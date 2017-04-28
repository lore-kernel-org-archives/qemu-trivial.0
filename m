Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d469d-0001t1-Ct
	for mharc-qemu-trivial@gnu.org; Fri, 28 Apr 2017 09:41:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@git.antfield.fr>) id 1d45SX-0005OT-Kq
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 08:57:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@git.antfield.fr>) id 1d45SW-0001HJ-KZ
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 08:57:17 -0400
Received: from bee.antfield.fr ([188.165.75.195]:54716)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <luc.michel@git.antfield.fr>)
	id 1d45SO-0001Bk-88; Fri, 28 Apr 2017 08:57:08 -0400
From: Luc MICHEL <luc.michel@git.antfield.fr>
To: qemu-devel@nongnu.org
Cc: Luc MICHEL <luc.michel@git.antfield.fr>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri, 28 Apr 2017 14:56:31 +0200
Message-Id: <20170428125632.5704-1-luc.michel@git.antfield.fr>
X-Mailer: git-send-email 2.12.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
X-Mailman-Approved-At: Fri, 28 Apr 2017 09:41:48 -0400
Subject: [Qemu-trivial] [PATCH 0/1] target/arm: add data cache invalidation
 cp15 instruction to cortex-r5
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Apr 2017 12:57:18 -0000

This patch adds the cp15, CRn=15, opc1=0, CRm=5, opc2=0 coprocessor instruction
to the cortex-r5. As stated in the TRM, this instruction invalidates all the
data cache. This trivial patch implements it as NOP as cache operations are not
implemented in QEMU.

The documentation is here:
http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0460d/Bgbdbdjc.html

Tested using this minimal program:
 .global _start
 
 .section .text
 _start:
   mcr p15, 0, r1, c15, c5, 0
 
 idle:
   wfi
   b idle

Before implementation:
 IN: 
 0x00008000:  ee0f1f15      mcr 15, 0, r1, cr15, cr5, {0}

 Taking exception 1 [Undefined Instruction]
 ...from EL1 to EL1
 ...with ESR 0x0/0x2000000

After implementation:
 IN: 
 0x00008000:  ee0f1f15      mcr 15, 0, r1, cr15, cr5, {0}
 0x00008004:  e320f003      wfi

Luc MICHEL (1):
  target/arm: add data cache invalidation cp15 instruction to cortex-r5

 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.12.2


