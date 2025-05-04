Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBhLc-0007fa-3Q
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2025 17:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLa-0007ef-HT
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:58:06 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLZ-0005EO-4f
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:58:06 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2260c91576aso33276435ad.3
 for <qemu-trivial@nongnu.org>; Sun, 04 May 2025 14:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746395884; x=1747000684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yJ6sh3pLgJKtEU3rXRYV5JYEmSVW7VzWbjTxsoRblQU=;
 b=u6TGHhkHWr6roR1I8L+WO2zNeAYMIBxw3xLct50spBmYj3YqnWtEs0DQlyZHzQRj2c
 21tu0glO8zo32/L73xqCvfTMdD3syDtsLB4GG7mkjGhe6/KlBEIWJlswXXAZxUaHEuvv
 tYaOLmPHzO8cIfPBCr2oI+LfbWxE3W60ZMs4QBB845UR074DKcndiW6vUevadsofkK6k
 SkqCNcRsH4ZgDjFmGhqJtj9PfQeGKzWTKQE9ovm6gu/GjvB4wUw//81UWBJI1M0E3H2r
 v2/0MxbcR/g/PjE91DtTNxDS+aKYsg2tAPbFZFc47SHt4GkEmL0SsPGRTtC8zW9po0+e
 k7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746395884; x=1747000684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yJ6sh3pLgJKtEU3rXRYV5JYEmSVW7VzWbjTxsoRblQU=;
 b=SrgzDKBtC1kAbNdr+/tJTk5zyq3sp1I3H3hVWrIxyLz6AZ7bYbvt9YvZm3Y43F34O1
 M5b41dIRXXxnP/KqJfStv5mmBh2LYUfE0S0Sv0zeaGM61cRy9EwOpUlPraoN6tjmGQTE
 5kpxMrxancc4hE7JiilWwN4SJhWda+aA/HrvpMAdKFGuKtEGBvfgbNi6i+rtPanPqa7R
 BbS+PGih9XLUPYm6WrzD24onCdvz7q3W0srokVz7VLhRdqy6gsODbRgC8iBV37L3zuyJ
 75vdEUjdUn1f85/lmiPU6ppEdoZSDPKXH6G82yP7bQMri0zzyt8H/exd/g3vcF/F3dhV
 VAyQ==
X-Gm-Message-State: AOJu0Yz8d8odyhME0dQfwm3j9BajcLq4Z02z/0A6OqDL7XxVbp8rD06j
 ydTxTWvyri6LoHb+gCA4VhYW7qdWGCfWKGRWXxVtN7YU69+pl0CLaTUVlelqGw4=
X-Gm-Gg: ASbGnctnUbzli7Ow9mjUwtKpZiEh1zJKhM9ozpLrAo8MFXhi3D+xlVtKYFEhRI+5IgH
 sjvxshJpXthYNHd6opFeAVxTEpNsR7QcyCdP6swXW3oqDhrUveljJOxstLcecbdtbHPC6uQwE2e
 tSVefTI+6wZ1Wo+irpJ2rdeqO0GuQi0mYBe9FNEnBwuzulZldDJRQnSpUUrF6OA1CICTO4M9d79
 uy4RTC35tNrnY9eZzURfzlBbq1KjNCC0Bfwx13SPFj8ZXgJkEGpoQILWeFQKTEByIGCenfNPTrt
 9UNy3u0aag6cUwW76iW1P1hOEEo4AGMOVh74o0scZyMCOmzh
X-Google-Smtp-Source: AGHT+IFTAEMZjB78zEYVogYT/aTb+2aaCMQnggNO7XDMlAjClzSVCXsoxQzjdCAaycYD5MfxMW7g2w==
X-Received: by 2002:a17:903:120e:b0:223:5241:f5ca with SMTP id
 d9443c01a7336-22e1ea7c4cbmr63451245ad.20.1746395883827; 
 Sun, 04 May 2025 14:58:03 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152204fesm41664875ad.137.2025.05.04.14.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 14:58:03 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org,
 gustavo.romero@linaro.org
Subject: [PATCH] hw/acpi/ich9: Remove ICH9_DEBUG macro
Date: Sun,  4 May 2025 21:56:39 +0000
Message-Id: <20250504215639.54860-11-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Sun, 04 May 2025 21:58:06 -0000

Remove the ICH9_DEBUG macro, which is only used to dump the value of the
pm_io_base parameter, passed to ich9_pm_iospace_update(). It provides
little to no value and is not worth converting to a trace event.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/acpi/ich9.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index a07c9d115b..967b67485e 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -41,15 +41,6 @@
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 
-//#define DEBUG
-
-#ifdef DEBUG
-#define ICH9_DEBUG(fmt, ...) \
-do { printf("%s "fmt, __func__, ## __VA_ARGS__); } while (0)
-#else
-#define ICH9_DEBUG(fmt, ...)    do { } while (0)
-#endif
-
 static void ich9_pm_update_sci_fn(ACPIREGS *regs)
 {
     ICH9LPCPMRegs *pm = container_of(regs, ICH9LPCPMRegs, acpi_regs);
@@ -135,8 +126,6 @@ static const MemoryRegionOps ich9_smi_ops = {
 
 void ich9_pm_iospace_update(ICH9LPCPMRegs *pm, uint32_t pm_io_base)
 {
-    ICH9_DEBUG("to 0x%x\n", pm_io_base);
-
     assert((pm_io_base & ICH9_PMIO_MASK) == 0);
 
     pm->pm_io_base = pm_io_base;
-- 
2.34.1


