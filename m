Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wb7i6-0006JZ-L2
	for mharc-qemu-trivial@gnu.org; Fri, 18 Apr 2014 08:16:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Wb7i1-00066T-RF
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 08:16:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Wb7hx-0000Cj-Ri
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 08:15:57 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:52192)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Wb7hp-0000Bq-Of; Fri, 18 Apr 2014 08:15:45 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 814B517F97D; Fri, 18 Apr 2014 14:15:43 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 18 Apr 2014 14:15:42 +0200
Message-Id: <1397823342-25013-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH=5D_po=3A_Update_all_*=2Epo_file?=
	=?utf-8?q?s?=
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
X-List-Received-Date: Fri, 18 Apr 2014 12:16:02 -0000

Most changes were caused by line changes in ui/gtk.c and updated
automatically by running "make -C po update".

In addition, the header entry "Language" was fixed, see this reference:
http://www.gnu.org/software/gettext/manual/html_node/Header-Entry.html.

"Project-Id-Version" now shows the current QEMU version.

Some unused translations for "_FILE" were removed, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Paolo, there are some Italian translations missing, maybe
you want to add them?

Peter, perhaps updating these files should be added to the
process which creates a new QEMU version.

Regards
Stefan

 po/de_DE.po    |   31 ++++++++++++++-----------------
 po/fr_FR.po    |   28 ++++++++++++++--------------
 po/hu.po       |   31 ++++++++++++++-----------------
 po/it.po       |   31 ++++++++++++++-----------------
 po/messages.po |   26 +++++++++++++-------------
 po/tr.po       |   28 ++++++++++++++--------------
 6 files changed, 83 insertions(+), 92 deletions(-)

diff --git a/po/de_DE.po b/po/de_DE.po
index 8636f3b..379757c 100644
--- a/po/de_DE.po
+++ b/po/de_DE.po
@@ -4,61 +4,58 @@
 #
 msgid ""
 msgstr ""
-"Project-Id-Version: QEMU 1.4.50\n"
+"Project-Id-Version: QEMU 2.0.50\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2013-11-16 15:25+0100\n"
+"POT-Creation-Date: 2014-04-18 13:53+0200\n"
 "PO-Revision-Date: 2012-02-28 16:00+0100\n"
 "Last-Translator: Kevin Wolf <kwolf@redhat.com>\n"
 "Language-Team: Deutsch <de@li.org>\n"
-"Language: \n"
+"Language: de\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D2; plural=3D(n!=3D1);\n"
=20
-#: ui/gtk.c:217
+#: ui/gtk.c:222
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr " - Strg+Alt+G dr=C3=BCcken, um Eingabeger=C3=A4te freizugeben"
=20
-#: ui/gtk.c:221
+#: ui/gtk.c:226
 msgid " [Paused]"
 msgstr " [Angehalten]"
=20
-#: ui/gtk.c:1331
+#: ui/gtk.c:1360
 msgid "_Pause"
 msgstr "_Angehalten"
=20
-#: ui/gtk.c:1337
+#: ui/gtk.c:1366
 msgid "_Reset"
 msgstr "_Reset"
=20
-#: ui/gtk.c:1340
+#: ui/gtk.c:1369
 msgid "Power _Down"
 msgstr "_Herunterfahren"
=20
-#: ui/gtk.c:1398
+#: ui/gtk.c:1427
 msgid "Zoom To _Fit"
 msgstr "Auf _Fenstergr=C3=B6=C3=9Fe skalieren"
=20
-#: ui/gtk.c:1404
+#: ui/gtk.c:1433
 msgid "Grab On _Hover"
 msgstr "Tastatur _automatisch einfangen"
=20
-#: ui/gtk.c:1407
+#: ui/gtk.c:1436
 msgid "_Grab Input"
 msgstr "_Eingabeger=C3=A4te einfangen"
=20
-#: ui/gtk.c:1434
+#: ui/gtk.c:1463
 msgid "Show _Tabs"
 msgstr "_Tableiste anzeigen"
=20
-#: ui/gtk.c:1448
+#: ui/gtk.c:1477
 msgid "_Machine"
 msgstr "_Maschine"
=20
-#: ui/gtk.c:1453
+#: ui/gtk.c:1482
 msgid "_View"
 msgstr "_Ansicht"
-
-#~ msgid "_File"
-#~ msgstr "_Datei"
diff --git a/po/fr_FR.po b/po/fr_FR.po
index e27ccbc..9b55be8 100644
--- a/po/fr_FR.po
+++ b/po/fr_FR.po
@@ -4,59 +4,59 @@
 # Aurelien Jarno <aurelien@aurel32.net>, 2013.
 msgid ""
 msgstr ""
-"Project-Id-Version: QEMU 1.4.50\n"
+"Project-Id-Version: QEMU 2.0.50\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2013-11-16 15:25+0100\n"
+"POT-Creation-Date: 2014-04-18 13:53+0200\n"
 "PO-Revision-Date: 2013-03-31 19:39+0200\n"
 "Last-Translator: Aurelien Jarno <aurelien@aurel32.net>\n"
 "Language-Team: French <FR@li.org>\n"
-"Language: \n"
+"Language: fr\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D2; plural=3Dn !=3D 1;\n"
 "X-Generator: Lokalize 1.4\n"
=20
-#: ui/gtk.c:217
+#: ui/gtk.c:222
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr "- Appuyer sur Ctrl+Alt+G pour arr=C3=AAter la capture"
=20
-#: ui/gtk.c:221
+#: ui/gtk.c:226
 msgid " [Paused]"
 msgstr "=C2=A0[En pause]"
=20
-#: ui/gtk.c:1331
+#: ui/gtk.c:1360
 msgid "_Pause"
 msgstr "_Pause"
=20
-#: ui/gtk.c:1337
+#: ui/gtk.c:1366
 msgid "_Reset"
 msgstr "_R=C3=A9initialiser"
=20
-#: ui/gtk.c:1340
+#: ui/gtk.c:1369
 msgid "Power _Down"
 msgstr "_=C3=89teindre"
=20
-#: ui/gtk.c:1398
+#: ui/gtk.c:1427
 msgid "Zoom To _Fit"
 msgstr "Zoomer pour _ajuster"
=20
-#: ui/gtk.c:1404
+#: ui/gtk.c:1433
 msgid "Grab On _Hover"
 msgstr "Capturer en _survolant"
=20
-#: ui/gtk.c:1407
+#: ui/gtk.c:1436
 msgid "_Grab Input"
 msgstr "_Capturer les entr=C3=A9es"
=20
-#: ui/gtk.c:1434
+#: ui/gtk.c:1463
 msgid "Show _Tabs"
 msgstr "Montrer les _onglets"
=20
-#: ui/gtk.c:1448
+#: ui/gtk.c:1477
 msgid "_Machine"
 msgstr "_Machine"
=20
-#: ui/gtk.c:1453
+#: ui/gtk.c:1482
 msgid "_View"
 msgstr "_Vue"
diff --git a/po/hu.po b/po/hu.po
index b298712..fbe2e1e 100644
--- a/po/hu.po
+++ b/po/hu.po
@@ -4,60 +4,57 @@
 #
 msgid ""
 msgstr ""
-"Project-Id-Version: QEMU 1.4.50\n"
+"Project-Id-Version: QEMU 2.0.50\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2013-11-16 15:25+0100\n"
+"POT-Creation-Date: 2014-04-18 13:53+0200\n"
 "PO-Revision-Date: 2013-05-06 20:42+0200\n"
 "Last-Translator: =C3=81kos Kov=C3=A1cs <akoskovacs@gmx.com>\n"
 "Language-Team: Hungarian <hu@li.org>\n"
-"Language: \n"
+"Language: hu\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
=20
-#: ui/gtk.c:217
+#: ui/gtk.c:222
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr " - Nyomj Ctrl+Alt+G-t a bemeneti eszk=C3=B6z=C3=B6k elenged=C3=A9=
s=C3=A9hez"
=20
-#: ui/gtk.c:221
+#: ui/gtk.c:226
 msgid " [Paused]"
 msgstr " [Meg=C3=A1ll=C3=ADtva]"
=20
-#: ui/gtk.c:1331
+#: ui/gtk.c:1360
 msgid "_Pause"
 msgstr "_Meg=C3=A1ll=C3=ADt=C3=A1s"
=20
-#: ui/gtk.c:1337
+#: ui/gtk.c:1366
 msgid "_Reset"
 msgstr "=C3=9Aj_raind=C3=ADt=C3=A1s"
=20
-#: ui/gtk.c:1340
+#: ui/gtk.c:1369
 msgid "Power _Down"
 msgstr "_Le=C3=A1ll=C3=ADt=C3=A1s"
=20
-#: ui/gtk.c:1398
+#: ui/gtk.c:1427
 msgid "Zoom To _Fit"
 msgstr "Ablakm=C3=A9rethez _igaz=C3=ADt=C3=A1s"
=20
-#: ui/gtk.c:1404
+#: ui/gtk.c:1433
 msgid "Grab On _Hover"
 msgstr "Automatikus _elfog=C3=A1s"
=20
-#: ui/gtk.c:1407
+#: ui/gtk.c:1436
 msgid "_Grab Input"
 msgstr "_Bemeneti eszk=C3=B6z=C3=B6k megragad=C3=A1sa"
=20
-#: ui/gtk.c:1434
+#: ui/gtk.c:1463
 msgid "Show _Tabs"
 msgstr "_F=C3=BClek megjelen=C3=ADt=C3=A9se"
=20
-#: ui/gtk.c:1448
+#: ui/gtk.c:1477
 msgid "_Machine"
 msgstr "_G=C3=A9p"
=20
-#: ui/gtk.c:1453
+#: ui/gtk.c:1482
 msgid "_View"
 msgstr "_N=C3=A9zet"
-
-#~ msgid "_File"
-#~ msgstr "_File"
diff --git a/po/it.po b/po/it.po
index 8cde051..0e8a536 100644
--- a/po/it.po
+++ b/po/it.po
@@ -4,61 +4,58 @@
 #
 msgid ""
 msgstr ""
-"Project-Id-Version: QEMU 1.4.50\n"
+"Project-Id-Version: QEMU 2.0.50\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2013-11-16 15:25+0100\n"
+"POT-Creation-Date: 2014-04-18 13:53+0200\n"
 "PO-Revision-Date: 2012-02-27 08:23+0100\n"
 "Last-Translator: Paolo Bonzini <pbonzini@redhat.com>\n"
 "Language-Team: Italian <it@li.org>\n"
-"Language: \n"
+"Language: it\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D2; plural=3Dn !=3D 1;\n"
=20
-#: ui/gtk.c:217
+#: ui/gtk.c:222
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr ""
=20
-#: ui/gtk.c:221
+#: ui/gtk.c:226
 msgid " [Paused]"
 msgstr ""
=20
-#: ui/gtk.c:1331
+#: ui/gtk.c:1360
 msgid "_Pause"
 msgstr ""
=20
-#: ui/gtk.c:1337
+#: ui/gtk.c:1366
 msgid "_Reset"
 msgstr ""
=20
-#: ui/gtk.c:1340
+#: ui/gtk.c:1369
 msgid "Power _Down"
 msgstr ""
=20
-#: ui/gtk.c:1398
+#: ui/gtk.c:1427
 msgid "Zoom To _Fit"
 msgstr "Adatta alla _finestra"
=20
-#: ui/gtk.c:1404
+#: ui/gtk.c:1433
 msgid "Grab On _Hover"
 msgstr "Cattura _automatica input"
=20
-#: ui/gtk.c:1407
+#: ui/gtk.c:1436
 msgid "_Grab Input"
 msgstr "_Cattura input"
=20
-#: ui/gtk.c:1434
+#: ui/gtk.c:1463
 msgid "Show _Tabs"
 msgstr "Mostra _tab"
=20
-#: ui/gtk.c:1448
+#: ui/gtk.c:1477
 msgid "_Machine"
 msgstr ""
=20
-#: ui/gtk.c:1453
+#: ui/gtk.c:1482
 msgid "_View"
 msgstr "_Visualizza"
-
-#~ msgid "_File"
-#~ msgstr "_File"
diff --git a/po/messages.po b/po/messages.po
index d55a487..b01206f 100644
--- a/po/messages.po
+++ b/po/messages.po
@@ -5,9 +5,9 @@
 #, fuzzy
 msgid ""
 msgstr ""
-"Project-Id-Version: QEMU 1.6.90\n"
+"Project-Id-Version: QEMU 2.0.50\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2013-11-16 15:25+0100\n"
+"POT-Creation-Date: 2014-04-18 13:53+0200\n"
 "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
 "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
 "Language-Team: LANGUAGE <LL@li.org>\n"
@@ -16,46 +16,46 @@ msgstr ""
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
=20
-#: ui/gtk.c:217
+#: ui/gtk.c:222
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr ""
=20
-#: ui/gtk.c:221
+#: ui/gtk.c:226
 msgid " [Paused]"
 msgstr ""
=20
-#: ui/gtk.c:1331
+#: ui/gtk.c:1360
 msgid "_Pause"
 msgstr ""
=20
-#: ui/gtk.c:1337
+#: ui/gtk.c:1366
 msgid "_Reset"
 msgstr ""
=20
-#: ui/gtk.c:1340
+#: ui/gtk.c:1369
 msgid "Power _Down"
 msgstr ""
=20
-#: ui/gtk.c:1398
+#: ui/gtk.c:1427
 msgid "Zoom To _Fit"
 msgstr ""
=20
-#: ui/gtk.c:1404
+#: ui/gtk.c:1433
 msgid "Grab On _Hover"
 msgstr ""
=20
-#: ui/gtk.c:1407
+#: ui/gtk.c:1436
 msgid "_Grab Input"
 msgstr ""
=20
-#: ui/gtk.c:1434
+#: ui/gtk.c:1463
 msgid "Show _Tabs"
 msgstr ""
=20
-#: ui/gtk.c:1448
+#: ui/gtk.c:1477
 msgid "_Machine"
 msgstr ""
=20
-#: ui/gtk.c:1453
+#: ui/gtk.c:1482
 msgid "_View"
 msgstr ""
diff --git a/po/tr.po b/po/tr.po
index 26bb900..ba7ed63 100644
--- a/po/tr.po
+++ b/po/tr.po
@@ -4,59 +4,59 @@
 #
 msgid ""
 msgstr ""
-"Project-Id-Version: QEMU 1.4.50\n"
+"Project-Id-Version: QEMU 2.0.50\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
-"POT-Creation-Date: 2013-11-16 15:25+0100\n"
+"POT-Creation-Date: 2014-04-18 13:53+0200\n"
 "PO-Revision-Date: 2013-04-22 18:35+0300\n"
 "Last-Translator: Ozan =C3=87a=C4=9Flayan <ozancag@gmail.com>\n"
 "Language-Team: T=C3=BCrk=C3=A7e <>\n"
-"Language: \n"
+"Language: tr\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D1; plural=3D0;\n"
 "X-Generator: Gtranslator 2.91.6\n"
=20
-#: ui/gtk.c:217
+#: ui/gtk.c:222
 msgid " - Press Ctrl+Alt+G to release grab"
 msgstr " - Yakalamay=C4=B1 durdurmak i=C3=A7in Ctrl+Alt+G tu=C5=9Flar=C4=
=B1na bas=C4=B1n"
=20
-#: ui/gtk.c:221
+#: ui/gtk.c:226
 msgid " [Paused]"
 msgstr " [Duraklat=C4=B1ld=C4=B1]"
=20
-#: ui/gtk.c:1331
+#: ui/gtk.c:1360
 msgid "_Pause"
 msgstr "_Duraklat"
=20
-#: ui/gtk.c:1337
+#: ui/gtk.c:1366
 msgid "_Reset"
 msgstr "_S=C4=B1f=C4=B1rla"
=20
-#: ui/gtk.c:1340
+#: ui/gtk.c:1369
 msgid "Power _Down"
 msgstr "_Kapat"
=20
-#: ui/gtk.c:1398
+#: ui/gtk.c:1427
 msgid "Zoom To _Fit"
 msgstr "Yak=C4=B1nla=C5=9F ve S=C4=B1=C4=9F_d=C4=B1r"
=20
-#: ui/gtk.c:1404
+#: ui/gtk.c:1433
 msgid "Grab On _Hover"
 msgstr "=C3=9C_zerindeyken Yakala"
=20
-#: ui/gtk.c:1407
+#: ui/gtk.c:1436
 msgid "_Grab Input"
 msgstr "Girdiyi _Yakala"
=20
-#: ui/gtk.c:1434
+#: ui/gtk.c:1463
 msgid "Show _Tabs"
 msgstr "Se_kmeleri G=C3=B6ster"
=20
-#: ui/gtk.c:1448
+#: ui/gtk.c:1477
 msgid "_Machine"
 msgstr "_Makine"
=20
-#: ui/gtk.c:1453
+#: ui/gtk.c:1482
 msgid "_View"
 msgstr "_G=C3=B6r=C3=BCnt=C3=BCle"
--=20
1.7.10.4


