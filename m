Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMoI-0001N1-6J
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:34:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMoF-0001Fw-NM
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:34:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMoE-0005HU-QY
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:34:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52126)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMoA-0005F3-Fa; Thu, 31 Aug 2017 06:34:46 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 773D87E437;
	Thu, 31 Aug 2017 10:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 773D87E437
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B7C0841C7;
	Thu, 31 Aug 2017 10:34:41 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 31 Aug 2017 12:34:05 +0200
Message-Id: <20170831103432.6007-3-marcandre.lureau@redhat.com>
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 31 Aug 2017 10:34:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 02/29] vnc: use QEMU_ALIGN_DOWN
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
X-List-Received-Date: Thu, 31 Aug 2017 10:34:53 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 ui/vnc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 651cbb8606..2c1c0cb5ed 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2624,8 +2624,8 @@ static int vnc_refresh_lossy_rect(VncDisplay *vd, i=
nt x, int y)
     int stx =3D x / VNC_STAT_RECT;
     int has_dirty =3D 0;
=20
-    y =3D y / VNC_STAT_RECT * VNC_STAT_RECT;
-    x =3D x / VNC_STAT_RECT * VNC_STAT_RECT;
+    y =3D QEMU_ALIGN_DOWN(y, VNC_STAT_RECT);
+    x =3D QEMU_ALIGN_DOWN(x, VNC_STAT_RECT);
=20
     QTAILQ_FOREACH(vs, &vd->clients, next) {
         int j;
@@ -2714,8 +2714,8 @@ double vnc_update_freq(VncState *vs, int x, int y, =
int w, int h)
     double total =3D 0;
     int num =3D 0;
=20
-    x =3D  (x / VNC_STAT_RECT) * VNC_STAT_RECT;
-    y =3D  (y / VNC_STAT_RECT) * VNC_STAT_RECT;
+    x =3D  QEMU_ALIGN_DOWN(x, VNC_STAT_RECT);
+    y =3D  QEMU_ALIGN_DOWN(y, VNC_STAT_RECT);
=20
     for (j =3D y; j <=3D y + h; j +=3D VNC_STAT_RECT) {
         for (i =3D x; i <=3D x + w; i +=3D VNC_STAT_RECT) {
--=20
2.14.1.146.gd35faa819


