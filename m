Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d469e-0001uS-T0
	for mharc-qemu-trivial@gnu.org; Fri, 28 Apr 2017 09:41:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@git.antfield.fr>) id 1d45Sk-0005b3-NC
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 08:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@git.antfield.fr>) id 1d45Sf-0001M0-6L
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 08:57:30 -0400
Received: from bee.antfield.fr ([188.165.75.195]:54724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <luc.michel@git.antfield.fr>)
	id 1d45SO-0001Bl-7O; Fri, 28 Apr 2017 08:57:08 -0400
From: Luc MICHEL <luc.michel@git.antfield.fr>
To: qemu-devel@nongnu.org
Cc: Luc MICHEL <luc.michel@git.antfield.fr>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri, 28 Apr 2017 14:56:32 +0200
Message-Id: <20170428125632.5704-2-luc.michel@git.antfield.fr>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170428125632.5704-1-luc.michel@git.antfield.fr>
References: <20170428125632.5704-1-luc.michel@git.antfield.fr>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
X-Mailman-Approved-At: Fri, 28 Apr 2017 09:41:48 -0400
Subject: [Qemu-trivial] [PATCH 1/1] target/arm: add data cache invalidation
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
X-List-Received-Date: Fri, 28 Apr 2017 12:57:31 -0000

The cp15, CRn=15, opc1=0, CRm=5, opc2=0 instruction invalidates all the
data cache on the cortex-r5. Implementing it as a NOP.

Signed-off-by: Luc MICHEL <luc.michel@git.antfield.fr>
---
 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b357aee778..47687a40c4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1062,6 +1062,8 @@ static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST },
     { .name = "BTCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 1,
       .access = PL1_RW, .type = ARM_CP_CONST },
+    { .name = "DCACHE_INVAL", .cp = 15, .opc1 = 0, .crn = 15, .crm = 5,
+      .opc2 = 0, .access = PL1_W, .type = ARM_CP_NOP },
     REGINFO_SENTINEL
 };
 
-- 
2.12.2


