Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhwM-0005gi-HU
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 02:27:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwE-0005NE-1I
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwD-0002bV-8U
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynhw7-0002Z5-9S; Thu, 30 Apr 2015 02:27:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B3C0942BA2;
	Thu, 30 Apr 2015 09:26:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9E6B0951;
	Thu, 30 Apr 2015 08:08:58 +0300 (MSK)
Received: (nullmailer pid 4341 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:37 +0300
Message-Id: <16a8636501a2e9d3b8986da1a7bbbc4df98bb5bb.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 24/42] defconfigs: Piggyback microblazeel on
	microblaze
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
X-List-Received-Date: Thu, 30 Apr 2015 06:27:11 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

Theres no difference in defconfig. Going forward microblazeel should
superset microblaze so use an include.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 default-configs/microblazeel-softmmu.mak | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/default-configs/microblazeel-softmmu.mak b/default-configs/microblazeel-softmmu.mak
index acf22c5..2fcf442 100644
--- a/default-configs/microblazeel-softmmu.mak
+++ b/default-configs/microblazeel-softmmu.mak
@@ -1,11 +1,3 @@
 # Default configuration for microblazeel-softmmu
 
-CONFIG_PTIMER=y
-CONFIG_PFLASH_CFI01=y
-CONFIG_SERIAL=y
-CONFIG_XILINX=y
-CONFIG_XILINX_AXI=y
-CONFIG_XILINX_SPI=y
-CONFIG_XILINX_ETHLITE=y
-CONFIG_SSI=y
-CONFIG_SSI_M25P80=y
+include microblaze-softmmu.mak
-- 
2.1.4


