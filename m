Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286DECDB471
	for <qemu-trivial@archiver.kernel.org>; Tue, 23 Jun 2026 17:05:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wc4YY-0002dw-AZ; Tue, 23 Jun 2026 13:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wc4YK-0002N1-04
 for qemu-trivial@nongnu.org; Tue, 23 Jun 2026 13:04:51 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wc4YI-0003QZ-5P
 for qemu-trivial@nongnu.org; Tue, 23 Jun 2026 13:04:47 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-36d98b9aa9aso131297a91.3
 for <qemu-trivial@nongnu.org>; Tue, 23 Jun 2026 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782234284; x=1782839084; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frkdTRN5r5z/ocMDErKcvjYJyZm6QlD/OaSOCwTrYFM=;
 b=cmYPRbo4UDfF33nHaZiCa0+wXyd9DEYBIS/rVufgOTe+4zYPoOqysS14ggWMksbh+a
 It+5N9QRGiESffc7gYg21k9ez/fpIfe7ohrTxy3qNI/hirJck1MR5gsJs24VRNZPNurM
 SGC5VgchS1kUzceBDtb6uT+PChmHBSDV34pDRt/b5HmFmQ5HCLUTMKjU/kfWYvtELVVP
 avL1HBkq2K2EEOSsOB5qfYEVA9aqczC58rXQqAoFMMOGFayqYYrn4yQC4YAoeFz/+SEq
 Qs9t20TF2r9/ODM4fUueKBUWdgUnu1bEKBpWYtsEDzavBh/Jt+Rrd9ABjwjk3Cz1SHhf
 eHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782234284; x=1782839084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=frkdTRN5r5z/ocMDErKcvjYJyZm6QlD/OaSOCwTrYFM=;
 b=mkE1br702BAKZs9kfXOPFREctO3Ng6gPZunTRtiPJ/EFN4XMIF92ufXg3e/BNDXB77
 BJlMRmA8n5oeOL7SBYQQrWUnvvFUWxfK1xrZjQxPLQXKgKy43uxXctiYnNRi8hfvcFIA
 jfdGwHJV7gpAG7TuuVFAJAfoxxGkeHN09PUhApAwIQGc2qAKmS7taN9burhUKTsPBxg4
 SpVDFAk+WKyzfuJ6IgO5mxRoV40hUdrq1CXdu6QA+isiiaNdXfHD46GJqQ3R8fkIN2Eh
 f5J27+cSDt+nRDXO1cxEoHs5RWK/TJaRQ2tIk1O6IShAb8sGb1cGI27s0hyVp2o27PGQ
 z6sw==
X-Gm-Message-State: AOJu0Yzb34CMGf51pB/RFcGFFTkKfkxpS7pVlMe2cBRWcwbUUnWfQrHk
 HzvGI/FwjHvzEb6/idtDrjcdJAEjgMDbPZxHkVrmXqEs4WpFERUZGAJx
X-Gm-Gg: AfdE7cmmVB8zKiBFpuS8HMzYzduaCJ76xPiY++KUw4qhgKut4fSCOLw8O69N5Rtgqnr
 Jo7TvLuUqyq71n5g6W4wYe7b8XFKbJjX+7kigm9HUGA+CfHxyqfQcX/4dPAxLOk8550xctVdgLl
 N7kainb2zzj0yFbgRVmibDxvn33pCDLBBWHJJe7OVw0O25bDJVvINg7aU7FUiUGm21wcX4vraIh
 V4ovc9wsuILD1nnh/f+1zuBAnusRLVENM0C2jA8NX7mM55c2bv/geQxNZE1qVb+LdALlYfn60P7
 ewedLLwkD8mtqMgzaM5q6nXfV7t0REL7mDDHs6730VaHJ8HswVsIhgl0WUDJLZ6ZHqg2HdgcTFP
 Fayw1s6ugUPy5m4yvEJ9fhC0RzgDhXmasUAa3yZ14rhnLrkuCUpjhA0g4LWikzsN0sN0zVomUrm
 Ze0Q0xRGcK4NgG4qp7YfhqEiV+BqB1xh/VuqW2OA==
X-Received: by 2002:a17:90b:584b:b0:37c:18e0:90ed with SMTP id
 98e67ed59e1d1-37dd0d0d820mr4056523a91.4.1782234283832; 
 Tue, 23 Jun 2026 10:04:43 -0700 (PDT)
Received: from localhost.localdomain ([212.135.211.99])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37d4f225870sm10242924a91.8.2026.06.23.10.04.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jun 2026 10:04:42 -0700 (PDT)
From: jack wang <163wangjack@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, jack wang <163wangjack@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:i.MX31 (kzm))
Subject: [PATCH 3/3] hw/misc/imx31_ccm: Replace DPRINTF with trace events
Date: Wed, 24 Jun 2026 01:03:54 +0800
Message-ID: <20260623170354.43981-4-163wangjack@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623170354.43981-1-163wangjack@gmail.com>
References: <20260623170354.43981-1-163wangjack@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=163wangjack@gmail.com; helo=mail-pj1-x1036.google.com
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
 hw/misc/imx31_ccm.c  | 33 ++++++++++-----------------------
 hw/misc/trace-events | 10 ++++++++++
 2 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
index 339458e859..e3edd6df8f 100644
--- a/hw/misc/imx31_ccm.c
+++ b/hw/misc/imx31_ccm.c
@@ -16,21 +16,10 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "hw/misc/trace.h"
 
 #define CKIH_FREQ 26000000 /* 26MHz crystal input */
 
-#ifndef DEBUG_IMX31_CCM
-#define DEBUG_IMX31_CCM 0
-#endif
-
-#define DPRINTF(fmt, args...) \
-    do { \
-        if (DEBUG_IMX31_CCM) { \
-            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX31_CCM, \
-                                             __func__, ##args); \
-        } \
-    } while (0)
-
 static const char *imx31_ccm_reg_name(uint32_t reg)
 {
     static char unknown[20];
@@ -120,7 +109,7 @@ static uint32_t imx31_ccm_get_pll_ref_clk(IMXCCMState *dev)
         freq = CKIH_FREQ;
     }
 
-    DPRINTF("freq = %u\n", freq);
+    trace_imx31_ccm_get_pll_ref_clk(freq);
 
     return freq;
 }
@@ -133,7 +122,7 @@ static uint32_t imx31_ccm_get_mpll_clk(IMXCCMState *dev)
     freq = imx_ccm_calc_pll(s->reg[IMX31_CCM_MPCTL_REG],
                             imx31_ccm_get_pll_ref_clk(dev));
 
-    DPRINTF("freq = %u\n", freq);
+    trace_imx31_ccm_get_mpll_clk(freq);
 
     return freq;
 }
@@ -150,7 +139,7 @@ static uint32_t imx31_ccm_get_mcu_main_clk(IMXCCMState *dev)
         freq = imx31_ccm_get_mpll_clk(dev);
     }
 
-    DPRINTF("freq = %u\n", freq);
+    trace_imx31_ccm_get_mcu_main_clk(freq);
 
     return freq;
 }
@@ -163,7 +152,7 @@ static uint32_t imx31_ccm_get_hclk_clk(IMXCCMState *dev)
     freq = imx31_ccm_get_mcu_main_clk(dev)
            / (1 + EXTRACT(s->reg[IMX31_CCM_PDR0_REG], MAX));
 
-    DPRINTF("freq = %u\n", freq);
+    trace_imx31_ccm_get_hclk_clk(freq);
 
     return freq;
 }
@@ -176,7 +165,7 @@ static uint32_t imx31_ccm_get_ipg_clk(IMXCCMState *dev)
     freq = imx31_ccm_get_hclk_clk(dev)
            / (1 + EXTRACT(s->reg[IMX31_CCM_PDR0_REG], IPG));
 
-    DPRINTF("freq = %u\n", freq);
+    trace_imx31_ccm_get_ipg_clk(freq);
 
     return freq;
 }
@@ -201,7 +190,7 @@ static uint32_t imx31_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         break;
     }
 
-    DPRINTF("Clock = %d) = %u\n", clock, freq);
+    trace_imx31_ccm_get_clock_frequency(clock, freq);
 
     return freq;
 }
@@ -210,7 +199,7 @@ static void imx31_ccm_reset(DeviceState *dev)
 {
     IMX31CCMState *s = IMX31_CCM(dev);
 
-    DPRINTF("()\n");
+
 
     memset(s->reg, 0, sizeof(uint32_t) * IMX31_CCM_MAX_REG);
 
@@ -244,8 +233,7 @@ static uint64_t imx31_ccm_read(void *opaque, hwaddr offset, unsigned size)
                       HWADDR_PRIx "\n", TYPE_IMX31_CCM, __func__, offset);
     }
 
-    DPRINTF("reg[%s] => 0x%" PRIx32 "\n", imx31_ccm_reg_name(offset >> 2),
-            value);
+    trace_imx31_ccm_read(imx31_ccm_reg_name(offset >> 2), value);
 
     return (uint64_t)value;
 }
@@ -255,8 +243,7 @@ static void imx31_ccm_write(void *opaque, hwaddr offset, uint64_t value,
 {
     IMX31CCMState *s = (IMX31CCMState *)opaque;
 
-    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx31_ccm_reg_name(offset >> 2),
-            (uint32_t)value);
+    trace_imx31_ccm_write(imx31_ccm_reg_name(offset >> 2), value);
 
     switch (offset >> 2) {
     case IMX31_CCM_CCMR_REG:
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index ebe9b4fb22..0c2565ddb8 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -282,6 +282,16 @@ imx25_ccm_get_clock_frequency(unsigned clock, uint32_t freq) "(clock = %d) = %u"
 imx25_ccm_read(const char *reg, uint32_t value) "reg[%s] => 0x%" PRIx32
 imx25_ccm_write(const char *reg, uint32_t value) "reg[%s] <= 0x%" PRIx32
 
+# imx31_ccm.c
+imx31_ccm_get_mpll_clk(uint32_t freq) "freq = %u"
+imx31_ccm_get_pll_ref_clk(uint32_t freq) "freq = %u"
+imx31_ccm_get_mcu_main_clk(uint32_t freq) "freq = %u"
+imx31_ccm_get_hclk_clk(uint32_t freq) "freq = %u"
+imx31_ccm_get_ipg_clk(uint32_t freq) "freq = %u"
+imx31_ccm_get_clock_frequency(unsigned clock, uint32_t freq) "(clock = %u) = %u"
+imx31_ccm_read(const char *reg, uint32_t value) "reg[%s] => 0x%" PRIx32
+imx31_ccm_write(const char *reg, uint32_t value) "reg[%s] <= 0x%" PRIx32
+
 # iotkit-sysinfo.c
 iotkit_sysinfo_read(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysInfo read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysinfo_write(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysInfo write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
-- 
2.53.0


