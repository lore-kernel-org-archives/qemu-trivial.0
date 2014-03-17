Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPZyO-00061K-1t
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 12:01:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy9-0005U4-G2
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy8-0007ml-EH
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:53 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZy4-0007gB-PU; Mon, 17 Mar 2014 12:00:48 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZxx-0004vb-5N; Mon, 17 Mar 2014 16:00:41 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 Mar 2014 16:00:31 +0000
Message-Id: <1395072041-18911-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
References: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH v2 02/12] hw/intc/apic.c: Use uint32_t for
	mask word in foreach_apic
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
X-List-Received-Date: Mon, 17 Mar 2014 16:00:55 -0000

Use unsigned arithmetic for operations on the mask word
in the foreach_apic() macro, to avoid relying on undefined
behaviour when shifting into the sign bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
I took Stefan Weil's suggestion and merged the __mask
declaration into the assignment inside the loop.
---
 hw/intc/apic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 361ae90..b8c061b 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -201,12 +201,12 @@ static void apic_external_nmi(APICCommonState *s)
 
 #define foreach_apic(apic, deliver_bitmask, code) \
 {\
-    int __i, __j, __mask;\
+    int __i, __j;\
     for(__i = 0; __i < MAX_APIC_WORDS; __i++) {\
-        __mask = deliver_bitmask[__i];\
+        uint32_t __mask = deliver_bitmask[__i];\
         if (__mask) {\
             for(__j = 0; __j < 32; __j++) {\
-                if (__mask & (1 << __j)) {\
+                if (__mask & (1U << __j)) {\
                     apic = local_apics[__i * 32 + __j];\
                     if (apic) {\
                         code;\
-- 
1.9.0


