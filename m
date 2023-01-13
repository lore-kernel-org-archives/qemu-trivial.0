Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGQFT-0003ZO-N5
	for mharc-qemu-trivial@gnu.org; Fri, 13 Jan 2023 15:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFQ-0003YQ-1z
 for qemu-trivial@nongnu.org; Fri, 13 Jan 2023 15:01:56 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFN-0006mY-RR
 for qemu-trivial@nongnu.org; Fri, 13 Jan 2023 15:01:55 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k8so7545100wrc.9
 for <qemu-trivial@nongnu.org>; Fri, 13 Jan 2023 12:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tt1mSx+5mpU6vHqq0Q13XSPghb0/iRRovVdL8d0eEs4=;
 b=Cn2mKzV6ctZxmYKSeDpjr1h/46sokNPZxnhqsyq9C4ZKQJZgtxB03U5xSMilrwXxVX
 E40iS+jhZ/l4JE/VQMeeL2pJ0eRed0kMVJ4m3KUUG5bxiVp3Z4nejh7Fx4l1bvkQwYDM
 aM3tc4wSGT9EZcdVFCl8C+0bP10TKBNmpwpdgEbHDp1QaBeMIis9VOZ4Eq+A+UNsIMcq
 wSHz3kXSfzcClpRU2nPSTHkEIAX0dL3Ofxo2OtvhyPdJY+wCJY+sGlppNT97B0rmN7eB
 3GMk4U3PmZXWy+YsBo6fbqTd3KOw0txTdYnMsZ7NzLH4+7sEReKvZbqNrF7JXOwZZZbW
 AbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tt1mSx+5mpU6vHqq0Q13XSPghb0/iRRovVdL8d0eEs4=;
 b=lWSVL8akRI4Y6UC3nNNWkNRoMQcsifc/dMFZf5lpa/SEiqNc2VOEwxwfxG90dkdhPf
 TudeIYnkVzY/b6U+e0tBxdrL62hZpbD+9EkPScMzkZShyOVc0e6epqOKEXKdiXfcxkUN
 1LEZgiLcjYAv8rIEYGjm5zDfXBBxWSFvpVGnnFxlGmBYTVB0PHy356W6RUJFMuJ+uRnD
 2VfhbIjsKV3M7uCfBKTjlhkAzelz8kQj8UtY8gUZKOm+/VLyEQ1LKWgqewiuNll6IoCr
 RcLlWZWEmiG8g5atS1tfGdXP2FG0an6GdkGMeZi/ZcCyNJOBcjiG9CExsd7DJXeu8PYm
 joYg==
X-Gm-Message-State: AFqh2kpAzYoHBQ9HaZE2OJ8Gv9aCc5vCtiLexhrlVvL5qSNEcdeKJ6uW
 BfGXV+HfZ/QXMMfWsBR3InPhlQ==
X-Google-Smtp-Source: AMrXdXtTL6D44qTH0r/JeMhSbTQWTT6SDAl+BPXmv3UqNUxOACPqZFSiiTntWD2qbP94eQCGMNHM0Q==
X-Received: by 2002:adf:e181:0:b0:2b1:c393:cbe with SMTP id
 az1-20020adfe181000000b002b1c3930cbemr882252wrb.11.1673640112416; 
 Fri, 13 Jan 2023 12:01:52 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfe486000000b002423dc3b1a9sm19290078wrm.52.2023.01.13.12.01.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 12:01:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/4] hw/irq: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
Date: Fri, 13 Jan 2023 21:01:36 +0100
Message-Id: <20230113200138.52869-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113200138.52869-1-philmd@linaro.org>
References: <20230113200138.52869-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 20:01:56 -0000

QOM *DECLARE* macros expect a typedef as first argument,
not a structure. Replace 'struct IRQState' by 'IRQState'
to avoid when modifying the macros:

  ../hw/core/irq.c:29:1: error: declaration of anonymous struct must be a definition
  DECLARE_INSTANCE_CHECKER(struct IRQState, IRQ,
  ^

Use OBJECT_DECLARE_SIMPLE_TYPE instead of DECLARE_INSTANCE_CHECKER.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/core/irq.c b/hw/core/irq.c
index 3623f711fe..3f14e2dda7 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -26,8 +26,7 @@
 #include "hw/irq.h"
 #include "qom/object.h"
 
-DECLARE_INSTANCE_CHECKER(struct IRQState, IRQ,
-                         TYPE_IRQ)
+OBJECT_DECLARE_SIMPLE_TYPE(IRQState, IRQ)
 
 struct IRQState {
     Object parent_obj;
@@ -68,7 +67,7 @@ qemu_irq *qemu_allocate_irqs(qemu_irq_handler handler, void *opaque, int n)
 
 qemu_irq qemu_allocate_irq(qemu_irq_handler handler, void *opaque, int n)
 {
-    struct IRQState *irq;
+    IRQState *irq;
 
     irq = IRQ(object_new(TYPE_IRQ));
     irq->handler = handler;
@@ -94,7 +93,7 @@ void qemu_free_irq(qemu_irq irq)
 
 static void qemu_notirq(void *opaque, int line, int level)
 {
-    struct IRQState *irq = opaque;
+    IRQState *irq = opaque;
 
     irq->handler(irq->opaque, irq->n, !level);
 }
@@ -120,7 +119,7 @@ void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n)
 static const TypeInfo irq_type_info = {
    .name = TYPE_IRQ,
    .parent = TYPE_OBJECT,
-   .instance_size = sizeof(struct IRQState),
+   .instance_size = sizeof(IRQState),
 };
 
 static void irq_register_types(void)
-- 
2.38.1


