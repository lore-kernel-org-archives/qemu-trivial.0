Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnaw-0008GZ-D7
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:07:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnas-0008Ai-La
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnaq-00042i-K2
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnal-0003uR-4D; Sat, 08 Oct 2016 05:06:51 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 40DDC40ED7;
	Sat,  8 Oct 2016 12:06:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 57DE5B44;
	Sat,  8 Oct 2016 11:58:17 +0300 (MSK)
Received: (nullmailer pid 19264 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Wei Yang <richard.weiyang@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:07 +0300
Message-Id: <cb57fb37051b11d04f1ddce736b0ec3f936e978e.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 21/26] bitmap: refine and move
 BITMAP_{FIRST/LAST}_WORD_MASK
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
X-List-Received-Date: Sat, 08 Oct 2016 09:07:00 -0000

From: Wei Yang <richard.weiyang@gmail.com>

According to linux kernel commit <89c1e79eb30> ("linux/bitmap.h: improve
BITMAP_{LAST,FIRST}_WORD_MASK"), these two macro could be improved.

This patch takes this change and also move them all in header file.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/bitmap.h | 7 ++-----
 util/bitmap.c         | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index 7247f14..63ea2d0 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -57,11 +57,8 @@
  * find_next_bit(addr, nbits, bit)	Position next set bit in *addr >= bit
  */
 
-#define BITMAP_LAST_WORD_MASK(nbits)                                    \
-    (                                                                   \
-        ((nbits) % BITS_PER_LONG) ?                                     \
-        (1UL<<((nbits) % BITS_PER_LONG))-1 : ~0UL                       \
-        )
+#define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
+#define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))
 
 #define DECLARE_BITMAP(name,bits)                  \
         unsigned long name[BITS_TO_LONGS(bits)]
diff --git a/util/bitmap.c b/util/bitmap.c
index 40aadfb..43ed011 100644
--- a/util/bitmap.c
+++ b/util/bitmap.c
@@ -157,8 +157,6 @@ int slow_bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
     return result != 0;
 }
 
-#define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) % BITS_PER_LONG))
-
 void bitmap_set(unsigned long *map, long start, long nr)
 {
     unsigned long *p = map + BIT_WORD(start);
-- 
2.1.4


