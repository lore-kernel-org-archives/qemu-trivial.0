Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zyt-0005Ra-Kc
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:33:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zym-0005E8-Cn
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zyl-0008Aj-1H
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58763)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zyf-00088K-8h; Mon, 22 Jun 2015 07:33:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 34A1241E47;
	Mon, 22 Jun 2015 14:33:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 01E56A73;
	Mon, 22 Jun 2015 14:16:33 +0300 (MSK)
Received: (nullmailer pid 9257 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:16 +0300
Message-Id: <a74d29198e76b5e79bd28d3d4482252a4bb1c576.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: [Qemu-trivial] [PULL 09/21] xen_pt: QOMify
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
X-List-Received-Date: Mon, 22 Jun 2015 11:33:33 -0000

From: Gonglei <arei.gonglei@huawei.com>

Cc: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Tested-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/xen/xen_pt.c | 10 +++++-----
 hw/xen/xen_pt.h |  4 ++++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 9afcda8..35ddacc 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -125,7 +125,7 @@ int xen_pt_bar_offset_to_index(uint32_t offset)
 
 static uint32_t xen_pt_pci_read_config(PCIDevice *d, uint32_t addr, int len)
 {
-    XenPCIPassthroughState *s = DO_UPCAST(XenPCIPassthroughState, dev, d);
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(d);
     uint32_t val = 0;
     XenPTRegGroup *reg_grp_entry = NULL;
     XenPTReg *reg_entry = NULL;
@@ -230,7 +230,7 @@ exit:
 static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
                                     uint32_t val, int len)
 {
-    XenPCIPassthroughState *s = DO_UPCAST(XenPCIPassthroughState, dev, d);
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(d);
     int index = 0;
     XenPTRegGroup *reg_grp_entry = NULL;
     int rc = 0;
@@ -679,7 +679,7 @@ static const MemoryListener xen_pt_io_listener = {
 
 static int xen_pt_initfn(PCIDevice *d)
 {
-    XenPCIPassthroughState *s = DO_UPCAST(XenPCIPassthroughState, dev, d);
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(d);
     int rc = 0;
     uint8_t machine_irq = 0;
     uint16_t cmd = 0;
@@ -797,7 +797,7 @@ out:
 
 static void xen_pt_unregister_device(PCIDevice *d)
 {
-    XenPCIPassthroughState *s = DO_UPCAST(XenPCIPassthroughState, dev, d);
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(d);
     uint8_t machine_irq = s->machine_irq;
     uint8_t intx = xen_pt_pci_intx(s);
     int rc;
@@ -868,7 +868,7 @@ static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
 };
 
 static const TypeInfo xen_pci_passthrough_info = {
-    .name = "xen-pci-passthrough",
+    .name = TYPE_XEN_PT_DEVICE,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(XenPCIPassthroughState),
     .class_init = xen_pci_passthrough_class_init,
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 4bba559..87a6677 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -36,6 +36,10 @@ typedef struct XenPTReg XenPTReg;
 
 typedef struct XenPCIPassthroughState XenPCIPassthroughState;
 
+#define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
+#define XEN_PT_DEVICE(obj) \
+    OBJECT_CHECK(XenPCIPassthroughState, (obj), TYPE_XEN_PT_DEVICE)
+
 /* function type for config reg */
 typedef int (*xen_pt_conf_reg_init)
     (XenPCIPassthroughState *, XenPTRegInfo *, uint32_t real_offset,
-- 
2.1.4


