Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTF6B-0006ws-B6
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 14:36:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTF68-0006s8-Qa
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 14:36:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTF64-0001Xp-PH
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 14:36:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTF5u-0001SF-G1; Wed, 04 Mar 2015 14:36:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9995D408F5;
	Wed,  4 Mar 2015 22:36:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 67D23936;
	Wed,  4 Mar 2015 20:07:06 +0300 (MSK)
Received: (nullmailer pid 17485 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:18 +0300
Message-Id: <e3a448456bc0f1e9fb5bc71c14e6fd5cd6652b58.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 01/47] xen-pt: fix Negative array index read
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
X-List-Received-Date: Wed, 04 Mar 2015 19:36:50 -0000

From: Gonglei <arei.gonglei@huawei.com>

Coverity spot:
Function xen_pt_bar_offset_to_index() may return a negative
value (-1) which is used as an index to d->io_regions[] down
the line.

Let's pass index directly as an argument to
xen_pt_bar_reg_parse().

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


