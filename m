Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbqB9-0005fa-UL
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 04:03:39 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbpeA-00067l-Mm
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:29:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpe9-0006NB-SI
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:29:34 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47738)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rbpe6-0006MP-Hf; Sat, 17 Dec 2011 03:29:30 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	15855728327C; Sat, 17 Dec 2011 09:29:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Mo2-XUrgQHFA; Sat, 17 Dec 2011 09:28:59 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 40E587283288; Sat, 17 Dec 2011 09:27:53 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 09:27:35 +0100
Message-Id: <1324110459-3932-8-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 07/11] configure: Fix compiler warnings in
	config.log (uninitialized variable)
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
X-List-Received-Date: Sat, 17 Dec 2011 09:03:39 -0000

warning: =E2=80=98fd=E2=80=99 is used uninitialized in this function
warning: =E2=80=98id=E2=80=99 is used uninitialized in this function

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index b799212..b755ad1 100755
--- a/configure
+++ b/configure
@@ -2237,7 +2237,7 @@ cat > $TMPC << EOF
=20
 int main(void)
 {
-    int len, fd;
+    int len, fd =3D 0;
     len =3D tee(STDIN_FILENO, STDOUT_FILENO, INT_MAX, SPLICE_F_NONBLOCK)=
;
     splice(STDIN_FILENO, NULL, fd, NULL, len, SPLICE_F_MOVE);
     return 0;
@@ -2449,7 +2449,7 @@ fi
 cat > $TMPC <<EOF
 #include <signal.h>
 #include <time.h>
-int main(void) { clockid_t id; return clock_gettime(id, NULL); }
+int main(void) { return clock_gettime(CLOCK_REALTIME, NULL); }
 EOF
=20
 if compile_prog "" "" ; then
--=20
1.7.2.5


