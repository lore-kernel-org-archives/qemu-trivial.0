Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XExri-0001j2-7D
	for mharc-qemu-trivial@gnu.org; Wed, 06 Aug 2014 05:50:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XExrb-0001gE-7N
	for qemu-trivial@nongnu.org; Wed, 06 Aug 2014 05:50:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XExrW-0007Qw-J9
	for qemu-trivial@nongnu.org; Wed, 06 Aug 2014 05:50:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XExrN-0007Lv-7t; Wed, 06 Aug 2014 05:50:17 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s769oFM1014265
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 6 Aug 2014 05:50:15 -0400
Received: from T430.redhat.com (vpn1-113-35.nay.redhat.com [10.66.113.35])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s769oCFB004278; Wed, 6 Aug 2014 05:50:13 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  6 Aug 2014 17:50:33 +0800
Message-Id: <1407318633-19387-1-git-send-email-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s769oFM1014265
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, wehuang@redhat.com, songdongsheng@live.cn
Subject: [Qemu-trivial] [PATCH v3] po: Add Chinese translation
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
X-List-Received-Date: Wed, 06 Aug 2014 09:50:36 -0000

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Amos Kong <akong@redhat.com>
Reviewed-by: Dongsheng Song <songdongsheng@live.cn>
Reviewed-by: Wei Huang <wehuang@redhat.com>

---
v3: Add a missing space for
    msgid " - Press Ctrl+Alt+G to release grab"
    As pointed out by Amos.
    Meanwhile adding people's review-by's. [Hope no one in the rev-by
    list is against with that change.  To Wei: I changed your Acked-by
    to Reviewed-by which I think is more appropriate here.]
    Cc'ing qemu-trivial.

v2: Fix typo for "_View".
---
 po/zh_CN.po | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
 1 file changed, 86 insertions(+)
 create mode 100644 po/zh_CN.po

diff --git a/po/zh_CN.po b/po/zh_CN.po
new file mode 100644
index 0000000..2b1d42e
--- /dev/null
+++ b/po/zh_CN.po
@@ -0,0 +1,86 @@
+# Chinese translation for QEMU.
+# This file is put in the public domain.
+#
+# Fam Zheng <famz@redhat.com>, 2014
+msgid ""
+msgstr ""
+"Project-Id-Version: QEMU 2.2\n"
+"Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
+"POT-Creation-Date: 2014-07-31 10:03+0800\n"
+"PO-Revision-Date: 2014-07-31 10:00+0800\n"
+"Last-Translator: Fam Zheng <famz@redhat.com>\n"
+"Language-Team: Chinese <zh@li.org>\n"
+"Language: zh\n"
+"MIME-Version: 1.0\n"
+"Content-Type: text/plain; charset=3DUTF-8\n"
+"Content-Transfer-Encoding: 8bit\n"
+"Plural-Forms: nplurals=3D2; plural=3Dn !=3D 1;\n"
+"X-Generator: Lokalize 1.4\n"
+
+#: ui/gtk.c:321
+msgid " - Press Ctrl+Alt+G to release grab"
+msgstr " - =E6=8C=89=E4=B8=8B Ctrl+Alt+G =E5=8F=96=E6=B6=88=E6=8D=95=E8=8E=
=B7"
+
+#: ui/gtk.c:325
+msgid " [Paused]"
+msgstr "=C2=A0[=E5=B7=B2=E6=9A=82=E5=81=9C]"
+
+#: ui/gtk.c:1601
+msgid "_Pause"
+msgstr "=E6=9A=82=E5=81=9C(_P)"
+
+#: ui/gtk.c:1607
+msgid "_Reset"
+msgstr "=E9=87=8D=E7=BD=AE(_R)"
+
+#: ui/gtk.c:1610
+msgid "Power _Down"
+msgstr "=E5=85=B3=E9=97=AD=E7=94=B5=E6=BA=90(_D)"
+
+#: ui/gtk.c:1616
+msgid "_Quit"
+msgstr "=E9=80=80=E5=87=BA(_Q)"
+
+#: ui/gtk.c:1692
+msgid "_Fullscreen"
+msgstr "=E5=85=A8=E5=B1=8F(_F)"
+
+#: ui/gtk.c:1702
+msgid "Zoom _In"
+msgstr "=E6=94=BE=E5=A4=A7(_I)"
+
+#: ui/gtk.c:1709
+msgid "Zoom _Out"
+msgstr "=E7=BC=A9=E5=B0=8F(_O)"
+
+#: ui/gtk.c:1716
+msgid "Best _Fit"
+msgstr "=E6=9C=80=E5=90=88=E9=80=82=E5=A4=A7=E5=B0=8F(_F)"
+
+#: ui/gtk.c:1723
+msgid "Zoom To _Fit"
+msgstr "=E7=BC=A9=E6=94=BE=E4=BB=A5=E9=80=82=E5=BA=94=E5=A4=A7=E5=B0=8F(=
_F)"
+
+#: ui/gtk.c:1729
+msgid "Grab On _Hover"
+msgstr "=E9=BC=A0=E6=A0=87=E7=BB=8F=E8=BF=87=E6=97=B6=E6=8D=95=E8=8E=B7(=
_H)"
+
+#: ui/gtk.c:1732
+msgid "_Grab Input"
+msgstr "=E6=8D=95=E8=8E=B7=E8=BE=93=E5=85=A5(_G)"
+
+#: ui/gtk.c:1761
+msgid "Show _Tabs"
+msgstr "=E6=98=BE=E7=A4=BA=E6=A0=87=E7=AD=BE=E9=A1=B5(_T)"
+
+#: ui/gtk.c:1764
+msgid "Detach Tab"
+msgstr "=E5=88=86=E7=A6=BB=E6=A0=87=E7=AD=BE=E9=A1=B5"
+
+#: ui/gtk.c:1778
+msgid "_Machine"
+msgstr "=E8=99=9A=E6=8B=9F=E6=9C=BA(_M)"
+
+#: ui/gtk.c:1783
+msgid "_View"
+msgstr "=E8=A7=86=E5=9B=BE(_V)"
--=20
2.0.3


