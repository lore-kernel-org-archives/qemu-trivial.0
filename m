Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMpT-0002eM-T4
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:36:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpO-0002a2-Sn
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpN-0006H0-VD
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45731)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMpI-0006Dj-FM; Thu, 31 Aug 2017 06:35:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8788D883D2;
	Thu, 31 Aug 2017 10:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8788D883D2
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E846E92BAB;
	Thu, 31 Aug 2017 10:35:54 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 31 Aug 2017 12:34:20 +0200
Message-Id: <20170831103432.6007-18-marcandre.lureau@redhat.com>
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 31 Aug 2017 10:35:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 17/29] virtio-serial: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 31 Aug 2017 10:36:06 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Amit Shah <amit@kernel.org>
---
 hw/char/virtio-serial-bus.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index f5bc173844..17a1bb008a 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -663,7 +663,7 @@ static void virtio_serial_save_device(VirtIODevice *v=
dev, QEMUFile *f)
=20
     /* The ports map */
     max_nr_ports =3D s->serial.max_virtserial_ports;
-    for (i =3D 0; i < (max_nr_ports + 31) / 32; i++) {
+    for (i =3D 0; i < DIV_ROUND_UP(max_nr_ports, 32); i++) {
         qemu_put_be32s(f, &s->ports_map[i]);
     }
=20
@@ -798,7 +798,7 @@ static int virtio_serial_load_device(VirtIODevice *vd=
ev, QEMUFile *f,
     qemu_get_be32s(f, &tmp);
=20
     max_nr_ports =3D s->serial.max_virtserial_ports;
-    for (i =3D 0; i < (max_nr_ports + 31) / 32; i++) {
+    for (i =3D 0; i < DIV_ROUND_UP(max_nr_ports, 32); i++) {
         qemu_get_be32s(f, &ports_map);
=20
         if (ports_map !=3D s->ports_map[i]) {
@@ -863,7 +863,7 @@ static uint32_t find_free_port_id(VirtIOSerial *vser)
     unsigned int i, max_nr_ports;
=20
     max_nr_ports =3D vser->serial.max_virtserial_ports;
-    for (i =3D 0; i < (max_nr_ports + 31) / 32; i++) {
+    for (i =3D 0; i < DIV_ROUND_UP(max_nr_ports, 32); i++) {
         uint32_t map, zeroes;
=20
         map =3D vser->ports_map[i];
@@ -1075,7 +1075,7 @@ static void virtio_serial_device_realize(DeviceStat=
e *dev, Error **errp)
         vser->ovqs[i] =3D virtio_add_queue(vdev, 128, handle_output);
     }
=20
-    vser->ports_map =3D g_malloc0(((vser->serial.max_virtserial_ports + =
31) / 32)
+    vser->ports_map =3D g_malloc0((DIV_ROUND_UP(vser->serial.max_virtser=
ial_ports, 32))
         * sizeof(vser->ports_map[0]));
     /*
      * Reserve location 0 for a console port for backward compat
--=20
2.14.1.146.gd35faa819


