Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNoo-00036b-Qz
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:40:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNog-00031S-MU
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:40:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNob-0005TT-Pk
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:40:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNoN-0005QS-4m; Mon, 05 May 2014 14:40:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E6E3540708;
	Mon,  5 May 2014 22:40:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8249C6AE;
	Mon,  5 May 2014 22:02:07 +0400 (MSK)
Received: (nullmailer pid 24246 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:56 +0400
Message-Id: <1399312923-24129-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 15/22] do not call g_thread_init() for glib >=
	2.31
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
X-List-Received-Date: Mon, 05 May 2014 18:40:48 -0000

glib >= 2.31 always enables thread support and g_thread_supported()
is #defined to 1, there's no need to call g_thread_init() anymore,
and it definitely does not need to report error which never happens.
Keep code for old < 2.31 glibc anyway for now, just #ifdef it
differently.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-trivial@nongnu.org
---
 coroutine-gthread.c |    7 ++-----
 util/osdep.c        |   21 +++++++++------------
 2 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/coroutine-gthread.c b/coroutine-gthread.c
index d3e5b99..a61efe0 100644
--- a/coroutine-gthread.c
+++ b/coroutine-gthread.c
@@ -115,14 +115,11 @@ static inline GThread *create_thread(GThreadFunc func, gpointer data)
 
 static void __attribute__((constructor)) coroutine_init(void)
 {
-    if (!g_thread_supported()) {
 #if !GLIB_CHECK_VERSION(2, 31, 0)
+    if (!g_thread_supported()) {
         g_thread_init(NULL);
-#else
-        fprintf(stderr, "glib threading failed to initialize.\n");
-        exit(1);
-#endif
     }
+#endif
 
     init_coroutine_cond();
 }
diff --git a/util/osdep.c b/util/osdep.c
index a9029f8..b2bd154 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -436,23 +436,20 @@ int socket_init(void)
     return 0;
 }
 
-/* Ensure that glib is running in multi-threaded mode */
+#if !GLIB_CHECK_VERSION(2, 31, 0)
+/* Ensure that glib is running in multi-threaded mode
+ * Old versions of glib require explicit initialization.  Failure to do
+ * this results in the single-threaded code paths being taken inside
+ * glib.  For example, the g_slice allocator will not be thread-safe
+ * and cause crashes.
+ */
 static void __attribute__((constructor)) thread_init(void)
 {
     if (!g_thread_supported()) {
-#if !GLIB_CHECK_VERSION(2, 31, 0)
-        /* Old versions of glib require explicit initialization.  Failure to do
-         * this results in the single-threaded code paths being taken inside
-         * glib.  For example, the g_slice allocator will not be thread-safe
-         * and cause crashes.
-         */
-        g_thread_init(NULL);
-#else
-        fprintf(stderr, "glib threading failed to initialize.\n");
-        exit(1);
-#endif
+       g_thread_init(NULL);
     }
 }
+#endif
 
 #ifndef CONFIG_IOVEC
 /* helper function for iov_send_recv() */
-- 
1.7.10.4


