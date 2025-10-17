Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDEFCCD195
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 11:35:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9ij5-0000ne-Oc; Fri, 17 Oct 2025 07:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9iiz-0000l5-79
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9iij-000608-5i
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso9348925e9.3
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 04:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760700840; x=1761305640; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n8oXWw/dktgNDXuS33Gpiga0QxIzazhu/qxi0riXcZ8=;
 b=QpDhaaCLe7fsPWXWhhEuLi2C1TI/AbLTIjz7SiTnS4sfWHy+OV3PofjerWT7ZgLyl7
 HHiz90BQyVzY4tDJ4NQB453G6TDLntgI3z7Wzs5k6AQT7DBGc6T9ECC8Go05ds9TVqWa
 vvy17XT6s5NYTjBt6UcKHDEOuYHlzNxnASM6U5T/U40MyD4tn71ts8CIfGvyhqNXfZ2a
 bXOigbaTuzVxUwyQ1gBETeqX9PEz4PrIWXQk7nlUGokJBhR3Beg0dT7j3XkM96teP41n
 n3/WsagEojUTGdUEtQkpWaA2u2y+O2EwIDmLrxnLVihtboCIFykZ4fZPtTMvYo1b4bNR
 Oxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760700840; x=1761305640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n8oXWw/dktgNDXuS33Gpiga0QxIzazhu/qxi0riXcZ8=;
 b=nJ4mx7IFDT6PpIvM3lDZzKtuJqoBmU6GdCUpBVuHwQ34ByHCLlgZsvGlEVQYETbyi7
 u8imQa5SDngmj9QIcfCffJssI4BnYBQejQvBqo8uePrJWwA8hBh8nSVsZy+7xGG1e5u+
 meM4S/jGFVTJZz/wfWqbvDDGNXWuv2UgQRNzgQxfCUJokzMbcMifcwlkVllykR2UaqXO
 VBmX0+mIqTWTYrWn7TiykJO4A2F3Z0JnIzrIcPyQBiTS2K3NB90X/ds3C6xbkApmW//i
 tRFOCBqCzdDF1vA5aijUtsBwP3Pvnu0D58oRKXv7GoLMvtmZnP737YTOpscGoZCdKc+l
 x0YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8jpEb9G8nXZ7n3F6OEK+8qnrgxE4m9VPW7EpeSCRTYY5uWbKENwINu+5zh95X6e9Vcy3fhhtnx9llfr8=@nongnu.org
X-Gm-Message-State: AOJu0YwQQhmMtBXEtSG+89jaeijC7LruF4JenDIR5ED3bAV4mJg7I6lX
 Vw4p+IXl6PyQLKXl5I103A1WpOFrugwepmKFgYu5wpgMEz25AAcpLtQJ
X-Gm-Gg: ASbGncsQWmKgz9GRyESoRQwVoVltTpqCa9jPIJZNCe7WgHSEftjsi1lmmAah+V4UKL4
 pGDP3dsg7QiU42QXmIR2OkysVrAFYa01enZnP9bLJVaIAEPPqeJZU4SUGQ4w2/qDJuktv+v4uHL
 yUZzyLL/bkiGLDC1X2aSMOXZKZIcwZbuzLPfoYdzE+0mAOo2tqJNy82gnyo2apsxXlFHm3Z1Sd7
 EheHgLRC3ofZ13Gn6uUN3eZkUnfCMn5xJD8y6JNzusnCS9rky7ZMu0Qf1zfcxWbr8G/wqzBg0sc
 TYKgxjYu8ux6W21tP49KFpW34UcWgwi0+lCAarL+d/I3YOsHbiD5vMRkJyZ2JUfueN1MK1e96GI
 IIpoYFI/N24TTLU2nWS8CV0tcdchjk+XQXeFg03OKusFab2kAYltKxz4sC6AOHeFtIzlgvs3yZB
 /2vbY+jZdhb+3EaW3WtjUx3QrCVwdzUNuYiOjSFxRuMUs=
X-Google-Smtp-Source: AGHT+IHChLP+fEi3IjSJ8xuUf0OcbY0gfQ2DOrnMB0thW11DyqUS6nTY7XHhnqI2um9SOjKmvUz9UQ==
X-Received: by 2002:a05:600c:4ec6:b0:46f:b327:ecfb with SMTP id
 5b1f17b1804b1-4711787bfe8mr25755445e9.9.1760700840070; 
 Fri, 17 Oct 2025 04:34:00 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711444c8adsm80395435e9.13.2025.10.17.04.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 04:33:59 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <laurent@vivier.eu>, kvm@vger.kernel.org,
 Zhao Liu <zhao1.liu@intel.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/8] hw/rtc/mc146818rtc: Convert CMOS_DPRINTF() into trace
 events
Date: Fri, 17 Oct 2025 13:33:33 +0200
Message-ID: <20251017113338.7953-4-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017113338.7953-1-shentey@gmail.com>
References: <20251017113338.7953-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x329.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/rtc/mc146818rtc.c | 14 +++-----------
 hw/rtc/trace-events  |  4 ++++
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index f9f5cf396f..61e9c0bf99 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -43,16 +43,10 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-misc.h"
 #include "qapi/visitor.h"
+#include "trace.h"
 
-//#define DEBUG_CMOS
 //#define DEBUG_COALESCED
 
-#ifdef DEBUG_CMOS
-# define CMOS_DPRINTF(format, ...)      printf(format, ## __VA_ARGS__)
-#else
-# define CMOS_DPRINTF(format, ...)      do { } while (0)
-#endif
-
 #ifdef DEBUG_COALESCED
 # define DPRINTF_C(format, ...)      printf(format, ## __VA_ARGS__)
 #else
@@ -439,8 +433,7 @@ static void cmos_ioport_write(void *opaque, hwaddr addr,
     if ((addr & 1) == 0) {
         s->cmos_index = data & 0x7f;
     } else {
-        CMOS_DPRINTF("cmos: write index=0x%02x val=0x%02" PRIx64 "\n",
-                     s->cmos_index, data);
+        trace_mc146818_rtc_ioport_write(s->cmos_index, data);
         switch(s->cmos_index) {
         case RTC_SECONDS_ALARM:
         case RTC_MINUTES_ALARM:
@@ -726,8 +719,7 @@ static uint64_t cmos_ioport_read(void *opaque, hwaddr addr,
             ret = s->cmos_data[s->cmos_index];
             break;
         }
-        CMOS_DPRINTF("cmos: read index=0x%02x val=0x%02x\n",
-                     s->cmos_index, ret);
+        trace_mc146818_rtc_ioport_read(s->cmos_index, ret);
         return ret;
     }
 }
diff --git a/hw/rtc/trace-events b/hw/rtc/trace-events
index b9f2852d35..d2f36217cb 100644
--- a/hw/rtc/trace-events
+++ b/hw/rtc/trace-events
@@ -32,6 +32,10 @@ m48txx_nvram_io_write(uint64_t addr, uint64_t value) "io write addr:0x%04" PRIx6
 m48txx_nvram_mem_read(uint32_t addr, uint32_t value) "mem read addr:0x%04x value:0x%02x"
 m48txx_nvram_mem_write(uint32_t addr, uint32_t value) "mem write addr:0x%04x value:0x%02x"
 
+# mc146818rtc.c
+mc146818_rtc_ioport_read(uint8_t addr, uint8_t value) "[0x%02" PRIx8 "] -> 0x%02" PRIx8
+mc146818_rtc_ioport_write(uint8_t addr, uint8_t value) "[0x%02" PRIx8 "] <- 0x%02" PRIx8
+
 # goldfish_rtc.c
 goldfish_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
 goldfish_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
-- 
2.51.1.dirty


