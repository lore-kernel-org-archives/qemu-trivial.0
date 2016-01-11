Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIY3I-0003xG-19
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:42:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY3E-0003oo-7x
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:42:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY3D-0000uE-EU
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:42:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIY37-0000ri-DL; Mon, 11 Jan 2016 03:42:01 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B6EDE403E1;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 23593A98;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: (nullmailer pid 28781 invoked by uid 1000);
	Mon, 11 Jan 2016 08:41:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:47 +0300
Message-Id: <713572a7b59acfcf8fe0f35c799f647792c8c8cd.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/19] configure: fix trace backend check
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
X-List-Received-Date: Mon, 11 Jan 2016 08:42:09 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Found thanks to shellcheck!

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 83b40fc..44ac9ab 100755
--- a/configure
+++ b/configure
@@ -4817,7 +4817,7 @@ echo "libcap-ng support $cap_ng"
 echo "vhost-net support $vhost_net"
 echo "vhost-scsi support $vhost_scsi"
 echo "Trace backends    $trace_backends"
-if test "$trace_backend" =3D "simple"; then
+if have_backend "simple"; then
 echo "Trace output file $trace_file-<pid>"
 fi
 if test "$spice" =3D "yes"; then
--=20
2.1.4


