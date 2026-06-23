Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AF0CDB47F
	for <qemu-trivial@archiver.kernel.org>; Tue, 23 Jun 2026 17:05:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wc4YI-0002KO-3H; Tue, 23 Jun 2026 13:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wc4YB-0002G1-ND
 for qemu-trivial@nongnu.org; Tue, 23 Jun 2026 13:04:39 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wc4Y9-0003Lg-V3
 for qemu-trivial@nongnu.org; Tue, 23 Jun 2026 13:04:39 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-36d5fd50d20so125077a91.1
 for <qemu-trivial@nongnu.org>; Tue, 23 Jun 2026 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782234276; x=1782839076; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSaOMXjVoFPTW5HopszMbWR5/OiDDQVduHsnOIO0DKc=;
 b=cJZweZRLH2xm+A7vN8IFbqIjkU58oXe2PjNK5M0nCQl87aBuHerO6piKNjPMjAik7w
 pW05JyCffr1flwm1kQvt6Y/J1k1ooKuz2FaTCDxmfiypbLZIE+FEjITXKndBs1cDrmav
 TJeckgKBu4MJbVVKrk8usrUFv9+PNEQUxcffaknVUkOuFDnMCSWC+C3UqoSUSwkAd6m1
 Nk/l1oBjA6MtXlm8qyj6RAlKOTCZO0DvKeAXUy5uHWomGBHAQqWuPhBnjeguueU/O/VF
 8mxYQGSE8/tiL7BVmXs7bcug9AVbKsRLkzbegWOTg3c4AHzzVuSPssiAQAMmf9BWVsU8
 qaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782234276; x=1782839076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oSaOMXjVoFPTW5HopszMbWR5/OiDDQVduHsnOIO0DKc=;
 b=KWX6VbA72oOrf2kHRv3SIUV96XNW2muwZNDkRrd/GySF2e+xIGxTfswdlX/IF5fMry
 jMomrKYF6JrRvu/W0LoiAmie1GxB3x1P6v15Co2seDjw9tY2YjldHZRgQqM4a5Ya1Zis
 z842jdXmSI5iT4j8PMrSy0n8jLcxjvIrXQ8kOwAadK3oSG88RJEnQMju+7sie8A3SQiO
 QHrkadPuXl2xRikrcGeoXMGWsYPUIPu/c6Lf0def8IWB8QpZIygrxDxv7qbBUpqGsgI3
 w8lYT/wLPKllct6rOadxDwsoYjNMbItWLW4R9E6PrI2J13i7H2HRYA6Q0+LtcBkYropK
 Z43Q==
X-Gm-Message-State: AOJu0YwWlA5CtpRlj6rndaoqMateBwk499M9GkrbUDdjR+YWlcI6RmxW
 /+A85OzZGjtqzgjhfCO49gZ2gYUbaTw+ndzaojUNQc+PdRtXUYoaHmCs
X-Gm-Gg: AfdE7cleZzb58wA7E9vdH8QiCSpObFNOxPYLC4rCM8bqhO4+a4je8x94YajPcL6sFn0
 wtXA+DH5maW2AfWeWCmP5Z1SIs8P4HCOZp9fn33vxBHI70cK5fO+pz3zdqBoGQPM07r2bIE60kN
 m5/x/oFR0C+Fm7iA4kOJxoJ7JrfNhdvfa6Wg/jqm5RwVZHUtylSvOGppdv8RHFnLzHOAzuaALek
 NGOxf8kgDocI4MEeJetdapsaunfQPTBhHTlgGxyv7OFueXftnVP+vmyO7Oznv9DFy9lXweFWWnX
 /Rncj0pJ9VL1x02AxURsGXAtzPiy/UUiFR1+46PiJmhTtdKpcXGWGhq59oYAnQ7W4ECzfscuIrJ
 kYqeVylsEmRWOEzjW7Ao5ZYQ16A8eH5Zec8Emx3oq/hip6TM0Ru96Tbe+rJT/lBpuiA3ORY0zrH
 3KOgRGBalcaKuUNwLtusBD/wjPA7a2iKujuo5UPA==
X-Received: by 2002:a17:90b:5405:b0:36b:3ecd:88d2 with SMTP id
 98e67ed59e1d1-37dd0d0d8d1mr4442368a91.3.1782234276101; 
 Tue, 23 Jun 2026 10:04:36 -0700 (PDT)
Received: from localhost.localdomain ([212.135.211.99])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37d4f225870sm10242924a91.8.2026.06.23.10.04.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jun 2026 10:04:35 -0700 (PDT)
From: jack wang <163wangjack@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, jack wang <163wangjack@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org (open list:i.MX25 PDK)
Subject: [PATCH 2/3] hw/misc/imx25_ccm: Replace DPRINTF with trace events
Date: Wed, 24 Jun 2026 01:03:53 +0800
Message-ID: <20260623170354.43981-3-163wangjack@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623170354.43981-1-163wangjack@gmail.com>
References: <20260623170354.43981-1-163wangjack@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=163wangjack@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

---
 hw/misc/imx25_ccm.c  | 34 ++++++++++------------------------
 hw/misc/trace-events |  9 +++++++++
 2 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
index a6665d5535..1ee652a117 100644
--- a/hw/misc/imx25_ccm.c
+++ b/hw/misc/imx25_ccm.c
@@ -16,18 +16,8 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "hw/misc/trace.h"
 
-#ifndef DEBUG_IMX25_CCM
-#define DEBUG_IMX25_CCM 0
-#endif
-
-#define DPRINTF(fmt, args...) \
-    do { \
-        if (DEBUG_IMX25_CCM) { \
-            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX25_CCM, \
-                                             __func__, ##args); \
-        } \
-    } while (0)
 
 static const char *imx25_ccm_reg_name(uint32_t reg)
 {
@@ -118,12 +108,12 @@ static uint32_t imx25_ccm_get_mpll_clk(IMXCCMState *dev)
         freq = imx_ccm_calc_pll(s->reg[IMX25_CCM_MPCTL_REG], CKIH_FREQ);
     }
 
-    DPRINTF("freq = %u\n", freq);
+    trace_imx25_ccm_get_mpll_clk(freq);
 
     return freq;
 }
 
-static uint32_t imx25_ccm_get_mcu_clk(IMXCCMState *dev)
+static uint32_t imx25_ccm_get_mcu_clk(IMX25CCMState *dev)
 {
     uint32_t freq;
     IMX25CCMState *s = IMX25_CCM(dev);
@@ -136,7 +126,7 @@ static uint32_t imx25_ccm_get_mcu_clk(IMXCCMState *dev)
 
     freq = freq / (1 + EXTRACT(s->reg[IMX25_CCM_CCTL_REG], ARM_CLK_DIV));
 
-    DPRINTF("freq = %u\n", freq);
+    trace_imx25_ccm_get_mcu_clk(freq);
 
     return freq;
 }
@@ -149,7 +139,7 @@ static uint32_t imx25_ccm_get_ahb_clk(IMXCCMState *dev)
     freq = imx25_ccm_get_mcu_clk(dev)
            / (1 + EXTRACT(s->reg[IMX25_CCM_CCTL_REG], AHB_CLK_DIV));
 
-    DPRINTF("freq = %u\n", freq);
+    trace_imx25_ccm_get_ahb_clk(freq);
 
     return freq;
 }
@@ -160,7 +150,7 @@ static uint32_t imx25_ccm_get_ipg_clk(IMXCCMState *dev)
 
     freq = imx25_ccm_get_ahb_clk(dev) / 2;
 
-    DPRINTF("freq = %u\n", freq);
+    trace_imx25_ccm_get_ipg_clk(freq);
 
     return freq;
 }
@@ -168,7 +158,7 @@ static uint32_t imx25_ccm_get_ipg_clk(IMXCCMState *dev)
 static uint32_t imx25_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
 {
     uint32_t freq = 0;
-    DPRINTF("Clock = %d)\n", clock);
+    trace_imx25_ccm_get_clock_frequency(clock, freq);
 
     switch (clock) {
     case CLK_NONE:
@@ -186,7 +176,7 @@ static uint32_t imx25_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         break;
     }
 
-    DPRINTF("Clock = %d) = %u\n", clock, freq);
+    trace_imx25_ccm_get_clock_frequency(clock, freq);
 
     return freq;
 }
@@ -195,8 +185,6 @@ static void imx25_ccm_reset(DeviceState *dev)
 {
     IMX25CCMState *s = IMX25_CCM(dev);
 
-    DPRINTF("\n");
-
     memset(s->reg, 0, IMX25_CCM_MAX_REG * sizeof(uint32_t));
     s->reg[IMX25_CCM_MPCTL_REG] = 0x800b2c01;
     s->reg[IMX25_CCM_UPCTL_REG] = 0x84042800;
@@ -238,8 +226,7 @@ static uint64_t imx25_ccm_read(void *opaque, hwaddr offset, unsigned size)
                       HWADDR_PRIx "\n", TYPE_IMX25_CCM, __func__, offset);
     }
 
-    DPRINTF("reg[%s] => 0x%" PRIx32 "\n", imx25_ccm_reg_name(offset >> 2),
-            value);
+    trace_imx25_ccm_read(imx25_ccm_reg_name(offset >> 2), value);
 
     return value;
 }
@@ -249,8 +236,7 @@ static void imx25_ccm_write(void *opaque, hwaddr offset, uint64_t value,
 {
     IMX25CCMState *s = (IMX25CCMState *)opaque;
 
-    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx25_ccm_reg_name(offset >> 2),
-            (uint32_t)value);
+    trace_imx25_ccm_write(imx25_ccm_reg_name(offset >> 2), (uint32_t)value);
 
     if (offset < 0x70) {
         /*
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index fdb4844045..ebe9b4fb22 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -273,6 +273,15 @@ imx6_src_reset(void) ""
 imx7_src_read(const char *reg_name, uint32_t value) "reg[%s] => 0x%" PRIx32
 imx7_src_write(const char *reg_name, uint32_t value) "reg[%s] <= 0x%" PRIx32
 
+# imx25_ccm.c
+imx25_ccm_get_mpll_clk(uint32_t freq) "freq = %u"
+imx25_ccm_get_mcu_clk(uint32_t freq) "freq = %u"
+imx25_ccm_get_ahb_clk(uint32_t freq) "freq = %u"
+imx25_ccm_get_ipg_clk(uint32_t freq) "freq = %u"
+imx25_ccm_get_clock_frequency(unsigned clock, uint32_t freq) "(clock = %d) = %u"
+imx25_ccm_read(const char *reg, uint32_t value) "reg[%s] => 0x%" PRIx32
+imx25_ccm_write(const char *reg, uint32_t value) "reg[%s] <= 0x%" PRIx32
+
 # iotkit-sysinfo.c
 iotkit_sysinfo_read(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysInfo read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysinfo_write(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysInfo write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
-- 
2.53.0


