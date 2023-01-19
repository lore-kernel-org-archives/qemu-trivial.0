Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIS7n-0001AU-O9
	for mharc-qemu-trivial@gnu.org; Thu, 19 Jan 2023 05:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIS7l-00011h-PG
 for qemu-trivial@nongnu.org; Thu, 19 Jan 2023 05:26:25 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIS7k-0001J3-6Y
 for qemu-trivial@nongnu.org; Thu, 19 Jan 2023 05:26:25 -0500
Received: by mail-wm1-x335.google.com with SMTP id l8so1114012wms.3
 for <qemu-trivial@nongnu.org>; Thu, 19 Jan 2023 02:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4CbYIfUJATXUoU/wA0fH5piu4Xh5iRBL8FANLl50fgE=;
 b=hHwV2vMeyCKwYcpbVo67qdd2Mr8gDyLFkNxKs+xPz51MBXtIAukGSsl8xEvS1Q0M8s
 hyMVIh2xqIsYyURmDga9LHVIWoOn16YnEHFZ5Ezj6vjjCT9GTbM2kTggrNuy/Kq+jY6A
 d9/sWUXb47biG+zH/SQnbHcX1HQBlKZn8LvgAk4pqI4ea5V4HAGwvVzxLCB6HIsSZmNk
 YaNq3vJPWRLukQDfl+NAfmntz6Zh/qmv1IL2MkgOWnq4qWiYa4TLJuCLiDW8MdsZaJ5b
 KCUrgYcFrBv8XGevjGS0hS+XH+ZmI1oR/UKm7IA7S2YEJOxNUpDmR9OTgugpQ2XH7HIT
 9THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4CbYIfUJATXUoU/wA0fH5piu4Xh5iRBL8FANLl50fgE=;
 b=VM31jCDpMbRitN+V9d1f1GuCwfmM26wWiHsY7u/8ioRWa9aYDoupKauVXhQOC5KV71
 d8SS/+mHyEAUPFWxjojzVUuYbjdKoFY778lOuI8X7lKadzVjCtIFokoQ6npIMDglhgbE
 BqnuzGLPWDYdIVaBNDw+m1O1XpCHbmd1QeL/ZQtXoqZ5yw+JE+rT4WB3SHJr6Aj8J/jd
 slJp/1ng6p4fGJacM7pwHP1Q8tLWDF9GzxQm65IY8J1bInN52seDL/BzTfb3SdSUeYDN
 bhqr81JY7jq9H4ecTXlFzkaJRyCYjvS4jW+bafsO0PHXiIbPNCTD+mPYE5ImbCD6F+2A
 lI2Q==
X-Gm-Message-State: AFqh2kqNrWXcoUf8ItxzGQgs1uFU2b6WKUE9c0tghfcjNT1ALP6wej0h
 rGsTVDQgAs95Q/uztTuq/lCBUQ==
X-Google-Smtp-Source: AMrXdXtV75JT+SgBYm3c1QbWEFQ6jmSliIVcRl3zehLO7ZjTZrMXX6DfrVeaXAH7t7QIQLKb6FGnRQ==
X-Received: by 2002:a05:600c:1c27:b0:3db:12f2:7499 with SMTP id
 j39-20020a05600c1c2700b003db12f27499mr5404163wms.40.1674123982684; 
 Thu, 19 Jan 2023 02:26:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a05600c21c200b003d9b89a39b2sm4367993wmj.10.2023.01.19.02.26.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:26:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] MAINTAINERS: Cover RCU documentation
Date: Thu, 19 Jan 2023 11:26:20 +0100
Message-Id: <20230119102620.5669-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 10:26:26 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fe50d01e3..73e9cb33f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2812,6 +2812,8 @@ F: qapi/run-state.json
 Read, Copy, Update (RCU)
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
+F: docs/devel/lockcnt.txt
+F: docs/devel/rcu.txt
 F: include/qemu/rcu*.h
 F: tests/unit/rcutorture.c
 F: tests/unit/test-rcu-*.c
-- 
2.38.1


