Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wedo7-0000DL-QF
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedo1-0008Sg-IE
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:08:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wednw-0000oU-PH
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:08:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41248)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wednm-0000m5-Cu; Mon, 28 Apr 2014 01:08:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DA85743037;
	Mon, 28 Apr 2014 09:08:25 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BCCB52B6;
	Mon, 28 Apr 2014 09:08:25 +0400 (MSK)
Received: (nullmailer pid 19130 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:48 +0400
Message-Id: <1398661684-19059-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Igor Mammedov <imammedo@redhat.com>
Subject: [Qemu-trivial] [PULL 02/18] qemu-option: introduce
	qemu_find_opts_singleton
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
X-List-Received-Date: Mon, 28 Apr 2014 05:08:46 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/config-file.h |    2 ++
 util/qemu-config.c         |   14 ++++++++++++++
 vl.c                       |   11 +----------
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index dbd97c4..d4ba20e 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -8,6 +8,8 @@
=20
 QemuOptsList *qemu_find_opts(const char *group);
 QemuOptsList *qemu_find_opts_err(const char *group, Error **errp);
+QemuOpts *qemu_find_opts_singleton(const char *group);
+
 void qemu_add_opts(QemuOptsList *list);
 void qemu_add_drive_opts(QemuOptsList *list);
 int qemu_set_option(const char *str);
diff --git a/util/qemu-config.c b/util/qemu-config.c
index f610101..60051df 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -39,6 +39,20 @@ QemuOptsList *qemu_find_opts(const char *group)
     return ret;
 }
=20
+QemuOpts *qemu_find_opts_singleton(const char *group)
+{
+    QemuOptsList *list;
+    QemuOpts *opts;
+
+    list =3D qemu_find_opts(group);
+    assert(list);
+    opts =3D qemu_opts_find(list, NULL);
+    if (!opts) {
+        opts =3D qemu_opts_create(list, NULL, 0, &error_abort);
+    }
+    return opts;
+}
+
 static CommandLineParameterInfoList *query_option_descs(const QemuOptDes=
c *desc)
 {
     CommandLineParameterInfoList *param_list =3D NULL, *entry;
diff --git a/vl.c b/vl.c
index db9ea90..5aad3bc 100644
--- a/vl.c
+++ b/vl.c
@@ -517,16 +517,7 @@ static QemuOptsList qemu_name_opts =3D {
  */
 QemuOpts *qemu_get_machine_opts(void)
 {
-    QemuOptsList *list;
-    QemuOpts *opts;
-
-    list =3D qemu_find_opts("machine");
-    assert(list);
-    opts =3D qemu_opts_find(list, NULL);
-    if (!opts) {
-        opts =3D qemu_opts_create(list, NULL, 0, &error_abort);
-    }
-    return opts;
+    return qemu_find_opts_singleton("machine");
 }
=20
 const char *qemu_get_vm_name(void)
--=20
1.7.10.4


