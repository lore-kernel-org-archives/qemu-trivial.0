Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4BbR-0006LJ-Kh
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jan 2021 18:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <35lgPYAgKDNsTRE7LQPEDLLDIB.9LJNBJR-QOFSF7IKLKDKR.LOD@flex--wuhaotsh.bounces.google.com>)
 id 1l4BbP-0006IE-UL
 for qemu-trivial@nongnu.org; Mon, 25 Jan 2021 18:48:59 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:45362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <35lgPYAgKDNsTRE7LQPEDLLDIB.9LJNBJR-QOFSF7IKLKDKR.LOD@flex--wuhaotsh.bounces.google.com>)
 id 1l4BbN-00038b-55
 for qemu-trivial@nongnu.org; Mon, 25 Jan 2021 18:48:59 -0500
Received: by mail-pl1-x649.google.com with SMTP id 98so8589372pla.12
 for <qemu-trivial@nongnu.org>; Mon, 25 Jan 2021 15:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=I+jzqQbXvQgWEuHn+S1cGshEJkxZZv/tRlV4YBUAhVY=;
 b=mRCTh8N3GYdCOaCaGlFqMFUkJp0rJ0i4BEUeKzpQ9hW1vK8AcNT6ij0J4irEMjEZCJ
 5OnxJb4TbhFrboNDKEKYjKt9fV9NXN9dXUfEO9nNVGvrQF14SRBaQOby/0GMs1NyZ9Zg
 Njr0zji/DBdO2OlHsbc5ZZm6W6Xx5bjuxsF8f92NjBhPMGoAqxgmqm7ah9UQ0ghxHBH9
 56S+JOH6KhFVlcvUiFGPT9T9MU+xzYYxDQkgRudf34NRoFy0skXb/CzQhjY6TLPfe+01
 hDsdhJ+mg35SNprl5yqHAS+g2TpEX7IlvJAigpSV+KxlBrfB5P7fTxrjOAt8rZW+FQvB
 MNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=I+jzqQbXvQgWEuHn+S1cGshEJkxZZv/tRlV4YBUAhVY=;
 b=K7TuEwiiEdPgTbfP8Ir/BqkN8rB6jTYfTibFusgvy91Qtbvy1UmnsrwIIxGd7XI7tc
 KhkfAcAXaHonAS4+AOc998YqhVBPSJoLqzYOJ8IF2rGM10ISlc8uqxuCFDBut3hoy69+
 qLxeXWaZ8jUpPc6n1/6zFybg7bSWtWSw77tKH/G0QidFj2yI+eGFGxwK2hpBVc9TzhPp
 nGIVMuXHAbvcneHOW4RetqBUHU3I1f+aN7r6EaJm8vx1D8iB+xaby1kgKEYNwa/RDX3V
 RpP98E93/RlZHbH5uvOdCsYhPEFT+gZ6AmIEvQfU0qrxpPtFXlk21LeKpTpHFuvOZgou
 bhgg==
X-Gm-Message-State: AOAM533iPwfspwUyOSp7FmjCS/0HnF+oX4wzTpluar/PxlS6BVA/sDqD
 y+jJfEStwzNTCWrBzppJ8CUk5TdvEeu51g==
X-Google-Smtp-Source: ABdhPJwCxBtjWpteiEJxI0dYDZjWQ7m1nZJzBi5EzLtJpn2EhrpC7Eacsrozx1WxSGDUTLbnLkB4YDowN4VNMA==
Sender: "wuhaotsh via sendgmr" <wuhaotsh@mimik.c.googlers.com>
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:b189:b029:dc:4102:4edf with SMTP
 id s9-20020a170902b189b02900dc41024edfmr3086577plr.80.1611618534131; Mon, 25
 Jan 2021 15:48:54 -0800 (PST)
Date: Mon, 25 Jan 2021 15:48:36 -0800
Message-Id: <20210125234836.607233-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH] hw/misc: Fix arith overflow in NPCM7XX PWM module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 wuhaotsh@google.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=35lgPYAgKDNsTRE7LQPEDLLDIB.9LJNBJR-QOFSF7IKLKDKR.LOD@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 25 Jan 2021 23:49:00 -0000

There's a potential arith overflow in npcm7xx_pwm_calculate_duty.
This patch fixes it.

Thanks Peter for finding this out.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm7xx_pwm.c          | 4 ++--
 tests/qtest/npcm7xx_pwm-test.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
index e99e3cc7ef..90b4f630a0 100644
--- a/hw/misc/npcm7xx_pwm.c
+++ b/hw/misc/npcm7xx_pwm.c
@@ -102,9 +102,9 @@ static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
         if (p->cnr == 0) {
             duty = 0;
         } else if (p->cmr >= p->cnr) {
-            duty = NPCM7XX_PWM_MAX_DUTY;
+            duty = (uint64_t)NPCM7XX_PWM_MAX_DUTY;
         } else {
-            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
+            duty = (uint64_t)NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
         }
     } else {
         duty = 0;
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index 63557d2c06..f55571b31d 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -280,7 +280,7 @@ static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
     } else if (cmr >= cnr) {
         duty = MAX_DUTY;
     } else {
-        duty = MAX_DUTY * (cmr + 1) / (cnr + 1);
+        duty = (uint64_t)MAX_DUTY * (cmr + 1) / (cnr + 1);
     }
 
     if (inverted) {
-- 
2.30.0.280.ga3ce27912f-goog


