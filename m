Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A638CCCD199
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 14:15:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9lCW-0004eU-VP; Fri, 17 Oct 2025 10:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCV-0004e5-NG
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:12:59 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCN-0005gG-Qz
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:12:59 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47100eae3e5so19555795e9.1
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760710368; x=1761315168; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n8oXWw/dktgNDXuS33Gpiga0QxIzazhu/qxi0riXcZ8=;
 b=ZUKYJdrMcPHLsaW3sELc/wPljyOuA8KNMhYRpoIn7lUZkeIhvFyM6y8yJe+lumISuS
 4QRuvg0Q1FgwqwcAQ6n8EoOWLmcAziNEX75+Wg7cnBWlT14aohUJ92h9QK9hZ338FmVo
 V9+/PeT5i34x3R7jVeLfVrv6YLIVeDFwRV3K/lVZQ/2JLqsLghwwXG4o3ItVnnfWX0IP
 Vi3ViVTpRvUYJ3jDS62tdnGOvKsVUvts63jMaI1MyvEpijpw7205Ym4qnYnIgen+iRKA
 GTbtPoHMCV5Grsgsk9TgtG7wMhZzxj7R3a1VjCGR6juu06JLSIcD/rzHJomdO3uZ3gAN
 7YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760710368; x=1761315168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n8oXWw/dktgNDXuS33Gpiga0QxIzazhu/qxi0riXcZ8=;
 b=SyhMXZc/546NlzChcg/AJtoGyUKjqsFZvbTD/2pSSVDX0yvEwp3n8BTEJj7Ui2BKDC
 hBHQnIpeDbSkBsHAivlp2ikgSffomYnzPcRTcb9sGMh5+Z5AJdPBjfJ13gdxB1jJtwi+
 WL2cSNBRtVNx/M53TNn99Pyo6oMI3Wn1WP9O2yU7EoLzRSKwpSN1epEhgRf7/7jdp8YV
 pznqd0lpx5+G0FRSAGS0dJmedtiCE4fRTommDWqVMpT/9YTbbGgk5Ry9tBqR8dzsOTn/
 FHQvFU69Ve30XaYv32oCoRv7HxCUYaPc8PVJ00C6Cfom+Uhg30XCXIk7iKIuK6oRbdHR
 u7Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSJGJ1wDm4zezThXdua1g1X2Kt4KupWlbTO2Xxgs8hN101/gNR2h692Lt4hKe/pcjHTs9u47hZ8jXjaAI=@nongnu.org
X-Gm-Message-State: AOJu0Ywb9X4J2eupeOLXMNraay+nJlk8r/6vdZaewJhkoctx5USSE1bF
 gnpQiZiSVgzfn4g/k7u/lrRLz3Z2I69cFMH/1KQK5aJn3T4AZUh0oDFa
X-Gm-Gg: ASbGncvLmiUNDsB8d6YcLWUnFv56gtVdHSFsHQ0reL9KQh0ifQvV8XZSflypLm1SfwI
 w0jexVbuQWtF7qsVU8eWmgHJAoBcMkHgb1tJb8Qox/tsAdx/VH1hdjnV+wKgUQJ3yrX8xL531CS
 XX+GpywRLAQhRAkU4hLycrm88ymbwda4kpWShQMNEF+AR/R93ZUi4FiBJ1aKVxnHujU62SCKLRL
 sCh7qLXM2KgpxVHUdZPdXmmvn60/S2Wwovc9U3JAh/lZDhVhRItpqMx8o94yIeVa1B5xija8wDT
 4171T0d6zEL++dd9aqb2Hsy/avWWWrDn6wHyYzlsoBswDMvrz30nefltEWofmH/m8cMjAK7Z+xS
 4JUrCw3pd1bAiwRhFCWJwOdVaDT5Wiro4JrlQqCEx0dLQRfMtOdcZ5rMyoijXaZ/X62CrFYa1uw
 FMUJHy/Ju6p2/2L5PSL9YFW9WyTWiieeEsac6sr48bulU=
X-Google-Smtp-Source: AGHT+IGhiyzkzAr+6r0KBtkLRDLs2tlXhqCkwBqEUxcf5/lWQeWBHbLeSI13oIDWMKk0dtvqeisVSw==
X-Received: by 2002:a05:600c:3488:b0:459:e398:ed89 with SMTP id
 5b1f17b1804b1-4711786c586mr30171665e9.1.1760710367930; 
 Fri, 17 Oct 2025 07:12:47 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb36e7csm51359675e9.2.2025.10.17.07.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 07:12:47 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, Cameron Esfahani <dirty@apple.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 03/11] hw/rtc/mc146818rtc: Convert CMOS_DPRINTF() into
 trace events
Date: Fri, 17 Oct 2025 16:11:09 +0200
Message-ID: <20251017141117.105944-4-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017141117.105944-1-shentey@gmail.com>
References: <20251017141117.105944-1-shentey@gmail.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


