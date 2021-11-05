Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miplm-0004Kl-Us
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipli-0004Ga-3g
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:54 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:36675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplf-00043Q-Bf
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:53 -0400
Received: by mail-il1-x12a.google.com with SMTP id l8so8272333ilv.3
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOISPYYKecMk71RBzznUZbzYo3FGryyldBKKzRc7muU=;
 b=HsDjNmtOoFA6hBAH8rjKqis5saoGQ1Kk7UyzD0c8L2dKow0WG8ibimMhhexPMiGQDL
 UYNqXFbiz7QXWKpR6dz/rf40xqoJgKsnaJl4+iLIT5XX277VYCZTn378lS/xEX7JHxil
 +IbXyZQYVM0aVgPUtHMBKFa/MARhXlKCp6I3ykM/Q9eMYmh8cHZL2BLgllrv7xbmT+UP
 2qCu3kiKvsAwfKphNC73FXfW91fmcCfB3tASKzA0BrmX992aF1oUjIBxtU6mzkbs9S5X
 CBFTzyzUxdcMEDSjbu4C7QeN8DVxhrIOGBkYUTv8G5dVYaKGAtIsfWE9+BbftuJSbfBl
 UHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rOISPYYKecMk71RBzznUZbzYo3FGryyldBKKzRc7muU=;
 b=a9/fwnzlvK+3oaAEdE/99Q7UPfdw+1OQvUBS11ekTX6c4jKzuNkRqL3wC1PB3vtfy1
 +2b6b3IbF84jy0jVlhxgcbEBCMb1P3IhpXRzMFV+wOCKDeA6by2jmBAEEsjApI7MRM0j
 OHTD5jgIi9tzeKLCANfZCfGkNIm22OXWYz1fR8DjrFxYB6oVunAnH9I/Q9svyFdsIr/f
 ZUEUqswvJssRt3iKZlmPeMdtCg/4WWPNqvFne/w8XguDmJdzUC+maRvvMCsAsV6BZm1c
 tN4efNA/iDBd5E11le9jZleHCULSTVbW399pMZ2ig203A/SMSaYQx7yr9VUuUKcgKDAn
 YMDA==
X-Gm-Message-State: AOAM530o4xNke8lK7Y3BF9PoHrVRnjvDIra8Qoeksb4YcOkK5xi0XVry
 as1I5SyvQVHFMC9ZAvFypey1NQ==
X-Google-Smtp-Source: ABdhPJzVFhzWsOGkE7rfKs03PlXzdcfqK0dvnp7/2wm1iAaSeJCCt+j7QDp3NRC4/kE4jyvRvRrv6w==
X-Received: by 2002:a05:6e02:1ca9:: with SMTP id
 x9mr12340717ill.273.1636082390111; 
 Thu, 04 Nov 2021 20:19:50 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:49 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v4 04/36] bsd-user/i386/target_arch_signal.h: Remove
 target_sigcontext
Date: Thu,  4 Nov 2021 21:18:45 -0600
Message-Id: <20211105031917.87837-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 05 Nov 2021 03:19:56 -0000

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index a90750d602..e262667bda 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -27,10 +27,6 @@
 #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
-struct target_sigcontext {
-    /* to be added */
-};
-
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-- 
2.33.0


