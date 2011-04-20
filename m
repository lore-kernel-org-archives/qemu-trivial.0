Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QCUVH-0004NT-3c
	for mharc-qemu-trivial@gnu.org; Wed, 20 Apr 2011 06:19:23 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QCUVE-0004JD-RQ
	for qemu-trivial@nongnu.org; Wed, 20 Apr 2011 06:19:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QCUVD-0005UO-SL
	for qemu-trivial@nongnu.org; Wed, 20 Apr 2011 06:19:20 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:46053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QCUVC-0005Tp-0o; Wed, 20 Apr 2011 06:19:18 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QCUV9-0000he-A4; Wed, 20 Apr 2011 11:19:15 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 20 Apr 2011 11:19:15 +0100
Message-Id: <1303294755-2679-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] linux-user/arm/nwfpe: rename REG_PC to
	ARM_REG_PC
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2011 10:19:21 -0000

The REG_PC constant used in the ARM nwfpe code is fine in the kernel
but when used in qemu can clash with a definition in the host system
include files (in particular on Ubuntu Lucid SPARC, including signal.h
will define a REG_PC). Rename the constant to avoid this issue.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/arm/nwfpe/fpa11.c      |    2 +-
 linux-user/arm/nwfpe/fpa11.h      |    2 +-
 linux-user/arm/nwfpe/fpa11_cpdt.c |    8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux-user/arm/nwfpe/fpa11.c b/linux-user/arm/nwfpe/fpa11.c
index 0a87c43..eebd93f 100644
--- a/linux-user/arm/nwfpe/fpa11.c
+++ b/linux-user/arm/nwfpe/fpa11.c
@@ -144,7 +144,7 @@ unsigned int EmulateAll(unsigned int opcode, FPA11* qfpa, CPUARMState* qregs)
 
 #if 0
   fprintf(stderr,"emulating FP insn 0x%08x, PC=0x%08x\n",
-          opcode, qregs[REG_PC]);
+          opcode, qregs[ARM_REG_PC]);
 #endif
   fpa11 = GET_FPA11();
 
diff --git a/linux-user/arm/nwfpe/fpa11.h b/linux-user/arm/nwfpe/fpa11.h
index f17647b..002b3cb 100644
--- a/linux-user/arm/nwfpe/fpa11.h
+++ b/linux-user/arm/nwfpe/fpa11.h
@@ -111,7 +111,7 @@ static inline void writeConditionCodes(unsigned int x)
         cpsr_write(user_registers,x,CPSR_NZCV);
 }
 
-#define REG_PC 15
+#define ARM_REG_PC 15
 
 unsigned int EmulateAll(unsigned int opcode, FPA11* qfpa, CPUARMState* qregs);
 
diff --git a/linux-user/arm/nwfpe/fpa11_cpdt.c b/linux-user/arm/nwfpe/fpa11_cpdt.c
index b12e27d..3e7a938 100644
--- a/linux-user/arm/nwfpe/fpa11_cpdt.c
+++ b/linux-user/arm/nwfpe/fpa11_cpdt.c
@@ -220,7 +220,7 @@ static unsigned int PerformLDF(const unsigned int opcode)
    //printk("PerformLDF(0x%08x), Fd = 0x%08x\n",opcode,getFd(opcode));
 
    pBase = readRegister(getRn(opcode));
-   if (REG_PC == getRn(opcode))
+   if (ARM_REG_PC == getRn(opcode))
    {
      pBase += 8;
      write_back = 0;
@@ -256,7 +256,7 @@ static unsigned int PerformSTF(const unsigned int opcode)
    SetRoundingMode(ROUND_TO_NEAREST);
 
    pBase = readRegister(getRn(opcode));
-   if (REG_PC == getRn(opcode))
+   if (ARM_REG_PC == getRn(opcode))
    {
      pBase += 8;
      write_back = 0;
@@ -289,7 +289,7 @@ static unsigned int PerformLFM(const unsigned int opcode)
    target_ulong pBase, pAddress, pFinal;
 
    pBase = readRegister(getRn(opcode));
-   if (REG_PC == getRn(opcode))
+   if (ARM_REG_PC == getRn(opcode))
    {
      pBase += 8;
      write_back = 0;
@@ -322,7 +322,7 @@ static unsigned int PerformSFM(const unsigned int opcode)
    target_ulong pBase, pAddress, pFinal;
 
    pBase = readRegister(getRn(opcode));
-   if (REG_PC == getRn(opcode))
+   if (ARM_REG_PC == getRn(opcode))
    {
      pBase += 8;
      write_back = 0;
-- 
1.7.1


