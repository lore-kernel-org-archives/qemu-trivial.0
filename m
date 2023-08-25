Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qZZqR-00067f-Or
	for mharc-qemu-trivial@gnu.org; Fri, 25 Aug 2023 12:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam.morgan44@gmail.com>)
 id 1qZYf9-0005eU-9x
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 11:23:51 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sam.morgan44@gmail.com>)
 id 1qZYf7-0006lL-7y
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 11:23:51 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-58e6c05f529so13057217b3.3
 for <qemu-trivial@nongnu.org>; Fri, 25 Aug 2023 08:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692977027; x=1693581827;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JWxKtY9Y/BfbN+iSotpxkpFphtD54WK54TW1AXtdcFc=;
 b=ZKmLDFFAsqHJ4+/v3+1Hqoj5gyT6pAu1BgbWBWzw3mlYsqlFjDzNmkimP5Y9nN9ZMg
 qzlm8aGEKC9WRasBhxMDGreYjftV3+QNVxyjlYNKRFkBL9OdbXS874SAlVK1Fzcqr/yK
 mEUSjaHKLSWEd2Ch2xKl85D1iWSNdoKJ6GPyKHep63tt7nrD5vIY54geu7W1ZoPcfkWd
 ZR/7QIGrRZdjgwJbkeetTDeEsUQDvAk4fmS1giRIK1aq6uGcPXPUu+2TrrC4Gu4NpkjF
 0GNoiuF7PtTq3emfaDKNnZcjqa6tc5XywB7+VNEpG/CKs7XRXXB2nJykp0oXGH6YNLvy
 HG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692977027; x=1693581827;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JWxKtY9Y/BfbN+iSotpxkpFphtD54WK54TW1AXtdcFc=;
 b=hXmyG5V134EuOPm0dcq2wMIT3O1ACdxkG9wqi1oHpuDvY7+68RH+e2Y1HAvmWKnCkU
 0UWzJDWmu9bQzWffEhhAv9IX7gJiot1YFveaLle0bZvO4p+7fyj1JY8N02/cZ+pCj4GW
 NdEHXvMpdU5x2XmAimf8s+bXGSPTgs6mTHeu86amDW2YOZKuMIUSVdeHGdpRAC2wsofP
 xWPpF7qKoYI0WmbHa2d4JR/Fj3xZPFruxuzonaEwrfSHNxAlYZuni2nMnT+Jn/qH42XO
 lgJCjnspEEcRRxRNLGIrfYipmGaTwR/LfBoGmEiKmWodb5zGX7h024iHAHV9TX/AxYxB
 lhcw==
X-Gm-Message-State: AOJu0Yywrfpd/XySE/xt8dVkVf04qKaWMGOT0v+OJBjRPKB00b90SW/m
 NyU/0qZ9/gdKoJNt0KKktPoihGVYzrg+IQ==
X-Google-Smtp-Source: AGHT+IE7O0nV2orL0WpoY8maLZacu+HTNOqzWRRAHfBRMLAMNOctzwv0+M78VfzKShaJpEC5zcI/DQ==
X-Received: by 2002:a05:690c:3384:b0:592:8b9d:e826 with SMTP id
 fl4-20020a05690c338400b005928b9de826mr5338642ywb.35.1692977026994; 
 Fri, 25 Aug 2023 08:23:46 -0700 (PDT)
Received: from localhost.localdomain
 (204-144-196-170.cgn.imoncommunications.net. [204.144.196.170])
 by smtp.gmail.com with ESMTPSA id
 fj3-20020a05690c330300b005925d7b62e0sm535883ywb.24.2023.08.25.08.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 08:23:46 -0700 (PDT)
From: sam.morgan44@gmail.com
To: qemu-trivial@nongnu.org
Cc: Sam Morgan <sam.morgan44@gmail.com>
Subject: [PATCH 1/1] Fix addressing with ramp registers
Date: Fri, 25 Aug 2023 10:23:42 -0500
Message-Id: <20230825152342.1470-1-sam.morgan44@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=sam.morgan44@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Aug 2023 12:39:33 -0400
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
X-List-Received-Date: Fri, 25 Aug 2023 15:23:51 -0000

From: Sam Morgan <sam.morgan44@gmail.com>

Signed-off-by: Sam Morgan <sam.morgan44@gmail.com>
---
 target/avr/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index ef2edd7415..b1c4bb17a1 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1459,8 +1459,10 @@ static void gen_set_zaddr(TCGv addr)
 static TCGv gen_get_addr(TCGv H, TCGv M, TCGv L)
 {
     TCGv addr = tcg_temp_new_i32();
+    TCGv shifted_H = tcg_temp_new_i32();
 
-    tcg_gen_deposit_tl(addr, M, H, 8, 8);
+    tcg_gen_shri_tl(shifted_H, H, 16);
+    tcg_gen_deposit_tl(addr, M, shifted_H, 8, 8);
     tcg_gen_deposit_tl(addr, L, addr, 8, 16);
 
     return addr;
-- 
2.25.1


