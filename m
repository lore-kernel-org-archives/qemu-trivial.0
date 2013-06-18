Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoq8Y-0002aj-C3
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 03:15:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UomvU-0004s8-LG
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:49:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UomvT-00017h-LL
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:49:48 -0400
Received: from [222.73.24.84] (port=54261 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UomvT-00017P-8h; Mon, 17 Jun 2013 23:49:47 -0400
X-IronPort-AV: E=Sophos;i="4.87,886,1363104000"; 
   d="scan'208";a="7584455"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 18 Jun 2013 11:46:50 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5I3niZL016577;
	Tue, 18 Jun 2013 11:49:44 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061811474255-2222949 ;
	Tue, 18 Jun 2013 11:47:42 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 18 Jun 2013 11:45:36 +0800
Message-Id: <1371527137-16949-4-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/18 11:47:42,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/18 11:47:42,
	Serialize complete at 2013/06/18 11:47:42
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Tue, 18 Jun 2013 03:15:28 -0400
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [PATCH v2 4/5] sd: pass bool parameter for sd_init
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
X-List-Received-Date: Tue, 18 Jun 2013 03:49:51 -0000

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 hw/sd/milkymist-memcard.c |    2 +-
 hw/sd/omap_mmc.c          |    4 ++--
 hw/sd/pl181.c             |    2 +-
 hw/sd/pxa2xx_mmci.c       |    2 +-
 hw/sd/sdhci.c             |    2 +-
 hw/sd/ssi-sd.c            |    2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index d5944bc..61a8aad 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -250,7 +250,7 @@ static int milkymist_memcard_init(SysBusDevice *dev)
     DriveInfo *dinfo;
 
     dinfo = drive_get_next(IF_SD);
-    s->card = sd_init(dinfo ? dinfo->bdrv : NULL, 0);
+    s->card = sd_init(dinfo ? dinfo->bdrv : NULL, false);
     s->enabled = dinfo ? bdrv_is_inserted(dinfo->bdrv) : 0;
 
     memory_region_init_io(&s->regs_region, &memcard_mmio_ops, s,
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index d4079cd..ba9f4b3 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -592,7 +592,7 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
     memory_region_add_subregion(sysmem, base, &s->iomem);
 
     /* Instantiate the storage */
-    s->card = sd_init(bd, 0);
+    s->card = sd_init(bd, false);
 
     return s;
 }
@@ -617,7 +617,7 @@ struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
     omap_l4_attach(ta, 0, &s->iomem);
 
     /* Instantiate the storage */
-    s->card = sd_init(bd, 0);
+    s->card = sd_init(bd, false);
 
     s->cdet = qemu_allocate_irqs(omap_mmc_cover_cb, s, 1)[0];
     sd_set_cb(s->card, NULL, s->cdet);
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 2527296..e08fd04 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -485,7 +485,7 @@ static int pl181_init(SysBusDevice *dev)
     sysbus_init_irq(dev, &s->irq[1]);
     qdev_init_gpio_out(&s->busdev.qdev, s->cardstatus, 2);
     dinfo = drive_get_next(IF_SD);
-    s->card = sd_init(dinfo ? dinfo->bdrv : NULL, 0);
+    s->card = sd_init(dinfo ? dinfo->bdrv : NULL, false);
     return 0;
 }
 
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 2db1cab..0574d6b 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -538,7 +538,7 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
     memory_region_add_subregion(sysmem, base, &s->iomem);
 
     /* Instantiate the actual storage */
-    s->card = sd_init(bd, 0);
+    s->card = sd_init(bd, false);
 
     register_savevm(NULL, "pxa2xx_mmci", 0, 0,
                     pxa2xx_mmci_save, pxa2xx_mmci_load, s);
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index e64899c..ddc260f 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1165,7 +1165,7 @@ static void sdhci_initfn(Object *obj)
     DriveInfo *di;
 
     di = drive_get_next(IF_SD);
-    s->card = sd_init(di ? di->bdrv : NULL, 0);
+    s->card = sd_init(di ? di->bdrv : NULL, false);
     s->eject_cb = qemu_allocate_irqs(sdhci_insert_eject_cb, s, 1)[0];
     s->ro_cb = qemu_allocate_irqs(sdhci_card_readonly_cb, s, 1)[0];
     sd_set_cb(s->card, s->ro_cb, s->eject_cb);
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 4d3c4f6..d47e237 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -245,7 +245,7 @@ static int ssi_sd_init(SSISlave *dev)
 
     s->mode = SSI_SD_CMD;
     dinfo = drive_get_next(IF_SD);
-    s->sd = sd_init(dinfo ? dinfo->bdrv : NULL, 1);
+    s->sd = sd_init(dinfo ? dinfo->bdrv : NULL, true);
     register_savevm(&dev->qdev, "ssi_sd", -1, 1, ssi_sd_save, ssi_sd_load, s);
     return 0;
 }
-- 
1.7.2.5


