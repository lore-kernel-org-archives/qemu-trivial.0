Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rabnA-0004l6-SM
	for mharc-qemu-trivial@gnu.org; Thu, 15 Feb 2024 08:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rabn9-0004hf-0i
 for qemu-trivial@nongnu.org; Thu, 15 Feb 2024 08:28:43 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rabn7-0004oW-Dq
 for qemu-trivial@nongnu.org; Thu, 15 Feb 2024 08:28:42 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-511976c126dso1125804e87.1
 for <qemu-trivial@nongnu.org>; Thu, 15 Feb 2024 05:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708003720; x=1708608520; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bseUpOju7YvUN3+/fm6a697urfBk+5lMG7vEa3ydvK4=;
 b=uisddBYEDFd0Pk/xsMV5T7COFCFzxVhz/Gfos2GEDhz634keGRoMu1eKWbSjhKmWz/
 DhUbC35PdD5XeqCGcYfkG35K6OM68xpMGP2s6pzWr4rC0F93CFAupGusXa57vHaxpygI
 /9ZXjOjaohJq7P2yVvmGQYA2A024Jtb8tFAeAmE+Y9wnfwLEVKXBMXUoICeY1HT25MqT
 ec41Cw5b2Yk9sZlUqBIt2ivVsQYMzG9yIfk10Wdhvj5SjElRUdo8K4WpPRkgJLuYyGio
 sJyWyiayOyQvmdhUo6sr0eXSl5K2Y4WMq5fWXWNMGPqzjk1s3gcFo3qWFJ9Z9aIgGoKv
 sYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708003720; x=1708608520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bseUpOju7YvUN3+/fm6a697urfBk+5lMG7vEa3ydvK4=;
 b=HIy88VkiXBBNdgxO+q4hCI4kJGZ0LfPosiQw8wPByd994jYmn0/Ov8DircSt+b1uck
 EhMt3OxQlmKuE43A8VHEFL2SoNYey4DMkuSqyApNMCzmtH6e7FQuO2gw5dkftQPDLgPj
 JCmc2o2Q+jdGKibL71yJS4HgksyPDcbwbMqxkHdV3a34KrppVjG5EiVSrlmd63RQLYBK
 Rj0GsM/P9Ca9vD4oglwG32RlXPLPrGCJJXXRA2XEtcdCUstroRuL06Da+r383OlBi8n8
 tQcu63Mb56B4EohmUS/lFtoU5prr0jtKeHMQN4tiSlnhrqH+NfxOJxbnXNeKet4MWWNN
 ra5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUllh8j+yPm8d8+OtlWT5c4r/jIoIpZmO6wRHVD+slJFxLQj3e/FUZqszbPTgan9+6iYUBxHtGyjoTpymIES3h6yl/r/fqmqQ==
X-Gm-Message-State: AOJu0Yz1gklfPpKZFjU6e4X89SeIsjStwyN7bHjyMVBT6ySidELFJ3c1
 xzaOBooysMFABjYlJ6pUa5Hs7twOBeGdvsd0o8ZJUV3T2HHIS4OCCmQe97lcSIM=
X-Google-Smtp-Source: AGHT+IHlEe+sqHcp4OzsmVcMHIJGeWmZh6qN5MdhWX4VeKaegGjcgZdvHngXnvb1M56Yl/F9lLT97g==
X-Received: by 2002:a05:6512:3baa:b0:512:88b2:abff with SMTP id
 g42-20020a0565123baa00b0051288b2abffmr1271397lfv.6.1708003719656; 
 Thu, 15 Feb 2024 05:28:39 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 vx2-20020a170907a78200b00a3d9a94b13fsm446246ejc.136.2024.02.15.05.28.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 05:28:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 qemu-trivial@nongnu.org, Fabien Chouteau <chouteau@adacore.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] hw/sparc/leon3: Have write_bootloader() take a void
 pointer argument
Date: Thu, 15 Feb 2024 14:28:24 +0100
Message-ID: <20240215132824.67363-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215132824.67363-1-philmd@linaro.org>
References: <20240215132824.67363-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 15 Feb 2024 13:28:43 -0000

Directly use the void pointer argument returned
by memory_region_get_ram_ptr().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sparc/leon3.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index d096fb04cb..8717c72e77 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -94,9 +94,9 @@ static uint32_t *gen_store_u32(uint32_t *code, hwaddr addr, uint32_t val)
  * state (eg: initialized by the bootloader). This little code reproduces
  * this behavior.
  */
-static void write_bootloader(uint8_t *base, hwaddr kernel_addr)
+static void write_bootloader(void *ptr, hwaddr kernel_addr)
 {
-    uint32_t *p = (uint32_t *) base;
+    uint32_t *p = (uint32_t *) ptr;
 
     /* Initialize the UARTs                                        */
     /* *UART_CONTROL = UART_RECEIVE_ENABLE | UART_TRANSMIT_ENABLE; */
@@ -338,10 +338,7 @@ static void leon3_generic_hw_init(MachineState *machine)
              * the machine in an initialized state through a little
              * bootloader.
              */
-            uint8_t *bootloader_entry;
-
-            bootloader_entry = memory_region_get_ram_ptr(prom);
-            write_bootloader(bootloader_entry, entry);
+            write_bootloader(memory_region_get_ram_ptr(prom), entry);
             env->pc = LEON3_PROM_OFFSET;
             env->npc = LEON3_PROM_OFFSET + 4;
             reset_info->entry = LEON3_PROM_OFFSET;
-- 
2.41.0


