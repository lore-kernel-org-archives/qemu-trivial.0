Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEnj6-0005pk-Bp
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2023 03:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnj4-0005on-TU
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 03:41:50 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnj1-0001e4-WB
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 03:41:50 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso8409906wms.5
 for <qemu-trivial@nongnu.org>; Mon, 09 Jan 2023 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJ7Ld9KMG3cV36Q3MxoGtMbfv5FoM/NwLMR+8A4FApY=;
 b=qachPbsKzMR+AMKRNhD4UGtfFP1ArC77+F3/gsw6SbkjSbjkhLM6aJGpEJJWb8SFIK
 VnWxvcR7jgak923oQrD2S4R5+lQ+F/DYuesknN5e3oU++WaLkaGO/20/K8poZwG2yT/s
 TsW3t/rysBYtNucAGyfWro+1sVL5zJlBoi6IwzzjU6RStYfS+RlUh9WRxuzsSh7gh/A2
 khag8XexU0XnotBkg71iwCIh1PRY1F7ztlk6118KFsXP6iDYE/7Fj0GgOSDFON9VPTs6
 vdaxuD4XYWo9dsEj7pL1CTsFN74fvgElldGAd5Mwd6iWjxai0HJTtLV+twrpujKkKzEP
 RQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJ7Ld9KMG3cV36Q3MxoGtMbfv5FoM/NwLMR+8A4FApY=;
 b=epgpwva7pLssyZnaTFY7A35FmE3KMZnsh3YhBRvvlU/sunr6bNPy9JWb6uJJtwXbKW
 MkAJUYPwXN8kHU2DIcN1kShvlrtfw79ZDLJhBY25VfwOM+zdfV2Ai+7EZY71F65EYGnA
 r35LRzUynjYmKRdpJ4+tpBdlYdVNEzi80VjT260M1VIULeF6vp19q6OFYCQM9yr8rxDY
 B3kb55hdf7TOz/nzUAYSAragPbIvze/cPdm+HcudU8tqV3fMHgLWXcHnKOjJcd8vHdY7
 2HLCv0PfOc0tXy77mw1B5Dmhla758v/DthHWwFhS/QySnGZeDxGA162O540MdxNEINfz
 jR/A==
X-Gm-Message-State: AFqh2krsTKmOOJ3+gwMGpwyIT1r7jHIT5WzyTuv6uN41M6Fsy1Db7Wxk
 jKKbhWyPpzxOuZDvwXYGhVZJDQ==
X-Google-Smtp-Source: AMrXdXv/ymE/p71F/4Lx6ghQg2jauI3V1Aqt/e83Ivhiqc90LIMsL9bOdgQwluW0WT0jR8M08lWjFw==
X-Received: by 2002:a7b:ce8e:0:b0:3d7:1b84:e377 with SMTP id
 q14-20020a7bce8e000000b003d71b84e377mr47660529wmj.27.1673253707375; 
 Mon, 09 Jan 2023 00:41:47 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b003d9ed40a512sm4853414wmb.45.2023.01.09.00.41.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 00:41:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
Date: Mon,  9 Jan 2023 09:41:21 +0100
Message-Id: <20230109084121.72138-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109084121.72138-1-philmd@linaro.org>
References: <20230109084121.72138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Mon, 09 Jan 2023 08:41:51 -0000

Convert the remaining DPRINTF debug macro uses to tracepoints.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 18 ++++++------------
 hw/i2c/trace-events  |  4 ++++
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index 9fa19cf8b1..ffc5b95410 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -18,14 +18,6 @@
 #include "qom/object.h"
 #include "trace.h"
 
-//#define DEBUG_BITBANG_I2C
-
-#ifdef DEBUG_BITBANG_I2C
-#define DPRINTF(fmt, ...) \
-do { printf("bitbang_i2c: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while(0)
-#endif
 
 /* bitbang_i2c_state enum to name */
 static const char *sname[] = {
@@ -72,8 +64,10 @@ static void bitbang_i2c_enter_stop(bitbang_i2c_interface *i2c)
 /* Set device data pin.  */
 static int bitbang_i2c_ret(bitbang_i2c_interface *i2c, int level)
 {
+    trace_bitbang_i2c_data(i2c->last_clock, i2c->last_data,
+                           i2c->device_out, level);
     i2c->device_out = level;
-    //DPRINTF("%d %d %d\n", i2c->last_clock, i2c->last_data, i2c->device_out);
+
     return level & i2c->last_data;
 }
 
@@ -138,11 +132,11 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
 
         if (i2c->current_addr < 0) {
             i2c->current_addr = i2c->buffer;
-            DPRINTF("Address 0x%02x\n", i2c->current_addr);
+            trace_bitbang_i2c_addr(i2c->current_addr);
             ret = i2c_start_transfer(i2c->bus, i2c->current_addr >> 1,
                                      i2c->current_addr & 1);
         } else {
-            DPRINTF("Sent 0x%02x\n", i2c->buffer);
+            trace_bitbang_i2c_send(i2c->buffer);
             ret = i2c_send(i2c->bus, i2c->buffer);
         }
         if (ret) {
@@ -162,7 +156,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
     }
     case RECEIVING_BIT7:
         i2c->buffer = i2c_recv(i2c->bus);
-        DPRINTF("RX byte 0x%02x\n", i2c->buffer);
+        trace_bitbang_i2c_recv(i2c->buffer);
         /* Fall through... */
     case RECEIVING_BIT6 ... RECEIVING_BIT0:
         data = i2c->buffer >> 7;
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 2a479c1c12..b0ab237b0f 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -2,6 +2,10 @@
 
 # bitbang_i2c.c
 bitbang_i2c_state(const char *old_state, const char *new_state) "state %s -> %s"
+bitbang_i2c_addr(uint8_t addr) "Address 0x%02x"
+bitbang_i2c_send(uint8_t byte) "TX byte 0x%02x"
+bitbang_i2c_recv(uint8_t byte) "RX byte 0x%02x"
+bitbang_i2c_data(unsigned dat, unsigned clk, unsigned old_out, unsigned new_out) "dat %u clk %u out %u -> %u"
 
 # core.c
 
-- 
2.38.1


