Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onTgX-0005Wg-OF
	for mharc-qemu-trivial@gnu.org; Tue, 25 Oct 2022 19:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTgW-0005U4-F0
 for qemu-trivial@nongnu.org; Tue, 25 Oct 2022 19:50:16 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTgU-0002z4-Rp
 for qemu-trivial@nongnu.org; Tue, 25 Oct 2022 19:50:16 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 i5-20020a1c3b05000000b003cf47dcd316so299635wma.4
 for <qemu-trivial@nongnu.org>; Tue, 25 Oct 2022 16:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=83SXE8AE3IXPEXq0sb4zKw6WXURfWcnz2Ug5j96SE0k=;
 b=yXaYxH8FwywYwB75qCnMBhfGCd5FILaWtTqb117ghpk+Df6r+3ZORvJSKLBePcClFh
 uZmYRwDcdqVq6rtnsDuQwQsE73wLVaHKKXiKjp3UCRHWHD6Cfh0fm6BWpqqh1kuAdsZn
 m/lFMPlOHMIg9ip6sFEVlJISmEHPNgsyHlk+5Nz8XR/4k1y4uRFPjgYPyAmULAWkfpxf
 uDcGhG3QLlvU9U3BLdLn0QpO9k6COGCprNaSUQTECm77PtsbsuZ82GtfbedHylheSX/f
 YOIjNvslgdSPMNYSkolKWCJ1qzHp4HETAeAiaEqV/nJPPJl6dNtO9VB3c3zz9wRkZ9pZ
 OJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=83SXE8AE3IXPEXq0sb4zKw6WXURfWcnz2Ug5j96SE0k=;
 b=ZFZsoJUpQlOjf93f+DYpK6KkE7FNiK6VobOPchE77eMFwKS0aFLYCxg7D2Wnpxdv++
 x1kx2mAKvcCUhCbAr+aRPF3S4p7JH4EOSXA1bRLPU025UtdnJFCglvBSD9S7tH+1yG4C
 JxfbOA3BacrKGySLuDkI1SzQrbL396txD0r5Xs+03PriKMjmorjzIZtXCBsL+m1TUYaP
 oys1NqacuBCXWOOm1dnAYDRY/3tZG4KFlhi25VLRi5Cu6tNkFkcgU/31Q1iFfM4O6xmI
 1nPWzmjuvrZqtIo6LqB8ayRbNePPCORk2cYjb9k6Kd2PE6in1sPcByXSyRZluYlAYi/t
 KziQ==
X-Gm-Message-State: ACrzQf2ZXlerTdVBJYOhWTewwz4Ybxp79k+Nzt1fM42pdrCgyspImnP/
 LAEvN1nj6v8RKrva/Y5aN+CYaQ==
X-Google-Smtp-Source: AMsMyM55/nSwiHjEHNbkvqWITV1++7a2MRGEL63QQt612HugqiyEzh7TsTeEvp4rcx5iWN7va3wFbA==
X-Received: by 2002:a05:600c:42c6:b0:3c6:f27e:cac8 with SMTP id
 j6-20020a05600c42c600b003c6f27ecac8mr410140wme.175.1666741813559; 
 Tue, 25 Oct 2022 16:50:13 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r29-20020adfa15d000000b002365f326037sm4649107wrr.63.2022.10.25.16.50.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Oct 2022 16:50:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] target/m68k: Rename qregs.def -> qregs.h.inc
Date: Wed, 26 Oct 2022 01:50:04 +0200
Message-Id: <20221025235006.7215-2-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025235006.7215-1-philmd@linaro.org>
References: <20221025235006.7215-1-philmd@linaro.org>
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
X-List-Received-Date: Tue, 25 Oct 2022 23:50:16 -0000

We use the .h.inc extension to include C headers. To be consistent
with the rest of the codebase, rename the C headers using the .def
extension.

IDE/tools using our .editorconfig / .gitattributes will leverage
this consistency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/{qregs.def => qregs.h.inc} | 0
 target/m68k/translate.c                | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename target/m68k/{qregs.def => qregs.h.inc} (100%)

diff --git a/target/m68k/qregs.def b/target/m68k/qregs.h.inc
similarity index 100%
rename from target/m68k/qregs.def
rename to target/m68k/qregs.h.inc
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 9df17aa4b2..f018fa9eb0 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -39,7 +39,7 @@
 
 #define DEFO32(name, offset) static TCGv QREG_##name;
 #define DEFO64(name, offset) static TCGv_i64 QREG_##name;
-#include "qregs.def"
+#include "qregs.h.inc"
 #undef DEFO32
 #undef DEFO64
 
@@ -75,7 +75,7 @@ void m68k_tcg_init(void)
 #define DEFO64(name, offset) \
     QREG_##name = tcg_global_mem_new_i64(cpu_env, \
         offsetof(CPUM68KState, offset), #name);
-#include "qregs.def"
+#include "qregs.h.inc"
 #undef DEFO32
 #undef DEFO64
 
-- 
2.37.3


