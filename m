Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtZeX-0003NM-BH
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 10:07:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtZeM-0002zx-64
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 10:07:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtZVh-0000Zg-NM
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:58:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59248)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gtZVY-0000FJ-Kt; Tue, 12 Feb 2019 09:58:02 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9C5F88E54;
	Tue, 12 Feb 2019 14:57:58 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F25B117796;
	Tue, 12 Feb 2019 14:57:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Anatoli Huseu1 <avg.tolik@gmail.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 12 Feb 2019 15:57:22 +0100
Message-Id: <20190212145722.31891-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 12 Feb 2019 14:57:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] chardev/wctablet: Fix a typo
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
X-List-Received-Date: Tue, 12 Feb 2019 15:07:15 -0000

The correct name is Wacom.
Fix the typo present this the origin of this file (378af96155d).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 chardev/wctablet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index 969d014574..35dbd29a33 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -177,7 +177,7 @@ static void wctablet_input_sync(DeviceState *dev)
 }
=20
 static QemuInputHandler wctablet_handler =3D {
-    .name  =3D "QEMU Wacome Pen Tablet",
+    .name  =3D "QEMU Wacom Pen Tablet",
     .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
     .event =3D wctablet_input_event,
     .sync  =3D wctablet_input_sync,
--=20
2.20.1


