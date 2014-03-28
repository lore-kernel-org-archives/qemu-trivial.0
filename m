Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTYSw-0002cR-AA
	for mharc-qemu-trivial@gnu.org; Fri, 28 Mar 2014 11:13:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WTYSt-0002Xg-2x
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 11:13:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WTYSs-0004Ma-6L
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 11:13:03 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:47176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WTYSp-0004Kq-Vd; Fri, 28 Mar 2014 11:13:00 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WTYSn-0000X7-VA; Fri, 28 Mar 2014 15:12:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 28 Mar 2014 15:12:57 +0000
Message-Id: <1396019577-2013-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 3/3] xbzrle.c: Avoid undefined behaviour with
	signed arithmetic
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
X-List-Received-Date: Fri, 28 Mar 2014 15:13:04 -0000

Use unsigned types for doing bitwise arithmetic in the xzbrle
calculations, to avoid undefined behaviour:

 xbzrle.c:99:49: runtime error: left shift of 72340172838076673
 by 7 places cannot be represented in type 'long'

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 xbzrle.c | 8 +++++---
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
1.9.0


