Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0Aik-0000QI-84
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 11:36:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0Aig-0000JK-6G
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 11:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0Aif-0004nA-CY
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 11:36:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37597)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0Aia-0004hD-Sy; Wed, 03 Jun 2015 11:36:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 043C4407DD;
	Wed,  3 Jun 2015 18:36:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E3688A51;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: (nullmailer pid 27416 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:22 +0300
Message-Id: <a2f533da00f7278788afcf10f325f636805077dc.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 02/30] microblaze: cpu: Delete MMAP_SHIFT
	definition
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
X-List-Received-Date: Wed, 03 Jun 2015 15:36:43 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

Just fallback on the default of 12 like other architectures. This
allows changing the system-mode-affecting definition of
TARGET_PAGE_BITS without affecting microblaze linux-user.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-microblaze/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index 4ea04ac..d73e1c7 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -285,7 +285,6 @@ int cpu_mb_signal_handler(int host_signum, void *pinfo,
 
 /* FIXME: MB uses variable pages down to 1K but linux only uses 4k.  */
 #define TARGET_PAGE_BITS 12
-#define MMAP_SHIFT TARGET_PAGE_BITS
 
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
-- 
2.1.4


