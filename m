Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QIoBA-0006TH-1L
	for mharc-qemu-trivial@gnu.org; Sat, 07 May 2011 16:32:44 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QIoB7-0006Pf-MH
	for qemu-trivial@nongnu.org; Sat, 07 May 2011 16:32:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QIoB7-0005Lf-0A
	for qemu-trivial@nongnu.org; Sat, 07 May 2011 16:32:41 -0400
Received: from moutng.kundenserver.de ([212.227.17.9]:59382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QIoB4-0005L6-Eh; Sat, 07 May 2011 16:32:38 -0400
Received: from flocke.fritz.box (p54ADACCA.dip.t-dialin.net [84.173.172.202])
	by mrelayeu.kundenserver.de (node=mreu3) with ESMTP (Nemesis)
	id 0MEOzM-1QYBJl2ly4-00FRRX; Sat, 07 May 2011 22:32:30 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QIoAu-0005as-PQ; Sat, 07 May 2011 22:32:28 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Sat,  7 May 2011 22:32:25 +0200
Message-Id: <1304800345-21474-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-Provags-ID: V02:K0:2Unxyct79gi88lhIoDLuC7NWs2mxBV11YPjvY3vbxjS
	FNV05QaDxhUleqiEnVReTVUXQMgn6vlHNE/USRq5C1lp6CIbSy
	pMUmkY1H+cDmFHQzzoYy5PlpjLZAvPgNTVMxSy7emt72q4SxdZ
	RBTrsPtvzZsyzyK1bwHpb6VLbrsyTRR+QqA/NQx8JDBjwq/dae
	yaUdbjwjWnfZgZ/t8jVK3uDgGnmyorqkfeJgziGhWhWGTX9mGg XbOW81gDsF1rU
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.9
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	Riku Voipio <riku.voipio@iki.fi>
Subject: [Qemu-trivial] [PATCH] linux-user: Replace deprecated function
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
X-List-Received-Date: Sat, 07 May 2011 20:32:42 -0000

Function bzero is deprecated, so replace it by function memset.

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 linux-user/syscall.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 279cef3..6e7d88e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -287,7 +287,7 @@ static int sys_uname(struct new_utsname *buf)
    * struct linux kernel uses).
    */
 
-  bzero(buf, sizeof (*buf));
+  memset(buf, 0, sizeof(*buf));
   COPY_UTSNAME_FIELD(buf->sysname, uts_buf.sysname);
   COPY_UTSNAME_FIELD(buf->nodename, uts_buf.nodename);
   COPY_UTSNAME_FIELD(buf->release, uts_buf.release);
-- 
1.7.2.5


