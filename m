Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBhLL-0007QS-Ql
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2025 17:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLJ-0007PA-6F
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:49 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLH-0005Au-Lu
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:48 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-224100e9a5cso52054435ad.2
 for <qemu-trivial@nongnu.org>; Sun, 04 May 2025 14:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746395866; x=1747000666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=70eq9g6WHBoTjhXQzmX0KiM0KlARnQpKuNIYy55yJxM=;
 b=lcTyW13cMyMAJMDOaoejvAAXrLtOHiObyA4CWnphunjA4KwTBUaSEypQJa2TjJvf3s
 AV0caAfzni2BMTWA+HqVadLWtSTGlhmMC6nSNckRo1llm/Oi6GO6dQub9TmOtRWSf50Q
 eya3I00gY6GaxQrrHcki/opqDGWj/kzM9zcLmUZESnGaEjQAvRmFwsVgoJWabsZ3Ws9B
 SUXqgiYfzjB1ENoOjaAPK/9POcAemk1Ds2mTvwVISAsWaC53L6JDeYy2vgmURTrjFE8O
 8vdPXAo2PNlvC4Ns+Tu69oeDKWf2Bek+5WUkxbwT/bnev/aDXbfptB0LokYqovirZVGL
 bR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746395866; x=1747000666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=70eq9g6WHBoTjhXQzmX0KiM0KlARnQpKuNIYy55yJxM=;
 b=eGc+C2DTqrcK/YOZ7I5BNNa76hzNRRtVVX0TugkrpFJ4+bPi2JTgY4CTo+uXZZRf07
 JYkfsey3uo4B7OST5FXK1yce34c7RXqsyBFseZHuYFLuAhIhJfoVIf545uh8TTkY5r0c
 Y2Zs4L7Yew7LX7WiLpNFn6Wv4jwzGJgsj6KB9tJpYwa5shE/tEMTLuR4/BxbkaWga8k0
 TgTAtzHfHD4aZ8SejXdrwFE+dj/WAzb2fcYb5HqunbWxFJWuEHJxweVkrxHK1m65yIh3
 DiFjJDuqxnC89vL3u+RLE8VqAMeiqLDRQCY7zmFgd6wDlhNrcFA77EJSHIhYHdHjl8HT
 WtQg==
X-Gm-Message-State: AOJu0YwhLElljK8WIDBnC79jXUgf4U0mJ6SYeiZywhqq5kIsFyT4W3MU
 lIJ92mzBAQIKTuY7TvpKUurN+LaciojmRWOqioKwoqnVOOw9MLAswQVHWPWluxc8GPGi/zNC+VL
 XT/w=
X-Gm-Gg: ASbGncumenki5vqJmvPnq4BG7+R50hA1ljqyvL9xklpS3JBv6xYpa0lrYMYO8kqZEqE
 WAEKzyNyLOY1UZ8cmjrSj5kxvVKRSRUKqvSw60fIDeBKwXA2k+PrxI8KYjBH8lof1bafmHJCxk2
 WdLiGSr1pJZijbUsitNyfA3xUdbzO4ZcjF2TKDyK24AFRSyOUE1fitzqBlVZrwEB37alkFgEVcb
 +EOh0EvITKwpiyCa2x2FBVo/iKllF1NnJohzKvMi5lBtU25KFGyeldUmPnotEPz4d+Rmafb9xz/
 4/iFSfim/b0FibbzseABVu0g2xvtLXKrV/NMe/u5JnTcoK2d
X-Google-Smtp-Source: AGHT+IH8qtHtLj8WpGKYcYxJcW8v5JenW5jMtdxO9YS6Ha1A7cnpPdznd6vRtZLIj+Z+zaK9MBxQyQ==
X-Received: by 2002:a17:903:2f07:b0:21a:8300:b9d5 with SMTP id
 d9443c01a7336-22e1e918571mr73488125ad.23.1746395866010; 
 Sun, 04 May 2025 14:57:46 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152204fesm41664875ad.137.2025.05.04.14.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 14:57:45 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org,
 gustavo.romero@linaro.org
Subject: [PATCH] hw/isa/ich9: Remove stray empty comment
Date: Sun,  4 May 2025 21:56:31 +0000
Message-Id: <20250504215639.54860-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Sun, 04 May 2025 21:57:49 -0000

Remove stray empty comment in IRQ routing function.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/isa/lpc_ich9.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 71afb45b63..304dffac32 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -182,7 +182,6 @@ static uint64_t ich9_cc_read(void *opaque, hwaddr addr,
 }
 
 /* IRQ routing */
-/* */
 static void ich9_lpc_rout(uint8_t pirq_rout, int *pic_irq, int *pic_dis)
 {
     *pic_irq = pirq_rout & ICH9_LPC_PIRQ_ROUT_MASK;
-- 
2.34.1


