Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jjLcU-00023D-AE
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jun 2020 07:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjLcS-00020B-Sg; Thu, 11 Jun 2020 07:43:40 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54491)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjLcR-0001ra-Sq; Thu, 11 Jun 2020 07:43:40 -0400
Received: by mail-wm1-x341.google.com with SMTP id g10so4676195wmh.4;
 Thu, 11 Jun 2020 04:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fCWXr6zHNQbQPJ8BLLwrAx76MymcZFD1NlfKOZXdkr4=;
 b=UOiu10D4aSgaDFRlMJNytYn/Q7gzW+vFYxQlQYgo7S/b3+dKgXavuBn+ayrHJ1Raxc
 ar1whJ832CHvBvtJJXum61KlUPzA2X6KW/ttA+ryRMFdWv5NdhxvTaXyG8yK+SM9Ow+O
 Lcw8jM7WNuvdKKbELsScO7U212WiJLo2K7biWJ4jxGS2PK2Vs1JfFuMnZpt9KDA/8CEh
 9YsJz2RnURDkIqBhQnTNz6OItAekH3OIl0TPL4TkyxrZ3zlsVL0KNNPMZ/etCRdZagKG
 C9cVsS6fIoP+7uUTGyBHWNwQ9lazUhD23AGoW8RNbXyMeHZCVyctJkArq0aK/kLZJ0/6
 7jNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fCWXr6zHNQbQPJ8BLLwrAx76MymcZFD1NlfKOZXdkr4=;
 b=C+ODsAENLL+TDcQpmo8HZy6IxQEA35IIyiD5PwLhfXm0sEoT8klBpTfp7sJB3elACe
 tu7gbL381cFTAc9WXdcD1mc1cZylK1Y4fcGELak4tReRECsSts6z15YIk4m0g/9ju1Xk
 KeBRVx/vsf7/SQ60rE5q+4SiBUKfn3lXZH9QIUpoLbTnkGZchfEFOkOFQkZfcvXfacIy
 hl9q2J64eOl6vpdkBjqGVkceGDjr95cv3w42GL3ow7Ox0QX/TPZR1WvDMWS/WA9RHdpm
 0Tw2KYfPRv0Ohg7iUmf3ICOtKV0F6DZLR3qFD3vaijbS/mGSBlWLAp+t/wX11UZFXNq2
 dGNg==
X-Gm-Message-State: AOAM5331LcOnVVGj7qJcmlwyogB0H2U2548M5wT3b+iu1Wd4us8GAE+V
 siDs59ARWwuHCmdScYL8U5iOVaAG
X-Google-Smtp-Source: ABdhPJzDPpyP/JzSSvCY6RWZY6JFqN54fAIRSfB5l6XFm8wGuoCaCDoMb8DsKq/sGimWoei4QDwt2Q==
X-Received: by 2002:a7b:c951:: with SMTP id i17mr7493918wml.44.1591875807714; 
 Thu, 11 Jun 2020 04:43:27 -0700 (PDT)
Received: from x1w.redhat.com (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id h29sm4832863wrc.78.2020.06.11.04.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:43:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Tokarev <mjt@tls.msk.ru>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 5/7] hw/timer/sh_timer: Remove unused 'qemu/timer.h' include
Date: Thu, 11 Jun 2020 13:43:15 +0200
Message-Id: <20200611114317.13044-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200611114317.13044-1-f4bug@amsat.org>
References: <20200611114317.13044-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
X-List-Received-Date: Thu, 11 Jun 2020 11:43:41 -0000

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


