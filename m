Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqn47-00036R-VD
	for mharc-qemu-trivial@gnu.org; Thu, 12 Oct 2023 00:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqn47-00034I-21
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 00:12:51 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqn44-0002Xz-CP
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 00:12:50 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53d82bea507so972310a12.2
 for <qemu-trivial@nongnu.org>; Wed, 11 Oct 2023 21:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697083965; x=1697688765; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lWNq3KWxwESBCknmH6aQ2YVg3r1DMh4fTWxmynlFDM0=;
 b=fGopAv3tLuaBWtx+fTKUYshtGF3yoVhkRKO0jtTy/3qiEag4PemWkozISdXwtBazIE
 4+5izvh9p5it7YhZj6Pit8tj7gP+API7oVmpuJwg2BcF1XhzXVVTr4Bc9EgEu5yK74k/
 vIMz2n77abK8NOmFNb8t3GvvcIJdZ+PHdVAz+/GtwpYuuKGE8vvaHieIYYSvG2F/Zrgl
 5U59mcLX77PEpOenX0T8qHwX8tfuFARgj940wKJst9J1oEz3I7EHjve/+ljMUgTosuti
 agWjGRlEAW28qQdUv352gLBQN9Lux3Q8noUYM32wF8un1/tTdz+zrGqsWcloCAHA91/T
 FfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697083965; x=1697688765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lWNq3KWxwESBCknmH6aQ2YVg3r1DMh4fTWxmynlFDM0=;
 b=LmvIKac/MnL11BIRZRPT6iRWCU4rX/yFUxdQzfoZaKf2rs9cEw3i2dKe04kQzEN3Se
 LA/mV4tomhv2KsnhxN83iBxZgeq8ibV5TLwGAtSO6IF1FFRqrxwobKi/EzecYNvf+6yi
 jaWkwlVZRVBfe9ubjXhDhEDI5cCJmDJmZOOxX9rIsxV6Y22RtJbE29wDJJl3zlcNR5if
 ojtJEgYc/NTVvZYTOM4+Ni36kO0fKOJes1gI/RUT6SkYERNXGhs1tnD3WJn0yJRx/7vi
 Z2duiLHwkNfKzvJ07z4CwyNHYyPtr+CE8OEd4KPcSkyRYDC+qnsCgGucdBC4BcvMpjEM
 5ZNQ==
X-Gm-Message-State: AOJu0Yyg83yp/uZRbfZLCZCAC8av7cUl6jvYRqG3h0r5Z5tKHmb4/7rG
 NYWzUXeSu7nfw+j5YtdNW+v1cw==
X-Google-Smtp-Source: AGHT+IG2tU0448ksjArII5Kd//1AaxL71l31OdHDqsc/O4s1tuUe0RAXZGIlgfCPotow0D8tvVhFCQ==
X-Received: by 2002:a05:6402:351:b0:533:87c9:4a83 with SMTP id
 r17-20020a056402035100b0053387c94a83mr20694022edw.37.1697083965369; 
 Wed, 11 Oct 2023 21:12:45 -0700 (PDT)
Received: from m1x-phil.lan (dcs23-h01-176-173-173-31.dsl.sta.abo.bbox.fr.
 [176.173.173.31]) by smtp.gmail.com with ESMTPSA id
 dm9-20020a05640222c900b0053db1ca293asm1993649edb.19.2023.10.11.21.12.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Oct 2023 21:12:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] hw/pci-host/sh_pcic: Declare CPU QOM types using
 DEFINE_TYPES() macro
Date: Thu, 12 Oct 2023 06:12:35 +0200
Message-ID: <20231012041237.22281-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012041237.22281-1-philmd@linaro.org>
References: <20231012041237.22281-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Thu, 12 Oct 2023 04:12:51 -0000

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/sh_pci.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
index 77e7bbc65f..41aed48c85 100644
--- a/hw/pci-host/sh_pci.c
+++ b/hw/pci-host/sh_pci.c
@@ -167,17 +167,6 @@ static void sh_pci_host_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
 }
 
-static const TypeInfo sh_pci_host_info = {
-    .name          = "sh_pci_host",
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
-    .class_init    = sh_pci_host_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
 static void sh_pci_device_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -185,17 +174,22 @@ static void sh_pci_device_class_init(ObjectClass *klass, void *data)
     dc->realize = sh_pci_device_realize;
 }
 
-static const TypeInfo sh_pci_device_info = {
-    .name          = TYPE_SH_PCI_HOST_BRIDGE,
-    .parent        = TYPE_PCI_HOST_BRIDGE,
-    .instance_size = sizeof(SHPCIState),
-    .class_init    = sh_pci_device_class_init,
+static const TypeInfo sh_pcic_types[] = {
+    {
+        .name           = TYPE_SH_PCI_HOST_BRIDGE,
+        .parent         = TYPE_PCI_HOST_BRIDGE,
+        .instance_size  = sizeof(SHPCIState),
+        .class_init     = sh_pci_device_class_init,
+    }, {
+        .name           = "sh_pci_host",
+        .parent         = TYPE_PCI_DEVICE,
+        .instance_size  = sizeof(PCIDevice),
+        .class_init     = sh_pci_host_class_init,
+        .interfaces = (InterfaceInfo[]) {
+            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+            { },
+        },
+    },
 };
 
-static void sh_pci_register_types(void)
-{
-    type_register_static(&sh_pci_device_info);
-    type_register_static(&sh_pci_host_info);
-}
-
-type_init(sh_pci_register_types)
+DEFINE_TYPES(sh_pcic_types)
-- 
2.41.0


