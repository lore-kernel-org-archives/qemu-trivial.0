Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHqur-0001wz-6v
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2023 13:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHque-0001sy-2I
 for qemu-trivial@nongnu.org; Tue, 17 Jan 2023 13:42:28 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHqub-0000iv-VG
 for qemu-trivial@nongnu.org; Tue, 17 Jan 2023 13:42:23 -0500
Received: by mail-ej1-x636.google.com with SMTP id ud5so77552301ejc.4
 for <qemu-trivial@nongnu.org>; Tue, 17 Jan 2023 10:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0tE4B310nUB0gFBo/wzLg+119jqLd4O6fykhWT0X0zM=;
 b=GRwQuj3FSMLOS9E9vz4DqUakntCuQ/r9l/lcm7Latb0IUlN7qgRlyr3a7HA99Z12cf
 IAgIz+eL8JtqMNZ/rWFHbjUtant2ZeAvuJD63BO6RtZqpl9n3n1mMNQasyEpW1IS/D2E
 Ufp8XXGRctpKIbKpTBf1ppKqBbSi4D/zha0Q8NR8F9ZuyYmheRaklPrSbc8mbqZY/jW4
 eA/BeQffsqa9E4EtGRd+O9ULFiyZ21TLfMplphWun37cV9D/k3AX8hxFyBgzTSJXYsRD
 lweYZkhJ1qSFMPAJuPC6/sU63Tawao5VHdgABYjVA0uaXffVL/cTeAc60C/+C66LBSlG
 MGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0tE4B310nUB0gFBo/wzLg+119jqLd4O6fykhWT0X0zM=;
 b=iU+PbEWPCX89MCKf9NbW0LcgLSup7vfjQKB/4VtfR7F+ST64pYmVOacfiElSi6rp41
 KQ/OON2K5dJSwi+vkWA2tb2mc1QCoWs3snzL2U/XD/SeHxa5bEqkbyXHaqlN9g2jPs89
 98shudxA3rIrjM5XstmqCvhyyHZ4F1lGQSqe6cYDnbpT0bXpJxm3dj94HvlFD3EKsYBH
 Nqccxf6UettdzOsDz0s2WCrM29tkSuirQaOHr3G0h+YKfQknXLQG0k3RZMDjN0wkUdaH
 0WnSQwbT0q5BuBOYZn3/GglI00aylQqM6f6voPNNFH4Mq1sGMCKKhviDRV6XTacfcJlv
 BiTQ==
X-Gm-Message-State: AFqh2kry/xpxonxoDcw2+cyXWJ6Sy+IJkZwlGetB2kbCqKH7/AK/BV7M
 vcWmYsdqgX4CrnfXuXjYjlQVUXuN7z+a2OOm
X-Google-Smtp-Source: AMrXdXsjujbr8EWCfNKDN4D/DZiZa4lQs0U4OiaLv6QqK8kWZ3KRGRuGOqjY5D+UhttpidCwpzIfLg==
X-Received: by 2002:a17:906:474a:b0:7c0:d60b:2883 with SMTP id
 j10-20020a170906474a00b007c0d60b2883mr3822514ejs.50.1673980940101; 
 Tue, 17 Jan 2023 10:42:20 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170906319500b0086faa5b06d4sm3524214ejy.181.2023.01.17.10.42.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Jan 2023 10:42:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] target/tricore: Remove unused fields from CPUTriCoreState
Date: Tue, 17 Jan 2023 19:42:17 +0100
Message-Id: <20230117184217.83305-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 17 Jan 2023 18:42:34 -0000

Remove dead code:
- unused fields in CPUTriCoreState
- (unexisting) tricore_def_t structure
- forward declaration of tricore_boot_info structure
  (declared in "hw/tricore/tricore.h", used once in
   hw/tricore/tricore_testboard.c).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/cpu.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 3b9c533a7c..47d0ffb745 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -25,10 +25,6 @@
 #include "qemu/cpu-float.h"
 #include "tricore-defs.h"
 
-struct tricore_boot_info;
-
-typedef struct tricore_def_t tricore_def_t;
-
 typedef struct CPUArchState {
     /* GPR Register */
     uint32_t gpr_a[16];
@@ -179,16 +175,9 @@ typedef struct CPUArchState {
     uint32_t M3CNT;
     /* Floating Point Registers */
     float_status fp_status;
-    /* QEMU */
-    int error_code;
-    uint32_t hflags;    /* CPU State */
 
     /* Internal CPU feature flags.  */
     uint64_t features;
-
-    const tricore_def_t *cpu_model;
-    void *irq[8];
-    struct QEMUTimer *timer; /* Internal timer */
 } CPUTriCoreState;
 
 /**
-- 
2.38.1


