Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOkg-0002WN-4T
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:18:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkY-0002GN-Cm
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkS-0003iL-5Y
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOkE-0003fA-Ig; Tue, 10 Jun 2014 12:17:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AB2BF412C1;
	Tue, 10 Jun 2014 20:17:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 56A9B6DB;
	Tue, 10 Jun 2014 20:08:51 +0400 (MSK)
Received: (nullmailer pid 13338 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:41 +0400
Message-Id: <1402416523-13212-24-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 23/25] migration: Plug memory leak in
	migrate-set-cache-size command
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
X-List-Received-Date: Tue, 10 Jun 2014 16:18:20 -0000

From: Chen Gang <gang.chen.5i5j@gmail.com>

We call g_free() after cache_fini() in migration_end(), but we don't
call it after cache_fini() in xbzrle_cache_resize(), leaking the
memory.

cache_init() and cache_fini() are a pair.  Since cache_init()
allocates the cache, let cache_fini() free it.  This plugs the leak.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 arch_init.c  |    1 -
 page_cache.c |    1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch_init.c b/arch_init.c
index 9f1a174..23044c1 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -739,7 +739,6 @@ static void migration_end(void)
     XBZRLE_cache_lock();
     if (XBZRLE.cache) {
         cache_fini(XBZRLE.cache);
-        g_free(XBZRLE.cache);
         g_free(XBZRLE.encoded_buf);
         g_free(XBZRLE.current_buf);
         XBZRLE.cache = NULL;
diff --git a/page_cache.c b/page_cache.c
index b033681..89bb1ec 100644
--- a/page_cache.c
+++ b/page_cache.c
@@ -109,6 +109,7 @@ void cache_fini(PageCache *cache)
 
     g_free(cache->page_cache);
     cache->page_cache = NULL;
+    g_free(cache);
 }
 
 static size_t cache_get_cache_pos(const PageCache *cache,
-- 
1.7.10.4


