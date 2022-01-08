Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66J3-0005i2-Lg
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:38:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0005JX-Mm
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:02 -0500
Received: from [2607:f8b0:4864:20::136] (port=36724
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IW-0003M8-2H
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:59 -0500
Received: by mail-il1-x136.google.com with SMTP id v10so6497254ilj.3
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0CqTPJq/tJ7F8T2WyiTYooNJL76c+e8K9lgdH6FKRTc=;
 b=maDlcgx3gK9QtAq4NoQzdvaKSSaESa5JHzqDKyP6Hs/5mbLOhLrNp5MQ9M/Ikhy0Cp
 rZGNx8Mfr1NdGKxIDXrbHFtfY9So2QBnUFz6tRgQypLGv/rkZQ09xTfbWrGZxdtfql21
 snf4APVrGKASFyb6BXRyS1lBldRj4D5T1cAAZLd/VsTmYHIcRhOW8pJ8JZX6oeJWnHdR
 s1/aqAr/woRZlDPdFju67zPhFekt91tsRThFLkAA+d5hIMsSHTCDmrOa4YdVvgehsTJQ
 BKWdARQ8AgLQmUKKo7NMSYtaOxWaZJ3Shl52zKS1lB1ZhrSBs9qjGP4OmEAat7pnzEQG
 J3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0CqTPJq/tJ7F8T2WyiTYooNJL76c+e8K9lgdH6FKRTc=;
 b=dmkkilEBaaVMsSfnRwrj7s1BOaFmTnmrWxWHYViyBhM34RfmncJE268fmFw96U1A+U
 oW2JLA05oyaNA2YgyNq7BjHJD8kKvMiow7MnGG3UGN5XP9/ii605EEIVJDJyr3iL8Vzc
 9oz3/K8GbbX6qSZepYYdxOTrW285qwzt99E2Wc9+wemYGoN4uKi8k+Z87nIibZjGVrMU
 e257ceeGEYjgE5DZfmgUXUybL+UGq8H6TmYKzlTykoJUAEAXVij1QBHOSCyNeSt+Jz6I
 GvNTVbnrAkphNrkCv2SSDQH1TYn2FaIhwKQ5Zfqz9Y6mhj5qetqz0l2+hWEbX6fMpHv5
 rtWg==
X-Gm-Message-State: AOAM530bWdBLrA5WVf6UR4QhWxgZwdQ+UNQAryGgnAY6NzFf/XjQlbo1
 Tv8xeLv8NVwlpm5gjE0adHrx40UiwgJnZUy8
X-Google-Smtp-Source: ABdhPJwEy8K6ONN12zBymJqdUNNyA/mEjSQ+LRlFIdOYIAywhJ3kFJ9VX09WRRut7308JkECKA49OA==
X-Received: by 2002:a05:6e02:1033:: with SMTP id
 o19mr32312874ilj.267.1641627474334; 
 Fri, 07 Jan 2022 23:37:54 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:54 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 12/37] bsd-user/target_os_signal.h: Move signal prototypes to
 target_os_ucontext.h
Date: Sat,  8 Jan 2022 00:37:12 -0700
Message-Id: <20220108073737.5959-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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

Switch to the CPUArchState typedef and move target-provided prototypes
to target_os_ucontext.h.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_ucontext.h | 11 +++++++++++
 bsd-user/i386/target_arch_signal.h    |  9 ---------
 bsd-user/x86_64/target_arch_signal.h  |  9 ---------
 3 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/bsd-user/freebsd/target_os_ucontext.h b/bsd-user/freebsd/target_os_ucontext.h
index 1d0c3c4e651..dd61aec7cce 100644
--- a/bsd-user/freebsd/target_os_ucontext.h
+++ b/bsd-user/freebsd/target_os_ucontext.h
@@ -32,4 +32,15 @@ G_STATIC_ASSERT(TARGET_MCONTEXT_SIZE == sizeof(target_mcontext_t));
 G_STATIC_ASSERT(TARGET_UCONTEXT_SIZE == sizeof(target_ucontext_t));
 #endif /* TARGET_MCONTEXT_SIZE */
 
+struct target_sigframe;
+
+abi_long set_sigtramp_args(CPUArchState *env, int sig,
+                           struct target_sigframe *frame,
+                           abi_ulong frame_addr,
+                           struct target_sigaction *ka);
+abi_long get_mcontext(CPUArchState *regs, target_mcontext_t *mcp, int flags);
+abi_long set_mcontext(CPUArchState *regs, target_mcontext_t *mcp, int srflag);
+abi_long get_ucontext_sigreturn(CPUArchState *regs, abi_ulong target_sf,
+                                abi_ulong *target_uc);
+
 #endif /* TARGET_OS_UCONTEXT_H */
diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index 982c7035c75..279dadc22c7 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -88,13 +88,4 @@ struct target_sigframe {
     uint32_t    __spare__[2];
 };
 
-abi_long set_sigtramp_args(CPUX86State *env, int sig,
-                           struct target_sigframe *frame,
-                           abi_ulong frame_addr,
-                           struct target_sigaction *ka);
-abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int flags);
-abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int srflag);
-abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
-                                abi_ulong *target_uc);
-
 #endif /* TARGET_ARCH_SIGNAL_H */
diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index b39b70466ef..b4a0ebf2bd5 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -96,13 +96,4 @@ struct target_sigframe {
     uint32_t    __spare__[2];
 };
 
-abi_long set_sigtramp_args(CPUX86State *env, int sig,
-                           struct target_sigframe *frame,
-                           abi_ulong frame_addr,
-                           struct target_sigaction *ka);
-abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int flags);
-abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int srflag);
-abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
-                                abi_ulong *target_uc);
-
 #endif /* !TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.1


