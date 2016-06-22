Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bFkAd-0004ef-EF
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jun 2016 11:34:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bFkAb-0004Yw-QW
	for qemu-trivial@nongnu.org; Wed, 22 Jun 2016 11:34:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bFkAX-0006bX-R7
	for qemu-trivial@nongnu.org; Wed, 22 Jun 2016 11:34:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bFkAM-0006UF-Ua; Wed, 22 Jun 2016 11:34:11 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6017A7F6CF;
	Wed, 22 Jun 2016 15:34:10 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-45.ams2.redhat.com [10.36.112.45])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5MFY71K010433; Wed, 22 Jun 2016 11:34:08 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	eblake@redhat.com, Laurent Vivier <lvivier@redhat.com>
Date: Wed, 22 Jun 2016 17:34:02 +0200
Message-Id: <1466609642-17709-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 22 Jun 2016 15:34:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] trace-event: display "%d" instead of "0x%d"
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
X-List-Received-Date: Wed, 22 Jun 2016 15:34:26 -0000

Display the slot number of mhp_pc_dimm_assigned_slot()
using "%d" without the "0x".

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/i386/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index ea77bc2..71fc191 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -8,5 +8,5 @@ xen_pv_mmio_read(uint64_t addr) "WARNING: read from Xen PV Device MMIO space (ad
 xen_pv_mmio_write(uint64_t addr) "WARNING: write to Xen PV Device MMIO space (address %"PRIx64")"
 
 # hw/i386/pc.c
-mhp_pc_dimm_assigned_slot(int slot) "0x%d"
+mhp_pc_dimm_assigned_slot(int slot) "%d"
 mhp_pc_dimm_assigned_address(uint64_t addr) "0x%"PRIx64
-- 
2.5.5


