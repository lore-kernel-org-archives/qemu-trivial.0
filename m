Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuM4-0006lE-G1
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 10:51:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuM2-0006gZ-2g
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuM0-0005fU-38
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLt-0005b0-Hb; Tue, 28 Jun 2016 10:51:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLk-000657-Hf; Tue, 28 Jun 2016 15:50:52 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 28 Jun 2016 15:50:46 +0100
Message-Id: <1467125451-16700-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH 1/6] fsdev/9p-iov-marshal.c: Don't use
 cpu_to_*w() functions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2016 14:51:11 -0000

Don't use the cpu_to_*w() functions, which we are trying to deprecate.
Instead just use cpu_to_*() to do the byteswap, which brings the
code in the marshal function in line with that in the unmarshal.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 fsdev/9p-iov-marshal.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/fsdev/9p-iov-marshal.c b/fsdev/9p-iov-marshal.c
index fce1ee9..c33fac6 100644
--- a/fsdev/9p-iov-marshal.c
+++ b/fsdev/9p-iov-marshal.c
@@ -208,31 +208,25 @@ ssize_t v9fs_iov_vmarshal(struct iovec *in_sg, int in_num, size_t offset,
             break;
         }
         case 'w': {
-            uint16_t val;
+            uint16_t val = va_arg(ap, int);
             if (bswap) {
-                cpu_to_le16w(&val, va_arg(ap, int));
-            } else {
-                val =  va_arg(ap, int);
+                val = cpu_to_le16(val);
             }
             copied = v9fs_pack(in_sg, in_num, offset, &val, sizeof(val));
             break;
         }
         case 'd': {
-            uint32_t val;
+            uint32_t val = va_arg(ap, uint32_t);
             if (bswap) {
-                cpu_to_le32w(&val, va_arg(ap, uint32_t));
-            } else {
-                val =  va_arg(ap, uint32_t);
+                val = cpu_to_le32(val);
             }
             copied = v9fs_pack(in_sg, in_num, offset, &val, sizeof(val));
             break;
         }
         case 'q': {
-            uint64_t val;
+            uint64_t val = va_arg(ap, uint64_t);;
             if (bswap) {
-                cpu_to_le64w(&val, va_arg(ap, uint64_t));
-            } else {
-                val =  va_arg(ap, uint64_t);
+                val = cpu_to_le64(val);
             }
             copied = v9fs_pack(in_sg, in_num, offset, &val, sizeof(val));
             break;
-- 
1.9.1


