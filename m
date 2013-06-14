Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRfO-0001n1-BS
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:55:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRfH-0001ZH-9n
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:55:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRfG-0005rl-0e
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:55:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRfA-0005pn-Mr; Fri, 14 Jun 2013 06:55:24 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E5A6841667;
	Fri, 14 Jun 2013 14:55:23 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 3A30E528; Fri, 14 Jun 2013 14:50:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:41 +0400
Message-Id: <1371207042-17980-26-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 25/26] cputlb: fix debug logs
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
X-List-Received-Date: Fri, 14 Jun 2013 10:55:33 -0000

From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

'pd' variable has been removed in 06ef3525e1f271b6a842781a05eace5cf63b95c=
2.

Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 cputlb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cputlb.c b/cputlb.c
index 86666c8..1230e9e 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -262,8 +262,8 @@ void tlb_set_page(CPUArchState *env, target_ulong vad=
dr,
=20
 #if defined(DEBUG_TLB)
     printf("tlb_set_page: vaddr=3D" TARGET_FMT_lx " paddr=3D0x" TARGET_F=
MT_plx
-           " prot=3D%x idx=3D%d pd=3D0x%08lx\n",
-           vaddr, paddr, prot, mmu_idx, pd);
+           " prot=3D%x idx=3D%d\n",
+           vaddr, paddr, prot, mmu_idx);
 #endif
=20
     address =3D vaddr;
--=20
1.7.10.4


