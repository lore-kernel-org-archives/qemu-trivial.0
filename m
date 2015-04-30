Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yngij-0000M0-CP
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:09:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yngie-0000B2-AF
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:09:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yngic-0003mO-Rk
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:09:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YngiY-0003l2-Qh; Thu, 30 Apr 2015 01:08:59 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B2FE142B8B;
	Thu, 30 Apr 2015 08:08:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A021393E;
	Thu, 30 Apr 2015 08:08:57 +0300 (MSK)
Received: (nullmailer pid 4298 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:16 +0300
Message-Id: <77c03172f5da73ea53c669a400cf7b8c0a13533b.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chih-Min Chao <cmchao@gmail.com>
Subject: [Qemu-trivial] [PULL 03/42] bitops : fix coding style
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
X-List-Received-Date: Thu, 30 Apr 2015 05:09:05 -0000

From: Chih-Min Chao <cmchao@gmail.com>

    don't mix tab and space. The rule is 4 spaces

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/bitops.h | 61 ++++++++++++++++++++++++++-------------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 90ca8df..8abdcf9 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -20,10 +20,10 @@
 #define BITS_PER_BYTE           CHAR_BIT
 #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
 
-#define BIT(nr)			(1UL << (nr))
-#define BIT_MASK(nr)		(1UL << ((nr) % BITS_PER_LONG))
-#define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
-#define BITS_TO_LONGS(nr)	DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(long))
+#define BIT(nr)                 (1UL << (nr))
+#define BIT_MASK(nr)            (1UL << ((nr) % BITS_PER_LONG))
+#define BIT_WORD(nr)            ((nr) / BITS_PER_LONG)
+#define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(long))
 
 /**
  * set_bit - Set a bit in memory
@@ -32,10 +32,10 @@
  */
 static inline void set_bit(long nr, unsigned long *addr)
 {
-	unsigned long mask = BIT_MASK(nr);
-        unsigned long *p = addr + BIT_WORD(nr);
+    unsigned long mask = BIT_MASK(nr);
+    unsigned long *p = addr + BIT_WORD(nr);
 
-	*p  |= mask;
+    *p  |= mask;
 }
 
 /**
@@ -45,10 +45,10 @@ static inline void set_bit(long nr, unsigned long *addr)
  */
 static inline void clear_bit(long nr, unsigned long *addr)
 {
-	unsigned long mask = BIT_MASK(nr);
-        unsigned long *p = addr + BIT_WORD(nr);
+    unsigned long mask = BIT_MASK(nr);
+    unsigned long *p = addr + BIT_WORD(nr);
 
-	*p &= ~mask;
+    *p &= ~mask;
 }
 
 /**
@@ -58,10 +58,10 @@ static inline void clear_bit(long nr, unsigned long *addr)
  */
 static inline void change_bit(long nr, unsigned long *addr)
 {
-	unsigned long mask = BIT_MASK(nr);
-        unsigned long *p = addr + BIT_WORD(nr);
+    unsigned long mask = BIT_MASK(nr);
+    unsigned long *p = addr + BIT_WORD(nr);
 
-	*p ^= mask;
+    *p ^= mask;
 }
 
 /**
@@ -71,12 +71,12 @@ static inline void change_bit(long nr, unsigned long *addr)
  */
 static inline int test_and_set_bit(long nr, unsigned long *addr)
 {
-	unsigned long mask = BIT_MASK(nr);
-        unsigned long *p = addr + BIT_WORD(nr);
-	unsigned long old = *p;
+    unsigned long mask = BIT_MASK(nr);
+    unsigned long *p = addr + BIT_WORD(nr);
+    unsigned long old = *p;
 
-	*p = old | mask;
-	return (old & mask) != 0;
+    *p = old | mask;
+    return (old & mask) != 0;
 }
 
 /**
@@ -86,12 +86,12 @@ static inline int test_and_set_bit(long nr, unsigned long *addr)
  */
 static inline int test_and_clear_bit(long nr, unsigned long *addr)
 {
-	unsigned long mask = BIT_MASK(nr);
-        unsigned long *p = addr + BIT_WORD(nr);
-	unsigned long old = *p;
+    unsigned long mask = BIT_MASK(nr);
+    unsigned long *p = addr + BIT_WORD(nr);
+    unsigned long old = *p;
 
-	*p = old & ~mask;
-	return (old & mask) != 0;
+    *p = old & ~mask;
+    return (old & mask) != 0;
 }
 
 /**
@@ -101,12 +101,12 @@ static inline int test_and_clear_bit(long nr, unsigned long *addr)
  */
 static inline int test_and_change_bit(long nr, unsigned long *addr)
 {
-	unsigned long mask = BIT_MASK(nr);
-        unsigned long *p = addr + BIT_WORD(nr);
-	unsigned long old = *p;
+    unsigned long mask = BIT_MASK(nr);
+    unsigned long *p = addr + BIT_WORD(nr);
+    unsigned long old = *p;
 
-	*p = old ^ mask;
-	return (old & mask) != 0;
+    *p = old ^ mask;
+    return (old & mask) != 0;
 }
 
 /**
@@ -116,7 +116,7 @@ static inline int test_and_change_bit(long nr, unsigned long *addr)
  */
 static inline int test_bit(long nr, const unsigned long *addr)
 {
-	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
+    return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
 }
 
 /**
@@ -136,7 +136,8 @@ unsigned long find_last_bit(const unsigned long *addr,
  * @size: The bitmap size in bits
  */
 unsigned long find_next_bit(const unsigned long *addr,
-				   unsigned long size, unsigned long offset);
+                            unsigned long size,
+                            unsigned long offset);
 
 /**
  * find_next_zero_bit - find the next cleared bit in a memory region
-- 
2.1.4


