Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTF6B-0006wT-15
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 14:36:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTF68-0006rG-I0
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 14:36:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTF64-0001Xh-Cb
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 14:36:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTF5u-0001SG-G4; Wed, 04 Mar 2015 14:36:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 99BE5408F6;
	Wed,  4 Mar 2015 22:36:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6C637978;
	Wed,  4 Mar 2015 20:07:11 +0300 (MSK)
Received: (nullmailer pid 17569 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:59 +0300
Message-Id: <976e6ed5bb1eadeaf6977b4eb57fc35715e47022.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 42/47] oslib-posix: Fix compiler warning
	(-Wclobbered) and simplify the code
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
X-List-Received-Date: Wed, 04 Mar 2015 19:36:49 -0000

From: Stefan Weil <sw@weilnetz.de>

gcc reports this warning with -Wclobbered:

util/oslib-posix.c: In function =E2=80=98os_mem_prealloc=E2=80=99:
util/oslib-posix.c:374:49: error: argument =E2=80=98memory=E2=80=99 might=
 be clobbered by
 =E2=80=98longjmp=E2=80=99 or =E2=80=98vfork=E2=80=99 [-Werror=3Dclobbere=
d]

Fix this and simplify the code by using an existing macro.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/oslib-posix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 16fcec2..37ffd96 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -399,10 +399,10 @@ void os_mem_prealloc(int fd, char *area, size_t mem=
ory)
     } else {
         int i;
         size_t hpagesize =3D fd_getpagesize(fd);
+        size_t numpages =3D DIV_ROUND_UP(memory, hpagesize);
=20
         /* MAP_POPULATE silently ignores failures */
-        memory =3D (memory + hpagesize - 1) & -hpagesize;
-        for (i =3D 0; i < (memory / hpagesize); i++) {
+        for (i =3D 0; i < numpages; i++) {
             memset(area + (hpagesize * i), 0, 1);
         }
=20
--=20
2.1.4


