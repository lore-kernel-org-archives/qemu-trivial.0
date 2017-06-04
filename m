Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXnw-0005H1-DP
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:51:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXnu-0005Ed-2Q
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:50:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXnt-0003CK-CZ
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:50:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53887)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXno-00034C-5r; Sun, 04 Jun 2017 11:50:52 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 60FE3404E7;
	Sun,  4 Jun 2017 18:45:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 42A695E4;
	Sun,  4 Jun 2017 18:45:28 +0300 (MSK)
Received: (nullmailer pid 16374 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Luc MICHEL <luc.michel@git.antfield.fr>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:14 +0300
Message-Id: <95e9a242e2a393c7d4e5cc04340e39c3a9420f03.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/22] target/arm: add data cache invalidation
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
X-List-Received-Date: Sun, 04 Jun 2017 15:50:59 -0000

From: Luc MICHEL <luc.michel@git.antfield.fr>

The cp15, CRn=15, opc1=0, CRm=5, opc2=0 instruction invalidates all the
data cache on the cortex-r5. Implementing it as a NOP.

Signed-off-by: Luc MICHEL <luc.michel@git.antfield.fr>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e748097860..04a3fea03f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1082,6 +1082,8 @@ static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST },
     { .name = "BTCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 1,
       .access = PL1_RW, .type = ARM_CP_CONST },
+    { .name = "DCACHE_INVAL", .cp = 15, .opc1 = 0, .crn = 15, .crm = 5,
+      .opc2 = 0, .access = PL1_W, .type = ARM_CP_NOP },
     REGINFO_SENTINEL
 };
 
-- 
2.11.0


