Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a6pOu-0004If-4k
	for mharc-qemu-trivial@gnu.org; Wed, 09 Dec 2015 19:48:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1a6pOr-0004Ft-ML
	for qemu-trivial@nongnu.org; Wed, 09 Dec 2015 19:48:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1a6pOq-0003kV-RB
	for qemu-trivial@nongnu.org; Wed, 09 Dec 2015 19:48:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>)
	id 1a6pOm-0003jD-Nk; Wed, 09 Dec 2015 19:47:56 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id C45CAC0B0232;
	Thu, 10 Dec 2015 00:47:55 +0000 (UTC)
Received: from localhost (ovpn-113-41.phx2.redhat.com [10.3.113.41])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBA0lsel027822; Wed, 9 Dec 2015 19:47:55 -0500
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Date: Thu, 10 Dec 2015 01:47:45 +0100
Message-Id: <1449708466-13366-1-git-send-email-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [Qemu-trivial] [PATCH 1/2] configure: remove unused or undefined
	variables
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
X-List-Received-Date: Thu, 10 Dec 2015 00:48:02 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Found thanks to shellcheck!

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 configure | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/configure b/configure
index b55dcdd..6a971a2 100755
--- a/configure
+++ b/configure
@@ -3994,7 +3994,6 @@ EOF
 fi
=20
 # check for smartcard support
-smartcard_cflags=3D""
 if test "$smartcard" !=3D "no"; then
     if $pkg_config libcacard; then
         libcacard_cflags=3D$($pkg_config --cflags libcacard)
@@ -4356,7 +4355,6 @@ fi
 # If we can't selectively disable warning in the code, disable -Werror s=
o that
 # the build doesn't fail anyway.
=20
-pragma_disable_unused_but_set=3Dno
 cat > $TMPC << EOF
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wunused-but-set-variable"
@@ -4791,9 +4789,6 @@ if test "$vnc" =3D "yes" ; then
     echo "VNC JPEG support  $vnc_jpeg"
     echo "VNC PNG support   $vnc_png"
 fi
-if test -n "$sparc_cpu"; then
-    echo "Target Sparc Arch $sparc_cpu"
-fi
 echo "xen support       $xen"
 if test "$xen" =3D "yes" ; then
   echo "xen ctrl version  $xen_ctrl_version"
@@ -5285,7 +5280,6 @@ if test "$qom_cast_debug" =3D "yes" ; then
 fi
 if test "$rbd" =3D "yes" ; then
   echo "CONFIG_RBD=3Dm" >> $config_host_mak
-  echo "RBD_CFLAGS=3D$rbd_cflags" >> $config_host_mak
   echo "RBD_LIBS=3D$rbd_libs" >> $config_host_mak
 fi
=20
--=20
2.5.0


