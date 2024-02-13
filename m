Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZrW4-0007Pe-HC
	for mharc-qemu-trivial@gnu.org; Tue, 13 Feb 2024 07:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZrUL-0005Qw-PB
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 07:02:24 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZrUC-00016W-4c
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 07:02:06 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33cd57b7eabso351906f8f.2
 for <qemu-trivial@nongnu.org>; Tue, 13 Feb 2024 04:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707825722; x=1708430522; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URWCcZelwghQnfWxClC3fdOHYZqhuz4D09m5EBaU2Y0=;
 b=nvkG3L+QIISU3vsWPbtSiUZY1QS1tgQIL4B+kQZJcuzci5bMsL4lLLTkg4nyXvoV6x
 QYwBmTWHqwkBc9ckeAF9p2qVkjRSvRJgHgN0SQPurBTK73TrzJA3xUmP0uzBTxvR6Ax8
 gFi7Dh/2i7VNLIR8+isRWdpEUJtF1/w3oXAFvqUQE5toHV/pVdeQ2a8tYgOfihbsGFaM
 z2tXCJpl316ztukpnGzE9ZgtGTDlt3wJkvugZKxk/jZl4z3USz5klJOiWwjUB/F6oIUd
 6AxZZpX4PRHzEKRxC03O7LXwOcUuMcZ00knUx6Nh79S1YE2XA0kHFfbbFTm6NaqCXmAp
 XULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707825722; x=1708430522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URWCcZelwghQnfWxClC3fdOHYZqhuz4D09m5EBaU2Y0=;
 b=ktXTH0FZogPyxOrVRBtwi9X6cNgeSJGwxT8QXqFgdCB+XU8bPjuglBAWrAS8UMh4lX
 ltTY6kUgXP/oHzAZqkV1qmStdFN/MTXD3km1JApUnZiaH3Xjg91XBVeb09oXNpflaqZu
 ffh5aMSScGg7O20Evvgy27CYFq8ASV5YWSCIyaT65sFsp4im8+AZIGz74Y2H3wBOAS2v
 O3cEeWlsXZBkma5MW96fEwahshju8a6sVSMkdiq/Hcd2Dlw1WjnKhhOqFLqj76dN8o0w
 cx+oPxAPn/n/ISGsZxRyOFgvvFQYzCjecku4BaLUVp4qGUQfQb7mO0kGqcGUkFx0X9aN
 lzHQ==
X-Gm-Message-State: AOJu0YzuXnf2K/WiKc97bxpKy7uFnbTKbh8o8i8t7IcDWFsRkUMzeQgK
 Sx+vHL38vhfn9IkP5bk52XyW439vgQnllcUUkl1PP1p5twF5rZdL/hK8gAX1jq0=
X-Google-Smtp-Source: AGHT+IFBcIQsCryECxDeQiGV9eyJexKjlZYijw8go/anuC35ucjcIWQtOlbMH7CWAwWkkNcHNV3ZKw==
X-Received: by 2002:adf:e6c9:0:b0:33b:136a:95a3 with SMTP id
 y9-20020adfe6c9000000b0033b136a95a3mr5609270wrm.28.1707825722071; 
 Tue, 13 Feb 2024 04:02:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXbkIZh6v+HCmpi5EqEkJ4qcPlvBQ+Rs3VISy+9MCtlJcac5fq/U7utL/DUwjfg88aCf2IvuKpveB1wwHbWjR1bHsv1aQ09lKlY7tc3z1XTKUFjiwK6/WUFXCwb669LCmDAVPgX8hd8JW0EnVSzh/YiNzQxZWK2Y3llzfyvEkPsyjJkxDpj4DPJsaAvMrSFAg79Uo0kpypaPjYIAHV5W+AcuWsPyvHMgU+g5S0Vpwf5HS+vytXbqiAaAoIog1aRqOdUA3FGDcRcHlybMiSwPd9oXCOb+meozxMwfe81AhtHOCAjNJwenx7RKXaXEFw64VA16ZkHxXI=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 bs25-20020a056000071900b0033b45bdb2a1sm9556186wrb.4.2024.02.13.04.02.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 04:02:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/7] target/i386/monitor: Remove unused 'hw/i386/pc.h' header
Date: Tue, 13 Feb 2024 13:01:46 +0100
Message-ID: <20240213120153.90930-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213120153.90930-1-philmd@linaro.org>
References: <20240213120153.90930-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Tue, 13 Feb 2024 12:02:44 -0000
X-List-Received-Date: Tue, 13 Feb 2024 12:02:44 -0000
X-List-Received-Date: Tue, 13 Feb 2024 12:02:44 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/monitor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 950ff9ccbc..3a281dab02 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -33,7 +33,6 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
-#include "hw/i386/pc.h"
 
 /* Perform linear address sign extension */
 static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
-- 
2.41.0


