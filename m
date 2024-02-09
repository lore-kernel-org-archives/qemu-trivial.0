Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rYSNG-0007BH-AG
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2024 10:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYSNE-0007Ae-70
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 10:01:04 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYSN9-0000Te-Vn
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 10:01:03 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33b65b2e43eso434776f8f.1
 for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2024 07:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707490856; x=1708095656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3TQbFIKBrA58mD0J5hzum2Y6ObE019XfQgAO3Dz+7uI=;
 b=kjKI7qaVXL1JNbHNVRAQkCcPs3zewIaMbjgu50hhgQh+put+XibSMyBMMYXma63Llf
 phB8+Dz7L4tk82yxpgps8DOy8uUyBVoSfaG7AA6jgxCTxNEUiVdYnF673Mo98KQul70g
 blOY7ytU4MoUh01rN6EkmynXdZ4xW35IVyQPd8lEyIL2BRPSSl1Py8hsls7Oav0A9M4P
 FtnTOk6gjBiob1wAtuk0eqJeygs1l30tvcR9lpvN0z1mi+dTs1J1/XIZ1iBh0i5p2pph
 QTfuC0sBAj8+g7J0SLqWp0zzUd/Y3zOiU60wL4bKuoiDcq3DgktliGbui3ThWfBAaWHq
 sLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707490856; x=1708095656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3TQbFIKBrA58mD0J5hzum2Y6ObE019XfQgAO3Dz+7uI=;
 b=G9MGbvcJkRjOsBMeL4hcIBXtOUrlovxCLLf0W9qbxld3tyloiosCY8DPBYx37M1rOU
 R21rySiZPJuZVpHywfIifprCxBx7U8TTAFX05AK8njZHjX5toFpejayfzsv671W6D25L
 2HMfv5Tm0FOvRKRXt7aPAVfXbpxfwWUD6CuCD1AyhVVB0n2gNFQNGHBRTQx3ZfXOvFIK
 sqLnbGoBc2GMRi9JX4FW3snLlAaucrpfOjYPknHch/x/tBcrK7YvTkxhL7OB7v/vEyY1
 HGOpYRB27gj6lVYcA9uxd5ng9jRTgOrmh43JrXG0+EBgb4rMUrKUYcOxOnbnLhbzWf+C
 3VgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Xh4IyqNZp/OQDA+5GHihgdbX2CkYQf2+/ju/zQbaeuEj6NACr6fEu1+IWMgh6dXnrmAE9zC6um4XYFAzAnysRphWvgIWNw==
X-Gm-Message-State: AOJu0Yz/hMczHqHfVW3iY5r2cLsxfEW1VS3TWIJxtaV5AKGtasnA5Afq
 N0D3aLa7jfAmJgqutbiQ+bxkXbaei4PloKzTgJQ0Ls4FMFGHh5T7Oqb0d5La4zY=
X-Google-Smtp-Source: AGHT+IGE58hrzoM/BZ0wVkojqhV/OprqYysCPEfJbvzcAe0ru/emhwlayDk4ZDK3F2FhAbhLRNfTaw==
X-Received: by 2002:adf:f6c7:0:b0:33b:183f:b194 with SMTP id
 y7-20020adff6c7000000b0033b183fb194mr1189391wrp.38.1707490856084; 
 Fri, 09 Feb 2024 07:00:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUEzHFdSgcsL5aUNJ6sEx57bh/NWSrPJt5Us8drIzBkFyGf02PM9uTiFMRwfWyPvOlAfVUUMjn1efLbjDYCGY4rzHe31488bytV7qD9LINMG3Pts7kcH29DXCeWDBuqUsqk7N/gTv/7vpYiWszNwodbO3KKvhnuf6h8QikuKbaZ17XI0DLZ2/MNof5wHRXx98QHJEI62U7PJFs56ufLSNc9IAK3fbMsW6bTFf59KaH+7ASa4OFz3YTdBL+kPGIL3AlwolMsDA2bo5r5CsEaK9dUcOP1TSsMfw==
Received: from m1x-phil.lan ([176.187.218.105])
 by smtp.gmail.com with ESMTPSA id
 bw17-20020a0560001f9100b0033b3b878bf6sm2037509wrb.89.2024.02.09.07.00.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Feb 2024 07:00:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Subject: [PATCH 2/3] monitor/target: Include missing 'exec/memory.h' header
Date: Fri,  9 Feb 2024 16:00:38 +0100
Message-ID: <20240209150039.22211-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240209150039.22211-1-philmd@linaro.org>
References: <20240209150039.22211-1-philmd@linaro.org>
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
X-List-Received-Date: Fri, 09 Feb 2024 15:01:04 -0000

Include "exec/memory.h" in order to avoid:

  monitor/hmp-cmds-target.c:263:10: error: call to undeclared function 'memory_region_is_ram';
  ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      if (!memory_region_is_ram(mrs.mr) && !memory_region_is_romd(mrs.mr)) {
           ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 monitor/hmp-cmds-target.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/monitor/hmp-cmds-target.c b/monitor/hmp-cmds-target.c
index d9fbcac08d..9338ae8440 100644
--- a/monitor/hmp-cmds-target.c
+++ b/monitor/hmp-cmds-target.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "disas/disas.h"
 #include "exec/address-spaces.h"
+#include "exec/memory.h"
 #include "monitor/hmp-target.h"
 #include "monitor/monitor-internal.h"
 #include "qapi/error.h"
-- 
2.41.0


