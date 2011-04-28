Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1k-0001Ok-SD
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1c-00019X-S8
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1b-0006kw-F4
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:04 -0400
Received: from moutng.kundenserver.de ([212.227.126.186]:49168)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1S-0006dw-Gb; Thu, 28 Apr 2011 11:20:54 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap1) with ESMTP (Nemesis)
	id 0Las3s-1PVAus09AO-00knDz; Thu, 28 Apr 2011 17:20:46 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1J-0002BJ-6c; Thu, 28 Apr 2011 17:20:45 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:27 +0200
Message-Id: <1304004042-8334-3-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:f7VaL2PMyyP4VFtSzgswyMKE4xsuCAW/fodeZe/o4J6
	Our+TOeeoqmGaX1BiLmpyOHIuA6qzM/a5au4+fgC5l3nYOFity
	2unK4vs+YWMJumjR71CcXxLnjw7VzwAj7y4nKqoJudzY8WGVJJ
	Zw8Mo0Ltfq56rERuCXSrCdnl4EgtiJ/bIbAiIWsNAy6nhzk5IY
	lfIQH8poMdU2LCF2If4PaDiQFOVN29ts6GUPAaM1hYYo8pH9wB yKpwzhFvxWQLm
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.186
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 03/18] Fix typos in comments (accessable ->
	accessible, priveleged -> privileged)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:06 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hw/sh7750_regs.h  |    6 +++---
 target-cris/cpu.h |    2 +-
 tests/test-mmap.c |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/sh7750_regs.h b/hw/sh7750_regs.h
index 5a23a2c..6ec13ab 100644
--- a/hw/sh7750_regs.h
+++ b/hw/sh7750_regs.h
@@ -23,9 +23,9 @@
  * All register has 2 addresses: in 0xff000000 - 0xffffffff (P4 address)  and
  * in 0x1f000000 - 0x1fffffff (area 7 address)
  */
-#define SH7750_P4_BASE       0xff000000	/* Accessable only in
-					   priveleged mode */
-#define SH7750_A7_BASE       0x1f000000	/* Accessable only using TLB */
+#define SH7750_P4_BASE       0xff000000	/* Accessible only in
+					   privileged mode */
+#define SH7750_A7_BASE       0x1f000000	/* Accessible only using TLB */
 
 #define SH7750_P4_REG32(ofs) (SH7750_P4_BASE + (ofs))
 #define SH7750_A7_REG32(ofs) (SH7750_A7_BASE + (ofs))
diff --git a/target-cris/cpu.h b/target-cris/cpu.h
index d908775..4a9032b 100644
--- a/target-cris/cpu.h
+++ b/target-cris/cpu.h
@@ -101,7 +101,7 @@ typedef struct CPUCRISState {
 	/* P0 - P15 are referred to as special registers in the docs.  */
 	uint32_t pregs[16];
 
-	/* Pseudo register for the PC. Not directly accessable on CRIS.  */
+	/* Pseudo register for the PC. Not directly accessible on CRIS.  */
 	uint32_t pc;
 
 	/* Pseudo register for the kernel stack.  */
diff --git a/tests/test-mmap.c b/tests/test-mmap.c
index c578e25..c67174a 100644
--- a/tests/test-mmap.c
+++ b/tests/test-mmap.c
@@ -322,7 +322,7 @@ void check_file_unfixed_eof_mmaps(void)
 		fail_unless (p1[(test_fsize & pagemask) / sizeof *p1 - 1]
 			     == ((test_fsize - sizeof *p1) / sizeof *p1));
 
-		/* Verify that the end of page is accessable and zeroed.  */
+		/* Verify that the end of page is accessible and zeroed.  */
 		cp = (void *) p1;
 		fail_unless (cp[pagesize - 4] == 0);
 		munmap (p1, pagesize);
@@ -365,7 +365,7 @@ void check_file_fixed_eof_mmaps(void)
 		fail_unless (p1[(test_fsize & pagemask) / sizeof *p1 - 1]
 			     == ((test_fsize - sizeof *p1) / sizeof *p1));
 
-		/* Verify that the end of page is accessable and zeroed.  */
+		/* Verify that the end of page is accessible and zeroed.  */
 		cp = (void *)p1;
 		fail_unless (cp[pagesize - 4] == 0);
 		munmap (p1, pagesize);
-- 
1.7.2.5


