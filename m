Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66Iv-0005WX-V2
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:38:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IU-0005I2-8y
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:57 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=38513
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IO-0003KI-Ip
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:50 -0500
Received: by mail-io1-xd2f.google.com with SMTP id u8so10106425iol.5
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SHR8E0XalFYH6WBW0i6lmI4bojXX/JfzdunUrlaEzCM=;
 b=zs6YvjhsYRmac1pPQEeIlTkGIBi6Ln/gKKeCMKE+fJenUQRc55n4hxwTON8AhIeg+e
 4szRuCKKMJY7MakX3+u7kWYxjbi7lBu/JFUfnvj4Ir52PsBySm+fY7Hchd4VYcChlv8C
 0HwzPbTFKbNAKMJEZOGlSIKFII06FpJvoONIWth+NImBf4wn5txxewaZrDKvWRpzFab4
 JvHv8wJfVRttyoOScReaeh8oygQ/Phv6bXrmr4P3q2D6SEIcktLy03nUOyzbgcc4m1o/
 +bWGEifnGsRwvMB8S9k7CfDQcYxuJG7Eeg021xdKxuVqbcCWaBRENW0tJYDB0nSlKKa0
 lwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHR8E0XalFYH6WBW0i6lmI4bojXX/JfzdunUrlaEzCM=;
 b=R8UqlaSRXL+DH27NFekoBhgkEdBlAknC4ycTXVskDaYlX5cM+aB1x11QpqsWzZRzLr
 Ak2NFGByzO/PHKSw5G7RVDj6FfwEnJQQEV7lNUH1oR9qiW+LcKaMc+ZhkYFGIM6vbhA6
 ZP2sblKry0GWKqFcOcuI7V1myTQqKJZFwbevuNXdbFTu8lmQJ0xEmni5Dyilxw981wDB
 vBOAdSDL4F8bnuun9REPLx7s9c5WxrW9szKvB9FHOIh7T2s0/JG8QxLNukllQtkHswUG
 7FIE4fGqY9n24bYByH9u2p0hYpqFd8owz6y8YeXnPpZvbfwKr+cpTm46g46XxGJzyht9
 ZWnQ==
X-Gm-Message-State: AOAM532m0FdxrMQQp9LXEKM/P2UcjXMrIu5Aqn5gOfz0G9vjMZsfDGq5
 j3ROg/C3NWOh6L42QQDcHtM5Kg==
X-Google-Smtp-Source: ABdhPJz3VdQbiO+mlpA20EkP/JGgrvwcbD1CLP0+8cHwhiacQ/LxLEoEX21+Xk0vfRBwfntrirf55A==
X-Received: by 2002:a5d:8244:: with SMTP id n4mr31879224ioo.27.1641627466710; 
 Fri, 07 Jan 2022 23:37:46 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:46 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 04/37] bsd-user/i386/target_arch_signal.h: Remove
 target_sigcontext
Date: Sat,  8 Jan 2022 00:37:04 -0700
Message-Id: <20220108073737.5959-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:00 -0000

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index a90750d602c..e262667bdab 100644
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
2.33.1


