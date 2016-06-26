Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bH9dD-00060j-Gh
	for mharc-qemu-trivial@gnu.org; Sun, 26 Jun 2016 08:57:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ashopov@ashmac.lan>) id 1bH7n2-0006uS-5k
	for qemu-trivial@nongnu.org; Sun, 26 Jun 2016 06:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ashopov@ashmac.lan>) id 1bH7my-0008BK-Ek
	for qemu-trivial@nongnu.org; Sun, 26 Jun 2016 06:59:48 -0400
Received: from [87.227.212.252] (port=55111 helo=ashmac.lan)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ashopov@ashmac.lan>)
	id 1bH7mo-00085e-Kk; Sun, 26 Jun 2016 06:59:34 -0400
Received: by ashmac.lan (Postfix, from userid 501)
	id 21537B875F1; Sun, 26 Jun 2016 11:23:38 +0300 (EEST)
From: Alexander Shopov <ash@kambanaria.org>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, sw@weilnetz.de,
	pbonzini@redhat.com, mjt@tls.msk.ru, ash@kambanaria.org,
	al_shopov@yahoo.com, jano.vesely@gmail.com, cornelia.huck@de.ibm.com,
	mst@redhat.com
Cc: qemu-trivial@nongnu.org
Date: Sun, 26 Jun 2016 11:23:31 +0300
Message-Id: <20160626082331.39187-2-ash@kambanaria.org>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160626082331.39187-1-ash@kambanaria.org>
References: <20160626082331.39187-1-ash@kambanaria.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Mac OS X  [generic]
X-Received-From: 87.227.212.252
X-Mailman-Approved-At: Sun, 26 Jun 2016 08:57:46 -0400
Subject: [Qemu-trivial] [PATCH L10N v3 1/1] Added Bulgarian translation
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jun 2016 10:59:54 -0000

Signed-off-by: Alexander Shopov <ash@kambanaria.org>
---
 po/bg.po | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
 1 file changed, 90 insertions(+)
 create mode 100644 po/bg.po

diff --git a/po/bg.po b/po/bg.po
new file mode 100644
index 0000000..5047861
--- /dev/null
+++ b/po/bg.po
@@ -0,0 +1,90 @@
+# Bulgarian translation of qemu po-file.
+# Copyright (C) 2016 Alexander Shopov <ash@kambanaria.org>
+# This file is distributed under the same license as the qemu package.
+# Alexander Shopov <ash@kambanaria.org>, 2016.
+#
+msgid ""
+msgstr ""
+"Project-Id-Version: QEMU 2.6.50\n"
+"Report-Msgid-Bugs-To: \n"
+"POT-Creation-Date: 2016-06-26 10:16+0300\n"
+"PO-Revision-Date: 2016-06-09 15:54+0300\n"
+"Last-Translator: Alexander Shopov <ash@kambanaria.org>\n"
+"Language-Team: Bulgarian <dict@ludost.net>\n"
+"Language: bg\n"
+"MIME-Version: 1.0\n"
+"Content-Type: text/plain; charset=3DUTF-8\n"
+"Content-Transfer-Encoding: 8bit\n"
+"Plural-Forms: nplurals=3D2; plural=3D(n !=3D 1);\n"
+
+#: ui/gtk.c:274
+msgid " - Press Ctrl+Alt+G to release grab"
+msgstr " =E2=80=94 =D0=BD=D0=B0=D1=82=D0=B8=D1=81=D0=BD=D0=B5=D1=82=D0=B5=
 Ctrl+Alt+G, =D0=B7=D0=B0 =D0=B4=D0=B0 =D0=BE=D1=81=D0=B2=D0=BE=D0=B1=D0=BE=
=D0=B4=D0=B8=D1=82=D0=B5 =D1=84=D0=BE=D0=BA=D1=83=D1=81=D0=B0"
+
+#: ui/gtk.c:278
+msgid " [Paused]"
+msgstr " [=D0=BF=D0=B0=D1=83=D0=B7=D0=B0]"
+
+#: ui/gtk.c:1906
+msgid "_Pause"
+msgstr "_=D0=9F=D0=B0=D1=83=D0=B7=D0=B0"
+
+#: ui/gtk.c:1912
+msgid "_Reset"
+msgstr "_=D0=A0=D0=B5=D1=81=D1=82=D0=B0=D1=80=D1=82=D0=B8=D1=80=D0=B0=D0=
=BD=D0=B5"
+
+#: ui/gtk.c:1915
+msgid "Power _Down"
+msgstr "_=D0=98=D0=B7=D0=BA=D0=BB=D1=8E=D1=87=D0=B2=D0=B0=D0=BD=D0=B5"
+
+#: ui/gtk.c:1921
+msgid "_Quit"
+msgstr "_=D0=A1=D0=BF=D0=B8=D1=80=D0=B0=D0=BD=D0=B5 =D0=BD=D0=B0 =D0=BF=D1=
=80=D0=BE=D0=B3=D1=80=D0=B0=D0=BC=D0=B0=D1=82=D0=B0"
+
+#: ui/gtk.c:2013
+msgid "_Fullscreen"
+msgstr "=D0=9D=D0=B0 _=D1=86=D1=8F=D0=BB =D0=B5=D0=BA=D1=80=D0=B0=D0=BD"
+
+#: ui/gtk.c:2016
+msgid "_Copy"
+msgstr "_=D0=9A=D0=BE=D0=BF=D0=B8=D1=80=D0=B0=D0=BD=D0=B5"
+
+#: ui/gtk.c:2032
+msgid "Zoom _In"
+msgstr "_=D0=A3=D0=B2=D0=B5=D0=BB=D0=B8=D1=87=D0=B0=D0=B2=D0=B0=D0=BD=D0=
=B5"
+
+#: ui/gtk.c:2039
+msgid "Zoom _Out"
+msgstr "_=D0=9D=D0=B0=D0=BC=D0=B0=D0=BB=D1=8F=D0=B2=D0=B0=D0=BD=D0=B5"
+
+#: ui/gtk.c:2046
+msgid "Best _Fit"
+msgstr "=D0=9F=D0=BE_=D0=BC=D0=B5=D1=81=D1=82=D0=B2=D0=B0=D0=BD=D0=B5"
+
+#: ui/gtk.c:2053
+msgid "Zoom To _Fit"
+msgstr "=D0=9D=D0=B0=D0=BF=D0=B0=D1=81_=D0=B2=D0=B0=D0=BD=D0=B5"
+
+#: ui/gtk.c:2059
+msgid "Grab On _Hover"
+msgstr "=D0=9F=D1=80=D0=B8=D1=85=D0=B2=D0=B0=D1=89=D0=B0=D0=BD=D0=B5 =D0=
=BF=D1=80=D0=B8 =D0=BF=D0=BE=D1=81=D0=BE_=D1=87=D0=B2=D0=B0=D0=BD=D0=B5"
+
+#: ui/gtk.c:2062
+msgid "_Grab Input"
+msgstr "=D0=9F=D1=80=D0=B8=D1=85=D0=B2=D0=B0=D1=89=D0=B0=D0=BD=D0=B5 =D0=
=BD=D0=B0 _=D1=84=D0=BE=D0=BA=D1=83=D1=81=D0=B0"
+
+#: ui/gtk.c:2091
+msgid "Show _Tabs"
+msgstr "=D0=9F=D0=BE=D0=B4=D0=BF=D1=80=D0=BE_=D0=B7=D0=BE=D1=80=D1=86=D0=
=B8"
+
+#: ui/gtk.c:2094
+msgid "Detach Tab"
+msgstr "=D0=9A=D1=8A=D0=BC =D1=81=D0=B0=D0=BC=D0=BE=D1=81=D1=82=D0=BE=D1=
=8F=D1=82=D0=B5=D0=BB=D0=B5=D0=BD =D0=BF=D0=BE=D0=B4=D0=BF=D1=80=D0=BE=D0=
=B7=D0=BE=D1=80=D0=B5=D1=86"
+
+#: ui/gtk.c:2106
+msgid "_Machine"
+msgstr "_=D0=9C=D0=B0=D1=88=D0=B8=D0=BD=D0=B0"
+
+#: ui/gtk.c:2111
+msgid "_View"
+msgstr "_=D0=98=D0=B7=D0=B3=D0=BB=D0=B5=D0=B4"
--=20
2.9.0


