Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk566-0005rw-C9
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:59:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk564-0005oQ-FN
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk562-0004bw-Nu
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40825)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk55y-0004WR-2o; Wed, 14 Sep 2016 03:59:02 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5613841845;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CBCF5AEB;
	Wed, 14 Sep 2016 10:58:57 +0300 (MSK)
Received: (nullmailer pid 17337 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Stefano=20Dong=20=28=E8=91=A3=E5=85=B4=E6=B0=B4=29?=
	<opensource.dxs@aliyun.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:39 +0300
Message-Id: <5050dc30b50d95c198657f52658eac1f0a41aa88.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 13/27] ivshmem: Delete duplicate debug message
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
X-List-Received-Date: Wed, 14 Sep 2016 07:59:09 -0000

From: Stefano Dong (=E8=91=A3=E5=85=B4=E6=B0=B4) <opensource.dxs@aliyun.c=
om>

Duplicated in commit ca0b756.  Delete it.

Signed-off-by: Stefano Dong (=E8=91=A3=E5=85=B4=E6=B0=B4) <opensource.dxs=
@aliyun.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/misc/ivshmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 40a2ebc..f803dfd 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -628,7 +628,6 @@ static void ivshmem_read(void *opaque, const uint8_t =
*buf, int size)
     s->msg_buffered_bytes =3D 0;
=20
     fd =3D qemu_chr_fe_get_msgfd(s->server_chr);
-    IVSHMEM_DPRINTF("posn is %" PRId64 ", fd is %d\n", msg, fd);
=20
     process_msg(s, msg, fd, &err);
     if (err) {
--=20
2.1.4


