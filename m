Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsdIr-0006tN-34
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 14:21:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdIn-0006lD-LM
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:21:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdIm-0006ph-6O
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:21:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsdIh-0006oO-Sk; Fri, 28 Jun 2013 14:21:40 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 508B142BCE;
	Fri, 28 Jun 2013 22:21:39 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 5A0E51A3; Fri, 28 Jun 2013 22:17:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 28 Jun 2013 22:17:40 +0400
Message-Id: <1372443465-22384-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 09/14] qemu-char: use ChardevBackendKind in
	CharDriver
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/sysemu/char.h |    2 +-
 qemu-char.c           |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/char.h b/include/sysemu/char.h
index 066c216..e65e4a4 100644
--- a/include/sysemu/char.h
+++ b/include/sysemu/char.h
@@ -281,7 +281,7 @@ CharDriverState *qemu_chr_find(const char *name);
 QemuOpts *qemu_chr_parse_compat(const char *label, const char *filename);
 
 void register_char_driver(const char *name, CharDriverState *(*open)(QemuOpts *));
-void register_char_driver_qapi(const char *name, int kind,
+void register_char_driver_qapi(const char *name, ChardevBackendKind kind,
         void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp));
 
 /* add an eventfd to the qemu devices that are polled */
diff --git a/qemu-char.c b/qemu-char.c
index 0cda56c..90754e6 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3120,7 +3120,7 @@ typedef struct CharDriver {
     /* old, pre qapi */
     CharDriverState *(*open)(QemuOpts *opts);
     /* new, qapi-based */
-    int kind;
+    ChardevBackendKind kind;
     void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 } CharDriver;
 
@@ -3137,7 +3137,7 @@ void register_char_driver(const char *name, CharDriverState *(*open)(QemuOpts *)
     backends = g_slist_append(backends, s);
 }
 
-void register_char_driver_qapi(const char *name, int kind,
+void register_char_driver_qapi(const char *name, ChardevBackendKind kind,
         void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp))
 {
     CharDriver *s;
-- 
1.7.10.4


