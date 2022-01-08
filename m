Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66J2-0005cz-3n
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:38:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ii-0005KN-MI
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:13 -0500
Received: from [2607:f8b0:4864:20::12e] (port=46861
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ie-0003Pn-5z
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:06 -0500
Received: by mail-il1-x12e.google.com with SMTP id e8so6449875ilm.13
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLTwIHEIl13GSbdWHtA7LCjVkj5LLcCAHprKI0xeB4I=;
 b=4lFcgypJReRH3+v5LQNNNcGKNixJ4XHsBqLakGEpSGXTwBOU+aKzEj2ylU2uVNUSMS
 0kEy0TgmrQogQE7exdxQCpECDfsJZnwYMUjdub22jb2o5eAI1yeyrlgwC2YukpQcOVNZ
 SBQTSN8GECMFEIiFrqER/fwWlbyzA2drQi7wF/82bbeY1MsQqoDPbGtUL3h4mBronWSL
 C5HjoUTWdWAoeizYy6pqkrZJqyJD0vyxmrSwLxVSGy5GfLoYOP22DK8oCUHhxryZa9XU
 zwDoBczo3WRi085/v7IyFBOmUOCsw1UCU1b3n8r2aFgHJe+q/0AuGnbdWvcO4vlCqqhb
 u0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLTwIHEIl13GSbdWHtA7LCjVkj5LLcCAHprKI0xeB4I=;
 b=gZQfEWukQCnIMxJ5dRiQ3YF3FmsLD9f6XS7G1gLt9K2s3shQtEFAlJNFQkVHaU4P/T
 3repNNdj48o7RE8QEhxY99W0N+lRBFPFW6vTBmT4ZK+cf9AiK+gRkJJwCFj3fcPBKTh+
 aX5ET00FwRtNbWGqmxu29oJ3AcbDxgYzBYtSzvXWmWzqFTR0VbDPop4Aq2QJbPnLxhuG
 6yl+Dm6PWFT2+tpKYVabkp/xyfSdzCLVdfABpY6P85v8+Gqm+ZHuLwyZ4kapgC+Ozjw/
 siEXuCgeQyVYmrFuCC2dxZVrSNnj+lPl3sM+yFPEGrPi/GeYWF357p0KS5wp84xgLyhI
 HLtQ==
X-Gm-Message-State: AOAM533+B13DGj+XtNg91fIrjLk14lgmnBdYnqByFchUjtB8Ry00zM5V
 3KFdt1cSJwkdmE1mB6xUkeoV1g==
X-Google-Smtp-Source: ABdhPJyroJ6d1NLPvLF+CdzcMJVJVohvG9kJpuKazDmwM3Bl4lyl8YlyfQITAjCtdKaoCrHvgACI1g==
X-Received: by 2002:a05:6e02:1569:: with SMTP id
 k9mr30182738ilu.290.1641627481369; 
 Fri, 07 Jan 2022 23:38:01 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:01 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 19/37] bsd-user/arm/target_arch_cpu.h: Implement trivial EXCP
 exceptions
Date: Sat,  8 Jan 2022 00:37:19 -0700
Message-Id: <20220108073737.5959-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:16 -0000

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
index 2484bdc2f7a..9f9b380b137 100644
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
2.33.1


