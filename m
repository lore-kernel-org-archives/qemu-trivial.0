Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RuVyE-0000FA-PB
	for mharc-qemu-trivial@gnu.org; Mon, 06 Feb 2012 16:19:30 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1RuVyD-00009K-0F
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2012 16:19:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1RuVyC-00080N-2s
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2012 16:19:28 -0500
Received: from smtp1-g21.free.fr ([212.27.42.1]:58160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1RuVy8-0007zJ-ME; Mon, 06 Feb 2012 16:19:25 -0500
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 44CDA9401B1;
	Mon,  6 Feb 2012 22:19:11 +0100 (CET)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Mon,  6 Feb 2012 22:19:42 +0100
Message-Id: <1328563183-2823-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.8.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 212.27.42.1
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH] ide: fix compilation errors when DEBUG_IDE
	is set
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
X-List-Received-Date: Mon, 06 Feb 2012 21:19:30 -0000


Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 hw/ide/pci.c  |    2 +-
 hw/ide/piix.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 246dd57..88c0942 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -336,7 +336,7 @@ static uint64_t bmdma_addr_read(void *opaque, target_=
phys_addr_t addr,
=20
     data =3D (bm->addr >> (addr * 8)) & mask;
 #ifdef DEBUG_IDE
-    printf("%s: 0x%08x\n", __func__, (unsigned)*data);
+    printf("%s: 0x%08x\n", __func__, (unsigned)data);
 #endif
     return data;
 }
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index bf4465b..76cf209 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -53,7 +53,7 @@ static uint64_t bmdma_read(void *opaque, target_phys_ad=
dr_t addr, unsigned size)
         break;
     }
 #ifdef DEBUG_IDE
-    printf("bmdma: readb 0x%02x : 0x%02x\n", addr, val);
+    printf("bmdma: readb 0x%02x : 0x%02x\n", (uint8_t)addr, val);
 #endif
     return val;
 }
@@ -68,7 +68,7 @@ static void bmdma_write(void *opaque, target_phys_addr_=
t addr,
     }
=20
 #ifdef DEBUG_IDE
-    printf("bmdma: writeb 0x%02x : 0x%02x\n", addr, val);
+    printf("bmdma: writeb 0x%02x : 0x%02x\n", (uint8_t)addr, (uint8_t)va=
l);
 #endif
     switch(addr & 3) {
     case 0:
--=20
1.7.8.3


