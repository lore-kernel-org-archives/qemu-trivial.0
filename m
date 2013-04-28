Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UWSZo-0003pn-47
	for mharc-qemu-trivial@gnu.org; Sun, 28 Apr 2013 10:27:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UWSZl-0003mv-Ig
	for qemu-trivial@nongnu.org; Sun, 28 Apr 2013 10:27:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UWSZk-0002cP-Kx
	for qemu-trivial@nongnu.org; Sun, 28 Apr 2013 10:27:37 -0400
Received: from cantor2.suse.de ([195.135.220.15]:33234 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UWSZg-0002ak-JL; Sun, 28 Apr 2013 10:27:32 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 7A24E5E00020A;
	Sun, 28 Apr 2013 16:27:31 +0200 (CEST)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Sun, 28 Apr 2013 16:27:26 +0200
Message-Id: <1367159247-13441-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org, agraf@suse.de,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, brogers@suse.com
Subject: [Qemu-trivial] [PATCH for-1.5] configure: Pick up libseccomp
	include path
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
X-List-Received-Date: Sun, 28 Apr 2013 14:27:38 -0000

openSUSE 12.3 has seccomp.h in /usr/include/libseccomp-1.0.1,
so add `pkg-config --cflags libseccomp` output to QEMU_CFLAGS.

Cc: qemu-stable@nongnu.org
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 21438d4..643153f 100755
--- a/configure
+++ b/configure
@@ -1505,6 +1505,7 @@ libs_softmmu=3D"$libs_softmmu -lz"
 if test "$seccomp" !=3D "no" ; then
     if $pkg_config --atleast-version=3D1.0.0 libseccomp --modversion >/d=
ev/null 2>&1; then
         libs_softmmu=3D"$libs_softmmu `$pkg_config --libs libseccomp`"
+        QEMU_CFLAGS=3D"$QEMU_CFLAGS `$pkg_config --cflags libseccomp`"
 	seccomp=3D"yes"
     else
 	if test "$seccomp" =3D "yes"; then
--=20
1.8.1.4


