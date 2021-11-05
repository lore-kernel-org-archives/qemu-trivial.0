Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmK-0005Um-M0
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplz-0004TD-2l
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:11 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:46869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplv-0004A3-Pq
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:10 -0400
Received: by mail-il1-x12f.google.com with SMTP id w10so8226297ilc.13
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=98BqBI8TmV8YvyFkZ3y+XgKQlmpyG8KzRCO1YXNy77I=;
 b=6sE0pexeQqrn5SF0NWwdIXpUZQpVKw3scy75G62WVxFc4j88ikoIBgIyqRvgYulcPn
 ZU3oSvxOghyJaD8EiwFFTs0FkTfy95D1B3JlwoOzYeZ2Gtr51s/SmaZzUQNcN8aijcir
 u4aoxd6WDz2GooofZ834Us2dSpF2RayGhI1q+F3bajNOwaCs2vf/lIfpDz83sO2FJvhb
 riLPbEiRy/BbavyP4Z1iELrzSIsAPM2ScNYSoGhli5pmAhjcBit1/tcO7fPEPXnxKhmY
 KPHmonLV82TYL1A/D0XGZxp/PUiJBrK9JpXrQv+bsS4kNlK5lBUUoFn9Gblb2wWi36BS
 aZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98BqBI8TmV8YvyFkZ3y+XgKQlmpyG8KzRCO1YXNy77I=;
 b=zAtGn5Rcy7uQugVsSxWo2siAlwv7kX9pXgsqFAe6QV/9yeW0k5+gNVDP4KHUMLjK/S
 +48BFSsdMRS7Qkysmkj5RfpQTTdzkEqPxslWnwZv1tWxK0RG/vngx6pBQBDu8WL+OP8U
 5GE8M7QSywzMtNBdgn43/33HJVyQ9Zm1+uAlbRrp4UIwMtY05dD+kf0+rlKDr68QcNNz
 QCesoSjnppzFwkrvi8F+wUJgiAn2ODFgr565zItbt5NbJOIZbQ/m9vVtaxZIiFerPHum
 Dx3x2y8ilR/N2urYXAxW+6Pn31eq/tHw7sgr3usPod3CwxAd2/1U1GsOZAseCpYiNqi5
 zw3Q==
X-Gm-Message-State: AOAM531cfD5wrqDZHmks1QALrVIp/FxjA3/uZrut4wYXtHmRa6HPq5xa
 vOESNwk1A85WrO/7EpxU+Z5kGQ==
X-Google-Smtp-Source: ABdhPJwjwBmxYr41/gavOmKZMyGacQ1Y+/tLALNYmyBnQ6M7yXK5r8+gyGckd1PQws/SWIJCIFPiMA==
X-Received: by 2002:a05:6e02:1be2:: with SMTP id
 y2mr34609188ilv.22.1636082406573; 
 Thu, 04 Nov 2021 20:20:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 20/36] bsd-user/arm/target_arch_cpu.h: Implement system
 call dispatch
Date: Thu,  4 Nov 2021 21:19:01 -0600
Message-Id: <20211105031917.87837-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:11 -0000

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
index 905a5ffaff..c675419c30 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -40,6 +40,7 @@ static inline void target_cpu_loop(CPUARMState *env)
 {
     int trapnr;
     target_siginfo_t info;
+    unsigned int n;
     CPUState *cs = env_cpu(env);
 
     for (;;) {
@@ -62,6 +63,99 @@ static inline void target_cpu_loop(CPUARMState *env)
                 /* TODO: What about instruction emulation? */
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


