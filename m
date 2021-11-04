Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midOE-0008Ad-NY
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midOD-00083C-1f
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:49 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO1-00016V-UC
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:48 -0400
Received: by mail-io1-xd36.google.com with SMTP id d70so6054946iof.7
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZNPpOkk6VPcljeu7Kbkpd5a4MaTSH5kT5BRcPYHMyg=;
 b=zhoQTsjivEs4/Afvof/7U5V2sMoO7bk2skxkaDGTxvBJIe3+vCn7GGMBD0knhd9aM9
 VbcxJHfNotdW+VcejNXjqiFcrE680cAyMAia4lDjg5PY+e+qMscAsUewltsZK0BVwgYy
 keUsdypTvBM/x+ABui0wffMro+hyT18p+6Fy0Dl5l8X0LrrO09xzqqczpPo8HKzmvIBU
 PGGPPFl5ehGviMramLO21rPCfqNRhgb9Gv4DejNJmCI63cKerF4M12lMQ+SJvchxeDqp
 Ii3zVSwYBKswgZft6CyWcOi3LBDQYqI14QQAjYOgynOY9NGyQgbA2WD91WtyHvR/PbHc
 wAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZNPpOkk6VPcljeu7Kbkpd5a4MaTSH5kT5BRcPYHMyg=;
 b=yr7HeYzrQLbgGWPET187YmTuHag3nZTntjE4Cv4VE5zrOBtTm1IGsYFhFTZ1qTcm7G
 6oRbDaj4r7ePDlE/Ulay2l5xB5X7ZmSaXTMwJxiRZGnJAjl7pPBZppxQnAnZeex0U0us
 oymyV+Zpy8zfouyclLkHaWyCrJxpet5Y5B4xTi5kTxpALAVzpPIFZdxb+2SDdv5jWyVY
 qDcmznOxXnsRGsoLA8uMU94H0T0D0Dyls5bIRjuQtCLPLD9yndi7oL98wWMf0EzbXl2K
 01aZXvXTqDGHPpYa400y+S+wqNw8bbsOjwNhW5Y7J4gYSHbWISs3rOp7n3XukIlRZbe9
 21qg==
X-Gm-Message-State: AOAM532VsDHqpdAv+gMBIbKTljZ0jwz9MfK2gmR7AjJ0dUjziPuWJGAu
 KkILFHTtJT98yswBL/1ZYkktxQ==
X-Google-Smtp-Source: ABdhPJwya05Z+S9mWZkbL5Z5WxNczRZiIgvrNqVOwI8zdtkyh61MIZRIorioA7cCubwc+WX3lXT86w==
X-Received: by 2002:a5d:9d85:: with SMTP id ay5mr26324871iob.203.1636034796892; 
 Thu, 04 Nov 2021 07:06:36 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:36 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 29/29] bsd-user/x86_64/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Thu,  4 Nov 2021 08:05:36 -0600
Message-Id: <20211104140536.42573-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:49 -0000

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 55f742b0a8..e84aff948c 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -30,14 +30,7 @@
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-typedef struct target_ucontext {
-    target_sigset_t   uc_sigmask;
-    target_mcontext_t uc_mcontext;
-    abi_ulong         uc_link;
-    target_stack_t    uc_stack;
-    int32_t           uc_flags;
-    int32_t         __spare__[4];
-} target_ucontext_t;
+#include "target_os_ucontext.h"
 
 struct target_sigframe {
     abi_ulong   sf_signum;
-- 
2.33.0


