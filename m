Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZkZl-000077-FU
	for mharc-qemu-trivial@gnu.org; Mon, 12 Feb 2024 23:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZkZk-0008WV-4A
 for qemu-trivial@nongnu.org; Mon, 12 Feb 2024 23:39:20 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZkZi-00062F-BV
 for qemu-trivial@nongnu.org; Mon, 12 Feb 2024 23:39:19 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a30e445602cso958856466b.0
 for <qemu-trivial@nongnu.org>; Mon, 12 Feb 2024 20:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707799157; x=1708403957; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShumMCIaTbveateThFlQmvKVfpqfzquzqsEpvHvEiZU=;
 b=UMg71gBLWVaSPx3KQ+EzTDptITgCqKZTLmWq8MqBjSJXztXZk9bNgyttWxz0+cjaTy
 BMwnf+/SN+kHfygeT/6XTNLr5vMcNXcrS2HRTCHXirw3aM2SXdnmfpM+QLR+d7r9ZdPW
 uxn8ExWFGARYoI4fOkgj+2YfSuJx1sy9j+DM3xg+TusyZB6A5/vi5TrIlaBwx5Bf0M9q
 t/9sZd5uSAiNiGkfi6b+alyZwXRR2g1dmpEJn/zBmnDDgddLBbHWB2dzESh4IZxy1Hoa
 aq3oX8qD75DX4lX+/3XczpvtyQFXJYmBVAlvqlYYVtiHGGH48vA81f66Ri4aV8hegpu9
 i6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707799157; x=1708403957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ShumMCIaTbveateThFlQmvKVfpqfzquzqsEpvHvEiZU=;
 b=KZ7KYxwcJLsxoeV9dm13ZvmGydzBNerMzzrXyE7xvebfw3n2WzCB4+qA4PwcmBB3BZ
 fU/t8JFYWe7asqc1S2V4ZhyNaCPFbQVa/G804Ba6sbM3OgYY7AWwmEYJ+j/j+AfsB9kc
 toGAQk+wcLXppovMSvCddqowXNohRzQTOd/zyDnX4gEvd5pWEB9JIjC/Qkx8m3kzi1C6
 mtOT5RGoQl+Z6ml7xNEv6c9QhIz9zSuH76YztxamAwTuQtTXbtkbX0iJ9uecdrLurKm7
 qKVT+M96WSG/N7O3SsXEsxFr4lqXtTcKHHMu5ouAWjZ/i5OkqyxrFwBc7WW9ntXNvR2r
 kMsA==
X-Gm-Message-State: AOJu0YyGsTob5ru5iR2xIDtuJ5ZEXt4spSK40HqnCXiY82jSd2ij7j7S
 WBwnLdi59eIZSLRMYCrYKXXcpMcD4Q1g9jqAU4v8INIghqDNLZcDeJ3wyOjoDVCav3k5PzXRowy
 i
X-Google-Smtp-Source: AGHT+IFDyLzafmOnrsN3fwWun8MGFcNxvN/EWUyhawQAx8O37OyNNu/i3Ox4nInO6ZBB11/RhJa3bg==
X-Received: by 2002:a17:906:c144:b0:a3c:afe1:7d4e with SMTP id
 dp4-20020a170906c14400b00a3cafe17d4emr1523737ejc.8.1707799157089; 
 Mon, 12 Feb 2024 20:39:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWVdsejrfcMWqE6T0Me2zYUKPaZe2TmhsZvninkP5xrhx9Vl6FMNAhwS25RF/96p0AoyiradO2bgRC6fXwJS1LF81X3OIk8rXP9LCk8QhgA1Py/wdg=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 vo2-20020a170907a80200b00a3cf66ec008sm376172ejc.166.2024.02.12.20.39.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Feb 2024 20:39:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] hw/usb/ehci: Rename NB_PORTS -> EHCI_PORTS
Date: Tue, 13 Feb 2024 05:38:59 +0100
Message-ID: <20240213043859.61019-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213043859.61019-1-philmd@linaro.org>
References: <20240213043859.61019-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Feb 2024 04:39:20 -0000

Rename NB_PORTS as EHCI_PORTS to avoid definition clash
with UHCI equivalent:

  hw/usb/hcd-ehci.h:40:9: error: 'NB_PORTS' macro redefined [-Werror,-Wmacro-redefined]
  #define NB_PORTS         6        /* Max. Number of downstream ports */
          ^
  hw/usb/hcd-uhci.h:38:9: note: previous definition is here
  #define NB_PORTS 2
          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ehci.h        |  8 ++++----
 hw/usb/hcd-ehci-pci.c    |  2 +-
 hw/usb/hcd-ehci-sysbus.c |  2 +-
 hw/usb/hcd-ehci.c        | 20 ++++++++++----------
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 2cd821f49e..56a1c09d1f 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -37,7 +37,7 @@
 #define MMIO_SIZE        0x1000
 #define CAPA_SIZE        0x10
 
-#define NB_PORTS         6        /* Max. Number of downstream ports */
+#define EHCI_PORTS       6        /* Max. Number of downstream ports */
 
 typedef struct EHCIPacket EHCIPacket;
 typedef struct EHCIQueue EHCIQueue;
@@ -288,7 +288,7 @@ struct EHCIState {
             uint32_t configflag;
         };
     };
-    uint32_t portsc[NB_PORTS];
+    uint32_t portsc[EHCI_PORTS];
 
     /*
      *  Internal states, shadow registers, etc
@@ -298,8 +298,8 @@ struct EHCIState {
     bool working;
     uint32_t astate;         /* Current state in asynchronous schedule */
     uint32_t pstate;         /* Current state in periodic schedule     */
-    USBPort ports[NB_PORTS];
-    USBPort *companion_ports[NB_PORTS];
+    USBPort ports[EHCI_PORTS];
+    USBPort *companion_ports[EHCI_PORTS];
     uint32_t usbsts_pending;
     uint32_t usbsts_frindex;
     EHCIQueueHead aqueues;
diff --git a/hw/usb/hcd-ehci-pci.c b/hw/usb/hcd-ehci-pci.c
index 0b26db74d8..3ff54edf62 100644
--- a/hw/usb/hcd-ehci-pci.c
+++ b/hw/usb/hcd-ehci-pci.c
@@ -83,7 +83,7 @@ static void usb_ehci_pci_init(Object *obj)
     s->capsbase = 0x00;
     s->opregbase = 0x20;
     s->portscbase = 0x44;
-    s->portnr = NB_PORTS;
+    s->portnr = EHCI_PORTS;
 
     if (!dc->hotpluggable) {
         s->companion_enable = true;
diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index bfb774504c..fe1dabd0bb 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -88,7 +88,7 @@ static void ehci_sysbus_class_init(ObjectClass *klass, void *data)
     SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(klass);
 
     sec->portscbase = 0x44;
-    sec->portnr = NB_PORTS;
+    sec->portnr = EHCI_PORTS;
 
     dc->realize = usb_ehci_sysbus_realize;
     dc->vmsd = &vmstate_ehci_sysbus;
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 98a2860069..01864d4649 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -783,9 +783,9 @@ static void ehci_register_companion(USBBus *bus, USBPort *ports[],
     EHCIState *s = container_of(bus, EHCIState, bus);
     uint32_t i;
 
-    if (firstport + portcount > NB_PORTS) {
+    if (firstport + portcount > EHCI_PORTS) {
         error_setg(errp, "firstport must be between 0 and %u",
-                   NB_PORTS - portcount);
+                   EHCI_PORTS - portcount);
         return;
     }
 
@@ -831,7 +831,7 @@ static USBDevice *ehci_find_device(EHCIState *ehci, uint8_t addr)
     USBPort *port;
     int i;
 
-    for (i = 0; i < NB_PORTS; i++) {
+    for (i = 0; i < EHCI_PORTS; i++) {
         port = &ehci->ports[i];
         if (!(ehci->portsc[i] & PORTSC_PED)) {
             DPRINTF("Port %d not enabled\n", i);
@@ -850,7 +850,7 @@ void ehci_reset(void *opaque)
 {
     EHCIState *s = opaque;
     int i;
-    USBDevice *devs[NB_PORTS];
+    USBDevice *devs[EHCI_PORTS];
 
     trace_usb_ehci_reset();
 
@@ -858,7 +858,7 @@ void ehci_reset(void *opaque)
      * Do the detach before touching portsc, so that it correctly gets send to
      * us or to our companion based on PORTSC_POWNER before the reset.
      */
-    for(i = 0; i < NB_PORTS; i++) {
+    for(i = 0; i < EHCI_PORTS; i++) {
         devs[i] = s->ports[i].dev;
         if (devs[i] && devs[i]->attached) {
             usb_detach(&s->ports[i]);
@@ -877,7 +877,7 @@ void ehci_reset(void *opaque)
     s->astate = EST_INACTIVE;
     s->pstate = EST_INACTIVE;
 
-    for(i = 0; i < NB_PORTS; i++) {
+    for(i = 0; i < EHCI_PORTS; i++) {
         if (s->companion_ports[i]) {
             s->portsc[i] = PORTSC_POWNER | PORTSC_PPOWER;
         } else {
@@ -1086,7 +1086,7 @@ static void ehci_opreg_write(void *ptr, hwaddr addr,
     case CONFIGFLAG:
         val &= 0x1;
         if (val) {
-            for (i = 0; i < NB_PORTS; i++) {
+            for (i = 0; i < EHCI_PORTS; i++) {
                 handle_port_owner_write(s, i, 0);
             }
         }
@@ -2427,7 +2427,7 @@ static int usb_ehci_post_load(void *opaque, int version_id)
     EHCIState *s = opaque;
     int i;
 
-    for (i = 0; i < NB_PORTS; i++) {
+    for (i = 0; i < EHCI_PORTS; i++) {
         USBPort *companion = s->companion_ports[i];
         if (companion == NULL) {
             continue;
@@ -2509,9 +2509,9 @@ void usb_ehci_realize(EHCIState *s, DeviceState *dev, Error **errp)
 {
     int i;
 
-    if (s->portnr > NB_PORTS) {
+    if (s->portnr > EHCI_PORTS) {
         error_setg(errp, "Too many ports! Max. port number is %d.",
-                   NB_PORTS);
+                   EHCI_PORTS);
         return;
     }
     if (s->maxframes < 8 || s->maxframes > 512)  {
-- 
2.41.0


