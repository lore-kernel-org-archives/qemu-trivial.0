Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLUmd-0001wP-4a
	for mharc-qemu-trivial@gnu.org; Thu, 06 Mar 2014 04:40:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WLUmT-0001XG-Gi
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 04:40:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WLUmO-00049a-DD
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 04:39:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:1344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1WLUmE-00048P-95; Thu, 06 Mar 2014 04:39:42 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s269dci6022646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 6 Mar 2014 04:39:38 -0500
Received: from dell-pet610-01.lab.eng.brq.redhat.com
	(dell-pet610-01.lab.eng.brq.redhat.com [10.34.42.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s269dVVQ016495; Thu, 6 Mar 2014 04:39:35 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Mar 2014 10:39:24 +0100
Message-Id: <1394098765-12727-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1394098765-12727-1-git-send-email-imammedo@redhat.com>
References: <1394098765-12727-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s269dci6022646
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, stefanha@redhat.com, qemu-trivial@nongnu.org,
	eblake@redhat.com, coreyb@linux.vnet.ibm.com, mjt@tls.msk.ru,
	mreitz@redhat.com, aliguori@amazon.com, pbonzini@redhat.com,
	lcapitulino@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	afaerber@suse.de
Subject: [Qemu-trivial] [PATCH v4 1/2] qemu-option: introduce
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
X-List-Received-Date: Thu, 06 Mar 2014 09:40:02 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
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
index 685a7a9..7eb3b73 100644
--- a/vl.c
+++ b/vl.c
@@ -482,16 +482,7 @@ static QemuOptsList qemu_msg_opts =3D {
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
1.7.1


