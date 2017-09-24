Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwFbK-0002vd-4R
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 18:42:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwFbF-0002qF-UQ
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwFbF-00085c-6s
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:42:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwFbA-00083B-Iy; Sun, 24 Sep 2017 18:42:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7A33741C99;
	Mon, 25 Sep 2017 01:42:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1C89FC3D;
	Mon, 25 Sep 2017 00:22:57 +0300 (MSK)
Received: (nullmailer pid 28302 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:49 +0300
Message-Id: <97fb016a2aae686098f01d1c2dc194ed0f8e1c36.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 31/31] hw/isa/pc87312: Mark the device with
 user_creatable = false
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
X-List-Received-Date: Sun, 24 Sep 2017 22:42:10 -0000

From: Thomas Huth <thuth@redhat.com>

QEMU currently aborts if you try to use the device at the command
line:

$ ppc64-softmmu/qemu-system-ppc64 -S -machine prep -device pc87312
Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
qemu-system-ppc64: -device pc87312: Device 'parallel0' is in use
Aborted (core dumped)

It uses parallel_hds in its realize function, so I can not be
instantiated by the user again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/isa/pc87312.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index 5ce9f0a062..48b29e3c3c 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -386,6 +386,8 @@ static void pc87312_class_init(ObjectClass *klass, vo=
id *data)
     dc->reset =3D pc87312_reset;
     dc->vmsd =3D &vmstate_pc87312;
     dc->props =3D pc87312_properties;
+    /* Reason: Uses parallel_hds[0] in realize(), so it can't be used tw=
ice */
+    dc->user_creatable =3D false;
 }
=20
 static const TypeInfo pc87312_type_info =3D {
--=20
2.11.0


