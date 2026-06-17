Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA483CD98F0
	for <qemu-trivial@archiver.kernel.org>; Wed, 17 Jun 2026 12:03:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wZozH-0004na-EQ; Wed, 17 Jun 2026 08:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wZorU-0002So-Bz
 for qemu-trivial@nongnu.org; Wed, 17 Jun 2026 07:55:16 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wZorR-0006HB-J0
 for qemu-trivial@nongnu.org; Wed, 17 Jun 2026 07:55:16 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2c6d31bfc8aso731575ad.2
 for <qemu-trivial@nongnu.org>; Wed, 17 Jun 2026 04:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781697312; x=1782302112; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=934hamAJ+JSUr2HsPwZHL2EyxcVP/T+xXV5QPm/j1Y4=;
 b=bPwd/Jpm3tjFB+CmltKeI8d0kQ20twbWDHNKgCwUKnbNv9p/Abs2fipWtfSofUVBt2
 Gmvt4vEFm+PtJqlNsJjaVoPIfdITXbwKKGRzJWZK0sU90culoJxMrjoCkTlL9pXkcpnl
 gFh3yND+TlBj133ne0HR+mHAx0RzEPI9fzOCEQNFGXDWfWHHnjth8/apmuzbbZGG82uU
 Y8h0ya4Yo0NQV0SxPkQBLP9CSiVN3YyrwqhKwkHxOI/yUIVTsGf/X2GzY5VD2jcqSTfx
 ihkAbvijK9Gdkfvz9c4X80A+hzWehjpPOgdRoHdqLUcPGGWL2C2zWLiq0SskzrcukoIV
 auhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781697312; x=1782302112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=934hamAJ+JSUr2HsPwZHL2EyxcVP/T+xXV5QPm/j1Y4=;
 b=YJOuuyvI8hSaZWANpzfYUYCEULBoYs+PLbV/zZ767qR+Wl/JvVh5o/QxQP7cLMpQ0S
 ZHNU/5750oCQ0yDTSfueg0ix6Bw1qoJ6X4VY5whRfKiIu0h7BzWfqV1cLSmqabBc1t/m
 BV4iQ3o1FgJH21dolJzYNZ4EIqPZhQNrJ4z6KrH/Ddtcijj798Ui8cCw/bOx/edoSShV
 MwDtflSg6VHc+sWOD5a5ugtMqrKbnvWSi4DMYFWnKmI52b8WeH1ji0L5TEhzZuWxbev8
 9/1e3WoNLJ5ZaiFsXcGNyqELluuat0OPfg13TGBG519v6KKoFfRiHfg8cAmz9bix6SP5
 ERcQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8jzC+dD91fq7A9i17WG8CtT/QGYKUKnI7x7lzF7JOS9SEzlbLF/yn5YZLxzLsG63hQlwRsFrjhjBRYSQ=@nongnu.org
X-Gm-Message-State: AOJu0YypC8tie1LtdJLU9R9ZMFFX8nGGSe3GgN9sOj+CcvIkGarhyvd2
 7yg27ZQyILX7VmgtgndmDBhbkNgqqnmQDyxMH3edUX45yMLu0BQZlXy4
X-Gm-Gg: Acq92OEy+01Evj2X6eqNHIFfmbFLqjK4yKS8z1o0BHZgnDWdMQ120hKgybcJsqvmNDO
 EZljgpuuptXvN5C1FjY/wZp15JEPIbAikdPLYhX8bZ3wTxPtA1mZvhKX8SHe0IhDAyo2OvvhyqD
 5UH8uk1tw3SdNfc9rAQEcbNIOIuZIR/nRTkrxxHUnXpm4+M6RPZ2rAwYh2+Bs7U6b22ACBoBjBg
 I2Hk2hZyUyqDgOusm+JD2+MMt/uPhdKZkia2Ag8ZB7Jq+yfCgscF/XtbBSMeP5N2DgBZw3U60nh
 /eIkXfo2/RI2lL7yfIAGnh9X5OgqxP++XttRcWVhMb9g1eDTVwdlsJhLaT860redYVnvYEl4imb
 NneeInLP/IVDA3lrNl12pB7bdneAZsWMVAnBO7ES6xpx8Qc/NvfTW6L+tLZGMDULjK+modYO57F
 uvAKWM6PC8/8EkW0h/97/E6DlX
X-Received: by 2002:a17:903:b0d:b0:2c6:95d1:3bbc with SMTP id
 d9443c01a7336-2c6bc1e0086mr34999805ad.24.1781697311702; 
 Wed, 17 Jun 2026 04:55:11 -0700 (PDT)
Received: from localhost.localdomain ([82.40.42.115])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f1f1014sm163576605ad.16.2026.06.17.04.55.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Jun 2026 04:55:11 -0700 (PDT)
From: jw_mac <163wangjack@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, mjt@tls.msk.ru, laurent@vivier.eu,
 Wang Yuxin <163wangjack@gmail.com>
Subject: [PATCH trivial] git format-patch -1 --subject-prefix="PATCH
 trivial"Signed-off-by: jw_mac <163wangjack@gamil.com>
Date: Wed, 17 Jun 2026 19:54:42 +0800
Message-ID: <20260617115442.91715-2-163wangjack@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617115442.91715-1-163wangjack@gmail.com>
References: <20260617115442.91715-1-163wangjack@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=163wangjack@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Jun 2026 08:03:15 -0400
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

From: Wang Yuxin <163wangjack@gmail.com>

hw/timer/imx_epit: Replace DPRINTF with trace events

Clean up the codebase by removing the outdated DEBUG_IMX_EPIT
and DPRINTF macros, replacing them with modern QEMU trace events.

This also removes an empty and meaningless DPRINTF("\n") in the
imx_epit_realize function.

Signed-off-by: jw_mac <163wangjack@gmail.com>
---
 hw/timer/imx_epit.c   | 25 +++++--------------------
 hw/timer/trace-events |  8 ++++++++
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index c67a39f10c..476e2771b3 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -20,18 +20,7 @@
 #include "hw/misc/imx_ccm.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
-
-#ifndef DEBUG_IMX_EPIT
-#define DEBUG_IMX_EPIT 0
-#endif
-
-#define DPRINTF(fmt, args...) \
-    do { \
-        if (DEBUG_IMX_EPIT) { \
-            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX_EPIT, \
-                                             __func__, ##args); \
-        } \
-    } while (0)
+#include "trace.h"
 
 static const char *imx_epit_reg_name(uint32_t reg)
 {
@@ -80,7 +69,7 @@ static uint32_t imx_epit_get_freq(IMXEPITState *s)
     uint32_t prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
     uint32_t f_in = imx_ccm_get_clock_frequency(s->ccm, imx_epit_clocks[clksrc]);
     uint32_t freq = f_in / prescaler;
-    DPRINTF("ptimer frequency is %u\n", freq);
+    trace_imx_epit_get_freq(freq);
     return freq;
 }
 
@@ -146,8 +135,7 @@ static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
                       HWADDR_PRIx "\n", TYPE_IMX_EPIT, __func__, offset);
         break;
     }
-
-    DPRINTF("(%s) = 0x%08x\n", imx_epit_reg_name(offset >> 2), reg_value);
+    trace_imx_epit_read(imx_epit_reg_name(offset >> 2), reg_value);
 
     return reg_value;
 }
@@ -328,8 +316,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
 {
     IMXEPITState *s = IMX_EPIT(opaque);
 
-    DPRINTF("(%s, value = 0x%08x)\n", imx_epit_reg_name(offset >> 2),
-            (uint32_t)value);
+    trace_imx_epit_write(imx_epit_reg_name(offset >> 2), (uint32_t)value);
 
     switch (offset >> 2) {
     case 0: /* CR */
@@ -362,7 +349,7 @@ static void imx_epit_cmp(void *opaque)
     /* The cmp ptimer can't be running when the peripheral is disabled */
     assert(s->cr & CR_EN);
 
-    DPRINTF("sr was %d\n", s->sr);
+    trace_imx_epit_cmp(s->sr);
     /* Set interrupt status bit SR.OCIF and update the interrupt state */
     s->sr |= SR_OCIF;
     imx_epit_update_int(s);
@@ -399,8 +386,6 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
     IMXEPITState *s = IMX_EPIT(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    DPRINTF("\n");
-
     sysbus_init_irq(sbd, &s->irq);
     memory_region_init_io(&s->iomem, OBJECT(s), &imx_epit_ops, s, TYPE_IMX_EPIT,
                           0x00001000);
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index ac5afe84e8..3c282800c6 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -122,3 +122,11 @@ hpet_ram_write_tn_cmp(uint8_t reg_off) "hpet_ram_writel HPET_TN_CMP + %" PRIu8
 hpet_ram_write_invalid_tn_cmp(void) "invalid HPET_TN_CMP + 4 write"
 hpet_ram_write_invalid(void) "invalid hpet_ram_writel"
 hpet_ram_write_counter_write_while_enabled(void) "Writing counter while HPET enabled!"
+
+# imx_epit.c
+imx_epit_get_freq(uint32_t freq) "ptimer frequency is %u"
+imx_epit_read(const char *name, uint32_t value) "(%s) = 0x%08x"
+imx_epit_write(const char *name, uint32_t value) "(%s, value = 0x%08x)"
+imx_epit_cmp(uint32_t sr) "sr was %d"
+
+
-- 
2.53.0


