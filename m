Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMpg-0002rC-11
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:36:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpc-0002nR-KI
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpb-0006N4-HQ
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58572)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMpX-0006KZ-1j; Thu, 31 Aug 2017 06:36:11 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1ACF4C047B6F;
	Thu, 31 Aug 2017 10:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1ACF4C047B6F
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 730AC9ABBC;
	Thu, 31 Aug 2017 10:36:09 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 31 Aug 2017 12:34:23 +0200
Message-Id: <20170831103432.6007-21-marcandre.lureau@redhat.com>
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 31 Aug 2017 10:36:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 20/29] usb-hub: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 31 Aug 2017 10:36:18 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 hw/usb/dev-hub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index e82a6a6c44..752e30c305 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -109,7 +109,7 @@ static const USBDescIface desc_iface_hub =3D {
         {
             .bEndpointAddress      =3D USB_DIR_IN | 0x01,
             .bmAttributes          =3D USB_ENDPOINT_XFER_INT,
-            .wMaxPacketSize        =3D 1 + (NUM_PORTS + 7) / 8,
+            .wMaxPacketSize        =3D 1 + DIV_ROUND_UP(NUM_PORTS, 8),
             .bInterval             =3D 0xff,
         },
     }
@@ -442,14 +442,14 @@ static void usb_hub_handle_control(USBDevice *dev, =
USBPacket *p,
             data[2] =3D NUM_PORTS;
=20
             /* fill DeviceRemovable bits */
-            limit =3D ((NUM_PORTS + 1 + 7) / 8) + 7;
+            limit =3D DIV_ROUND_UP(NUM_PORTS + 1, 8) + 7;
             for (n =3D 7; n < limit; n++) {
                 data[n] =3D 0x00;
                 var_hub_size++;
             }
=20
             /* fill PortPwrCtrlMask bits */
-            limit =3D limit + ((NUM_PORTS + 7) / 8);
+            limit =3D limit + DIV_ROUND_UP(NUM_PORTS, 8);
             for (;n < limit; n++) {
                 data[n] =3D 0xff;
                 var_hub_size++;
@@ -477,7 +477,7 @@ static void usb_hub_handle_data(USBDevice *dev, USBPa=
cket *p)
             unsigned int status;
             uint8_t buf[4];
             int i, n;
-            n =3D (NUM_PORTS + 1 + 7) / 8;
+            n =3D DIV_ROUND_UP(NUM_PORTS + 1, 8);
             if (p->iov.size =3D=3D 1) { /* FreeBSD workaround */
                 n =3D 1;
             } else if (n > p->iov.size) {
--=20
2.14.1.146.gd35faa819


