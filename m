Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZKggG-0007kv-Ed
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jul 2015 01:47:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ZKggC-0007ch-72
	for qemu-trivial@nongnu.org; Thu, 30 Jul 2015 01:46:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ZKgg9-0003Fr-PD
	for qemu-trivial@nongnu.org; Thu, 30 Jul 2015 01:46:56 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:49125)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1ZKgg3-0003EK-Ha; Thu, 30 Jul 2015 01:46:47 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 3D38E17F6B0; Thu, 30 Jul 2015 07:46:44 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?=C3=81kos=20Kov=C3=A1cs?= <akoskovacs@gmx.com>,
	=?UTF-8?q?Ozan=20=C3=87a=C4=9Flayan?= <ozancag@gmail.com>
Date: Thu, 30 Jul 2015 07:46:43 +0200
Message-Id: <1438235203-31311-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH for-2.4] Update language files for QEMU 2.4.0
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
X-List-Received-Date: Thu, 30 Jul 2015 05:46:58 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

ui/gtk.c changed since the last update, and so the line numbers
changed, too. There are also some new texts which up to now
were only translated for de_DE, fr_FR and zh_CH.
it.po is nearly complete.

Regards
Stefan

 po/de_DE.po    | 36 ++++++++++++++++++------------------
 po/fr_FR.po    | 36 ++++++++++++++++++------------------
 po/hu.po       | 50 ++++++++++++++++++++++++++++++++++++++------------
 po/it.po       | 38 +++++++++++++++++++++-----------------
 po/messages.po | 50 +++++++++++++++++++++++++++++++++++++-------------
 po/tr.po       | 50 ++++++++++++++++++++++++++++++++++++++------------
 po/zh_CN.po    | 36 ++++++++++++++++++------------------
 7 files changed, 188 insertions(+), 108 deletions(-)

diff --git a/po/de_DE.po b/po/de_DE.po
index dcdcf22..5713150 100644
--- a/po/de_DE.po
+++ b/po/de_DE.po
@@ -6,7 +6,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: QEMU 1.4.50\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2014-07-17 20:39+0200\n"
+"POT-Creation-Date: 2015-07-30 07:34+0200\n"
 "PO-Revision-Date: 2012-02-28 16:00+0100\n"
 "Last-Translator: Kevin Wolf <kwolf@redhat.com>\n"
 "Language-Team: Deutsch <de@li.org>\n"
@@ -16,70 +16,70 @@ msgstr ""
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D2; plural=3D(n!=3D1);\n"
=20
-#: ui/gtk.c:321
+#: ui/gtk.c:260
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr " - Strg+Alt+G dr=C3=BCcken, um Eingabeger=C3=A4te freizugeben"
=20
-#: ui/gtk.c:325
+#: ui/gtk.c:264
 msgid " [Paused]"
 msgstr " [Angehalten]"
=20
-#: ui/gtk.c:1601
+#: ui/gtk.c:1688
 msgid "_Pause"
 msgstr "_Angehalten"
=20
-#: ui/gtk.c:1607
+#: ui/gtk.c:1694
 msgid "_Reset"
 msgstr "_Reset"
=20
-#: ui/gtk.c:1610
+#: ui/gtk.c:1697
 msgid "Power _Down"
 msgstr "_Herunterfahren"
=20
-#: ui/gtk.c:1616
+#: ui/gtk.c:1703
 msgid "_Quit"
 msgstr "_Beenden"
=20
-#: ui/gtk.c:1692
+#: ui/gtk.c:1787
 msgid "_Fullscreen"
 msgstr "_Vollbild"
=20
-#: ui/gtk.c:1702
+#: ui/gtk.c:1801
 msgid "Zoom _In"
 msgstr "_Heranzoomen"
=20
-#: ui/gtk.c:1709
+#: ui/gtk.c:1808
 msgid "Zoom _Out"
 msgstr "_Wegzoomen"
=20
-#: ui/gtk.c:1716
+#: ui/gtk.c:1815
 msgid "Best _Fit"
 msgstr "_Einpassen"
=20
-#: ui/gtk.c:1723
+#: ui/gtk.c:1822
 msgid "Zoom To _Fit"
 msgstr "Auf _Fenstergr=C3=B6=C3=9Fe skalieren"
=20
-#: ui/gtk.c:1729
+#: ui/gtk.c:1828
 msgid "Grab On _Hover"
 msgstr "Tastatur _automatisch einfangen"
=20
-#: ui/gtk.c:1732
+#: ui/gtk.c:1831
 msgid "_Grab Input"
 msgstr "_Eingabeger=C3=A4te einfangen"
=20
-#: ui/gtk.c:1761
+#: ui/gtk.c:1860
 msgid "Show _Tabs"
 msgstr "Reiter anzeigen"
=20
-#: ui/gtk.c:1764
+#: ui/gtk.c:1863
 msgid "Detach Tab"
 msgstr "Reiter abtrennen"
=20
-#: ui/gtk.c:1778
+#: ui/gtk.c:1875
 msgid "_Machine"
 msgstr "_Maschine"
=20
-#: ui/gtk.c:1783
+#: ui/gtk.c:1880
 msgid "_View"
 msgstr "_Ansicht"
diff --git a/po/fr_FR.po b/po/fr_FR.po
index bbb5ef8..42a9fd4 100644
--- a/po/fr_FR.po
+++ b/po/fr_FR.po
@@ -6,7 +6,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: QEMU 1.4.50\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2014-07-28 23:14+0200\n"
+"POT-Creation-Date: 2015-07-30 07:34+0200\n"
 "PO-Revision-Date: 2014-07-28 23:25+0200\n"
 "Last-Translator: Aurelien Jarno <aurelien@aurel32.net>\n"
 "Language-Team: French <FR@li.org>\n"
@@ -17,70 +17,70 @@ msgstr ""
 "Plural-Forms: nplurals=3D2; plural=3Dn !=3D 1;\n"
 "X-Generator: Lokalize 1.4\n"
=20
-#: ui/gtk.c:321
+#: ui/gtk.c:260
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr "- Appuyer sur Ctrl+Alt+G pour arr=C3=AAter la capture"
=20
-#: ui/gtk.c:325
+#: ui/gtk.c:264
 msgid " [Paused]"
 msgstr "=C2=A0[En pause]"
=20
-#: ui/gtk.c:1601
+#: ui/gtk.c:1688
 msgid "_Pause"
 msgstr "_Pause"
=20
-#: ui/gtk.c:1607
+#: ui/gtk.c:1694
 msgid "_Reset"
 msgstr "_R=C3=A9initialiser"
=20
-#: ui/gtk.c:1610
+#: ui/gtk.c:1697
 msgid "Power _Down"
 msgstr "_=C3=89teindre"
=20
-#: ui/gtk.c:1616
+#: ui/gtk.c:1703
 msgid "_Quit"
 msgstr "_Quitter"
=20
-#: ui/gtk.c:1692
+#: ui/gtk.c:1787
 msgid "_Fullscreen"
 msgstr "Mode _plein =C3=A9cran"
=20
-#: ui/gtk.c:1702
+#: ui/gtk.c:1801
 msgid "Zoom _In"
 msgstr "Zoom _avant"
=20
-#: ui/gtk.c:1709
+#: ui/gtk.c:1808
 msgid "Zoom _Out"
 msgstr "_Zoom arri=C3=A8re"
=20
-#: ui/gtk.c:1716
+#: ui/gtk.c:1815
 msgid "Best _Fit"
 msgstr "Zoom _id=C3=A9al"
=20
-#: ui/gtk.c:1723
+#: ui/gtk.c:1822
 msgid "Zoom To _Fit"
 msgstr "Zoomer pour a_juster"
=20
-#: ui/gtk.c:1729
+#: ui/gtk.c:1828
 msgid "Grab On _Hover"
 msgstr "Capturer en _survolant"
=20
-#: ui/gtk.c:1732
+#: ui/gtk.c:1831
 msgid "_Grab Input"
 msgstr "_Capturer les entr=C3=A9es"
=20
-#: ui/gtk.c:1761
+#: ui/gtk.c:1860
 msgid "Show _Tabs"
 msgstr "Montrer les _onglets"
=20
-#: ui/gtk.c:1764
+#: ui/gtk.c:1863
 msgid "Detach Tab"
 msgstr "_D=C3=A9tacher l'onglet"
=20
-#: ui/gtk.c:1778
+#: ui/gtk.c:1875
 msgid "_Machine"
 msgstr "_Machine"
=20
-#: ui/gtk.c:1783
+#: ui/gtk.c:1880
 msgid "_View"
 msgstr "_Vue"
diff --git a/po/hu.po b/po/hu.po
index 401ed21..9850820 100644
--- a/po/hu.po
+++ b/po/hu.po
@@ -6,7 +6,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: QEMU 1.4.50\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2013-07-05 22:36+0200\n"
+"POT-Creation-Date: 2015-07-30 07:34+0200\n"
 "PO-Revision-Date: 2013-05-06 20:42+0200\n"
 "Last-Translator: =C3=81kos Kov=C3=A1cs <akoskovacs@gmx.com>\n"
 "Language-Team: Hungarian <hu@li.org>\n"
@@ -15,47 +15,73 @@ msgstr ""
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
=20
-#: ui/gtk.c:214
+#: ui/gtk.c:260
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr " - Nyomj Ctrl+Alt+G-t a bemeneti eszk=C3=B6z=C3=B6k elenged=C3=A9=
s=C3=A9hez"
=20
-#: ui/gtk.c:218
+#: ui/gtk.c:264
 msgid " [Paused]"
 msgstr " [Meg=C3=A1ll=C3=ADtva]"
=20
-#: ui/gtk.c:1318
+#: ui/gtk.c:1688
 msgid "_Pause"
 msgstr "_Meg=C3=A1ll=C3=ADt=C3=A1s"
=20
-#: ui/gtk.c:1324
+#: ui/gtk.c:1694
 msgid "_Reset"
 msgstr "=C3=9Aj_raind=C3=ADt=C3=A1s"
=20
-#: ui/gtk.c:1327
+#: ui/gtk.c:1697
 msgid "Power _Down"
 msgstr "_Le=C3=A1ll=C3=ADt=C3=A1s"
=20
-#: ui/gtk.c:1381
+#: ui/gtk.c:1703
+msgid "_Quit"
+msgstr ""
+
+#: ui/gtk.c:1787
+msgid "_Fullscreen"
+msgstr ""
+
+#: ui/gtk.c:1801
+#, fuzzy
+msgid "Zoom _In"
+msgstr "Ablakm=C3=A9rethez _igaz=C3=ADt=C3=A1s"
+
+#: ui/gtk.c:1808
+#, fuzzy
+msgid "Zoom _Out"
+msgstr "Ablakm=C3=A9rethez _igaz=C3=ADt=C3=A1s"
+
+#: ui/gtk.c:1815
+msgid "Best _Fit"
+msgstr ""
+
+#: ui/gtk.c:1822
 msgid "Zoom To _Fit"
 msgstr "Ablakm=C3=A9rethez _igaz=C3=ADt=C3=A1s"
=20
-#: ui/gtk.c:1387
+#: ui/gtk.c:1828
 msgid "Grab On _Hover"
 msgstr "Automatikus _elfog=C3=A1s"
=20
-#: ui/gtk.c:1390
+#: ui/gtk.c:1831
 msgid "_Grab Input"
 msgstr "_Bemeneti eszk=C3=B6z=C3=B6k megragad=C3=A1sa"
=20
-#: ui/gtk.c:1416
+#: ui/gtk.c:1860
 msgid "Show _Tabs"
 msgstr "_F=C3=BClek megjelen=C3=ADt=C3=A9se"
=20
-#: ui/gtk.c:1430
+#: ui/gtk.c:1863
+msgid "Detach Tab"
+msgstr ""
+
+#: ui/gtk.c:1875
 msgid "_Machine"
 msgstr "_G=C3=A9p"
=20
-#: ui/gtk.c:1435
+#: ui/gtk.c:1880
 msgid "_View"
 msgstr "_N=C3=A9zet"
=20
diff --git a/po/it.po b/po/it.po
index e46fb3a..25f93dc 100644
--- a/po/it.po
+++ b/po/it.po
@@ -6,7 +6,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: QEMU 1.4.50\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2014-07-29 08:14+0200\n"
+"POT-Creation-Date: 2015-07-30 07:34+0200\n"
 "PO-Revision-Date: 2014-07-29 08:25+0200\n"
 "Last-Translator: Paolo Bonzini <pbonzini@redhat.com>\n"
 "Language-Team: Italian <it@li.org>\n"
@@ -16,66 +16,70 @@ msgstr ""
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D2; plural=3Dn !=3D 1;\n"
=20
-#: ui/gtk.c:321
+#: ui/gtk.c:260
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr " - Premere Ctrl+Alt+G per rilasciare l'input"
=20
-#: ui/gtk.c:325
+#: ui/gtk.c:264
 msgid " [Paused]"
 msgstr " [Pausa]"
=20
-#: ui/gtk.c:1601
+#: ui/gtk.c:1688
 msgid "_Pause"
 msgstr "_Pausa"
=20
-#: ui/gtk.c:1607
+#: ui/gtk.c:1694
 msgid "_Reset"
 msgstr "_Reset"
=20
-#: ui/gtk.c:1610
+#: ui/gtk.c:1697
 msgid "Power _Down"
 msgstr "_Spegni"
=20
-#: ui/gtk.c:1616
+#: ui/gtk.c:1703
 msgid "_Quit"
 msgstr "_Esci"
=20
-#: ui/gtk.c:1702
+#: ui/gtk.c:1787
+msgid "_Fullscreen"
+msgstr ""
+
+#: ui/gtk.c:1801
 msgid "Zoom _In"
 msgstr "_Aumenta zoom"
=20
-#: ui/gtk.c:1709
+#: ui/gtk.c:1808
 msgid "Zoom _Out"
 msgstr "_Riduci zoom"
=20
-#: ui/gtk.c:1716
+#: ui/gtk.c:1815
 msgid "Best _Fit"
 msgstr "A_nnulla zoom"
=20
-#: ui/gtk.c:1723
+#: ui/gtk.c:1822
 msgid "Zoom To _Fit"
 msgstr "Adatta alla _finestra"
=20
-#: ui/gtk.c:1729
+#: ui/gtk.c:1828
 msgid "Grab On _Hover"
 msgstr "Cattura _automatica input"
=20
-#: ui/gtk.c:1732
+#: ui/gtk.c:1831
 msgid "_Grab Input"
 msgstr "_Cattura input"
=20
-#: ui/gtk.c:1761
+#: ui/gtk.c:1860
 msgid "Show _Tabs"
 msgstr "Mostra _tab"
=20
-#: ui/gtk.c:1764
+#: ui/gtk.c:1863
 msgid "Detach Tab"
 msgstr "_Sposta in una nuova finestra"
=20
-#: ui/gtk.c:1778
+#: ui/gtk.c:1875
 msgid "_Machine"
 msgstr "_Macchina virtuale"
=20
-#: ui/gtk.c:1783
+#: ui/gtk.c:1880
 msgid "_View"
 msgstr "_Visualizza"
diff --git a/po/messages.po b/po/messages.po
index 26c76bc..fafcd24 100644
--- a/po/messages.po
+++ b/po/messages.po
@@ -5,9 +5,9 @@
 #, fuzzy
 msgid ""
 msgstr ""
-"Project-Id-Version: QEMU 1.5.50\n"
+"Project-Id-Version: QEMU 2.3.93\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2013-07-05 22:36+0200\n"
+"POT-Creation-Date: 2015-07-30 07:34+0200\n"
 "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
 "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
 "Language-Team: LANGUAGE <LL@li.org>\n"
@@ -16,46 +16,70 @@ msgstr ""
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
=20
-#: ui/gtk.c:214
+#: ui/gtk.c:260
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr ""
=20
-#: ui/gtk.c:218
+#: ui/gtk.c:264
 msgid " [Paused]"
 msgstr ""
=20
-#: ui/gtk.c:1318
+#: ui/gtk.c:1688
 msgid "_Pause"
 msgstr ""
=20
-#: ui/gtk.c:1324
+#: ui/gtk.c:1694
 msgid "_Reset"
 msgstr ""
=20
-#: ui/gtk.c:1327
+#: ui/gtk.c:1697
 msgid "Power _Down"
 msgstr ""
=20
-#: ui/gtk.c:1381
+#: ui/gtk.c:1703
+msgid "_Quit"
+msgstr ""
+
+#: ui/gtk.c:1787
+msgid "_Fullscreen"
+msgstr ""
+
+#: ui/gtk.c:1801
+msgid "Zoom _In"
+msgstr ""
+
+#: ui/gtk.c:1808
+msgid "Zoom _Out"
+msgstr ""
+
+#: ui/gtk.c:1815
+msgid "Best _Fit"
+msgstr ""
+
+#: ui/gtk.c:1822
 msgid "Zoom To _Fit"
 msgstr ""
=20
-#: ui/gtk.c:1387
+#: ui/gtk.c:1828
 msgid "Grab On _Hover"
 msgstr ""
=20
-#: ui/gtk.c:1390
+#: ui/gtk.c:1831
 msgid "_Grab Input"
 msgstr ""
=20
-#: ui/gtk.c:1416
+#: ui/gtk.c:1860
 msgid "Show _Tabs"
 msgstr ""
=20
-#: ui/gtk.c:1430
+#: ui/gtk.c:1863
+msgid "Detach Tab"
+msgstr ""
+
+#: ui/gtk.c:1875
 msgid "_Machine"
 msgstr ""
=20
-#: ui/gtk.c:1435
+#: ui/gtk.c:1880
 msgid "_View"
 msgstr ""
diff --git a/po/tr.po b/po/tr.po
index d712ced..8455ffd 100644
--- a/po/tr.po
+++ b/po/tr.po
@@ -6,7 +6,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: QEMU 1.4.50\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2013-07-05 22:36+0200\n"
+"POT-Creation-Date: 2015-07-30 07:34+0200\n"
 "PO-Revision-Date: 2013-04-22 18:35+0300\n"
 "Last-Translator: Ozan =C3=87a=C4=9Flayan <ozancag@gmail.com>\n"
 "Language-Team: T=C3=BCrk=C3=A7e <>\n"
@@ -17,46 +17,72 @@ msgstr ""
 "Plural-Forms: nplurals=3D1; plural=3D0;\n"
 "X-Generator: Gtranslator 2.91.6\n"
=20
-#: ui/gtk.c:214
+#: ui/gtk.c:260
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr " - Yakalamay=C4=B1 durdurmak i=C3=A7in Ctrl+Alt+G tu=C5=9Flar=C4=
=B1na bas=C4=B1n"
=20
-#: ui/gtk.c:218
+#: ui/gtk.c:264
 msgid " [Paused]"
 msgstr " [Duraklat=C4=B1ld=C4=B1]"
=20
-#: ui/gtk.c:1318
+#: ui/gtk.c:1688
 msgid "_Pause"
 msgstr "_Duraklat"
=20
-#: ui/gtk.c:1324
+#: ui/gtk.c:1694
 msgid "_Reset"
 msgstr "_S=C4=B1f=C4=B1rla"
=20
-#: ui/gtk.c:1327
+#: ui/gtk.c:1697
 msgid "Power _Down"
 msgstr "_Kapat"
=20
-#: ui/gtk.c:1381
+#: ui/gtk.c:1703
+msgid "_Quit"
+msgstr ""
+
+#: ui/gtk.c:1787
+msgid "_Fullscreen"
+msgstr ""
+
+#: ui/gtk.c:1801
+#, fuzzy
+msgid "Zoom _In"
+msgstr "Yak=C4=B1nla=C5=9F ve S=C4=B1=C4=9F_d=C4=B1r"
+
+#: ui/gtk.c:1808
+#, fuzzy
+msgid "Zoom _Out"
+msgstr "Yak=C4=B1nla=C5=9F ve S=C4=B1=C4=9F_d=C4=B1r"
+
+#: ui/gtk.c:1815
+msgid "Best _Fit"
+msgstr ""
+
+#: ui/gtk.c:1822
 msgid "Zoom To _Fit"
 msgstr "Yak=C4=B1nla=C5=9F ve S=C4=B1=C4=9F_d=C4=B1r"
=20
-#: ui/gtk.c:1387
+#: ui/gtk.c:1828
 msgid "Grab On _Hover"
 msgstr "=C3=9C_zerindeyken Yakala"
=20
-#: ui/gtk.c:1390
+#: ui/gtk.c:1831
 msgid "_Grab Input"
 msgstr "Girdiyi _Yakala"
=20
-#: ui/gtk.c:1416
+#: ui/gtk.c:1860
 msgid "Show _Tabs"
 msgstr "Se_kmeleri G=C3=B6ster"
=20
-#: ui/gtk.c:1430
+#: ui/gtk.c:1863
+msgid "Detach Tab"
+msgstr ""
+
+#: ui/gtk.c:1875
 msgid "_Machine"
 msgstr "_Makine"
=20
-#: ui/gtk.c:1435
+#: ui/gtk.c:1880
 msgid "_View"
 msgstr "_G=C3=B6r=C3=BCnt=C3=BCle"
diff --git a/po/zh_CN.po b/po/zh_CN.po
index 2b1d42e..fbd899e 100644
--- a/po/zh_CN.po
+++ b/po/zh_CN.po
@@ -6,7 +6,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: QEMU 2.2\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2014-07-31 10:03+0800\n"
+"POT-Creation-Date: 2015-07-30 07:34+0200\n"
 "PO-Revision-Date: 2014-07-31 10:00+0800\n"
 "Last-Translator: Fam Zheng <famz@redhat.com>\n"
 "Language-Team: Chinese <zh@li.org>\n"
@@ -17,70 +17,70 @@ msgstr ""
 "Plural-Forms: nplurals=3D2; plural=3Dn !=3D 1;\n"
 "X-Generator: Lokalize 1.4\n"
=20
-#: ui/gtk.c:321
+#: ui/gtk.c:260
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr " - =E6=8C=89=E4=B8=8B Ctrl+Alt+G =E5=8F=96=E6=B6=88=E6=8D=95=E8=8E=
=B7"
=20
-#: ui/gtk.c:325
+#: ui/gtk.c:264
 msgid " [Paused]"
 msgstr "=C2=A0[=E5=B7=B2=E6=9A=82=E5=81=9C]"
=20
-#: ui/gtk.c:1601
+#: ui/gtk.c:1688
 msgid "_Pause"
 msgstr "=E6=9A=82=E5=81=9C(_P)"
=20
-#: ui/gtk.c:1607
+#: ui/gtk.c:1694
 msgid "_Reset"
 msgstr "=E9=87=8D=E7=BD=AE(_R)"
=20
-#: ui/gtk.c:1610
+#: ui/gtk.c:1697
 msgid "Power _Down"
 msgstr "=E5=85=B3=E9=97=AD=E7=94=B5=E6=BA=90(_D)"
=20
-#: ui/gtk.c:1616
+#: ui/gtk.c:1703
 msgid "_Quit"
 msgstr "=E9=80=80=E5=87=BA(_Q)"
=20
-#: ui/gtk.c:1692
+#: ui/gtk.c:1787
 msgid "_Fullscreen"
 msgstr "=E5=85=A8=E5=B1=8F(_F)"
=20
-#: ui/gtk.c:1702
+#: ui/gtk.c:1801
 msgid "Zoom _In"
 msgstr "=E6=94=BE=E5=A4=A7(_I)"
=20
-#: ui/gtk.c:1709
+#: ui/gtk.c:1808
 msgid "Zoom _Out"
 msgstr "=E7=BC=A9=E5=B0=8F(_O)"
=20
-#: ui/gtk.c:1716
+#: ui/gtk.c:1815
 msgid "Best _Fit"
 msgstr "=E6=9C=80=E5=90=88=E9=80=82=E5=A4=A7=E5=B0=8F(_F)"
=20
-#: ui/gtk.c:1723
+#: ui/gtk.c:1822
 msgid "Zoom To _Fit"
 msgstr "=E7=BC=A9=E6=94=BE=E4=BB=A5=E9=80=82=E5=BA=94=E5=A4=A7=E5=B0=8F(=
_F)"
=20
-#: ui/gtk.c:1729
+#: ui/gtk.c:1828
 msgid "Grab On _Hover"
 msgstr "=E9=BC=A0=E6=A0=87=E7=BB=8F=E8=BF=87=E6=97=B6=E6=8D=95=E8=8E=B7(=
_H)"
=20
-#: ui/gtk.c:1732
+#: ui/gtk.c:1831
 msgid "_Grab Input"
 msgstr "=E6=8D=95=E8=8E=B7=E8=BE=93=E5=85=A5(_G)"
=20
-#: ui/gtk.c:1761
+#: ui/gtk.c:1860
 msgid "Show _Tabs"
 msgstr "=E6=98=BE=E7=A4=BA=E6=A0=87=E7=AD=BE=E9=A1=B5(_T)"
=20
-#: ui/gtk.c:1764
+#: ui/gtk.c:1863
 msgid "Detach Tab"
 msgstr "=E5=88=86=E7=A6=BB=E6=A0=87=E7=AD=BE=E9=A1=B5"
=20
-#: ui/gtk.c:1778
+#: ui/gtk.c:1875
 msgid "_Machine"
 msgstr "=E8=99=9A=E6=8B=9F=E6=9C=BA(_M)"
=20
-#: ui/gtk.c:1783
+#: ui/gtk.c:1880
 msgid "_View"
 msgstr "=E8=A7=86=E5=9B=BE(_V)"
--=20
2.1.4


