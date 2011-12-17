Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rbpdd-00048m-0a
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 03:29:01 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpda-0003xQ-7U
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:28:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbpdZ-0006KZ-38
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:28:58 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58915)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RbpdR-0006J5-Ty; Sat, 17 Dec 2011 03:28:50 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	646B57282E52; Sat, 17 Dec 2011 09:28:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 2CYX4I4Ty2r9; Sat, 17 Dec 2011 09:28:19 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 2F7BC7282E5C; Sat, 17 Dec 2011 09:27:51 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 09:27:30 +0100
Message-Id: <1324110459-3932-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 02/11] configure: Fix compiler warnings in
	config.log (old-style function definition)
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
X-List-Received-Date: Sat, 17 Dec 2011 08:29:00 -0000

warning: function declaration isn=E2=80=99t a prototype
In function =E2=80=98foo=E2=80=99:
warning: old-style function definition

The function name was changed, too, to avoid an additional warning.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 03b8f35..93c6cbe 100755
--- a/configure
+++ b/configure
@@ -1274,11 +1274,11 @@ if test "$nptl" !=3D "no" ; then
   cat > $TMPC <<EOF
 #include <sched.h>
 #include <linux/futex.h>
-void foo()
-{
+int main(void) {
 #if !defined(CLONE_SETTLS) || !defined(FUTEX_WAIT)
 #error bork
 #endif
+  return 0;
 }
 EOF
=20
--=20
1.7.2.5


