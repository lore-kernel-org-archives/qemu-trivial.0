Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2ev-00072M-E3
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2er-0006mE-Mn
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:33 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2eo-0002nd-A7
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:33 -0400
Received: by mail-io1-xd33.google.com with SMTP id 62so605902iou.2
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WEtSw0e1OoCnEPOeKTHBUWYo/YNsC3SH2hpvIjNKUwM=;
 b=c9K9kR0DBh00Ziq7FGrFBpcwY4hv83ucZrutu7YbnC/iFbixEX9uOGwYuaZ/1hQGCG
 dTKWaFMavW9uAw2PXYCVM6sV2Tp6VrfQ3PSp2+neWoyFDBfVHr2mYhyZBZBfAhYdEmao
 kiP7HcpV5IEyv76EWD8PZ3blccX9+INx7RTUy01HNldU8BkEnldx63vox6WDMyZrYEJb
 0UK5/Rv4kmw9G5QEqKc9ycprjB4LY5Dq2g3XWdV5xu13FjdDzawHWWLouWgen/m8yFV9
 /+zom4YKaUqgJWzJCtyQEJBvDbBB+dtYorKBDsipU85QkdRBk0NQKpjfYkmRECJdc0tB
 d4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WEtSw0e1OoCnEPOeKTHBUWYo/YNsC3SH2hpvIjNKUwM=;
 b=IAbHyEFSuFhMWTeq1md/KjqZeECnHa9418+81SRGp85c6KENCIegmSZRNAX57L2g57
 jsSlgqHLcCuh/Cdkac0tYGI7/GnF69Lje2q4xGoERG2tA6be/7DbROacz+xzHipFQIOw
 8CbqYlBHHUbPtRvnD1BMG+hmsDe7Z4GWLQ0wNnrD//oWam9osUSGAk8Qk7e+e2gYVD8D
 gXTYtCNnhFHFH5Q4OObWdqg7JITFwpdTCnmUglhh+gF9JK/IkGaKO/rSaWnLx5fX+eC7
 mKR+BmcJwQczfX4R4T/tgDZTqAYLVsk7M24LztF02tJ08luR6PMMNwDhZ8iJo+EsSFXE
 b7xg==
X-Gm-Message-State: AOAM530HCr2bVkJJPKBhx4D1o5vFjlezvcdH9ylq0eHoii0d+5EN8nA4
 UQJZXKy+JSkfFsN8xXQiew2fag==
X-Google-Smtp-Source: ABdhPJzPnqI8fKdPHcfw2ARAeaCa1UQn4em2lkSDpL1W3TuDXTGFL/J4QfuE1xjVYkuWeSKEBgdo6Q==
X-Received: by 2002:a6b:b5c2:: with SMTP id
 e185mr28878975iof.127.1635893609244; 
 Tue, 02 Nov 2021 15:53:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 10/30] bsd-user/arm/target_arch_cpu.h: Implement system
 call dispatch
Date: Tue,  2 Nov 2021 16:52:28 -0600
Message-Id: <20211102225248.52999-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:34 -0000

Implement the system call dispatch. This implements all three kinds of
system call: direct and the two indirect variants. It handles all the
special cases for thumb as well.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 94 ++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index cdb9440a65..e784c103a0 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -40,6 +40,7 @@ static inline void target_cpu_loop(CPUARMState *env)
 {
     int trapnr;
     target_siginfo_t info;
+    unsigned int n;
     CPUState *cs = env_cpu(env);
 
     for (;;) {
@@ -87,6 +88,99 @@ static inline void target_cpu_loop(CPUARMState *env)
                 }
             }
             break;
+        case EXCP_SWI:
+        case EXCP_BKPT:
+            {
+                /*
+                 * system call
+                 * See arm/arm/trap.c cpu_fetch_syscall_args()
+                 */
+                if (trapnr == EXCP_BKPT) {
+                    if (env->thumb) {
+                        env->regs[15] += 2;
+                    } else {
+                        env->regs[15] += 4;
+                    }
+                }
+                n = env->regs[7];
+                if (bsd_type == target_freebsd) {
+                    int ret;
+                    abi_ulong params = get_sp_from_cpustate(env);
+                    int32_t syscall_nr = n;
+                    int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
+
+                    /* See arm/arm/trap.c cpu_fetch_syscall_args() */
+                    if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
+                        syscall_nr = env->regs[0];
+                        arg1 = env->regs[1];
+                        arg2 = env->regs[2];
+                        arg3 = env->regs[3];
+                        get_user_s32(arg4, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg5, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg6, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg7, params);
+                        arg8 = 0;
+                    } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
+                        syscall_nr = env->regs[0];
+                        arg1 = env->regs[2];
+                        arg2 = env->regs[3];
+                        get_user_s32(arg3, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg4, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg5, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg6, params);
+                        arg7 = 0;
+                        arg8 = 0;
+                    } else {
+                        arg1 = env->regs[0];
+                        arg2 = env->regs[1];
+                        arg3 = env->regs[2];
+                        arg4 = env->regs[3];
+                        get_user_s32(arg5, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg6, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg7, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg8, params);
+                    }
+                    ret = do_freebsd_syscall(env, syscall_nr, arg1, arg2, arg3,
+                            arg4, arg5, arg6, arg7, arg8);
+                    /*
+                     * Compare to arm/arm/vm_machdep.c
+                     * cpu_set_syscall_retval()
+                     */
+                    if (-TARGET_EJUSTRETURN == ret) {
+                        /*
+                         * Returning from a successful sigreturn syscall.
+                         * Avoid clobbering register state.
+                         */
+                        break;
+                    }
+                    if (-TARGET_ERESTART == ret) {
+                        env->regs[15] -= env->thumb ? 2 : 4;
+                        break;
+                    }
+                    if ((unsigned int)ret >= (unsigned int)(-515)) {
+                        ret = -ret;
+                        cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
+                        env->regs[0] = ret;
+                    } else {
+                        cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
+                        env->regs[0] = ret; /* XXX need to handle lseek()? */
+                        /* env->regs[1] = 0; */
+                    }
+                } else {
+                    fprintf(stderr, "qemu: bsd_type (= %d) syscall "
+                            "not supported\n", bsd_type);
+                }
+            }
+            break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
-- 
2.33.0


