Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMiM-0000s3-Lr
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:41:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiI-0000kI-HT
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:41:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiH-0004uX-BG
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:41:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37592)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMiC-0004sF-7V; Fri, 11 Sep 2015 07:41:48 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E83C3413F3;
	Fri, 11 Sep 2015 14:41:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 74687A54;
	Fri, 11 Sep 2015 14:03:52 +0300 (MSK)
Received: (nullmailer pid 22774 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:35 +0300
Message-Id: <012aef073461fd24a901d7a8742532093b7f6ae5.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 11/26] maint: avoid useless "if (foo)
	free(foo)" pattern
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
X-List-Received-Date: Fri, 11 Sep 2015 11:41:56 -0000

From: Markus Armbruster <armbru@redhat.com>

My Coccinelle semantic patch finds a few more, because it also fixes up
the equally pointless conditional

    if (foo) {
        free(foo);
        foo = NULL;
    }

Result (feel free to squash it into your patch):

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/exynos4210_uart.c |  6 ++----
 hw/net/rtl8139.c          |  6 ++----
 hw/ppc/spapr_pci.c        | 12 ++++--------
 hw/sd/sdhci.c             |  6 ++----
 hw/usb/hcd-ehci-pci.c     |  6 ++----
 tests/test-hbitmap.c      |  6 ++----
 translate-all.c           |  6 ++----
 vl.c                      |  6 ++----
 xen-mapcache.c            |  6 ++----
 9 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 7614e58..215f962 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -234,10 +234,8 @@ static int fifo_empty_elements_number(Exynos4210UartFIFO *q)
 
 static void fifo_reset(Exynos4210UartFIFO *q)
 {
-    if (q->data != NULL) {
-        g_free(q->data);
-        q->data = NULL;
-    }
+    g_free(q->data);
+    q->data = NULL;
 
     q->data = (uint8_t *)g_malloc0(q->size);
 
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 2040618..b0d6c40 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -3391,10 +3391,8 @@ static void pci_rtl8139_uninit(PCIDevice *dev)
 {
     RTL8139State *s = RTL8139(dev);
 
-    if (s->cplus_txbuffer) {
-        g_free(s->cplus_txbuffer);
-        s->cplus_txbuffer = NULL;
-    }
+    g_free(s->cplus_txbuffer);
+    s->cplus_txbuffer = NULL;
     timer_del(s->timer);
     timer_free(s->timer);
     qemu_del_nic(s->nic);
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index a8f79d8..a2feb4c 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1460,10 +1460,8 @@ static void spapr_pci_pre_save(void *opaque)
     gpointer key, value;
     int i;
 
-    if (sphb->msi_devs) {
-        g_free(sphb->msi_devs);
-        sphb->msi_devs = NULL;
-    }
+    g_free(sphb->msi_devs);
+    sphb->msi_devs = NULL;
     sphb->msi_devs_num = g_hash_table_size(sphb->msi);
     if (!sphb->msi_devs_num) {
         return;
@@ -1490,10 +1488,8 @@ static int spapr_pci_post_load(void *opaque, int version_id)
                          sizeof(sphb->msi_devs[i].value));
         g_hash_table_insert(sphb->msi, key, value);
     }
-    if (sphb->msi_devs) {
-        g_free(sphb->msi_devs);
-        sphb->msi_devs = NULL;
-    }
+    g_free(sphb->msi_devs);
+    sphb->msi_devs = NULL;
     sphb->msi_devs_num = 0;
 
     return 0;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index e63367b..65304cf 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1169,10 +1169,8 @@ static void sdhci_uninitfn(SDHCIState *s)
     qemu_free_irq(s->eject_cb);
     qemu_free_irq(s->ro_cb);
 
-    if (s->fifo_buffer) {
-        g_free(s->fifo_buffer);
-        s->fifo_buffer = NULL;
-    }
+    g_free(s->fifo_buffer);
+    s->fifo_buffer = NULL;
 }
 
 const VMStateDescription sdhci_vmstate = {
diff --git a/hw/usb/hcd-ehci-pci.c b/hw/usb/hcd-ehci-pci.c
index 7afa5f9..16fb845 100644
--- a/hw/usb/hcd-ehci-pci.c
+++ b/hw/usb/hcd-ehci-pci.c
@@ -95,10 +95,8 @@ static void usb_ehci_pci_exit(PCIDevice *dev)
 
     usb_ehci_unrealize(s, DEVICE(dev), NULL);
 
-    if (s->irq) {
-        g_free(s->irq);
-        s->irq = NULL;
-    }
+    g_free(s->irq);
+    s->irq = NULL;
 }
 
 static void usb_ehci_pci_reset(DeviceState *dev)
diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
index 161eeb4..abcea0c 100644
--- a/tests/test-hbitmap.c
+++ b/tests/test-hbitmap.c
@@ -139,10 +139,8 @@ static void hbitmap_test_teardown(TestHBitmapData *data,
         hbitmap_free(data->hb);
         data->hb = NULL;
     }
-    if (data->bits) {
-        g_free(data->bits);
-        data->bits = NULL;
-    }
+    g_free(data->bits);
+    data->bits = NULL;
 }
 
 /* Set a range in the HBitmap and in the shadow "simple" bitmap.
diff --git a/translate-all.c b/translate-all.c
index 2a40530..8eb4512 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -731,10 +731,8 @@ void tb_free(TranslationBlock *tb)
 
 static inline void invalidate_page_bitmap(PageDesc *p)
 {
-    if (p->code_bitmap) {
-        g_free(p->code_bitmap);
-        p->code_bitmap = NULL;
-    }
+    g_free(p->code_bitmap);
+    p->code_bitmap = NULL;
     p->code_write_count = 0;
 }
 
diff --git a/vl.c b/vl.c
index 76e0bb2..1c8b28d 100644
--- a/vl.c
+++ b/vl.c
@@ -534,10 +534,8 @@ const char *qemu_get_vm_name(void)
 
 static void res_free(void)
 {
-    if (boot_splash_filedata != NULL) {
-        g_free(boot_splash_filedata);
-        boot_splash_filedata = NULL;
-    }
+    g_free(boot_splash_filedata);
+    boot_splash_filedata = NULL;
 }
 
 static int default_driver_check(void *opaque, QemuOpts *opts, Error **errp)
diff --git a/xen-mapcache.c b/xen-mapcache.c
index 8cefd0c..97fece2 100644
--- a/xen-mapcache.c
+++ b/xen-mapcache.c
@@ -169,10 +169,8 @@ static void xen_remap_bucket(MapCacheEntry *entry,
             exit(-1);
         }
     }
-    if (entry->valid_mapping != NULL) {
-        g_free(entry->valid_mapping);
-        entry->valid_mapping = NULL;
-    }
+    g_free(entry->valid_mapping);
+    entry->valid_mapping = NULL;
 
     for (i = 0; i < nb_pfn; i++) {
         pfns[i] = (address_index << (MCACHE_BUCKET_SHIFT-XC_PAGE_SHIFT)) + i;
-- 
2.1.4


