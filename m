Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur0Rr-00050a-I4
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:40:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rg-0004Xn-7L
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rc-0007Hp-OC
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur0RU-0006yF-2r; Mon, 24 Jun 2013 02:40:00 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6dxKG001946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:39:59 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5O6dwSJ025576; Mon, 24 Jun 2013 02:39:58 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id 35125419BA; Mon, 24 Jun 2013 08:39:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 08:39:53 +0200
Message-Id: <1372055996-4072-11-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 10/13] qemu-char: minor mux chardev fixes
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
X-List-Received-Date: Mon, 24 Jun 2013 06:40:16 -0000

mux failure path has a memory leak.  creating a mux chardev can't
fail though, so just assert() that instead of fixing an error path
which never ever runs anyway ...

Also fix bid being leaked while being at it.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-char.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 5a2291d..e6c3157 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3193,7 +3193,7 @@ CharDriverState *qemu_chr_new_from_opts(QemuOpts *opts,
         ChardevBackend *backend = g_new0(ChardevBackend, 1);
         ChardevReturn *ret = NULL;
         const char *id = qemu_opts_id(opts);
-        const char *bid = NULL;
+        char *bid = NULL;
 
         if (qemu_opt_get_bool(opts, "mux", 0)) {
             bid = g_strdup_printf("%s-base", id);
@@ -3220,9 +3220,7 @@ CharDriverState *qemu_chr_new_from_opts(QemuOpts *opts,
             backend->kind = CHARDEV_BACKEND_KIND_MUX;
             backend->mux->chardev = g_strdup(bid);
             ret = qmp_chardev_add(id, backend, errp);
-            if (error_is_set(errp)) {
-                goto qapi_out;
-            }
+            assert(!error_is_set(errp));
         }
 
         chr = qemu_chr_find(id);
@@ -3230,6 +3228,7 @@ CharDriverState *qemu_chr_new_from_opts(QemuOpts *opts,
     qapi_out:
         qapi_free_ChardevBackend(backend);
         qapi_free_ChardevReturn(ret);
+        g_free(bid);
         return chr;
     }
 
-- 
1.7.9.7


