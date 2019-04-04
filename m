Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBwa7-0006Ph-HQ
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2019 03:14:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hBwa5-0006Nw-A0
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 03:14:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hBwa4-0001cv-GL
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 03:14:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hBwa1-0001HG-HZ; Thu, 04 Apr 2019 03:14:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC63D316E912;
	Thu,  4 Apr 2019 07:14:30 +0000 (UTC)
Received: from thuth.com (ovpn-116-76.ams2.redhat.com [10.36.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B1976DFA0;
	Thu,  4 Apr 2019 07:14:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Thu,  4 Apr 2019 09:14:21 +0200
Message-Id: <20190404071421.4891-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 04 Apr 2019 07:14:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/input/pckbd: The i8042 device should not
 be user_creatable
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
X-List-Received-Date: Thu, 04 Apr 2019 07:14:38 -0000

The i8042 PS/2 controller is part of the chipset on the motherboard.
It is instantiated by the machine init code, and it does not make sense
to allow the user to plug an additional i8042 in any of the free ISA slot=
s.
Thus let's mark the device with user_creatable =3D false.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/input/pckbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 47a606f5e3..af393818fc 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -568,6 +568,8 @@ static void i8042_class_initfn(ObjectClass *klass, vo=
id *data)
     dc->realize =3D i8042_realizefn;
     dc->vmsd =3D &vmstate_kbd_isa;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    /* i8042 is a device on the motherboard, and not pluggable by the us=
er */
+    dc->user_creatable =3D false;
 }
=20
 static const TypeInfo i8042_info =3D {
--=20
2.21.0


