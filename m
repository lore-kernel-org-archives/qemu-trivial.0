Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19F0CCD19A
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 11:34:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9iik-0000gO-UM; Fri, 17 Oct 2025 07:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9iik-0000gD-0u
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:06 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9iig-0005zh-UY
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso13662145e9.0
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 04:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760700838; x=1761305638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFuBYoXthwAAHQXYSal9xNPgZEHCC/OlTSTKqa/XfA4=;
 b=hxF+nGP0MBfO0oAM8cyOMd8pXaFIICiHqXxikkUub6JucRGVRKifvNmx02SCfZM0V7
 MQ0QAB0Q1ZqzaKKGVZK/yuYsW9b3Wwae1TqKTYEsgUA0qdseFhZ3f23V/1ki5umH10Ga
 tGmIcU450spOKPodQlSjzdIL9PEs+AIWn/H7al42CLU1S6tZBZFnkHVQMbfECPbAJHvm
 qjlyvBvoCi+Qgs4oSZ4LHZoaTb4nY4B2ElbtOI4urJIEZGUNUiP2XxHmdRN5TH/T112b
 4AYaVn7uqXi+O1X+cDa5o/zIu0cRoBK582Ez9OAeAUAKK2bII5qLcQiScX/drNuhbg0E
 b+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760700838; x=1761305638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CFuBYoXthwAAHQXYSal9xNPgZEHCC/OlTSTKqa/XfA4=;
 b=mfiHM8ikOZSrVzWcVCxoyd+Bs/Tfvy/ZJtJa3RXExNnIapyIoK2QYVd8NczvFJP5FX
 +mYbYlLusvJI//z0ccFXyhvLbGN6RM6lVVRnDo6kCEjzd9pe3LHUATwfk++JLQzDRqua
 tqGagKGG91dOpCVmCzvjmrUG+wNkUCX8SiFLlA6dspp7u6oDilpfPGD0MsJyCROxwbxj
 jUXaFjSwyfBZDD+SVceldE346/T7mLy5g828CHqRht1etlWb5Bx3tKjXR/BhtYYgAFFF
 /ItYeMnLRfcITU2zX+23SiDhN8ekWDuEw+Q+FhFfT2J6Rnwv8EGYiSh/XmRCjth1it0a
 +bNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6nLP+g37mUfXTMq8V48bpmfvrhOy++vYXcAjk2qeinaL5JiKyVGQRdnc32Bl94L7zETA2ByXcXxHAq1I=@nongnu.org
X-Gm-Message-State: AOJu0YwxHbU8wVlYJu3e9G3b9GYXn1PShu1RcqFI9HVKLjb7nS9md+Ks
 ZbuH0mh665NalReRqwmoBChZRVpO0JXE+MiTmbdUJcG8ovuNZT2poXGw
X-Gm-Gg: ASbGnctOKE1I1gld6s26eneaz4bPsMJro5Wvzs0LtGZ/8txHlLF61I7PeI7Ymi5+JrV
 SL5H/ZdW3dxSGrnJnWW8w1l+kdDc+63KO+xqqhirkugZwpKIB1KO0Xyf+3OcBoHXLQ5EWgm/ht3
 ugb+L1pXjF5tT/D51GfQFyKdiQX2Z2MmZEQ2d5UsU7nV6+kbWEr04Y7917Y5UXtS1nys/LCzNro
 M1KO43i7eYt9Yr4L7GhzjbwNsiI02dJglOA6gCrThdC/PFRNkkZLCi7lonQw3Y9gM16Kd5WpRZ7
 b7EKKes/yWOML6KA5BRGNn0uzb504N3OEDKB0iAiDus7/eUFJsCWUMYYig57P/TqeybzvqG+KOE
 r7W+E6icP7XsiYXD3FgJfgHtfWGLNTdV4shV2Gnqqm9tqaRI0RwUUqnJdOT2OvyXKnW5wZe+TfY
 kWdlKkydtSzr/aCs+vS+/0D+Lih5IGT1zPSZqgiZoQXJs=
X-Google-Smtp-Source: AGHT+IE4/5NSxn/nzjrRaz/2tSIvi+OUwAPSKioBRiI/FigXa2wroS6pbibBYzUChp/qeNC2MX0YBA==
X-Received: by 2002:a05:600c:8b2f:b0:471:56:6f79 with SMTP id
 5b1f17b1804b1-4711793149emr23237705e9.41.1760700837650; 
 Fri, 17 Oct 2025 04:33:57 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711444c8adsm80395435e9.13.2025.10.17.04.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 04:33:57 -0700 (PDT)
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
Subject: [PATCH 1/8] hw/timer/i8254: Add I/O trace events
Date: Fri, 17 Oct 2025 13:33:31 +0200
Message-ID: <20251017113338.7953-2-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017113338.7953-1-shentey@gmail.com>
References: <20251017113338.7953-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x333.google.com
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

Allows to see how the guest interacts with the device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/timer/i8254.c      | 6 ++++++
 hw/timer/trace-events | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index 4b25c487f7..7033ebf50d 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -29,6 +29,7 @@
 #include "hw/timer/i8254.h"
 #include "hw/timer/i8254_internal.h"
 #include "qom/object.h"
+#include "trace.h"
 
 //#define DEBUG_PIT
 
@@ -130,6 +131,8 @@ static void pit_ioport_write(void *opaque, hwaddr addr,
     int channel, access;
     PITChannelState *s;
 
+    trace_pit_ioport_write(addr, val);
+
     addr &= 3;
     if (addr == 3) {
         channel = val >> 6;
@@ -248,6 +251,9 @@ static uint64_t pit_ioport_read(void *opaque, hwaddr addr,
             break;
         }
     }
+
+    trace_pit_ioport_read(addr, ret);
+
     return ret;
 }
 
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index c5b6db49f5..2bb51f95ea 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -49,6 +49,10 @@ cmsdk_apb_dualtimer_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK A
 cmsdk_apb_dualtimer_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB dualtimer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: reset"
 
+# i8254.c
+pit_ioport_read(uint8_t addr, uint32_t value) "[0x%" PRIx8 "] -> 0x%" PRIx32
+pit_ioport_write(uint8_t addr, uint32_t value) "[0x%" PRIx8 "] <- 0x%" PRIx32
+
 # imx_gpt.c
 imx_gpt_set_freq(uint32_t clksrc, uint32_t freq) "Setting clksrc %u to %u Hz"
 imx_gpt_read(const char *name, uint64_t value) "%s -> 0x%08" PRIx64
-- 
2.51.1.dirty


