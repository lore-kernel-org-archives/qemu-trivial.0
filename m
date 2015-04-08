Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YfvcI-0005g9-9O
	for mharc-qemu-trivial@gnu.org; Wed, 08 Apr 2015 15:26:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuL2-0001hz-9Z
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuKz-0001MC-0m
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:32 -0400
Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231]:35987)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>)
	id 1YfuKr-0001I5-TE; Wed, 08 Apr 2015 14:04:22 -0400
Received: by pdea3 with SMTP id a3so123242680pde.3;
	Wed, 08 Apr 2015 11:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ix8Y5K6edrnOio9Ir+0iO+yi7mTXVjVhtesrgAme9v4=;
	b=Q4paz/I5C3i0HT4mBGXetRQC1279Oi4OHTxVxdvCzJw1nydsnKsMO1zAOHjgcV7O4h
	DB8DfkFjOYAG8/15IBbYwHqNGqXZ00mwI5xHqEWKISJ+R8EkZFXEilKrQXEiNg8Zk6cS
	bW/4i7y+VzzUFQuwAooMywQXHbnUHH+Q+IdmwBwa9fJNY7OEZ2VNUgRy1tkMUsXvoxZK
	nZxFxOR5XyLyxhUg/pyWjzRYthV3UxKXxD7av0aRfuAUHvPidnoRj22F6GQVPjmzsgUd
	il5WE9dYHfIxeY/FVa/VHlF4O/gM9oBss+yZ16jNgXHoq0tSsGDYv9KjK2pmkow9tBPc
	u12g==
X-Received: by 10.66.120.40 with SMTP id kz8mr30076293pab.86.1428516260931;
	Wed, 08 Apr 2015 11:04:20 -0700 (PDT)
Received: from localhost.localdomain (118-167-152-188.dynamic.hinet.net.
	[118.167.152.188])
	by mx.google.com with ESMTPSA id w1sm11968593pdp.25.2015.04.08.11.04.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Apr 2015 11:04:20 -0700 (PDT)
From: Chih-Min Chao <cmchao@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  9 Apr 2015 02:04:10 +0800
Message-Id: <1428516254-23054-2-git-send-email-cmchao@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
References: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::231
X-Mailman-Approved-At: Wed, 08 Apr 2015 15:26:23 -0400
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com,
	Chih-Min Chao <cmchao@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/5] bitops : fix coding style
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
X-List-Received-Date: Wed, 08 Apr 2015 18:04:33 -0000

    don't mix tab and space. The rule is 4 spaces

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
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
1.9.1


