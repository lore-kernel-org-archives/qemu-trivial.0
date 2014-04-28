Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeeNK-0005fk-3u
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:45:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeeND-0005RD-EI
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:45:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeeN9-0002Tk-Eh
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:45:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41469)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WeeMt-0002Ql-RO; Mon, 28 Apr 2014 01:44:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CA28743043;
	Mon, 28 Apr 2014 09:44:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8BC07320;
	Mon, 28 Apr 2014 09:08:27 +0400 (MSK)
Received: (nullmailer pid 19166 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:08:03 +0400
Message-Id: <1398661684-19059-18-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] =?utf-8?q?=5BPULL_17/18=5D_po=3A_add_proper_Langua?=
	=?utf-8?q?ge=3A_tags_to_=2Epo_files?=
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
X-List-Received-Date: Mon, 28 Apr 2014 05:45:07 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 po/de_DE.po |    2 +-
 po/fr_FR.po |    2 +-
 po/hu.po    |    2 +-
 po/it.po    |    2 +-
 po/tr.po    |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/po/de_DE.po b/po/de_DE.po
index fcbde95..dec68c9 100644
--- a/po/de_DE.po
+++ b/po/de_DE.po
@@ -10,7 +10,7 @@ msgstr ""
 "PO-Revision-Date: 2012-02-28 16:00+0100\n"
 "Last-Translator: Kevin Wolf <kwolf@redhat.com>\n"
 "Language-Team: Deutsch <de@li.org>\n"
-"Language: \n"
+"Language: de\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
diff --git a/po/fr_FR.po b/po/fr_FR.po
index 45b2c01..ec54eb9 100644
--- a/po/fr_FR.po
+++ b/po/fr_FR.po
@@ -10,7 +10,7 @@ msgstr ""
 "PO-Revision-Date: 2013-03-31 19:39+0200\n"
 "Last-Translator: Aurelien Jarno <aurelien@aurel32.net>\n"
 "Language-Team: French <FR@li.org>\n"
-"Language: \n"
+"Language: fr\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
diff --git a/po/hu.po b/po/hu.po
index 0a44c66..401ed21 100644
--- a/po/hu.po
+++ b/po/hu.po
@@ -10,7 +10,7 @@ msgstr ""
 "PO-Revision-Date: 2013-05-06 20:42+0200\n"
 "Last-Translator: =C3=81kos Kov=C3=A1cs <akoskovacs@gmx.com>\n"
 "Language-Team: Hungarian <hu@li.org>\n"
-"Language: \n"
+"Language: hu\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
diff --git a/po/it.po b/po/it.po
index 592d3d8..a62665c 100644
--- a/po/it.po
+++ b/po/it.po
@@ -10,7 +10,7 @@ msgstr ""
 "PO-Revision-Date: 2012-02-27 08:23+0100\n"
 "Last-Translator: Paolo Bonzini <pbonzini@redhat.com>\n"
 "Language-Team: Italian <it@li.org>\n"
-"Language: \n"
+"Language: it\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
diff --git a/po/tr.po b/po/tr.po
index d57995a..d712ced 100644
--- a/po/tr.po
+++ b/po/tr.po
@@ -10,7 +10,7 @@ msgstr ""
 "PO-Revision-Date: 2013-04-22 18:35+0300\n"
 "Last-Translator: Ozan =C3=87a=C4=9Flayan <ozancag@gmail.com>\n"
 "Language-Team: T=C3=BCrk=C3=A7e <>\n"
-"Language: \n"
+"Language: tr\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
--=20
1.7.10.4


