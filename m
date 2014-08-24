Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXyJ-00045D-1r
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:36:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXyB-0003qN-53
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXy7-0006oC-1A
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45610)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXxy-0006kW-IX; Sun, 24 Aug 2014 09:36:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B84DA44A02;
	Sun, 24 Aug 2014 17:36:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B0BEE6E1;
	Sun, 24 Aug 2014 17:31:04 +0400 (MSK)
Received: (nullmailer pid 30073 invoked by uid 1000);
	Sun, 24 Aug 2014 13:31:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 24 Aug 2014 17:30:52 +0400
Message-Id: <1408887062-30022-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 01/11] util/path: Use the GLib memory
	allocation routines
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
X-List-Received-Date: Sun, 24 Aug 2014 13:36:35 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

In this file, we don't check the return value of malloc/strdup/realloc wh=
ich may fail.
Instead of using these routines, we use the GLib memory APIs g_malloc/g_s=
trdup/g_realloc.
They will exit on allocation failure, so there is no need to test for fai=
lure,
which would be fine for setup.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/path.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/util/path.c b/util/path.c
index 5c59d9f..4e4877e 100644
--- a/util/path.c
+++ b/util/path.c
@@ -45,8 +45,8 @@ static struct pathelem *new_entry(const char *root,
                                   struct pathelem *parent,
                                   const char *name)
 {
-    struct pathelem *new =3D malloc(sizeof(*new));
-    new->name =3D strdup(name);
+    struct pathelem *new =3D g_malloc(sizeof(*new));
+    new->name =3D g_strdup(name);
     new->pathname =3D g_strdup_printf("%s/%s", root, name);
     new->num_entries =3D 0;
     return new;
@@ -88,7 +88,7 @@ static struct pathelem *add_entry(struct pathelem *root=
, const char *name,
=20
     root->num_entries++;
=20
-    root =3D realloc(root, sizeof(*root)
+    root =3D g_realloc(root, sizeof(*root)
                    + sizeof(root->entries[0])*root->num_entries);
     e =3D &root->entries[root->num_entries-1];
=20
@@ -161,8 +161,8 @@ void init_paths(const char *prefix)
     base =3D add_dir_maybe(base);
     if (base->num_entries =3D=3D 0) {
         g_free(base->pathname);
-        free(base->name);
-        free(base);
+        g_free(base->name);
+        g_free(base);
         base =3D NULL;
     } else {
         set_parents(base, base);
--=20
1.7.10.4


