Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YS3M1-0002oM-7G
	for mharc-qemu-trivial@gnu.org; Sun, 01 Mar 2015 07:52:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YS3Lw-0002ji-QW
	for qemu-trivial@nongnu.org; Sun, 01 Mar 2015 07:52:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YS3Lv-0006Wz-V2
	for qemu-trivial@nongnu.org; Sun, 01 Mar 2015 07:52:12 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:46573)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YS3Lt-0006W7-Td; Sun, 01 Mar 2015 07:52:10 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id E20691803EC; Sun,  1 Mar 2015 13:52:06 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  1 Mar 2015 13:52:06 +0100
Message-Id: <1425214326-25326-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] oslib-posix: Fix compiler warning
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
X-List-Received-Date: Sun, 01 Mar 2015 12:52:14 -0000

gcc reports this warning with -Wclobbered:

util/oslib-posix.c: In function =E2=80=98os_mem_prealloc=E2=80=99:
util/oslib-posix.c:374:49: error: argument =E2=80=98memory=E2=80=99 might=
 be clobbered by
 =E2=80=98longjmp=E2=80=99 or =E2=80=98vfork=E2=80=99 [-Werror=3Dclobbere=
d]

Fix this and simplify the code by using an existing macro.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 util/oslib-posix.c |    4 ++--
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
1.7.10.4


