Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqn4D-0003Uo-GH
	for mharc-qemu-trivial@gnu.org; Thu, 12 Oct 2023 00:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqn4B-0003LL-QF
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 00:12:55 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqn49-0002ZY-0J
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 00:12:55 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9ad810be221so77337866b.2
 for <qemu-trivial@nongnu.org>; Wed, 11 Oct 2023 21:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697083971; x=1697688771; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WsX2DG2aDbsRhbntpTTVvqExibrPowqSUQlphKlY4n0=;
 b=w18JCYRji2rvQmiWW8GXzoT4EX2JpQZXD/Ya2nScLFnKDoO90sVXRLuW7ejKXW8sif
 4K+miP1lnsG4MhfZyKDL6KySm5rj85VPMZbU1qqHD10Hf42UCzLvepCVf9Qnaz51nuED
 ht5FwxTh50tT53IzEiP30Ok6WP5/8bqCNI5NyubnbFOnkNZ9QS4n2ot8aMZ+JpZPVs5L
 sTGmYC94j+dGlpn6oYLDm5Mi6ewLi9Zgx9cwgtkmNWCjiPN1DHzvwmSqOyq+YvFncyd1
 0lJGr/2gsSwgATQ3NvViUvD8PfywvNq846/1ONv9VSsEVtIOzu7j5GfI/zDuLovqrzXI
 DoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697083971; x=1697688771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WsX2DG2aDbsRhbntpTTVvqExibrPowqSUQlphKlY4n0=;
 b=hsOnJG+Z75m3Np3VXfTvBSlmvcOXAZFHftiVRpOHr2XrS2NeF4fYEy1GPAZP8hrK5/
 OZMmmRnhl3sLzYcWeFDQGDypJ8Hv2B2S4U3rc8nbMp8RMVVOAUkOX0yoL4b26hAnh+Cj
 0nQdcdaFhWe3FVW9Vgsq1ti55+SEOPATfFwclDRO0cPIZhN/6T24txgZ3LjfL1Vh8vME
 QDWsx/kH/xB9ho0GeuYlmHcvVWhJlaXuoaTUQwKtfwnTy7SyuHQOFs3UWMatB1jdjh0J
 dqUGJLLWAi6QOuZO1y2msA2+SKHwabmH8NaRIAwSWwe+SH1w6uILBeN5W6Eo8wZVACuJ
 9pNw==
X-Gm-Message-State: AOJu0YyG3Q5rZfl09qm+IepcdSiQFRwRGN4ZUTcOTbiOiLIhiPq/GTd+
 Kmxt52h+giuguvp+XCixZ4SfSA==
X-Google-Smtp-Source: AGHT+IF8e2OVr0AmyGOyd8lQzUViJIBoIXYUNY7eTdC8zOQVNVNsOdl8UEGD9MMlKxhTFm/YFKUFBg==
X-Received: by 2002:a17:906:8a64:b0:9b3:120:f319 with SMTP id
 hy4-20020a1709068a6400b009b30120f319mr19483428ejc.51.1697083971231; 
 Wed, 11 Oct 2023 21:12:51 -0700 (PDT)
Received: from m1x-phil.lan (dcs23-h01-176-173-173-31.dsl.sta.abo.bbox.fr.
 [176.173.173.31]) by smtp.gmail.com with ESMTPSA id
 r14-20020a170906364e00b009b65a698c16sm10513833ejb.220.2023.10.11.21.12.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Oct 2023 21:12:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] hw/pci-host/sh_pcic: Correct PCI host / devfn#0 function
 names
Date: Thu, 12 Oct 2023 06:12:36 +0200
Message-ID: <20231012041237.22281-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012041237.22281-1-philmd@linaro.org>
References: <20231012041237.22281-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 12 Oct 2023 04:12:56 -0000

Host bridge device and PCI function #0 are inverted.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/sh_pci.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
index 41aed48c85..580e273d96 100644
--- a/hw/pci-host/sh_pci.c
+++ b/hw/pci-host/sh_pci.c
@@ -116,7 +116,7 @@ static void sh_pci_set_irq(void *opaque, int irq_num, int level)
     qemu_set_irq(pic[irq_num], level);
 }
 
-static void sh_pci_device_realize(DeviceState *dev, Error **errp)
+static void sh_pcic_host_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     SHPCIState *s = SH_PCI_HOST_BRIDGE(dev);
@@ -145,19 +145,19 @@ static void sh_pci_device_realize(DeviceState *dev, Error **errp)
     s->dev = pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "sh_pci_host");
 }
 
-static void sh_pci_host_realize(PCIDevice *d, Error **errp)
+static void sh_pcic_pci_realize(PCIDevice *d, Error **errp)
 {
     pci_set_word(d->config + PCI_COMMAND, PCI_COMMAND_WAIT);
     pci_set_word(d->config + PCI_STATUS, PCI_STATUS_CAP_LIST |
                  PCI_STATUS_FAST_BACK | PCI_STATUS_DEVSEL_MEDIUM);
 }
 
-static void sh_pci_host_class_init(ObjectClass *klass, void *data)
+static void sh_pcic_pci_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    k->realize = sh_pci_host_realize;
+    k->realize = sh_pcic_pci_realize;
     k->vendor_id = PCI_VENDOR_ID_HITACHI;
     k->device_id = PCI_DEVICE_ID_HITACHI_SH7751R;
     /*
@@ -167,11 +167,11 @@ static void sh_pci_host_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
 }
 
-static void sh_pci_device_class_init(ObjectClass *klass, void *data)
+static void sh_pcic_host_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    dc->realize = sh_pci_device_realize;
+    dc->realize = sh_pcic_host_realize;
 }
 
 static const TypeInfo sh_pcic_types[] = {
@@ -179,12 +179,12 @@ static const TypeInfo sh_pcic_types[] = {
         .name           = TYPE_SH_PCI_HOST_BRIDGE,
         .parent         = TYPE_PCI_HOST_BRIDGE,
         .instance_size  = sizeof(SHPCIState),
-        .class_init     = sh_pci_device_class_init,
+        .class_init     = sh_pcic_host_class_init,
     }, {
         .name           = "sh_pci_host",
         .parent         = TYPE_PCI_DEVICE,
         .instance_size  = sizeof(PCIDevice),
-        .class_init     = sh_pci_host_class_init,
+        .class_init     = sh_pcic_pci_class_init,
         .interfaces = (InterfaceInfo[]) {
             { INTERFACE_CONVENTIONAL_PCI_DEVICE },
             { },
-- 
2.41.0


