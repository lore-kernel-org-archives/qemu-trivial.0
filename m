Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1m-0001SQ-6J
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1b-00017T-EE
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1a-0006k3-1s
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:03 -0400
Received: from moutng.kundenserver.de ([212.227.126.187]:59066)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1U-0006eg-7S; Thu, 28 Apr 2011 11:20:56 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap1) with ESMTP (Nemesis)
	id 0M2FjY-1PytVd0t3k-00sWSU; Thu, 28 Apr 2011 17:20:49 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1M-0002Bx-4P; Thu, 28 Apr 2011 17:20:48 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:41 +0200
Message-Id: <1304004042-8334-17-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:WR5Z3jzfuWagh/nZ+jrDPWQPBlO32msMCLWo7GCMuTw
	nN3oi8K4z2n261FKSTuH+L2C1j7+lsN0g/DGoEAYJnWVkA+/lV
	F1Qyqn6SmCPaDqFp4qllHs9yhbPgy/38/D443MOTwWCBcGMYec
	nVN27RZoFUoOEhQfMfHSp2dDVH0QUdgDGH7tP4DrQ4+1XXET8Y
	m0RUk64xn/Rwq3s4qAGv+oz0fmhwdJde/h/wB0MvNUdAS2+TxW VktMIXdU418T2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.187
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 17/18] Fix typo in comment (truely -> truly)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:08 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 linux-user/mmap.c           |    2 +-
 target-cris/translate_v10.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 0cf22f8..994c02b 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -354,7 +354,7 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size)
             }
             wrapped = 1;
             /* Don't actually use 0 when wrapping, instead indicate
-               that we'd truely like an allocation in low memory.  */
+               that we'd truly like an allocation in low memory.  */
             addr = (mmap_min_addr > TARGET_PAGE_SIZE
                      ? TARGET_PAGE_ALIGN(mmap_min_addr)
                      : TARGET_PAGE_SIZE);
diff --git a/target-cris/translate_v10.c b/target-cris/translate_v10.c
index 41db158..5b14157 100644
--- a/target-cris/translate_v10.c
+++ b/target-cris/translate_v10.c
@@ -956,7 +956,7 @@ static int dec10_bdap_m(DisasContext *dc, int size)
         return insn_len;
     }
 #endif
-    /* Now the rest of the modes are truely indirect.  */
+    /* Now the rest of the modes are truly indirect.  */
     insn_len += dec10_prep_move_m(dc, 1, size, cpu_PR[PR_PREFIX]);
     tcg_gen_add_tl(cpu_PR[PR_PREFIX], cpu_PR[PR_PREFIX], cpu_R[rd]);
     cris_set_prefix(dc);
-- 
1.7.2.5


