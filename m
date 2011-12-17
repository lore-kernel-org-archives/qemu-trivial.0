Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rbpdt-00058g-S8
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 03:29:17 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpdq-0004yT-P3
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:29:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpdq-0006Lh-1S
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:29:14 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rbpdm-0006L3-A2; Sat, 17 Dec 2011 03:29:10 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C951E7282E52; Sat, 17 Dec 2011 09:28:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id p3BWySWW0JBE; Sat, 17 Dec 2011 09:28:39 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id B82B17283281; Sat, 17 Dec 2011 09:27:52 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 09:27:33 +0100
Message-Id: <1324110459-3932-6-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 05/11] configure: Fix compiler warning in
	config.log (unused variable)
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
X-List-Received-Date: Sat, 17 Dec 2011 08:29:15 -0000

warning: unused variable =E2=80=98iov=E2=80=99

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index 5d860a7..efc7b6b 100755
--- a/configure
+++ b/configure
@@ -2060,7 +2060,7 @@ cat > $TMPC <<EOF
 #include <sys/types.h>
 #include <sys/uio.h>
 #include <unistd.h>
-int main(void) { struct iovec iov; return 0; }
+int main(void) { return sizeof(struct iovec); }
 EOF
 iovec=3Dno
 if compile_prog "" "" ; then
--=20
1.7.2.5


