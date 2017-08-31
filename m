Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMow-0002Bm-83
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:35:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMot-00027D-J6
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMos-0005fR-Fv
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:35:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41134)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMoq-0005dP-4M; Thu, 31 Aug 2017 06:35:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31199883BF;
	Thu, 31 Aug 2017 10:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 31199883BF
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A42B3841C8;
	Thu, 31 Aug 2017 10:35:24 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 31 Aug 2017 12:34:14 +0200
Message-Id: <20170831103432.6007-12-marcandre.lureau@redhat.com>
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 31 Aug 2017 10:35:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 11/29] vnc: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 31 Aug 2017 10:35:32 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 ui/vnc-enc-tight.c | 2 +-
 ui/vnc.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
index 89ab12c0d8..f38aceb4da 100644
--- a/ui/vnc-enc-tight.c
+++ b/ui/vnc-enc-tight.c
@@ -979,7 +979,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
     }
 #endif
=20
-    bytes =3D ((w + 7) / 8) * h;
+    bytes =3D (DIV_ROUND_UP(w, 8)) * h;
=20
     vnc_write_u8(vs, (stream | VNC_TIGHT_EXPLICIT_FILTER) << 4);
     vnc_write_u8(vs, VNC_TIGHT_FILTER_PALETTE);
diff --git a/ui/vnc.c b/ui/vnc.c
index 2c1c0cb5ed..fd43f9b983 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2781,7 +2781,7 @@ static int vnc_refresh_server_surface(VncDisplay *v=
d)
             PIXMAN_FORMAT_BPP(pixman_image_get_format(vd->guest.fb));
         guest_row0 =3D (uint8_t *)pixman_image_get_data(vd->guest.fb);
         guest_stride =3D pixman_image_get_stride(vd->guest.fb);
-        guest_ll =3D pixman_image_get_width(vd->guest.fb) * ((guest_bpp =
+ 7) / 8);
+        guest_ll =3D pixman_image_get_width(vd->guest.fb) * (DIV_ROUND_U=
P(guest_bpp, 8));
     }
     line_bytes =3D MIN(server_stride, guest_ll);
=20
--=20
2.14.1.146.gd35faa819


