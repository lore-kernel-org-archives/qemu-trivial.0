Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgF2n-0008JN-F1
	for mharc-qemu-trivial@gnu.org; Fri, 02 May 2014 11:06:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgEZY-00084K-F7
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 10:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgEZS-0008R1-Ne
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 10:36:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WgEZH-0008Na-H1; Fri, 02 May 2014 10:36:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DB730401F7;
	Fri,  2 May 2014 18:36:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C91175FE;
	Fri,  2 May 2014 18:36:02 +0400 (MSK)
Received: (nullmailer pid 30554 invoked by uid 1000);
	Fri, 02 May 2014 14:36:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  2 May 2014 18:35:56 +0400
Message-Id: <1399041361-30496-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399041361-30496-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399041361-30496-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 2/7] glib: move g_poll() replacement into
	glib-compat.h
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
X-List-Received-Date: Fri, 02 May 2014 15:06:32 -0000

From: Stefan Hajnoczi <stefanha@redhat.com>

We have a dedicated header file for wrappers to smooth over glib version
differences.  Move the g_poll() definition into glib-compat.h for
consistency.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org
---
 include/glib-compat.h |   12 ++++++++++++
 include/qemu-common.h |   12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 8aa77af..8d25900 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -24,4 +24,16 @@ static inline guint g_timeout_add_seconds(guint interval, GSourceFunc function,
 }
 #endif
 
+#if !GLIB_CHECK_VERSION(2, 20, 0)
+/*
+ * Glib before 2.20.0 doesn't implement g_poll, so wrap it to compile properly
+ * on older systems.
+ */
+static inline gint g_poll(GPollFD *fds, guint nfds, gint timeout)
+{
+    GMainContext *ctx = g_main_context_default();
+    return g_main_context_get_poll_func(ctx)(fds, nfds, timeout);
+}
+#endif
+
 #endif
diff --git a/include/qemu-common.h b/include/qemu-common.h
index a998e8d..3f3fd60 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -124,18 +124,6 @@ int qemu_main(int argc, char **argv, char **envp);
 void qemu_get_timedate(struct tm *tm, int offset);
 int qemu_timedate_diff(struct tm *tm);
 
-#if !GLIB_CHECK_VERSION(2, 20, 0)
-/*
- * Glib before 2.20.0 doesn't implement g_poll, so wrap it to compile properly
- * on older systems.
- */
-static inline gint g_poll(GPollFD *fds, guint nfds, gint timeout)
-{
-    GMainContext *ctx = g_main_context_default();
-    return g_main_context_get_poll_func(ctx)(fds, nfds, timeout);
-}
-#endif
-
 /**
  * is_help_option:
  * @s: string to test
-- 
1.7.10.4


