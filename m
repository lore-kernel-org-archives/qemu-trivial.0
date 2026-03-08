Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62DDEA8545
	for <qemu-trivial@archiver.kernel.org>; Sun,  8 Mar 2026 20:36:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vzKqe-0007J3-6h; Sun, 08 Mar 2026 16:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqb-0007H4-Ph
 for qemu-trivial@nongnu.org; Sun, 08 Mar 2026 16:35:33 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqa-00045v-Db
 for qemu-trivial@nongnu.org; Sun, 08 Mar 2026 16:35:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48539cbb7b1so3165805e9.3
 for <qemu-trivial@nongnu.org>; Sun, 08 Mar 2026 13:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773002131; x=1773606931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2i4QWuXnsIYxEz7i8mpYTk9RDE3sISGydinWlpK7m7M=;
 b=Y92nr9TPAx6rfQlHQmR6bGbSjC3Qw7Io7377HYBDIgojVQLpBg82maSG4xyW2mT6RN
 1GDJhTXwGhN7HZPR3E8TyrLgSGtZy0Dnwk7V1GUg6ioImpSBzu7sCzkPjGiUNYTQ/IHC
 10mRAp+udJOKaPqMbL5/2j+md9Ktt0nBDUMgl02xmVP6GNDAwqcXoohVxbB5bDwDbSNy
 kj7hpKDnEO3O6t36aa01VUD9pyhpd1bhVjnqNroXJtptYRyWXlCqKszN6lw+RiYclbT0
 6c+tJ/wih3QELMAc8XdYkKMFT2Yyl+xMxIIaK39s7PA5NAdsa6pwO+4rDWyZq1iaGlWv
 aJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773002131; x=1773606931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2i4QWuXnsIYxEz7i8mpYTk9RDE3sISGydinWlpK7m7M=;
 b=SVFW6dkCeZ3soVYTSsocfSKD9y4xzST5fhiAj59wRVmP1QH7H3E8C4/GCo6duCfXTL
 izSvaIrfe9guDR18qrZaNVOqbJI5hBAP8M6gA33egQdJOgFsnzEbFxkcyfPuDFqBpE7k
 32KSK6Ny3juJlsRo8Gx7olTqDOJzJ2p7n4QOpc1pQE7HNtBSt3FEEqZR5AI3C3Kcfm9u
 TwcIwesZ+/HsDORIvAJ51cllhlSzujwU4i97mwPR2IzseoshS8wIHSl2HjoQKnuNK9uD
 ayK7JTWTrto2iN926zALgP+IV3Gz4gvXoQxHRNi5WjMiFk0RNBCvD2ciLzqgcllDosRc
 OWuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZIRgcXC6/XK9F7qv1VooOHA5p2czwCzVMkGF5BDIUvZ2ilGRneepNQljdhSe61vasgcB7nfKqcM2gdO4=@nongnu.org
X-Gm-Message-State: AOJu0YyiLnd+5TDU+Lb85TnhokZyfy7VrfBnz7qPUGb3DNgSdcv9wSaK
 V343RsfbCm7eAy4tWOp1e53Q/tRF3ofo1sajonfESgrf/gBMDX4FNzDj
X-Gm-Gg: ATEYQzyEz5T9ppQNd3PWH/HDfLoQYc7FUXORi8l/JaRUR2EkmklflhGQVSxpB2rkF/Y
 Ywn+Aw6uGUaVmGLZgtalEx8/w2vA0m1a7GfFhqnOkCD6Gb4/K0QotjhUdcDfzYzhavN3bPkUAk1
 V6PjD3GB0YxdhQZVTQ1ZdaP+PhLdCnx203a9fShifWIxz17fQuuybLFnBuUfDQG+gJD+OrRAJRe
 wmWPd/PFLiwnjyxjhKMelmc1SNGdbRoV/tTcfEJSbD9fQ6azMEoG5OgPp3RxnV0H1jASAgTJ3wx
 4DLAeL3uv2Qi0wbLggHXeeN6FhMO8su6Nv80rB0oVJAjsqwsDtVfkX6Yx4IOf0qDWKx+8chy55P
 ENvX65Y/OdsqWrHtyeivTIT6Vam08R2GaUHwEAyVbR7J1QeDaQnuZRBjO2WOL9W/MnFN8s5RKOC
 eZ1/vwuGxNdFgJD5ukWAxwlHeZIXPDb5pRGsOsHr7WFkhUWSzt9dDDjviMrqT6uzO6haVGnsvo3
 6CIwEh7rv3fIg4FP5vquC/bUG1GxV0=
X-Received: by 2002:a05:600c:64c7:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-4852691ec50mr146662655e9.12.1773002130682; 
 Sun, 08 Mar 2026 13:35:30 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-25c6-8f00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:25c6:8f00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2bdf8sm20995508f8f.25.2026.03.08.13.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 13:35:30 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 5/5] Revert "sysbus: add irq_routing_notifier"
Date: Sun,  8 Mar 2026 21:35:16 +0100
Message-ID: <20260308203516.160103-6-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308203516.160103-1-shentey@gmail.com>
References: <20260308203516.160103-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

The callback has been introduced in commit 715ca691daca ("sysbus: add
irq_routing_notifier") for use in VFIO platform. Meanwhile, VFIO
platform has been removed via commit 762c85543948 ("vfio: Remove 'vfio-
platform'") which was its only user. Remove this unused code.

This reverts commit 715ca691daca081108b33306faa6fa102f0df8d8.

cc: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/core/sysbus.h | 1 -
 hw/core/sysbus.c         | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/include/hw/core/sysbus.h b/include/hw/core/sysbus.h
index c0d18d9e00..f3c4259d29 100644
--- a/include/hw/core/sysbus.h
+++ b/include/hw/core/sysbus.h
@@ -50,7 +50,6 @@ struct SysBusDeviceClass {
      * omitted then. (This is not considered a fatal error.)
      */
     char *(*explicit_ofw_unit_address)(const SysBusDevice *dev);
-    void (*connect_irq_notifier)(SysBusDevice *dev, qemu_irq irq);
 };
 
 struct SysBusDevice {
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 3adf2f2faf..3e1160ee92 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -104,13 +104,7 @@ qemu_irq sysbus_get_connected_irq(const SysBusDevice *dev, int n)
 
 void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq)
 {
-    SysBusDeviceClass *sbd = SYS_BUS_DEVICE_GET_CLASS(dev);
-
     qdev_connect_gpio_out_named(DEVICE(dev), SYSBUS_DEVICE_GPIO_IRQ, n, irq);
-
-    if (sbd->connect_irq_notifier) {
-        sbd->connect_irq_notifier(dev, irq);
-    }
 }
 
 /* Check whether an MMIO region exists */
-- 
2.53.0


