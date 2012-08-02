Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Swqx1-0007mX-LW
	for mharc-qemu-trivial@gnu.org; Thu, 02 Aug 2012 04:40:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1Swqwv-0007TE-9D
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 04:40:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1Swqwp-0006yr-Jb
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 04:40:05 -0400
Received: from smtp1-g21.free.fr ([212.27.42.1]:52387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1Swqwe-0006wQ-5D; Thu, 02 Aug 2012 04:39:48 -0400
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 6C80194016A;
	Thu,  2 Aug 2012 10:39:42 +0200 (CEST)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Thu,  2 Aug 2012 10:40:30 +0200
Message-Id: <1343896830-3503-2-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1343896830-3503-1-git-send-email-hpoussin@reactos.org>
References: <1343896830-3503-1-git-send-email-hpoussin@reactos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 212.27.42.1
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH 2/2] esp: add missing const on TypeInfo
	structures
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 08:40:09 -0000


Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 hw/esp.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/esp.c b/hw/esp.c
index c6422ad..4b00889 100644
--- a/hw/esp.c
+++ b/hw/esp.c
@@ -816,7 +816,7 @@ static void sysbus_esp_class_init(ObjectClass *klass,=
 void *data)
     dc->vmsd =3D &vmstate_sysbus_esp_scsi;
 }
=20
-static TypeInfo sysbus_esp_info =3D {
+static const TypeInfo sysbus_esp_info =3D {
     .name          =3D "esp",
     .parent        =3D TYPE_SYS_BUS_DEVICE,
     .instance_size =3D sizeof(SysBusESPState),
@@ -1178,7 +1178,7 @@ static void esp_pci_class_init(ObjectClass *klass, =
void *data)
     dc->vmsd =3D &vmstate_esp_pci_scsi;
 }
=20
-static TypeInfo esp_pci_info =3D {
+static const TypeInfo esp_pci_info =3D {
     .name =3D "am53c974",
     .parent =3D TYPE_PCI_DEVICE,
     .instance_size =3D sizeof(PCIESPState),
--=20
1.7.10.4


