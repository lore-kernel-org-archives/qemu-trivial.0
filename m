Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SBZsg-0007xY-QB
	for mharc-qemu-trivial@gnu.org; Sat, 24 Mar 2012 18:56:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1SBZse-0007qa-4K
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2012 18:56:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1SBZsc-0007dI-GI
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2012 18:56:15 -0400
Received: from smtp1-g21.free.fr ([212.27.42.1]:42924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1SBZsY-0007c0-HH; Sat, 24 Mar 2012 18:56:11 -0400
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 6A6F69400CB;
	Sat, 24 Mar 2012 23:55:56 +0100 (CET)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Sat, 24 Mar 2012 23:56:14 +0100
Message-Id: <1332629775-15200-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 212.27.42.1
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] qxl: fix compilation failure on 32 bit hosts
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
X-List-Received-Date: Sat, 24 Mar 2012 22:56:17 -0000


Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 trace-events |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/trace-events b/trace-events
index 70f059d..8fa1c1c 100644
--- a/trace-events
+++ b/trace-events
@@ -726,7 +726,7 @@ ppm_save(const char *filename, void *display_surface)=
 "%s surface=3D%p"
 # hw/qxl.c
 disable qxl_interface_set_mm_time(int qid, uint32_t mm_time) "%d %d"
 disable qxl_io_write_vga(int qid, const char *mode, uint32_t addr, uint3=
2_t val) "%d %s addr=3D%u val=3D%u"
-qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uint6=
4_t mem, uint32_t format, uint32_t position) "%d %dx%d mem=3D%lx %d,%d"
+qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uint6=
4_t mem, uint32_t format, uint32_t position) "%d %dx%d mem=3D%"PRIx64" %d=
,%d"
 qxl_create_guest_primary_rest(int qid, int32_t stride, uint32_t type, ui=
nt32_t flags) "%d %d,%d,%d"
 qxl_destroy_primary(int qid) "%d"
 qxl_enter_vga_mode(int qid) "%d"
--=20
1.7.9.1


