Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvng-0003QJ-Ue
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:58:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnd-0003Ir-1F
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:25 -0500
Received: from [2607:f8b0:4864:20::130] (port=34395
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnb-0006Ot-8r
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:24 -0500
Received: by mail-il1-x130.google.com with SMTP id j28so15560026ila.1
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=unoUheHOiBFwRIZBJ0G39ayIeTidxh9oy5cQLMJnocc=;
 b=Ji3jqYOgwzC2XJPxa8/28tjRiU8eTsUpTSkPO+A0KDSc1SJj4vMtSHnANEjjrqbi2M
 ad059Bm1NeloIKruBps43QkyJuuo9JmGQZ4vc2L4kP15hx/qYbkoz8UNkCg0qF0f+zbG
 6snbx9XQO6B1sBlNvhZIacGb4YxDZLNTM6MIIY3mtEljwZnhXMhkVmhMvEMSG3u2IstP
 LLtmQN5zo2I2Xq7PRhpw1Cx7i+CWBWvvYin/pRPguA2WEeQy6ST3yW6/XQc0s93D5xIE
 nWZnpMl6rZkWVw8qoxCaLhBP5Uvo9t8eoZrg0L7wCqeKSFq2QqNm1cp1R1ggTDHSWQbp
 L9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=unoUheHOiBFwRIZBJ0G39ayIeTidxh9oy5cQLMJnocc=;
 b=nUacUHUIqY0ZOidHg6N4fjYV5occUmFJDRsOe2a4VQfpZq7yMPSpmivxWEtCPglFbq
 N8yU4U05TlJccw3SQuM/if+lG2fuLyv4+ct2ovyoWmjwD79XYuEBkTnY5fg9jdmVVAAy
 zac9NsgmCgb4KFL5n7mBeVYniNL8P9TF2r6q0DQW97J7WTCVXTl6P0U/kOucHCJNDK+e
 pjaUbI5Of0JhbdMQh7WKE501ZFCMq+ry+yiiKA5GDEBxITeFouaS861H49PPdXUcLBee
 LZ+sOWbVdSrmdrRrc3mutzHluZygKR3CkuHbnIZfMNxsa5Ft8mu2SwAfo9psUWWQFTi8
 ByFg==
X-Gm-Message-State: AOAM5333zfPrOcKCk9HQSh28RbA8f89JMP1PEse6merQ7jKC2/A9EzLR
 LyoLPe+/yrapMgzRtXNkThZqjCUhClJxSw==
X-Google-Smtp-Source: ABdhPJwYYZXnyacGGGQms1ge3xdm18zvQZiRA/1RyxDx4bZI0F+JQ8PkmLDatFWKKgu5JBTtKCwhgQ==
X-Received: by 2002:a5d:87c8:: with SMTP id q8mr11200624ios.117.1636343548005; 
 Sun, 07 Nov 2021 19:52:28 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:27 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v5 19/37] bsd-user/arm/target_arch_cpu.h: Implement trivial
 EXCP exceptions
Date: Sun,  7 Nov 2021 20:51:18 -0700
Message-Id: <20211108035136.43687-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 08 Nov 2021 03:58:25 -0000

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


