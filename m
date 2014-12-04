Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwWxT-00029x-0G
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 09:00:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwWxG-0001wF-Cx
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 09:00:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwWxA-0001XE-4f
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 09:00:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52180)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XwWww-0001AE-Ba; Thu, 04 Dec 2014 09:00:06 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB4E05DT003357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 09:00:05 -0500
Received: from blackfin.pond.sub.org (ovpn-116-62.ams2.redhat.com
	[10.36.116.62])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB4E04u5020334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 4 Dec 2014 09:00:05 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B574330411A4; Thu,  4 Dec 2014 15:00:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Dec 2014 15:00:03 +0100
Message-Id: <1417701603-26388-4-git-send-email-armbru@redhat.com>
In-Reply-To: <1417701603-26388-1-git-send-email-armbru@redhat.com>
References: <1417701603-26388-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 3/3] util: Use g_new() & friends where that
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
X-List-Received-Date: Thu, 04 Dec 2014 14:00:32 -0000

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
1.9.3


