Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmD-00056u-MM
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplw-0004RP-AJ
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:08 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:39702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplt-00048s-IC
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:07 -0400
Received: by mail-il1-x133.google.com with SMTP id x9so8252991ilu.6
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=unoUheHOiBFwRIZBJ0G39ayIeTidxh9oy5cQLMJnocc=;
 b=FZHA2ydaGrPN3uvp9MS4CP459nkzM7FyZfrZxd8J5kMBFFaM8q+y3K4yNf4bzG11pa
 sq7AGdfLWFqb3VVzIlp1EQkQpt+u4nCdP0WNnjaUBEwksXQ22mfhALvfnGepbPFN8s9J
 Gguf5S3RyeKhy3pGzTmEFr4J25Pdn3MDYIRQQ2niDorjJ2ihb2RiDbn/+V4JpjoiF130
 im4cb1yWGhhsZvZ7bACW9OZL+Kc/7c6KHofgnKakFd2xdpQ2c1VGRMzncSLZssH71Fg3
 5TIHFx/XHZLaqUsap5PxUelJB8af7thQNbiNeUAjP3iBcTQGpzrO/CKqLIaKp2gompUD
 9/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=unoUheHOiBFwRIZBJ0G39ayIeTidxh9oy5cQLMJnocc=;
 b=CEOpYrq06S3zUY2Mf5NEfXmtYquW12sJ0yLinsc1OIifDBrWCRTeBdPVwYR3s+G7lm
 7vFmgLMwKfA0JRGYgcfG/Mbwsa8GDWzk8C7F91zLPIQKs6Ic412GDpyQ8OuCOuQC43FE
 SRaqXl75E8TXmsFhOWDAyoaiiuj9Sxrz9ia1DWkqgQsbkq/74N/Wk5R5RDkz2BcG52is
 JErzbSzpjA+nOuCHsh9M9R9RnO60PBQVQ/P4epJCJpA3YwQ+HthujW1r5oSNttnW962F
 bfIjAjD30xhyMwAdF+TVndui3Oe27/P4abJJlCV9gNiO38c67K5/d5J1QuaQPgFpE69F
 TzQQ==
X-Gm-Message-State: AOAM533J9Uh5aaZ6m/frkXJP5Mo09HqlpVVMnmb1sUlnfpknrv0MU8mK
 7mxNjNznSUDV1lPCWZrp0vEhVw==
X-Google-Smtp-Source: ABdhPJzUBkl5yF0iSOArViaO+vDlCr3FUAiBch59YqVTaaw3Q5LMZUzIMuTFrXu7shtaWgWMJuP0EA==
X-Received: by 2002:a05:6e02:1a21:: with SMTP id
 g1mr10569735ile.153.1636082404650; 
 Thu, 04 Nov 2021 20:20:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:04 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 18/36] bsd-user/arm/target_arch_cpu.h: Implement trivial
 EXCP exceptions
Date: Thu,  4 Nov 2021 21:18:59 -0600
Message-Id: <20211105031917.87837-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:10 -0000

Implement EXCP_UDEF, EXCP_DEBUG, EXCP_INTERRUPT, EXCP_ATOMIC and
EXCP_YIELD. The first two generate a signal to the emulated
binary. EXCP_ATOMIC handles atomic operations. The remainder are fancy
nops.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 2484bdc2f7..9f9b380b13 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -48,6 +48,39 @@ static inline void target_cpu_loop(CPUARMState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
         switch (trapnr) {
+        case EXCP_UDEF:
+            {
+                /* See arm/arm/undefined.c undefinedinstruction(); */
+                info.si_addr = env->regs[15];
+
+                /* illegal instruction */
+                info.si_signo = TARGET_SIGILL;
+                info.si_errno = 0;
+                info.si_code = TARGET_ILL_ILLOPC;
+                queue_signal(env, info.si_signo, &info);
+
+                /* TODO: What about instruction emulation? */
+            }
+            break;
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
+        case EXCP_DEBUG:
+            {
+
+                info.si_signo = TARGET_SIGTRAP;
+                info.si_errno = 0;
+                info.si_code = TARGET_TRAP_BRKPT;
+                info.si_addr = env->exception.vaddress;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+        case EXCP_ATOMIC:
+            cpu_exec_step_atomic(cs);
+            break;
+        case EXCP_YIELD:
+            /* nothing to do here for user-mode, just resume guest code */
+            break;
         default:
             fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
                     trapnr);
-- 
2.33.0


