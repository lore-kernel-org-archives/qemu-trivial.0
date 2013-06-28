Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsdIt-0006yB-Ae
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 14:21:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdIo-0006md-6H
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:21:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdIm-0006ps-Qe
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:21:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsdIh-0006oR-WB; Fri, 28 Jun 2013 14:21:40 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5D3C542BCF;
	Fri, 28 Jun 2013 22:21:39 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 6DBD1571; Fri, 28 Jun 2013 22:17:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 28 Jun 2013 22:17:41 +0400
Message-Id: <1372443465-22384-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 10/14] qemu-char: minor mux chardev fixes
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

mux failure path has a memory leak.  creating a mux chardev can't
fail though, so just assert() that instead of fixing an error path
which never ever runs anyway ...

Also fix bid being leaked while being at it.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 90754e6..392de29 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3186,7 +3186,7 @@ CharDriverState *qemu_chr_new_from_opts(QemuOpts *opts,
         ChardevBackend *backend = g_new0(ChardevBackend, 1);
         ChardevReturn *ret = NULL;
         const char *id = qemu_opts_id(opts);
-        const char *bid = NULL;
+        char *bid = NULL;
 
         if (qemu_opt_get_bool(opts, "mux", 0)) {
             bid = g_strdup_printf("%s-base", id);
@@ -3213,9 +3213,7 @@ CharDriverState *qemu_chr_new_from_opts(QemuOpts *opts,
             backend->kind = CHARDEV_BACKEND_KIND_MUX;
             backend->mux->chardev = g_strdup(bid);
             ret = qmp_chardev_add(id, backend, errp);
-            if (error_is_set(errp)) {
-                goto qapi_out;
-            }
+            assert(!error_is_set(errp));
         }
 
         chr = qemu_chr_find(id);
@@ -3223,6 +3221,7 @@ CharDriverState *qemu_chr_new_from_opts(QemuOpts *opts,
     qapi_out:
         qapi_free_ChardevBackend(backend);
         qapi_free_ChardevReturn(ret);
+        g_free(bid);
         return chr;
     }
 
-- 
1.7.10.4


