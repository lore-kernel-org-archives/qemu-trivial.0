Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a6pOt-0004I6-JJ
	for mharc-qemu-trivial@gnu.org; Wed, 09 Dec 2015 19:48:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1a6pOr-0004Fr-Em
	for qemu-trivial@nongnu.org; Wed, 09 Dec 2015 19:48:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1a6pOq-0003kX-RF
	for qemu-trivial@nongnu.org; Wed, 09 Dec 2015 19:48:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>)
	id 1a6pOn-0003jc-Uq; Wed, 09 Dec 2015 19:47:58 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 8CD5B5D;
	Thu, 10 Dec 2015 00:47:57 +0000 (UTC)
Received: from localhost (ovpn-113-41.phx2.redhat.com [10.3.113.41])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBA0lucA016502; Wed, 9 Dec 2015 19:47:57 -0500
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Date: Thu, 10 Dec 2015 01:47:46 +0100
Message-Id: <1449708466-13366-2-git-send-email-marcandre.lureau@redhat.com>
In-Reply-To: <1449708466-13366-1-git-send-email-marcandre.lureau@redhat.com>
References: <1449708466-13366-1-git-send-email-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/2] configure: fix trace backend check
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
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 6a971a2..ba57b3f 100755
--- a/configure
+++ b/configure
@@ -4816,7 +4816,7 @@ echo "libcap-ng support $cap_ng"
 echo "vhost-net support $vhost_net"
 echo "vhost-scsi support $vhost_scsi"
 echo "Trace backends    $trace_backends"
-if test "$trace_backend" =3D "simple"; then
+if have_backend "simple"; then
 echo "Trace output file $trace_file-<pid>"
 fi
 if test "$spice" =3D "yes"; then
--=20
2.5.0


