Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jj8uV-00062q-Vt
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jun 2020 18:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jj8uT-0005wi-BQ; Wed, 10 Jun 2020 18:09:25 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52707)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jj8uS-0008IE-Hq; Wed, 10 Jun 2020 18:09:24 -0400
Received: by mail-wm1-x344.google.com with SMTP id r9so3239103wmh.2;
 Wed, 10 Jun 2020 15:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fCWXr6zHNQbQPJ8BLLwrAx76MymcZFD1NlfKOZXdkr4=;
 b=uZWKnxaRDpKGzUjo9WJF4UAfNQeHO8Pr6Nu3oUn/eU7p4YeGVkVwVh71HpuWF1AEJa
 BYWQ+lHAGNzmvyINp2MR+Ew/EJ8Kt/RQHSsBH/tXvwcRUTy4R+JLEpXO8oTGjOu807Rt
 Xx0RUavFJeGzcbbvIOFztOGEKLNahigIMPzyGjUx7r4YmVtcYEgg5dTMqZGqxZDTALG8
 kC7gelvuZ0oAg8WtAbFYgZwJTiGgLLGmNlW+QVMsQLCrw4pj8hc0/yfteibekUT9zq/+
 Jn0acq/ULpN9nugW/f6UVdG7T+6Mdv4kdys0pbA8/3A+GQ+eZK++OM1MLao97ZYpnX/t
 lweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fCWXr6zHNQbQPJ8BLLwrAx76MymcZFD1NlfKOZXdkr4=;
 b=E8lt/lC1ZfFy639x/5hp/2LxNqCcPmFNoMEmbuqPo7slHfBq1pw73cmPZbCFpJvhvV
 lmUYp8in8mWP8rO+NL6W9LZ5VJs0GFvSFaLPcVFzHvdnzeP6m3OTybqyk1FS96kUYWp1
 eliR0JBjADYi01fp2i1Qmeh2LDuSGNC74rM6H0pu6IL7n6X7+D5RyEiMVLDrR+pZpy9m
 FMKvvhl3ku2pXJIQrlA8bbKdDyJP9nPt/8urSGO/ArVePjhJp40FFeKza8jYRpM7MZnx
 98/bd41hoRBV864OROPILz+osKBUnrW9ukg0nARuQMTwv4xctdtDfDHWbIx2wZiIZVCj
 FDKA==
X-Gm-Message-State: AOAM531hcJ0z1pvvXa5LBKXgLRkl5iiaejcozEhwI7p0uCVKxhAQqiNH
 VSBRO3zzy6iTLrNQR5NQaEiGGYUv
X-Google-Smtp-Source: ABdhPJwQx0tWiic5WPjQpeO61Qydwb9ShWvGEbP5yjG0ZsbvDXvSevcXlNSWgkKquz7g2Ph9LIlNzg==
X-Received: by 2002:a1c:6244:: with SMTP id w65mr5031214wmb.82.1591826950036; 
 Wed, 10 Jun 2020 15:09:10 -0700 (PDT)
Received: from x1w.redhat.com (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id 40sm1819354wrc.15.2020.06.10.15.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 15:09:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Fam Zheng <fam@euphon.net>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 09/11] hw/timer/sh_timer: Remove unused 'qemu/timer.h'
 include
Date: Thu, 11 Jun 2020 00:08:51 +0200
Message-Id: <20200610220853.8558-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200610220853.8558-1-f4bug@amsat.org>
References: <20200610220853.8558-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jun 2020 22:09:26 -0000

Remove unused "qemu/timer.h" include.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/sh_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index b9cbacf5d0..bb0e1c8ee5 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -13,7 +13,6 @@
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
-#include "qemu/timer.h"
 #include "hw/timer/tmu012.h"
 #include "hw/ptimer.h"
 
-- 
2.21.3


