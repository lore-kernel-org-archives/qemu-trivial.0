Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynj1v-0002Nr-Rv
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 03:37:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynj1r-0002EP-MT
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynj1q-0006CG-VY
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:37:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56829)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynj1l-00069B-VZ; Thu, 30 Apr 2015 03:36:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B1B3442BAD;
	Thu, 30 Apr 2015 10:36:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2E4B2962;
	Thu, 30 Apr 2015 08:09:00 +0300 (MSK)
Received: (nullmailer pid 4350 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:41 +0300
Message-Id: <19b8b216d64123c0a2c9440a676d976def741380.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 28/42] microblaze: cpu: Delete EXCP_NMI
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
X-List-Received-Date: Thu, 30 Apr 2015 07:37:04 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

This define is unused. Remove.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-microblaze/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index f21da2f..6522af7 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -36,7 +36,6 @@ typedef struct CPUMBState CPUMBState;
 
 #define ELF_MACHINE	EM_MICROBLAZE
 
-#define EXCP_NMI        1
 #define EXCP_MMU        2
 #define EXCP_IRQ        3
 #define EXCP_BREAK      4
-- 
2.1.4


