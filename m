Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XFqwp-0005GR-Gy
	for mharc-qemu-trivial@gnu.org; Fri, 08 Aug 2014 16:39:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwj-00054B-6O
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwf-0000za-0j
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38060)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XFqwO-0000ow-KA; Fri, 08 Aug 2014 16:39:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8110141A1A;
	Sat,  9 Aug 2014 00:39:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 67F736EE;
	Sat,  9 Aug 2014 00:39:06 +0400 (MSK)
Received: (nullmailer pid 10324 invoked by uid 1000);
	Fri, 08 Aug 2014 20:39:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 Aug 2014 00:39:01 +0400
Message-Id: <1407530342-10259-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BPULL_8/9=5D_po=3A_Add_Chinese_transla?=
	=?utf-8?q?tion?=
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
X-List-Received-Date: Fri, 08 Aug 2014 20:39:34 -0000

From: Fam Zheng <famz@redhat.com>

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Amos Kong <akong@redhat.com>
Reviewed-by: Dongsheng Song <songdongsheng@live.cn>
Reviewed-by: Wei Huang <wehuang@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 po/zh_CN.po |   86 +++++++++++++++++++++++++++++++++++++++++++++++++++++=
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
1.7.10.4


