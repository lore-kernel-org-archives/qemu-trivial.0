Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL5c0-0006yl-6N
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:52:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YL5bx-0006ta-I2
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YL5bw-0004Lm-FB
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:57 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:33331)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YL5bo-0004Dj-D2; Tue, 10 Feb 2015 02:51:48 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHC52465; Tue, 10 Feb 2015 15:51:37 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 10 Feb 2015 15:51:27 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 10 Feb 2015 15:51:22 +0800
Message-ID: <1423554683-2968-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1423554683-2968-1-git-send-email-arei.gonglei@huawei.com>
References: <1423554683-2968-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, stefano.stabellini@eu.citrix.com
Subject: [Qemu-trivial] [PATCH v2 1/2] xen-pt: fix Negative array index read
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
X-List-Received-Date: Tue, 10 Feb 2015 07:51:58 -0000

From: Gonglei <arei.gonglei@huawei.com>

Coverity spot:
Function xen_pt_bar_offset_to_index() may returns a negative
number (-1) value index, which as an index to array d->io_regions.

Let's directly and simply pass index as an argument to
xen_pt_bar_reg_parse().

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
---
 hw/xen/xen_pt_config_init.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index de9a20f..710fe50 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -360,15 +360,13 @@ static uint64_t xen_pt_get_bar_size(PCIIORegion *r)
 }
 
 static XenPTBarFlag xen_pt_bar_reg_parse(XenPCIPassthroughState *s,
-                                         XenPTRegInfo *reg)
+                                         int index)
 {
     PCIDevice *d = &s->dev;
     XenPTRegion *region = NULL;
     PCIIORegion *r;
-    int index = 0;
 
     /* check 64bit BAR */
-    index = xen_pt_bar_offset_to_index(reg->offset);
     if ((0 < index) && (index < PCI_ROM_SLOT)) {
         int type = s->real_device.io_regions[index - 1].type;
 
@@ -422,7 +420,7 @@ static int xen_pt_bar_reg_init(XenPCIPassthroughState *s, XenPTRegInfo *reg,
     }
 
     /* set BAR flag */
-    s->bases[index].bar_flag = xen_pt_bar_reg_parse(s, reg);
+    s->bases[index].bar_flag = xen_pt_bar_reg_parse(s, index);
     if (s->bases[index].bar_flag == XEN_PT_BAR_FLAG_UNUSED) {
         reg_field = XEN_PT_INVALID_REG;
     }
-- 
1.7.12.4



