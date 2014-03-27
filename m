Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTDTi-000835-JM
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 12:48:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTDTb-0007rz-Jd
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:48:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTDTX-0006aa-DW
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:48:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTDTH-0006TQ-I1; Thu, 27 Mar 2014 12:48:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3A6194373E;
	Thu, 27 Mar 2014 20:48:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 25A4F683;
	Thu, 27 Mar 2014 19:28:35 +0400 (MSK)
Received: (nullmailer pid 1788 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:16 +0400
Message-Id: <1395934108-1694-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/23] hw/intc/apic.c: Use uint32_t for mask
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
X-List-Received-Date: Thu, 27 Mar 2014 16:48:27 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Use unsigned arithmetic for operations on the mask word
in the foreach_apic() macro, to avoid relying on undefined
behaviour when shifting into the sign bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/intc/apic.c |    6 +++---
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
1.7.10.4


