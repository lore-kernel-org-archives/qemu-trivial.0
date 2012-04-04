Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SFIMi-00031X-49
	for mharc-qemu-trivial@gnu.org; Wed, 04 Apr 2012 01:02:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1SFIMd-0002nQ-Dg
	for qemu-trivial@nongnu.org; Wed, 04 Apr 2012 01:02:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1SFIMb-0005Wb-T2
	for qemu-trivial@nongnu.org; Wed, 04 Apr 2012 01:02:34 -0400
Received: from ozlabs.org ([203.10.76.45]:59244)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1SFIMU-0005Sm-74; Wed, 04 Apr 2012 01:02:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id EBAD2B7002; Wed,  4 Apr 2012 15:02:21 +1000 (EST)
From: David Gibson <david@gibson.dropbear.id.au>
To: afaerber@web.de
Date: Wed,  4 Apr 2012 15:02:06 +1000
Message-Id: <1333515728-9769-3-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1333515728-9769-1-git-send-email-david@gibson.dropbear.id.au>
References: <1333515728-9769-1-git-send-email-david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org, benh@kernel.crashing.org, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, scottwood@freescale.com,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH 2/4] pseries: Remove unused fields from
	VIOsPAPRBus structure
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
X-List-Received-Date: Wed, 04 Apr 2012 05:02:37 -0000

The VIOsPAPRBus structure, used on the pseries machine contains some old
fields which are no longer used anywhere.  This patch removes them.

Cc: qemu-trivial@nongnu.org

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/spapr_vio.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/hw/spapr_vio.h b/hw/spapr_vio.h
index d8527be..ae3283c 100644
--- a/hw/spapr_vio.h
+++ b/hw/spapr_vio.h
@@ -89,8 +89,6 @@ struct VIOsPAPRDevice {
 
 struct VIOsPAPRBus {
     BusState bus;
-    const char *dt_name, *dt_type, *dt_compatible;
-    target_ulong signal_mask;
     int (*init)(VIOsPAPRDevice *dev);
     int (*devnode)(VIOsPAPRDevice *dev, void *fdt, int node_off);
 };
-- 
1.7.9.1


