Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midO2-0007fR-R9
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO0-0007X5-Jb
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:36 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:45947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNz-000155-4q
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:36 -0400
Received: by mail-il1-x12e.google.com with SMTP id i12so6241124ila.12
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOISPYYKecMk71RBzznUZbzYo3FGryyldBKKzRc7muU=;
 b=RmX4rXtwf9HpYzI7pAKW6uKGnkTjS6QZi19qxbeat3XDkefgwndzBlTUg6OVQRSack
 5XIBs6ltcfJZ5mTR3+ZyK7Shf7Rt9rx7NdWKWig1r96shlem4TR3SdVukge6BHTHuEgc
 10u4JjVovdXM0oprQqSMDTNmTgnyuTJOoQyXp3XDHp7Zv35Ar1f7xWC0GZCvGFtIQ1+W
 01zbWSScHYhD+iladHA+UFu9vOE5+tmrNZJ2sFqdXKefVZMtsVBH6FaCG3ayLMO3aJxp
 K+Y5V2rD73jP2hkmEp6Sxvuc4bCCwmLpB7OfKR6X5VQTOlLmY2CAFtCLgn+vZiet/Asn
 qe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rOISPYYKecMk71RBzznUZbzYo3FGryyldBKKzRc7muU=;
 b=i74+7ylOUVHbkSKkBhNTGRE94WihSP0vWtS6dypxU+dgPuSVHaEJZ2xBzuO0H6EH7n
 Dut+yBmmnG0hEFDKlO1y2LNKEGd3BeUGOcMaxCtumDEKJ1Kk9oLkMFkxFjIE6Bw7+2Un
 u58w+I+Knt+237HlEQPKkcje4K7V8w/TFpci+LItaiblv0g9Em+FD9wFMhhR8f2+LhEs
 RzBD3zZTXxpb0imy9CaXr1vxlGPYu27RO25cbyqgqQDlzgkcwjFED9HiWjaYE8DIRaV2
 MLkQDM4XnEY4i9AxqKkiSv9i/b/BYrJ8fzWnL69Z+nqaFWf2+AZM8Ggou1mbdm0E+2tv
 TIbg==
X-Gm-Message-State: AOAM533D+1dsGL7YwgvHyy5A36qf4MQKdHy+glZ46XD2q4POQDXwsV5M
 OH8uRhQjw+A3M6UOmaa6BIAObQ==
X-Google-Smtp-Source: ABdhPJyJezRcE9awRy5ndNfR9iWBrjO37dpxKar/MH70Zf7AH3o+XKRvfuAEUyXZRsbbNP91C258qg==
X-Received: by 2002:a92:c051:: with SMTP id o17mr35672421ilf.276.1636034794151; 
 Thu, 04 Nov 2021 07:06:34 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:33 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 26/29] bsd-user/i386/target_arch_signal.h: Remove
 target_sigcontext
Date: Thu,  4 Nov 2021 08:05:33 -0600
Message-Id: <20211104140536.42573-27-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:37 -0000

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


