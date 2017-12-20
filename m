Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRf1M-00073T-Ah
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 09:06:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1eRf1G-0006y6-69
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 09:06:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1eRf1D-0007Vf-55
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 09:06:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1eRf14-0007KP-T4; Wed, 20 Dec 2017 09:06:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 444AD356D3;
	Wed, 20 Dec 2017 14:06:36 +0000 (UTC)
Received: from localhost (ovpn-112-57.ams2.redhat.com [10.36.112.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE8DE600D4;
	Wed, 20 Dec 2017 14:06:30 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Wed, 20 Dec 2017 15:06:18 +0100
Message-Id: <20171220140618.12701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 20 Dec 2017 14:06:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] vnc: fix debug spelling
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
X-List-Received-Date: Wed, 20 Dec 2017 14:06:54 -0000

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 ui/vnc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 9f8d5a1b1f..7d537b5c6b 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2255,7 +2255,7 @@ static int protocol_client_msg(VncState *vs, uint8_=
t *data, size_t len)
                 }
                 vs->as.nchannels =3D read_u8(data, 5);
                 if (vs->as.nchannels !=3D 1 && vs->as.nchannels !=3D 2) =
{
-                    VNC_DEBUG("Invalid audio channel coount %d\n",
+                    VNC_DEBUG("Invalid audio channel count %d\n",
                               read_u8(data, 5));
                     vnc_client_error(vs);
                     break;
--=20
2.15.1.355.g36791d7216


