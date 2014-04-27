Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeMf9-0004OG-20
	for mharc-qemu-trivial@gnu.org; Sun, 27 Apr 2014 06:50:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeMf3-0004DB-10
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 06:50:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeMey-0006Yr-Io
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 06:50:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WeMep-0006MJ-Cn; Sun, 27 Apr 2014 06:50:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B539442F06;
	Sun, 27 Apr 2014 14:50:00 +0400 (MSK)
Message-ID: <535CE0D8.5090409@msgid.tls.msk.ru>
Date: Sun, 27 Apr 2014 14:50:00 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <1397823342-25013-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1397823342-25013-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] po: Update all *.po files
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
X-List-Received-Date: Sun, 27 Apr 2014 10:50:21 -0000

18.04.2014 16:15, Stefan Weil wrote:
> Most changes were caused by line changes in ui/gtk.c and updated
> automatically by running "make -C po update".
>=20
> In addition, the header entry "Language" was fixed, see this reference:
> http://www.gnu.org/software/gettext/manual/html_node/Header-Entry.html.
>=20
> "Project-Id-Version" now shows the current QEMU version.
>=20
> Some unused translations for "_FILE" were removed, too.
[]

> diff --git a/po/de_DE.po b/po/de_DE.po
> index 8636f3b..379757c 100644
> --- a/po/de_DE.po
> +++ b/po/de_DE.po
> @@ -4,61 +4,58 @@
>  #
>  msgid ""
>  msgstr ""
> -"Project-Id-Version: QEMU 1.4.50\n"
> +"Project-Id-Version: QEMU 2.0.50\n"
>  "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
> -"POT-Creation-Date: 2013-11-16 15:25+0100\n"
> +"POT-Creation-Date: 2014-04-18 13:53+0200\n"

It looks like you used some local tree for this.
In upstream qemu git tree, those files are dated
2013-07-05 22:36+0200, not 2013-11.  From a patch
of yours, e9a72359a54978f, dated 5 Aug 2013.

Note also that in upstream git, no translations of
_FILE exists, as far as I can see.

I updated the Language: tags, here's how it looks like:

---- cut ----
diff --git a/po/de_DE.po b/po/de_DE.po
index fcbde95..dec68c9 100644
--- a/po/de_DE.po
+++ b/po/de_DE.po
@@ -12,3 +12,3 @@ msgstr ""
 "Language-Team: Deutsch <de@li.org>\n"
-"Language: \n"
+"Language: de\n"
 "MIME-Version: 1.0\n"
diff --git a/po/fr_FR.po b/po/fr_FR.po
index 45b2c01..ec54eb9 100644
--- a/po/fr_FR.po
+++ b/po/fr_FR.po
@@ -12,3 +12,3 @@ msgstr ""
 "Language-Team: French <FR@li.org>\n"
-"Language: \n"
+"Language: fr\n"
 "MIME-Version: 1.0\n"
diff --git a/po/hu.po b/po/hu.po
index 0a44c66..401ed21 100644
--- a/po/hu.po
+++ b/po/hu.po
@@ -12,3 +12,3 @@ msgstr ""
 "Language-Team: Hungarian <hu@li.org>\n"
-"Language: \n"
+"Language: hu\n"
 "MIME-Version: 1.0\n"
diff --git a/po/it.po b/po/it.po
index 592d3d8..a62665c 100644
--- a/po/it.po
+++ b/po/it.po
@@ -12,3 +12,3 @@ msgstr ""
 "Language-Team: Italian <it@li.org>\n"
-"Language: \n"
+"Language: it\n"
 "MIME-Version: 1.0\n"
diff --git a/po/tr.po b/po/tr.po
index d57995a..d712ced 100644
--- a/po/tr.po
+++ b/po/tr.po
@@ -12,3 +12,3 @@ msgstr ""
 "Language-Team: T=C3=BCrk=C3=A7e <>\n"
-"Language: \n"
+"Language: tr\n"
 "MIME-Version: 1.0\n"
---- cut ----

I think this update alone deserves a separate commit.
I can re-run `make -C po update' and commit the result.

Thanks,

/mjt


