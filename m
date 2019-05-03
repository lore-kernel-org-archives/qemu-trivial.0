Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMTqv-0007Y9-2o
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 04:47:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hMTqs-0007Xu-70
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 04:47:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hMTqo-0005Cf-A2
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 04:47:29 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liboxuan@connect.hku.hk>)
	id 1hMTql-0005BM-5D
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 04:47:24 -0400
Received: by mail-pg1-x543.google.com with SMTP id d31so2407525pgl.7
	for <qemu-trivial@nongnu.org>; Fri, 03 May 2019 01:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=connect-hku-hk.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8owxu74GQscfy+KDdA+EV/u1JwaAWme0ev7CAE/LPZs=;
	b=sRDZqjxhpWDynXbv4x4KXaqPM9tM7rSRHvDsh143QZ66HMboVVXnTrBm3e0RuGnLji
	//2vTT674viSgchypGPmlW41+ChJvkWVCay7cVlyr/B2mi7n4Z+78Nc486uyk0Ovzkgm
	RDH8PSWXOg2bO2ipZyd/TesuhmVjrH5SF0YU8WtqIvSooOMgAOoT1sz7ScZU6bywkeYk
	CxI0msEUE9Xb/5Nz31Py8oEA9u6iammXaipqVESq2uM1jiTFRPCHyhjZ8AV2goEx649b
	VHTFVt3x2BSR6stxBbnU12LmKfNO7qDWiutIW4lWdIPgySGD8Rzol+IskUFBTSBYK9A8
	2faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8owxu74GQscfy+KDdA+EV/u1JwaAWme0ev7CAE/LPZs=;
	b=G6GycGloXG+JhQYzbBZfA1ui5kMsOZrTWHtrDMWNBcnhv1Nyi65t7yBp5FHEVfnrdj
	+fGRwLGbxN5PUSajMACi2wFx/GyjQCC9zbElZdgBWvsA88t5+OSgqTUVDYjJDN5jvtdo
	2wHOm8K1hfo9nMe9ZsAUhLbBAMu/Rgo1AMHC26gB1jyWldxDl9xDpjeMHIIk6qdagI4V
	KefJU9qb0r8oufKdiRqFyCfS0WiDKOiE9QteJry49KOD+XRCoHQz0p04atG3XaKsFup3
	EvMQab/JUyFZznFP6PJx9sFI4DYLiC50u+WhXB/bt/HvV1KEnebK6DoufwjfOMLD5KEv
	hqoA==
X-Gm-Message-State: APjAAAUsleb3COIYtJzCMLLkumkvP8uYZSjr8XGbcgfU69GIM8kTFcxA
	0h1EQX4r1pKcoQQc10ybI5Fihw==
X-Google-Smtp-Source: APXvYqxlMR+vy7sIgeQGascmD01ZF4DpoOSl2t9DS/G2T9T3ELMPT8qvZfpnO+j51VKsREvWQZHxMg==
X-Received: by 2002:a62:4e86:: with SMTP id c128mr9125752pfb.39.1556873241152; 
	Fri, 03 May 2019 01:47:21 -0700 (PDT)
Received: from MBP.local.hk ([175.159.180.1]) by smtp.gmail.com with ESMTPSA id
	l26sm1980273pfb.20.2019.05.03.01.47.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 May 2019 01:47:20 -0700 (PDT)
From: Boxuan Li <liboxuan@connect.hku.hk>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, philmd@redhat.com,
	yuval.shaia@oracle.com, alex.bennee@linaro.org,
	Boxuan Li <liboxuan@connect.hku.hk>, "Michael S. Tsirkin" <mst@redhat.com>
Date: Fri,  3 May 2019 16:46:54 +0800
Message-Id: <20190503084654.18413-1-liboxuan@connect.hku.hk>
X-Mailer: git-send-email 2.13.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-trivial] [PATCH v3] hw/virtio/virtio-mmio: Convert DPRINTF to
 trace and log
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
X-List-Received-Date: Fri, 03 May 2019 08:47:31 -0000

Use traces for debug message and qemu_log_mask for errors.

Signed-off-by: Boxuan Li <liboxuan@connect.hku.hk>
---
v1: https://patchew.org/QEMU/20190428110258.86681-1-liboxuan@connect.hku.hk/
v2: https://patchew.org/QEMU/20190501081039.58938-1-liboxuan@connect.hku.hk/
v3: Use qemu_log_mask for errors
---
 hw/virtio/trace-events  |  7 +++++++
 hw/virtio/virtio-mmio.c | 44 +++++++++++++++++++++-----------------------
 2 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 60c649c4bc..81cbe1c4b2 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -46,3 +46,10 @@ virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s g
 virtio_balloon_get_config(uint32_t num_pages, uint32_t actual) "num_pages: %d actual: %d"
 virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) "actual: %d oldactual: %d"
 virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon target: 0x%"PRIx64" num_pages: %d"
+
+# virtio-mmio.c
+virtio_mmio_read(int offset) "virtio_mmio_read offset 0x%x"
+virtio_mmio_write_offset(int offset, uint64_t value) "virtio_mmio_write offset 0x%x value 0x%" PRIx64
+virtio_mmio_guest_page(uint64_t size, int shift) "guest page size 0x%" PRIx64 " shift %d"
+virtio_mmio_queue_write(int value, int max_size) "mmio_queue write %d max %d"
+virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 5807aa87fe..c8a9d974b3 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -27,16 +27,8 @@
 #include "sysemu/kvm.h"
 #include "hw/virtio/virtio-bus.h"
 #include "qemu/error-report.h"
-
-/* #define DEBUG_VIRTIO_MMIO */
-
-#ifdef DEBUG_VIRTIO_MMIO
-
-#define DPRINTF(fmt, ...) \
-do { printf("virtio_mmio: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while (0)
-#endif
+#include "qemu/log.h"
+#include "trace.h"
 
 /* QOM macros */
 /* virtio-mmio-bus */
@@ -107,7 +99,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
     VirtIOMMIOProxy *proxy = (VirtIOMMIOProxy *)opaque;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
 
-    DPRINTF("virtio_mmio_read offset 0x%x\n", (int)offset);
+    trace_virtio_mmio_read((int)offset);
 
     if (!vdev) {
         /* If no backend is present, we treat most registers as
@@ -144,7 +136,9 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
         }
     }
     if (size != 4) {
-        DPRINTF("wrong size access to register!\n");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: wrong size access to register!\n",
+                __func__);
         return 0;
     }
     switch (offset) {
@@ -182,10 +176,12 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
     case VIRTIO_MMIO_QUEUE_ALIGN:
     case VIRTIO_MMIO_QUEUE_NOTIFY:
     case VIRTIO_MMIO_INTERRUPT_ACK:
-        DPRINTF("read of write-only register\n");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: read of write-only register\n",
+                __func__);
         return 0;
     default:
-        DPRINTF("bad register offset\n");
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad register offset\n", __func__);
         return 0;
     }
     return 0;
@@ -197,8 +193,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
     VirtIOMMIOProxy *proxy = (VirtIOMMIOProxy *)opaque;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
 
-    DPRINTF("virtio_mmio_write offset 0x%x value 0x%" PRIx64 "\n",
-            (int)offset, value);
+    trace_virtio_mmio_write_offset((int)offset, value);
 
     if (!vdev) {
         /* If no backend is present, we just make all registers
@@ -226,7 +221,9 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
         return;
     }
     if (size != 4) {
-        DPRINTF("wrong size access to register!\n");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: wrong size access to register!\n",
+                __func__);
         return;
     }
     switch (offset) {
@@ -246,8 +243,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
         if (proxy->guest_page_shift > 31) {
             proxy->guest_page_shift = 0;
         }
-        DPRINTF("guest page size %" PRIx64 " shift %d\n", value,
-                proxy->guest_page_shift);
+        trace_virtio_mmio_guest_page(value, proxy->guest_page_shift);
         break;
     case VIRTIO_MMIO_QUEUE_SEL:
         if (value < VIRTIO_QUEUE_MAX) {
@@ -255,7 +251,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
         }
         break;
     case VIRTIO_MMIO_QUEUE_NUM:
-        DPRINTF("mmio_queue write %d max %d\n", (int)value, VIRTQUEUE_MAX_SIZE);
+        trace_virtio_mmio_queue_write((int)value, VIRTQUEUE_MAX_SIZE);
         virtio_queue_set_num(vdev, vdev->queue_sel, value);
         /* Note: only call this function for legacy devices */
         virtio_queue_update_rings(vdev, vdev->queue_sel);
@@ -303,11 +299,13 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
     case VIRTIO_MMIO_DEVICE_FEATURES:
     case VIRTIO_MMIO_QUEUE_NUM_MAX:
     case VIRTIO_MMIO_INTERRUPT_STATUS:
-        DPRINTF("write to readonly register\n");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: write to readonly register\n",
+                __func__);
         break;
 
     default:
-        DPRINTF("bad register offset\n");
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad register offset\n", __func__);
     }
 }
 
@@ -327,7 +325,7 @@ static void virtio_mmio_update_irq(DeviceState *opaque, uint16_t vector)
         return;
     }
     level = (atomic_read(&vdev->isr) != 0);
-    DPRINTF("virtio_mmio setting IRQ %d\n", level);
+    trace_virtio_mmio_setting_irq(level);
     qemu_set_irq(proxy->irq, level);
 }
 
-- 
2.13.2


