Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUZQ4-0003Gy-LE
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 08:03:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZUZQ1-0003C6-E2
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 08:03:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZUZQ0-0007P3-7i
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 08:03:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZUZPt-0007M6-Sb; Wed, 26 Aug 2015 08:02:58 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 749988E3C9;
	Wed, 26 Aug 2015 12:02:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-105.ams2.redhat.com
	[10.36.116.105])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QC2siU019090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Aug 2015 08:02:55 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D8F5A303F90B; Wed, 26 Aug 2015 14:02:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
	<1440587838-25595-8-git-send-email-berrange@redhat.com>
Date: Wed, 26 Aug 2015 14:02:53 +0200
In-Reply-To: <1440587838-25595-8-git-send-email-berrange@redhat.com> (Daniel
	P. Berrange's message of "Wed, 26 Aug 2015 12:17:18 +0100")
Message-ID: <87lhcyp89e.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 7/7] maint: avoid useless
	"if (foo) free(foo)" pattern
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
X-List-Received-Date: Wed, 26 Aug 2015 12:03:07 -0000

"Daniel P. Berrange" <berrange@redhat.com> writes:

> The free() and g_free() functions both happily accept
> NULL on any platform QEMU builds on.

Do systems where free(NULL) doesn't work even exist?  Even C89
guarantees it does nothing.

>                                      As such putting a
> conditional 'if (foo)' check before calls to 'free(foo)'
> merely serves to bloat the lines of code.
>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>

My Coccinelle semantic patch finds a few more, because it also fixes up
the equally pointless conditional

    if (foo) {
        free(foo);
        foo = NULL;
    }

@@
expression E;
@@
-	if (E != NULL) {
-	    g_free(E);
-	}
+       g_free(E);
@@
expression E;
@@
-	if (E != NULL) {
-	    g_free(E);
-           E = NULL;
-	}
+       g_free(E);
+       E = NULL;
@@
expression E;
type T;
@@
-	if (E != NULL) {
-	    g_free((T)E);
-	}
+       g_free((T)E);
@@
expression E;
type T;
@@
-	if (E != NULL) {
-	    g_free((T)E);
-           E = NULL;
-	}
+       g_free((T)E);
+       E = NULL;

Result (feel free to squash it into your patch):

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
index 78ae4cd..5742a24 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -3438,10 +3438,8 @@ static void pci_rtl8139_uninit(PCIDevice *dev)
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
index 9c46ffa..ffe75ed 100644
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
index 584ca88..72a3f81 100644
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

