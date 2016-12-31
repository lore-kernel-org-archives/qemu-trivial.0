Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cNKkg-0004cn-FW
	for mharc-qemu-trivial@gnu.org; Sat, 31 Dec 2016 09:35:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1cNKke-0004c0-GI
	for qemu-trivial@nongnu.org; Sat, 31 Dec 2016 09:35:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1cNKkd-0003Ow-LQ
	for qemu-trivial@nongnu.org; Sat, 31 Dec 2016 09:35:16 -0500
Received: from smtp5-g21.free.fr ([212.27.42.5]:3115)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <hpoussin@reactos.org>)
	id 1cNKkX-0003Da-9K; Sat, 31 Dec 2016 09:35:09 -0500
Received: from localhost.localdomain (unknown [78.230.185.200])
	by smtp5-g21.free.fr (Postfix) with ESMTP id DF8995FFD0;
	Sat, 31 Dec 2016 15:35:03 +0100 (CET)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 31 Dec 2016 15:34:16 +0100
Message-Id: <1483194856-14079-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 212.27.42.5
Subject: [Qemu-trivial] [PATCH] vl: disable default cdrom when using
 explicitely scsi-hd
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
X-List-Received-Date: Sat, 31 Dec 2016 14:35:17 -0000

'ide-hd', 'ide-cd' and 'scsi-cd' devices already disable default cdrom.
Make it the same for 'scsi-hd'.

That way, we can add/replace the device on lun=3D2 without using -nodefau=
lts.

Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/vl.c b/vl.c
index d77dd86..da97fe2 100644
--- a/vl.c
+++ b/vl.c
@@ -223,6 +223,7 @@ static struct {
     { .driver =3D "ide-hd",               .flag =3D &default_cdrom     }=
,
     { .driver =3D "ide-drive",            .flag =3D &default_cdrom     }=
,
     { .driver =3D "scsi-cd",              .flag =3D &default_cdrom     }=
,
+    { .driver =3D "scsi-hd",              .flag =3D &default_cdrom     }=
,
     { .driver =3D "virtio-serial-pci",    .flag =3D &default_virtcon   }=
,
     { .driver =3D "virtio-serial",        .flag =3D &default_virtcon   }=
,
     { .driver =3D "VGA",                  .flag =3D &default_vga       }=
,
--=20
2.1.4


