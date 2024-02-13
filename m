Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZkZj-0008Vf-4J
	for mharc-qemu-trivial@gnu.org; Mon, 12 Feb 2024 23:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZkZf-0008Um-F0
 for qemu-trivial@nongnu.org; Mon, 12 Feb 2024 23:39:16 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZkZd-0005zo-Nv
 for qemu-trivial@nongnu.org; Mon, 12 Feb 2024 23:39:15 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3122b70439so507261666b.3
 for <qemu-trivial@nongnu.org>; Mon, 12 Feb 2024 20:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707799152; x=1708403952; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vj8qKfoHRQQSQjKf28SMVg7GGjhkAsn0wq6WSyRxVjw=;
 b=PwlymzBn0akUrQZRWrVQ7kHLcyz9ruGCnccql5NMkjY4GXPVtcMjFq0JBKzYr47+7k
 4Iw2w2/C6LlK8ISm8wtejQnbN921QSBv4P3Wj3oZT/3OldGddOj74E5MdwwEWtTTuowR
 BEjxrPhsxn2ltB4UutAQLInRgX1qSTv56WTLuMyJLJ7SkP3Hb3VpOc8F09u8GpY9PlE7
 Bce06f9rrsZSjDELpSnrz7l23ru8NiTpaj45HNP+KNio7KYhexAMVdmUpPISYwHgBwVe
 GJEJ5eM9pukPJvlBh6w7RmlLKhkycjlWwo8aM2k4iP83zI0z9/2nBDoMWFjlLb498w2C
 L0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707799152; x=1708403952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vj8qKfoHRQQSQjKf28SMVg7GGjhkAsn0wq6WSyRxVjw=;
 b=cBZNWZ074en0LBWvDFj/Aw2jfmU7CEZv/MaZmNYuk3GlULUYdRBvlTYJ8pmYw/8X/D
 pGXnDEQQsEFgf4Imkl/CkwZMwIwG5nn5ulLgaQsKIE0AhtbX/Vd4D/U/xeg19fz47TsL
 TRX8G9M2YBVlz2DWhHIYNQmLUe6E33kOCEOBQTkG8nt+3ZHWIGA0revlq00ZVx10IP+Y
 TFByrW4Zkc0FfGCqrprK7hCz3xmX4eHxPov0NzF6CwxhGHZM3aeTcMz4gftXePcxQu5g
 FYL7mBF9cgoFs9fHoO4oZWqhSKkUMxs3X3RwJBK43cK+nR8RFoVkOfNWoTUh4q8ngut5
 mglQ==
X-Gm-Message-State: AOJu0YwFRnbtSUYY941e4owTJrpBtFOweJT4oUqTqX+e2Z/7jVvRr/tr
 We5UyjR0zTAZUne7Bmff6P0qpLtAqsDirogwC8ktQ6/lWkXSiC3E/4FaymXHZtWuLkEWcODxgfY
 j
X-Google-Smtp-Source: AGHT+IG2ASL8Im0/nKG8gnnkdSwT58a8CNDfrwBZw3mrlSphdWGOZmw+J1Ax49oKLmSyncHkL/qTsA==
X-Received: by 2002:a17:906:4719:b0:a3c:1291:224 with SMTP id
 y25-20020a170906471900b00a3c12910224mr5878460ejq.42.1707799151879; 
 Mon, 12 Feb 2024 20:39:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW/aEpcgd6hIbqAc/+248471nD5BATvinlkB0wy7tUUPAZtkFgu6Z5yoM2/xA78qfcs6bcxGGaPSEv8qmWyKgcE5j4UPFK9SBT43b2Tt9QDjGdPisI=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a1709061b4a00b00a3c09f3aea8sm872522ejg.211.2024.02.12.20.39.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Feb 2024 20:39:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] hw/usb/uhci: Rename NB_PORTS -> UHCI_PORTS
Date: Tue, 13 Feb 2024 05:38:58 +0100
Message-ID: <20240213043859.61019-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213043859.61019-1-philmd@linaro.org>
References: <20240213043859.61019-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Feb 2024 04:39:16 -0000

Rename NB_PORTS as UHCI_PORTS to avoid definition clash
with EHCI equivalent:

  hw/usb/hcd-uhci.h:38:9: error: 'NB_PORTS' macro redefined [-Werror,-Wmacro-redefined]
  #define NB_PORTS 2
          ^
  hw/usb/hcd-ehci.h:40:9: note: previous definition is here
  #define NB_PORTS         6        /* Max. Number of downstream ports */
          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-uhci.h |  4 ++--
 hw/usb/hcd-uhci.c | 22 +++++++++++-----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index 69f8b40c49..6d26b94e92 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -35,7 +35,7 @@
 
 typedef struct UHCIQueue UHCIQueue;
 
-#define NB_PORTS 2
+#define UHCI_PORTS 2
 
 typedef struct UHCIPort {
     USBPort port;
@@ -59,7 +59,7 @@ typedef struct UHCIState {
     uint32_t frame_bytes;
     uint32_t frame_bandwidth;
     bool completions_only;
-    UHCIPort ports[NB_PORTS];
+    UHCIPort ports[UHCI_PORTS];
     qemu_irq irq;
     /* Interrupts that should be raised at the end of the current frame.  */
     uint32_t pending_int_mask;
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index b95b47f6a4..a03cf22e69 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -322,7 +322,7 @@ static void uhci_reset(DeviceState *dev)
     s->fl_base_addr = 0;
     s->sof_timing = 64;
 
-    for(i = 0; i < NB_PORTS; i++) {
+    for(i = 0; i < UHCI_PORTS; i++) {
         port = &s->ports[i];
         port->ctrl = 0x0080;
         if (port->port.dev && port->port.dev->attached) {
@@ -364,7 +364,7 @@ static const VMStateDescription vmstate_uhci = {
     .fields = (const VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, UHCIState),
         VMSTATE_UINT8_EQUAL(num_ports_vmstate, UHCIState, NULL),
-        VMSTATE_STRUCT_ARRAY(ports, UHCIState, NB_PORTS, 1,
+        VMSTATE_STRUCT_ARRAY(ports, UHCIState, UHCI_PORTS, 1,
                              vmstate_uhci_port, UHCIPort),
         VMSTATE_UINT16(cmd, UHCIState),
         VMSTATE_UINT16(status, UHCIState),
@@ -404,7 +404,7 @@ static void uhci_port_write(void *opaque, hwaddr addr,
             int i;
 
             /* send reset on the USB bus */
-            for(i = 0; i < NB_PORTS; i++) {
+            for(i = 0; i < UHCI_PORTS; i++) {
                 port = &s->ports[i];
                 usb_device_reset(port->port.dev);
             }
@@ -457,7 +457,7 @@ static void uhci_port_write(void *opaque, hwaddr addr,
             int n;
 
             n = (addr >> 1) & 7;
-            if (n >= NB_PORTS) {
+            if (n >= UHCI_PORTS) {
                 return;
             }
             port = &s->ports[n];
@@ -514,7 +514,7 @@ static uint64_t uhci_port_read(void *opaque, hwaddr addr, unsigned size)
             UHCIPort *port;
             int n;
             n = (addr >> 1) & 7;
-            if (n >= NB_PORTS) {
+            if (n >= UHCI_PORTS) {
                 goto read_default;
             }
             port = &s->ports[n];
@@ -609,7 +609,7 @@ static USBDevice *uhci_find_device(UHCIState *s, uint8_t addr)
     USBDevice *dev;
     int i;
 
-    for (i = 0; i < NB_PORTS; i++) {
+    for (i = 0; i < UHCI_PORTS; i++) {
         UHCIPort *port = &s->ports[i];
         if (!(port->ctrl & UHCI_PORT_EN)) {
             continue;
@@ -1173,11 +1173,11 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
     s->irq = pci_allocate_irq(dev);
 
     if (s->masterbus) {
-        USBPort *ports[NB_PORTS];
-        for(i = 0; i < NB_PORTS; i++) {
+        USBPort *ports[UHCI_PORTS];
+        for(i = 0; i < UHCI_PORTS; i++) {
             ports[i] = &s->ports[i].port;
         }
-        usb_register_companion(s->masterbus, ports, NB_PORTS,
+        usb_register_companion(s->masterbus, ports, UHCI_PORTS,
                                s->firstport, s, &uhci_port_ops,
                                USB_SPEED_MASK_LOW | USB_SPEED_MASK_FULL,
                                &err);
@@ -1187,14 +1187,14 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
         }
     } else {
         usb_bus_new(&s->bus, sizeof(s->bus), &uhci_bus_ops, DEVICE(dev));
-        for (i = 0; i < NB_PORTS; i++) {
+        for (i = 0; i < UHCI_PORTS; i++) {
             usb_register_port(&s->bus, &s->ports[i].port, s, i, &uhci_port_ops,
                               USB_SPEED_MASK_LOW | USB_SPEED_MASK_FULL);
         }
     }
     s->bh = qemu_bh_new_guarded(uhci_bh, s, &DEVICE(dev)->mem_reentrancy_guard);
     s->frame_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, uhci_frame_timer, s);
-    s->num_ports_vmstate = NB_PORTS;
+    s->num_ports_vmstate = UHCI_PORTS;
     QTAILQ_INIT(&s->queues);
 
     memory_region_init_io(&s->io_bar, OBJECT(s), &uhci_ioport_ops, s,
-- 
2.41.0


