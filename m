Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wopml-00053l-R2
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:57:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopmf-0004rZ-D3
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopma-0001aQ-9R
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40927)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopmQ-0001WB-Pc; Mon, 26 May 2014 03:57:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A1BD242FAF;
	Mon, 26 May 2014 11:57:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 49A96666;
	Mon, 26 May 2014 11:20:14 +0400 (MSK)
Received: (nullmailer pid 22999 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:19:54 +0400
Message-Id: <1401088811-22923-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 06/23] bswap.h: Rename ldl_p, stl_p,
	etc to ldl_he_p, stl_he_p, etc
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
X-List-Received-Date: Mon, 26 May 2014 07:57:29 -0000

From: Peter Maydell <peter.maydell@linaro.org>

We have an unfortunate naming clash between the functions
ldl_p, stl_p, etc defined in bswap.h (which have semantics
"load/store in host endianness") and the #defines of the same
name in cpu-all.h (which have the semantics "load/store in
target endianness").

Fortunately it turns out that the only users of the bswap.h
functions are all within bswap.h itself, so we can simply
rename them to include a _he_ infix for "host endianness".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/bswap.h |   45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 0f9c6cf..78c1ced 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -215,9 +215,10 @@ typedef union {
  *   q: 64 bits
  *
  * endian is:
- * (empty): host endian
+ *   he   : host endian
  *   be   : big endian
  *   le   : little endian
+ * (except for byte accesses, which have no endian infix).
  */
 
 static inline int ldub_p(const void *ptr)
@@ -239,82 +240,82 @@ static inline void stb_p(void *ptr, uint8_t v)
    operations.  Thus we don't need to play games with packed attributes, or
    inline byte-by-byte stores.  */
 
-static inline int lduw_p(const void *ptr)
+static inline int lduw_he_p(const void *ptr)
 {
     uint16_t r;
     memcpy(&r, ptr, sizeof(r));
     return r;
 }
 
-static inline int ldsw_p(const void *ptr)
+static inline int ldsw_he_p(const void *ptr)
 {
     int16_t r;
     memcpy(&r, ptr, sizeof(r));
     return r;
 }
 
-static inline void stw_p(void *ptr, uint16_t v)
+static inline void stw_he_p(void *ptr, uint16_t v)
 {
     memcpy(ptr, &v, sizeof(v));
 }
 
-static inline int ldl_p(const void *ptr)
+static inline int ldl_he_p(const void *ptr)
 {
     int32_t r;
     memcpy(&r, ptr, sizeof(r));
     return r;
 }
 
-static inline void stl_p(void *ptr, uint32_t v)
+static inline void stl_he_p(void *ptr, uint32_t v)
 {
     memcpy(ptr, &v, sizeof(v));
 }
 
-static inline uint64_t ldq_p(const void *ptr)
+static inline uint64_t ldq_he_p(const void *ptr)
 {
     uint64_t r;
     memcpy(&r, ptr, sizeof(r));
     return r;
 }
 
-static inline void stq_p(void *ptr, uint64_t v)
+static inline void stq_he_p(void *ptr, uint64_t v)
 {
     memcpy(ptr, &v, sizeof(v));
 }
 
 static inline int lduw_le_p(const void *ptr)
 {
-    return (uint16_t)le_bswap(lduw_p(ptr), 16);
+    return (uint16_t)le_bswap(lduw_he_p(ptr), 16);
 }
 
 static inline int ldsw_le_p(const void *ptr)
 {
-    return (int16_t)le_bswap(lduw_p(ptr), 16);
+    return (int16_t)le_bswap(lduw_he_p(ptr), 16);
 }
 
 static inline int ldl_le_p(const void *ptr)
 {
-    return le_bswap(ldl_p(ptr), 32);
+    return le_bswap(ldl_he_p(ptr), 32);
 }
 
 static inline uint64_t ldq_le_p(const void *ptr)
 {
-    return le_bswap(ldq_p(ptr), 64);
+    return le_bswap(ldq_he_p(ptr), 64);
 }
 
 static inline void stw_le_p(void *ptr, uint16_t v)
 {
-    stw_p(ptr, le_bswap(v, 16));
+    stw_he_p(ptr, le_bswap(v, 16));
 }
 
 static inline void stl_le_p(void *ptr, uint32_t v)
 {
-    stl_p(ptr, le_bswap(v, 32));
+    stl_he_p(ptr, le_bswap(v, 32));
 }
 
 static inline void stq_le_p(void *ptr, uint64_t v)
 {
-    stq_p(ptr, le_bswap(v, 64));
+    stq_he_p(ptr, le_bswap(v, 64));
 }
 
 /* float access */
@@ -349,37 +350,37 @@ static inline void stfq_le_p(void *ptr, float64 v)
 
 static inline int lduw_be_p(const void *ptr)
 {
-    return (uint16_t)be_bswap(lduw_p(ptr), 16);
+    return (uint16_t)be_bswap(lduw_he_p(ptr), 16);
 }
 
 static inline int ldsw_be_p(const void *ptr)
 {
-    return (int16_t)be_bswap(lduw_p(ptr), 16);
+    return (int16_t)be_bswap(lduw_he_p(ptr), 16);
 }
 
 static inline int ldl_be_p(const void *ptr)
 {
-    return be_bswap(ldl_p(ptr), 32);
+    return be_bswap(ldl_he_p(ptr), 32);
 }
 
 static inline uint64_t ldq_be_p(const void *ptr)
 {
-    return be_bswap(ldq_p(ptr), 64);
+    return be_bswap(ldq_he_p(ptr), 64);
 }
 
 static inline void stw_be_p(void *ptr, uint16_t v)
 {
-    stw_p(ptr, be_bswap(v, 16));
+    stw_he_p(ptr, be_bswap(v, 16));
 }
 
 static inline void stl_be_p(void *ptr, uint32_t v)
 {
-    stl_p(ptr, be_bswap(v, 32));
+    stl_he_p(ptr, be_bswap(v, 32));
 }
 
 static inline void stq_be_p(void *ptr, uint64_t v)
 {
-    stq_p(ptr, be_bswap(v, 64));
+    stq_he_p(ptr, be_bswap(v, 64));
 }
 
 /* float access */
-- 
1.7.10.4


