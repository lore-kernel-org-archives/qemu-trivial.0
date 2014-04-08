Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQEq-00022G-Os
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:14:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQEk-0001qO-A1
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:14:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQEf-0004Pf-Ql
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:14:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXQEW-0004Me-OH; Tue, 08 Apr 2014 03:14:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E539440E32;
	Tue,  8 Apr 2014 11:14:11 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A5C966B0;
	Tue,  8 Apr 2014 11:04:13 +0400 (MSK)
Received: (nullmailer pid 10579 invoked by uid 1000);
	Tue, 08 Apr 2014 07:04:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 11:04:07 +0400
Message-Id: <1396940651-10513-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/11] xbzrle.c: Avoid undefined behaviour
	with signed arithmetic
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
X-List-Received-Date: Tue, 08 Apr 2014 07:14:31 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Use unsigned types for doing bitwise arithmetic in the xzbrle
calculations, to avoid undefined behaviour:

 xbzrle.c:99:49: runtime error: left shift of 72340172838076673
 by 7 places cannot be represented in type 'long'

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 xbzrle.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xbzrle.c b/xbzrle.c
index fbcb35d..8e220bf 100644
--- a/xbzrle.c
+++ b/xbzrle.c
@@ -28,7 +28,7 @@ int xbzrle_encode_buffer(uint8_t *old_buf, uint8_t *new_buf, int slen,
 {
     uint32_t zrun_len = 0, nzrun_len = 0;
     int d = 0, i = 0;
-    long res, xor;
+    long res;
     uint8_t *nzrun_start = NULL;
 
     g_assert(!(((uintptr_t)old_buf | (uintptr_t)new_buf | slen) %
@@ -93,9 +93,11 @@ int xbzrle_encode_buffer(uint8_t *old_buf, uint8_t *new_buf, int slen,
         /* word at a time for speed, use of 32-bit long okay */
         if (!res) {
             /* truncation to 32-bit long okay */
-            long mask = (long)0x0101010101010101ULL;
+            unsigned long mask = (unsigned long)0x0101010101010101ULL;
             while (i < slen) {
-                xor = *(long *)(old_buf + i) ^ *(long *)(new_buf + i);
+                unsigned long xor;
+                xor = *(unsigned long *)(old_buf + i)
+                    ^ *(unsigned long *)(new_buf + i);
                 if ((xor - mask) & ~xor & (mask << 7)) {
                     /* found the end of an nzrun within the current long */
                     while (old_buf[i] != new_buf[i]) {
-- 
1.7.10.4


