Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4fIC-0006LV-4q
	for mharc-qemu-trivial@gnu.org; Sun, 10 Feb 2013 17:22:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1U4fI9-0006Ju-QI
	for qemu-trivial@nongnu.org; Sun, 10 Feb 2013 17:22:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1U4f8F-00019v-3H
	for qemu-trivial@nongnu.org; Sun, 10 Feb 2013 17:12:20 -0500
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10]:54385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1U4f7S-0000yx-Fl; Sun, 10 Feb 2013 17:11:31 -0500
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id DB32894016D;
	Sun, 10 Feb 2013 23:11:24 +0100 (CET)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2013 23:12:11 +0100
Message-Id: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::10
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH] ide: log error when trying to use ATAPI
	overlapping features
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
X-List-Received-Date: Sun, 10 Feb 2013 22:22:34 -0000


Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 hw/ide/core.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 3743dc3..f0ab1a8 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1394,8 +1394,10 @@ void ide_exec_cmd(IDEBus *bus, uint32_t val)
         break;
     case WIN_PACKETCMD:
         /* overlapping commands not supported */
-        if (s->feature & 0x02)
+        if (s->feature & 0x02) {
+            qemu_log_mask(LOG_UNIMP, "ide: overlapping command not suppo=
rted");
             goto abort_cmd;
+        }
         s->status =3D READY_STAT | SEEK_STAT;
         s->atapi_dma =3D s->feature & 1;
         s->nsector =3D 1;
--=20
1.7.10.4


