Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN5bf-0005XN-Na
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 15:11:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bW-0005F7-Gq
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bR-0003RD-Oy
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:14 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:39685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5bA-0003JX-65; Mon, 10 Mar 2014 15:10:52 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5b7-0002T3-3X; Mon, 10 Mar 2014 19:10:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 10 Mar 2014 19:10:38 +0000
Message-Id: <1394478649-9453-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 02/12] hw/intc/apic.c: Use uint32_t for mask
	word in foreach_apic
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Mar 2014 19:11:19 -0000

Use unsigned arithmetic for operations on the mask word
in the foreach_apic() macro, to avoid relying on undefined
behaviour when shifting into the sign bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/apic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 361ae90..e137882 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -201,12 +201,13 @@ static void apic_external_nmi(APICCommonState *s)
 
 #define foreach_apic(apic, deliver_bitmask, code) \
 {\
-    int __i, __j, __mask;\
+    int __i, __j;\
+    uint32_t __mask;\
     for(__i = 0; __i < MAX_APIC_WORDS; __i++) {\
         __mask = deliver_bitmask[__i];\
         if (__mask) {\
             for(__j = 0; __j < 32; __j++) {\
-                if (__mask & (1 << __j)) {\
+                if (__mask & (1U << __j)) {\
                     apic = local_apics[__i * 32 + __j];\
                     if (apic) {\
                         code;\
-- 
1.9.0


