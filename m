Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B615FCCD195
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 14:16:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9lCl-0004ki-M9; Fri, 17 Oct 2025 10:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCf-0004jB-IP
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCQ-0005fp-HJ
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so1843383f8f.0
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760710367; x=1761315167; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NYtLEyH2FfideJwdnFZ4JM8eULzVedauT+XtbsfYWyM=;
 b=amsn5G/cU4k+ME9GC7M0RX6kU05AK2j5JR5DY6h6jCNWeZcyHgqPa3RmQG+1j8WBcv
 ooxF9ClUyeAaZDWBGcng0YIZrNbcIpQm8+wx57SDAQVO2xtMd6VrD+pGi0J3GUHK9+ha
 xtY1uVkQ6uy82URRZr6GJcxRbcTlMNB/ESG/rT2jKm0I/yW9p8EfIQqwYKQu5VGE5IX1
 IzrewAWDgdF+PTHEk/rUgGmxU/4nIZcMlWUgK0nBJcx8OHJh9sl6Iybk7mw67Qd/UVKR
 k65l/NapPLrdHrWeueoIkHbEnE8Z3TFDxeqy1zwA9ClagqVCc7dqCHNFZPFG6nUz+7zL
 s+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760710367; x=1761315167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NYtLEyH2FfideJwdnFZ4JM8eULzVedauT+XtbsfYWyM=;
 b=nYJ8W0bqpUHf/We1ZNFOmORGsng+jONOb7Se+xri2AIGkyXSg75Q8hvh5K9iB5vEFY
 U2PsvJy1vWWtvfUHsea37AMIXJw0I+3a2K9SyGKWZEEGgdSvnoWlkJgTcZm7mk9/Zw4q
 jGUnxve9HH5+ZECxTtfuK/0Hq0EPMjliAMcrq6UWQ06napd4r0NKuWaY2NweBf95f89y
 tzIaA9xzqGuaYjwoAB3UPDYCNWvRdQvlLrSt4GBRNN87OrIT38svCvKGIhlJl8FOHptc
 iSd5oMcFh6jVKNKJiqCkFIctQWe+eJ6s5voKoohqpeikuHq/WBlQX0N9q6ytAbidjrXR
 dnWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHCwMsInB5nILhSKKPqcpLLeD/F8sbHy/grFG1TOcVnlZR2Qk9nsIXuDoS9gSaHtKLapbxyXhqNvw2pIg=@nongnu.org
X-Gm-Message-State: AOJu0YzSpufIdnYMwx7ORyDF628mzntc4MK3k/JvINXThzljUMuFxvi4
 Ec7KtDyyhhNdppuOoeKm7Ixxre4dYQfHxNGKzHplNjZrBgZAP0ZSrhFR
X-Gm-Gg: ASbGncvfFIGNkOiIaCreZCRx4nzmOYgV3FDCk6SQdOzajmZks2oMeOXE67BcRfolPsD
 miyTQQPw+dNtFJk548HfvEVq9K+YMJ2DGiQyY21VKD8kdlcK0lI1xzQUrR7pbxgn6/QI1UYA2nm
 TfIld532g49l2VENkyLnwJ9xqu81Slmhs0ws/oBwyR2V4THnb2QmHW/xnoZF0vKf24OHYXKJU+3
 fGKLfqklbwSHNlLl5hJZR6uhg7sEtCcu0pZJrTvfwrAQaY3Keg5s84pOriCQnNEnbOeI7+mOVVq
 +SAx0bTkmCcWrjO/tXmhTsBFzVpPZw6aS4mPWCFT4c+VKa3jQkwWTZnL7vbmniYWbibSsA9UGtu
 6DKXwWwdmbzYObPnJwkHyNWx5+l0z3fsyonQCLV2T6mRXwlaG2S6zySd81IxOnC5jbdhhQBdl7x
 L7OXIdqhOkUKCGrL50V5Nc50mAicIf/WxzfXamkFwjjyE=
X-Google-Smtp-Source: AGHT+IEpVNrad4ULoYv87FWp8OQYnoQLnUzWsjxgBNny7ih8x0h9VPWd6hpnLRrzvILGi/tZVWmNGw==
X-Received: by 2002:a05:6000:250d:b0:3f8:8aa7:464d with SMTP id
 ffacd0b85a97d-42704d9b235mr3022647f8f.42.1760710366783; 
 Fri, 17 Oct 2025 07:12:46 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb36e7csm51359675e9.2.2025.10.17.07.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 07:12:46 -0700 (PDT)
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
Subject: [PATCH v2 02/11] hw/audio/pcspk: Add I/O trace events
Date: Fri, 17 Oct 2025 16:11:08 +0200
Message-ID: <20251017141117.105944-3-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017141117.105944-1-shentey@gmail.com>
References: <20251017141117.105944-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42b.google.com
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

Allows to see how the guest interacts with the device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/audio/pcspk.c      | 10 +++++++++-
 hw/audio/trace-events |  4 ++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index a419161b5b..f8020593b0 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -34,6 +34,7 @@
 #include "hw/audio/pcspk.h"
 #include "qapi/error.h"
 #include "qom/object.h"
+#include "trace.h"
 
 #define PCSPK_BUF_LEN 1792
 #define PCSPK_SAMPLE_RATE 32000
@@ -137,13 +138,18 @@ static uint64_t pcspk_io_read(void *opaque, hwaddr addr,
 {
     PCSpkState *s = opaque;
     PITChannelInfo ch;
+    uint8_t val;
 
     pit_get_channel_info(s->pit, 2, &ch);
 
     s->dummy_refresh_clock ^= (1 << 4);
 
-    return ch.gate | (s->data_on << 1) | s->dummy_refresh_clock |
+    val = ch.gate | (s->data_on << 1) | s->dummy_refresh_clock |
        (ch.out << 5);
+
+    trace_pcspk_io_read(s->iobase, val);
+
+    return val;
 }
 
 static void pcspk_io_write(void *opaque, hwaddr addr, uint64_t val,
@@ -152,6 +158,8 @@ static void pcspk_io_write(void *opaque, hwaddr addr, uint64_t val,
     PCSpkState *s = opaque;
     const int gate = val & 1;
 
+    trace_pcspk_io_write(s->iobase, val);
+
     s->data_on = (val >> 1) & 1;
     pit_set_gate(s->pit, 2, gate);
     if (s->voice) {
diff --git a/hw/audio/trace-events b/hw/audio/trace-events
index b8ef572767..30f5921545 100644
--- a/hw/audio/trace-events
+++ b/hw/audio/trace-events
@@ -23,6 +23,10 @@ hda_audio_format(const char *stream, int chan, const char *fmt, int freq) "st %s
 hda_audio_adjust(const char *stream, int pos) "st %s, pos %d"
 hda_audio_overrun(const char *stream) "st %s"
 
+# pcspk.c
+pcspk_io_read(uint16_t addr, uint8_t val) "[0x%"PRIx16"] -> 0x%"PRIx8
+pcspk_io_write(uint16_t addr, uint8_t val) "[0x%"PRIx16"] <- 0x%"PRIx8
+
 #via-ac97.c
 via_ac97_codec_write(uint8_t addr, uint16_t val) "0x%x <- 0x%x"
 via_ac97_sgd_fetch(uint32_t curr, uint32_t addr, char stop, char eol, char flag, uint32_t len) "curr=0x%x addr=0x%x %c%c%c len=%d"
-- 
2.51.1.dirty


