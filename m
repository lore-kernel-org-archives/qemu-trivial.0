Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynh0B-0000pq-Fz
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:27:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh05-0000e1-H0
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh04-0000dV-NZ
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yngzx-0000bF-AW; Thu, 30 Apr 2015 01:26:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7A36042B8C;
	Thu, 30 Apr 2015 08:26:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F0049956;
	Thu, 30 Apr 2015 08:08:58 +0300 (MSK)
Received: (nullmailer pid 4331 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:32 +0300
Message-Id: <cbf2135bf4849ab571352131f4355bfbad7d32ba.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 19/42] arm: cpu.h: Remove unused typdefs
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
X-List-Received-Date: Thu, 30 Apr 2015 05:27:06 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

These CP accessor function prototypes are unused. Remove them.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-arm/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index d63d9b2..8df0b6a 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -93,11 +93,6 @@
 #define ARM_CPU_VIRQ 2
 #define ARM_CPU_VFIQ 3
 
-typedef void ARMWriteCPFunc(void *opaque, int cp_info,
-                            int srcreg, int operand, uint32_t value);
-typedef uint32_t ARMReadCPFunc(void *opaque, int cp_info,
-                               int dstreg, int operand);
-
 struct arm_boot_info;
 
 #define NB_MMU_MODES 7
-- 
2.1.4


