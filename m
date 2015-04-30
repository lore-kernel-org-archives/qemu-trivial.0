Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhJZ-0006sA-Uc
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:47:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhJX-0006nx-NQ
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:47:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhJW-0006cJ-Sm
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:47:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnhJS-0006Zp-D3; Thu, 30 Apr 2015 01:47:06 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 02E4542B94;
	Thu, 30 Apr 2015 08:46:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 739C595B;
	Thu, 30 Apr 2015 08:08:59 +0300 (MSK)
Received: (nullmailer pid 4343 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:38 +0300
Message-Id: <7bf562bacbc3c7180b9ae5f5d7199ba902f34d7f.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 25/42] microblaze: mmu: Delete flip_um fn
	prototype
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
X-List-Received-Date: Thu, 30 Apr 2015 05:47:12 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

This is not implemented or used.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-microblaze/mmu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target-microblaze/mmu.h b/target-microblaze/mmu.h
index 3f74dda..3b7a998 100644
--- a/target-microblaze/mmu.h
+++ b/target-microblaze/mmu.h
@@ -82,7 +82,6 @@ struct microblaze_mmu_lookup
     } err;
 };
 
-void mmu_flip_um(CPUMBState *env, unsigned int um);
 unsigned int mmu_translate(struct microblaze_mmu *mmu,
                            struct microblaze_mmu_lookup *lu,
                            target_ulong vaddr, int rw, int mmu_idx);
-- 
2.1.4


