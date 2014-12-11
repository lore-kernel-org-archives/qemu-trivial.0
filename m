Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8aQ-0003fH-Nu
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:35:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8aH-0003U6-Ec
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:35:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8aC-00021J-Cp
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:35:29 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8Zz-0001tM-R1; Thu, 11 Dec 2014 13:35:11 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7335941D2C;
	Thu, 11 Dec 2014 21:35:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B15548CE;
	Thu, 11 Dec 2014 21:16:17 +0300 (MSK)
Received: (nullmailer pid 22977 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:59 +0300
Message-Id: <e1cf5582644ef63528993fb2b88dd3b43b9914c6.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 11/20] util: Use g_new() & friends where that
	makes obvious sense
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
X-List-Received-Date: Thu, 11 Dec 2014 18:35:35 -0000

From: Markus Armbruster <armbru@redhat.com>

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/hbitmap.c | 4 ++--
 util/iov.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/hbitmap.c b/util/hbitmap.c
index b3060e6..ab13971 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -373,7 +373,7 @@ void hbitmap_free(HBitmap *hb)
 
 HBitmap *hbitmap_alloc(uint64_t size, int granularity)
 {
-    HBitmap *hb = g_malloc0(sizeof (struct HBitmap));
+    HBitmap *hb = g_new0(struct HBitmap, 1);
     unsigned i;
 
     assert(granularity >= 0 && granularity < 64);
@@ -384,7 +384,7 @@ HBitmap *hbitmap_alloc(uint64_t size, int granularity)
     hb->granularity = granularity;
     for (i = HBITMAP_LEVELS; i-- > 0; ) {
         size = MAX((size + BITS_PER_LONG - 1) >> BITS_PER_LEVEL, 1);
-        hb->levels[i] = g_malloc0(size * sizeof(unsigned long));
+        hb->levels[i] = g_new0(unsigned long, size);
     }
 
     /* We necessarily have free bits in level 0 due to the definition
diff --git a/util/iov.c b/util/iov.c
index 24566c8..2fb18e6 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -253,7 +253,7 @@ unsigned iov_copy(struct iovec *dst_iov, unsigned int dst_iov_cnt,
 
 void qemu_iovec_init(QEMUIOVector *qiov, int alloc_hint)
 {
-    qiov->iov = g_malloc(alloc_hint * sizeof(struct iovec));
+    qiov->iov = g_new(struct iovec, alloc_hint);
     qiov->niov = 0;
     qiov->nalloc = alloc_hint;
     qiov->size = 0;
@@ -277,7 +277,7 @@ void qemu_iovec_add(QEMUIOVector *qiov, void *base, size_t len)
 
     if (qiov->niov == qiov->nalloc) {
         qiov->nalloc = 2 * qiov->nalloc + 1;
-        qiov->iov = g_realloc(qiov->iov, qiov->nalloc * sizeof(struct iovec));
+        qiov->iov = g_renew(struct iovec, qiov->iov, qiov->nalloc);
     }
     qiov->iov[qiov->niov].iov_base = base;
     qiov->iov[qiov->niov].iov_len = len;
-- 
2.1.3


