Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqMF-0006Uo-JX
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:14:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqMA-0006PA-3q
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqM5-0008Ay-3X
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48682)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqLv-0007lR-0q; Tue, 13 Sep 2016 12:14:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 190D7416E3;
	Tue, 13 Sep 2016 19:14:27 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 781D9B00;
	Tue, 13 Sep 2016 19:07:41 +0300 (MSK)
Received: (nullmailer pid 31902 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:48 +0300
Message-Id: <deff0ddb869d4a32f9c55fe3e420b7128792f798.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/16] trace-event: display "%d" instead of
 "0x%d"
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
X-List-Received-Date: Tue, 13 Sep 2016 16:14:50 -0000

From: Laurent Vivier <lvivier@redhat.com>

Display the slot number of mhp_pc_dimm_assigned_slot()
using "%d" without the "0x".

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index 7735e46..5b99eba 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -8,7 +8,7 @@ xen_pv_mmio_read(uint64_t addr) "WARNING: read from Xen PV Device MMIO space (ad
 xen_pv_mmio_write(uint64_t addr) "WARNING: write to Xen PV Device MMIO space (address %"PRIx64")"
 
 # hw/i386/pc.c
-mhp_pc_dimm_assigned_slot(int slot) "0x%d"
+mhp_pc_dimm_assigned_slot(int slot) "%d"
 mhp_pc_dimm_assigned_address(uint64_t addr) "0x%"PRIx64
 
 # hw/i386/x86-iommu.c
-- 
2.1.4


