Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66Jf-0005yp-55
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:39:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0005JU-Mk
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:02 -0500
Received: from [2607:f8b0:4864:20::132] (port=41905
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IU-0003LL-Ls
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:57 -0500
Received: by mail-il1-x132.google.com with SMTP id r16so4778311ile.8
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LuLB1GCaE27UYhebE8MEe7wQj0GNFAlmAIMZ+t4rYog=;
 b=rmhy6MmztDwLR6K8HP0DJCWbyWNsectKMkBk0Kce3mJPQVacAPxDXp+9EO1VwhTHGO
 9BfxfSj6EVAb/YIOKOpHZcT9vEx1MhTuBPba3CMh1cshNXWDOLpXTiDUhNRNSCKt5U5O
 6YO2E8EGiVvfUFaFnqwCF5yNW4eeRHz6FtOWvviBB9ctQfI7M5qHPx8RtCRu3UbYGiKk
 4T0cJ+goijz2eRFKVHfGr+Pe7JzEqruITUwrG4ZTPUlXq7S04GDQoKE2NxROflIKD9qF
 yTyBHWTR14N4iZ3yrmkMgc9SbrIatWX5R5kIiy8rEB/wxZPa8bJCSezfi7477+D7Q5h6
 5CmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LuLB1GCaE27UYhebE8MEe7wQj0GNFAlmAIMZ+t4rYog=;
 b=nWIlGfxls727/P+iYlmeW67y3f8uhRjTrRlm7zDUtv+U+GFREjoT24YVKegBtB2eaG
 kyP5d7ASx8y6XQXG+w9l89FtEKublWXOrWUchdqq/MMQUEVj4RnNimYEZK2ea2FUFqZH
 XMnnsPpgnMRgjTeBMZYwzumGyH2J1JatL51xtG2ry8lI8NBBDp9BQS66AuEEeuFggAnc
 00gXpZ3NNYyEVrPgmPDkL1EXAO2JSTHZ9o9/IY1xBiIiUAGJRMLfIfr7JbiQGfUo51AW
 Yga2KjusmPRipIlGRZD8MbXglnnU89jL9HwE8UY+JNYQLUWqYdYHWQZAR5OgQzVtnRFB
 olsg==
X-Gm-Message-State: AOAM531PtJ2RRAetNLNg6fZlgH0qP69FClcBXj9jvEUl1V1KpUuLrHYR
 1CxbA8ovCIGH/Q2FZ0/LtLTXAg==
X-Google-Smtp-Source: ABdhPJyMQxavm3Q1NeKZA9S3jAu0rcWPW/XqrTGGnKSJi4A5Q7rMttmvXjyOzDJR8H0/UZZYumOq7g==
X-Received: by 2002:a05:6e02:1c06:: with SMTP id
 l6mr1361840ilh.239.1641627471664; 
 Fri, 07 Jan 2022 23:37:51 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:51 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 09/37] bsd-user/x86_64/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Sat,  8 Jan 2022 00:37:09 -0700
Message-Id: <20220108073737.5959-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:12 -0000

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 55f742b0a8c..e84aff948c5 100644
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
2.33.1


