Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnkf-0006gU-Ah
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:17:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnkc-0006cM-Tx
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:17:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnka-0000qC-SW
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:17:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53900)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnkY-0000lZ-LI; Sat, 08 Oct 2016 05:16:58 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1A85940EDA;
	Sat,  8 Oct 2016 12:16:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9397DB3A;
	Sat,  8 Oct 2016 11:58:16 +0300 (MSK)
Received: (nullmailer pid 19262 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:06 +0300
Message-Id: <88071589e8c6665c40c39bdefc59ad615693b325.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 20/26] build-sys: fix find-in-path
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
X-List-Received-Date: Sat, 08 Oct 2016 09:17:04 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Fix spelling, the GNU make text functions is not called "find-string"
but "findstring".

Broken in commit 2b2e59e.  Fairly harmless: its only use is in
tests/tcg/Makefile, where the bug can cause the I386_TESTS not to
run when they should.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 rules.mak | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rules.mak b/rules.mak
index 3fdb261..0333ae3 100644
--- a/rules.mak
+++ b/rules.mak
@@ -138,7 +138,7 @@ endef
 # Looks in the PATH if the argument contains no slash, else only conside=
rs one
 # specific directory.  Returns an # empty string if the program doesn't =
exist
 # there.
-find-in-path =3D $(if $(find-string /, $1), \
+find-in-path =3D $(if $(findstring /, $1), \
         $(wildcard $1), \
         $(wildcard $(patsubst %, %/$1, $(subst :, ,$(PATH)))))
=20
--=20
2.1.4


