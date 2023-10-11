Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqZsd-0000EU-MV
	for mharc-qemu-trivial@gnu.org; Wed, 11 Oct 2023 10:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqZsV-00009L-UE
 for qemu-trivial@nongnu.org; Wed, 11 Oct 2023 10:08:01 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqZsS-0007GN-IU
 for qemu-trivial@nongnu.org; Wed, 11 Oct 2023 10:07:59 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40572aeb73cso64355275e9.3
 for <qemu-trivial@nongnu.org>; Wed, 11 Oct 2023 07:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697033275; x=1697638075; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=usve4PUujmMl+yMklSEmrKUgOD9wFrihCQZTy1/EuhY=;
 b=ADxQmNiQFcEO00e+80m2JT63capjTnnspS7C3dekT7hrjde8ZZq3hWMBs5prFHQo93
 CV8y5BTeNj+y84SXmguySa8bA+/fB5A5EoOjwTrPLIFXGPDMuzX1x86NEpwtGwhnuOkC
 RB1uqKs9Ms5+j86OZT420ytnM0QSmnoSx5qyUQUJt6R4zpa6p/aOnfYy9veVhJ4aDKUb
 h+MeKKaCAJctVNCviJxZMJJbebcghprQc7L30ZKGgEaWB9bohbnJigmTvjNvHHm1Vc4e
 7iBNoVuXOD06K/+5oCrL36/fLzvEYwDO0Tl38G5CLajwyfEapJRgvfIY311DQP+fnze4
 zW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697033275; x=1697638075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=usve4PUujmMl+yMklSEmrKUgOD9wFrihCQZTy1/EuhY=;
 b=ZX71piUkj7Dw7SAemp7z2/UigzL2JFWqJCgUIVkA3wWvbCFwDEUvs5MjOQt1pm/F/n
 967D8fZ3i0O+PPmBiRx07b6iJGqtzM23Cg7mPuFsa/hmo6+ZBUPad8c0J09rIiPVJvMz
 ivNKiH/jA+Q8evH/EVGGfWIujUx+JTHpjfWdJW5v2zQ5kxUE3Yr659tPa74Cdqp2l3/m
 rHKsQ99Aq6YqsSlyeP/FcPsFKQ40ybsqB9UG+sKEtsGiwYNtu2jc+U/r1yKFLrdMiu+O
 4Y1be1EM3+D2QOCOEFmO6coswWL16qSr+gNGkzN9+YeGjPom6ncBqHPXaJ0/eBxbjfvf
 swlA==
X-Gm-Message-State: AOJu0Yz30jHdFwYj2lg9v4JAcx2i9EFJUOsRjCaUZwRdD9uZp2mpM7fy
 K+cdbwn5KN2o5n8Z7jD6WMgKwA==
X-Google-Smtp-Source: AGHT+IHFTdwstWPuYaLjKJv36aoGe0CiU+W+okuR3KgbnHSYjLUfQplwnOC/KDWAsbK5bjbnwx3jOQ==
X-Received: by 2002:a7b:c394:0:b0:406:51a0:17fd with SMTP id
 s20-20020a7bc394000000b0040651a017fdmr17468739wmj.18.1697033275133; 
 Wed, 11 Oct 2023 07:07:55 -0700 (PDT)
Received: from m1x-phil.lan (mdq11-h01-176-173-161-48.dsl.sta.abo.bbox.fr.
 [176.173.161.48]) by smtp.gmail.com with ESMTPSA id
 4-20020a05600c248400b004060f0a0fd5sm16912521wms.13.2023.10.11.07.07.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Oct 2023 07:07:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/2] hw/ppc/ppc440_uc: Remove dead l2sram_update_mappings()
Date: Wed, 11 Oct 2023 16:07:21 +0200
Message-ID: <20231011140721.3469-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011140721.3469-1-philmd@linaro.org>
References: <20231011140721.3469-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Wed, 11 Oct 2023 14:08:02 -0000

Apparently l2sram_update_mappings() bit-rotted over time,
when defining MAP_L2SRAM we get:

  hw/ppc/ppc440_uc.c:83:17: error: no member named 'isarc' in 'struct ppc4xx_l2sram_t'
      if (l2sram->isarc != isarc ||
          ~~~~~~  ^
  hw/ppc/ppc440_uc.c:84:18: error: no member named 'isacntl' in 'struct ppc4xx_l2sram_t'
          (l2sram->isacntl & 0x80000000) != (isacntl & 0x80000000)) {
           ~~~~~~  ^
  hw/ppc/ppc440_uc.c:85:21: error: no member named 'isacntl' in 'struct ppc4xx_l2sram_t'
          if (l2sram->isacntl & 0x80000000) {
              ~~~~~~  ^
  hw/ppc/ppc440_uc.c:88:50: error: no member named 'isarc_ram' in 'struct ppc4xx_l2sram_t'
                                          &l2sram->isarc_ram);
                                           ~~~~~~  ^
  hw/ppc/ppc440_uc.c:93:50: error: no member named 'isarc_ram' in 'struct ppc4xx_l2sram_t'
                                          &l2sram->isarc_ram);
                                           ~~~~~~  ^
  hw/ppc/ppc440_uc.c:96:17: error: no member named 'dsarc' in 'struct ppc4xx_l2sram_t'
      if (l2sram->dsarc != dsarc ||
          ~~~~~~  ^
  hw/ppc/ppc440_uc.c:97:18: error: no member named 'dsacntl' in 'struct ppc4xx_l2sram_t'
          (l2sram->dsacntl & 0x80000000) != (dsacntl & 0x80000000)) {
           ~~~~~~  ^
  hw/ppc/ppc440_uc.c:98:21: error: no member named 'dsacntl' in 'struct ppc4xx_l2sram_t'
          if (l2sram->dsacntl & 0x80000000) {
              ~~~~~~  ^
  hw/ppc/ppc440_uc.c:100:52: error: no member named 'dsarc' in 'struct ppc4xx_l2sram_t'
              if (!(isacntl & 0x80000000) || l2sram->dsarc != isarc) {
                                             ~~~~~~  ^
  hw/ppc/ppc440_uc.c:103:54: error: no member named 'dsarc_ram' in 'struct ppc4xx_l2sram_t'
                                              &l2sram->dsarc_ram);
                                               ~~~~~~  ^
  hw/ppc/ppc440_uc.c:111:54: error: no member named 'dsarc_ram' in 'struct ppc4xx_l2sram_t'
                                              &l2sram->dsarc_ram);
                                               ~~~~~~  ^

Remove that dead code.

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/ppc440_uc.c | 42 ------------------------------------------
 1 file changed, 42 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 4181c843a8..7d6ca70387 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -73,46 +73,6 @@ typedef struct ppc4xx_l2sram_t {
     uint32_t isram0[11];
 } ppc4xx_l2sram_t;
 
-#ifdef MAP_L2SRAM
-static void l2sram_update_mappings(ppc4xx_l2sram_t *l2sram,
-                                   uint32_t isarc, uint32_t isacntl,
-                                   uint32_t dsarc, uint32_t dsacntl)
-{
-    if (l2sram->isarc != isarc ||
-        (l2sram->isacntl & 0x80000000) != (isacntl & 0x80000000)) {
-        if (l2sram->isacntl & 0x80000000) {
-            /* Unmap previously assigned memory region */
-            memory_region_del_subregion(get_system_memory(),
-                                        &l2sram->isarc_ram);
-        }
-        if (isacntl & 0x80000000) {
-            /* Map new instruction memory region */
-            memory_region_add_subregion(get_system_memory(), isarc,
-                                        &l2sram->isarc_ram);
-        }
-    }
-    if (l2sram->dsarc != dsarc ||
-        (l2sram->dsacntl & 0x80000000) != (dsacntl & 0x80000000)) {
-        if (l2sram->dsacntl & 0x80000000) {
-            /* Beware not to unmap the region we just mapped */
-            if (!(isacntl & 0x80000000) || l2sram->dsarc != isarc) {
-                /* Unmap previously assigned memory region */
-                memory_region_del_subregion(get_system_memory(),
-                                            &l2sram->dsarc_ram);
-            }
-        }
-        if (dsacntl & 0x80000000) {
-            /* Beware not to remap the region we just mapped */
-            if (!(isacntl & 0x80000000) || dsarc != isarc) {
-                /* Map new data memory region */
-                memory_region_add_subregion(get_system_memory(), dsarc,
-                                            &l2sram->dsarc_ram);
-            }
-        }
-    }
-}
-#endif
-
 static uint32_t dcr_read_l2sram(void *opaque, int dcrn)
 {
     ppc4xx_l2sram_t *l2sram = opaque;
@@ -193,7 +153,6 @@ static void dcr_write_l2sram(void *opaque, int dcrn, uint32_t val)
         /*l2sram->isram1[dcrn - DCR_L2CACHE_BASE] = val;*/
         break;
     }
-    /*l2sram_update_mappings(l2sram, isarc, isacntl, dsarc, dsacntl);*/
 }
 
 static void l2sram_reset(void *opaque)
@@ -203,7 +162,6 @@ static void l2sram_reset(void *opaque)
     memset(l2sram->l2cache, 0, sizeof(l2sram->l2cache));
     l2sram->l2cache[DCR_L2CACHE_STAT - DCR_L2CACHE_BASE] = 0x80000000;
     memset(l2sram->isram0, 0, sizeof(l2sram->isram0));
-    /*l2sram_update_mappings(l2sram, isarc, isacntl, dsarc, dsacntl);*/
 }
 
 void ppc4xx_l2sram_init(CPUPPCState *env)
-- 
2.41.0


