Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S2sH1-0005t2-G0
	for mharc-qemu-trivial@gnu.org; Wed, 29 Feb 2012 17:45:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1S2sGy-0005sY-Mp
	for qemu-trivial@nongnu.org; Wed, 29 Feb 2012 17:45:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1S2sGe-00081D-5b
	for qemu-trivial@nongnu.org; Wed, 29 Feb 2012 17:45:24 -0500
Received: from smtp1-g21.free.fr ([212.27.42.1]:43338)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1S2sGa-0007qx-D3; Wed, 29 Feb 2012 17:45:00 -0500
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 8D2A7940096;
	Wed, 29 Feb 2012 23:44:46 +0100 (CET)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Wed, 29 Feb 2012 23:44:58 +0100
Message-Id: <1330555499-11726-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.9
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 212.27.42.1
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH] pc: make user-triggerable exit conditional
	to DEBUG_BIOS define
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
X-List-Received-Date: Wed, 29 Feb 2012 22:45:26 -0000

The port 0x501 is (at least) used by SCO Xenix 2.3.4 installer.

Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 hw/pc.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/hw/pc.c b/hw/pc.c
index 12c02f2..113a38a 100644
--- a/hw/pc.c
+++ b/hw/pc.c
@@ -565,7 +565,10 @@ static void bochs_bios_write(void *opaque, uint32_t =
addr, uint32_t val)
         /* LGPL'ed VGA BIOS messages */
     case 0x501:
     case 0x502:
+#ifdef DEBUG_BIOS
         exit((val << 1) | 1);
+#endif
+        break;
     case 0x500:
     case 0x503:
 #ifdef DEBUG_BIOS
--=20
1.7.9


