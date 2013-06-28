Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsdIq-0006sI-QB
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 14:21:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdIn-0006kw-I3
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:21:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdIm-0006pc-4z
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:21:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38549)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsdIh-0006oM-Pc; Fri, 28 Jun 2013 14:21:40 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3D5A742B0C;
	Fri, 28 Jun 2013 22:21:39 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 76BE156C; Fri, 28 Jun 2013 22:17:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 28 Jun 2013 22:17:42 +0400
Message-Id: <1372443465-22384-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 11/14] qemu-char: add -chardev mux support
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
X-List-Received-Date: Fri, 28 Jun 2013 18:21:47 -0000

From: Gerd Hoffmann <kraxel@redhat.com>

Allow to explicitly create mux chardevs on the command line,
like you can using QMP.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/qemu-char.c b/qemu-char.c
index 392de29..c097ca1 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3115,6 +3115,19 @@ static void qemu_chr_parse_memory(QemuOpts *opts, ChardevBackend *backend,
     }
 }
 
+static void qemu_chr_parse_mux(QemuOpts *opts, ChardevBackend *backend,
+                               Error **errp)
+{
+    const char *chardev = qemu_opt_get(opts, "chardev");
+
+    if (chardev == NULL) {
+        error_setg(errp, "chardev: mux: no chardev given");
+        return;
+    }
+    backend->mux = g_new0(ChardevMux, 1);
+    backend->mux->chardev = g_strdup(chardev);
+}
+
 typedef struct CharDriver {
     const char *name;
     /* old, pre qapi */
@@ -3481,6 +3494,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "size",
             .type = QEMU_OPT_SIZE,
+        },{
+            .name = "chardev",
+            .type = QEMU_OPT_STRING,
         },
         { /* end of list */ }
     },
@@ -3771,6 +3787,8 @@ static void register_types(void)
     register_char_driver_qapi("console", CHARDEV_BACKEND_KIND_CONSOLE, NULL);
     register_char_driver_qapi("pipe", CHARDEV_BACKEND_KIND_PIPE,
                               qemu_chr_parse_pipe);
+    register_char_driver_qapi("mux", CHARDEV_BACKEND_KIND_MUX,
+                              qemu_chr_parse_mux);
 }
 
 type_init(register_types);
-- 
1.7.10.4


