Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h2gZY-00018C-Bd
	for mharc-qemu-trivial@gnu.org; Sat, 09 Mar 2019 13:19:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2gZW-000171-Je
	for qemu-trivial@nongnu.org; Sat, 09 Mar 2019 13:19:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2gZV-0004H5-V4
	for qemu-trivial@nongnu.org; Sat, 09 Mar 2019 13:19:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47060)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h2gZO-0004BY-Hw; Sat, 09 Mar 2019 13:19:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D5DE3082B4D;
	Sat,  9 Mar 2019 18:19:37 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9214611A6;
	Sat,  9 Mar 2019 18:19:33 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Laszlo Ersek <lersek@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org
Date: Sat,  9 Mar 2019 19:19:20 +0100
Message-Id: <20190309181920.30553-3-philmd@redhat.com>
In-Reply-To: <20190309181920.30553-1-philmd@redhat.com>
References: <20190309181920.30553-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Sat, 09 Mar 2019 18:19:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v3 2/2] hw/nvram/fw_cfg: Use the ldst API
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
X-List-Received-Date: Sat, 09 Mar 2019 18:19:47 -0000

The load/store API eases code review.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 7fdf04adc9..3d8859e333 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -85,7 +85,7 @@ static char *read_splashfile(char *filename, gsize *fil=
e_sizep,
     }
=20
     /* check magic ID */
-    filehead =3D ((content[0] & 0xff) + (content[1] << 8)) & 0xffff;
+    filehead =3D lduw_le_p(content);
     if (filehead =3D=3D 0xd8ff) {
         file_type =3D JPG_FILE;
     } else if (filehead =3D=3D 0x4d42) {
@@ -96,7 +96,7 @@ static char *read_splashfile(char *filename, gsize *fil=
e_sizep,
=20
     /* check BMP bpp */
     if (file_type =3D=3D BMP_FILE) {
-        bmp_bpp =3D (content[28] + (content[29] << 8)) & 0xffff;
+        bmp_bpp =3D lduw_le_p(&content[28]);
         if (bmp_bpp !=3D 24) {
             goto error;
         }
--=20
2.20.1


