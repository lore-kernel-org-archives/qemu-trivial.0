Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66J2-0005dd-9J
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:38:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Io-0005NO-7A
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:15 -0500
Received: from [2607:f8b0:4864:20::133] (port=39668
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Il-0003Rh-5f
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:13 -0500
Received: by mail-il1-x133.google.com with SMTP id o1so6332929ilo.6
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KGVENobWTliVhjD6oaRv6CJbcN7/F345/0QE+6WY50Y=;
 b=oGTYTEcBFq8VNRa1ExuztTPFimNszCTSguNMGFFjwpNfBolCAAHS8v8EqBl6wnf9yk
 I+/7lhn23lLTWgLtj0wsY0Khac2AW12M/2a0/JrB8PstkQVuvmTqe8CSQwdO+ETrMrj9
 DwBWOBGA7dZz7EU9pjekak1jRm/doXacDzPzBeiHknCiWT6MnP3L0WQAZDpRzn0MynSb
 Q8x6OThecYbjXHx4UDLhGc56Lx4Q60kKS4AL1PZ5DX7NKzDBdVfUIdUHVgpPc6b950WW
 XhSwFHrNlBSgVYglIcszEDiwca3WaPNg5C/Sl83rS4KgW8uTlUbhZAPCUGbTGpqfx+Uu
 YmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KGVENobWTliVhjD6oaRv6CJbcN7/F345/0QE+6WY50Y=;
 b=WcbKH60F5oP+N4UsOQAXR/WAqzvEKwVcRIdCKda5FoXDCWhBioqTp9BoqyHjJiaVxE
 AOUV6LoxA23ZAP5t5+99JLAivMqY/X6hFr8qv4uXjRAlF089TTbbe9sSyNEPOYg9ba4N
 AiQ6gj7XBR9GxJGmX4nnHg0Sci1zLtUX+/eLi/3keKiwLTjPo+UhoR1fPb3SIyEwQPvr
 7AP2G8MnU+1U3pOh4FfGHgPzNKpecbnXSNxcSisfcy/fwySUZFtqk4BloTEQHqrqQH/0
 ON4FopHYOTMIp8nhqNYrSgfSsB5NtoPK3fn2m6OQPjG+CY+2MfgDl/xwC5Z4spwv0ZaL
 /eyQ==
X-Gm-Message-State: AOAM531tBjPVTcdI8oy3JKat8pYzxmzleH/+0dGLz8oXtTWyWOKOqCSs
 i9WemQWEonr/VXrcKF6YBhdDEQ==
X-Google-Smtp-Source: ABdhPJxVkOnz0FQDBGIM1MMsLmu+KFUxbGkkVo6tButwNpel7wNSIJ0lQXUL5jMLIfzrLWsvmSNDhA==
X-Received: by 2002:a92:c681:: with SMTP id o1mr31718776ilg.23.1641627487695; 
 Fri, 07 Jan 2022 23:38:07 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:07 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 25/37] bsd-user/arm/target_arch_thread.h: Routines to create
 and switch to a thread
Date: Sat,  8 Jan 2022 00:37:25 -0700
Message-Id: <20220108073737.5959-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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

Implement target_thread_init (to create a thread) and target_set_upcall
(to switch to a thread) for arm.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/arm/target_arch_thread.h | 82 +++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_thread.h

diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
new file mode 100644
index 00000000000..11c7f765838
--- /dev/null
+++ b/bsd-user/arm/target_arch_thread.h
@@ -0,0 +1,82 @@
+/*
+ *  arm thread support
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_ARCH_THREAD_H_
+#define _TARGET_ARCH_THREAD_H_
+
+/* Compare to arm/arm/vm_machdep.c cpu_set_upcall_kse() */
+static inline void target_thread_set_upcall(CPUARMState *env, abi_ulong entry,
+    abi_ulong arg, abi_ulong stack_base, abi_ulong stack_size)
+{
+    abi_ulong sp;
+
+    /*
+     * Make sure the stack is properly aligned.
+     * arm/include/param.h (STACKLIGN() macro)
+     */
+    sp = (u_int)(stack_base + stack_size) & ~0x7;
+
+    /* sp = stack base */
+    env->regs[13] = sp;
+    /* pc = start function entry */
+    env->regs[15] = entry & 0xfffffffe;
+    /* r0 = arg */
+    env->regs[0] = arg;
+    env->spsr = ARM_CPU_MODE_USR;
+    /*
+     * Thumb mode is encoded by the low bit in the entry point (since ARM can't
+     * execute at odd addresses). When it's set, set the Thumb bit (T) in the
+     * CPSR.
+     */
+    cpsr_write(env, (entry & 1) * CPSR_T, CPSR_T, CPSRWriteByInstr);
+}
+
+static inline void target_thread_init(struct target_pt_regs *regs,
+        struct image_info *infop)
+{
+    abi_long stack = infop->start_stack;
+    memset(regs, 0, sizeof(*regs));
+    regs->ARM_cpsr = ARM_CPU_MODE_USR;
+    /*
+     * Thumb mode is encoded by the low bit in the entry point (since ARM can't
+     * execute at odd addresses). When it's set, set the Thumb bit (T) in the
+     * CPSR.
+     */
+    if (infop->entry & 1) {
+        regs->ARM_cpsr |= CPSR_T;
+    }
+    regs->ARM_pc = infop->entry & 0xfffffffe;
+    regs->ARM_sp = stack;
+    if (bsd_type == target_freebsd) {
+        regs->ARM_lr = infop->entry & 0xfffffffe;
+    }
+    /*
+     * FreeBSD kernel passes the ps_strings pointer in r0. This is used by some
+     * programs to set status messages that we see in ps. bsd-user doesn't
+     * support that functionality, so it's ignored. When set to 0, FreeBSD's csu
+     * code ignores it. For the static case, r1 and r2 are effectively ignored
+     * by the csu __startup() routine. For the dynamic case, rtld saves r0 but
+     * generates r1 and r2 and passes them into the csu _startup.
+     *
+     * r0 ps_strings 0 passed since ps arg setting not supported
+     * r1 obj_main   ignored by _start(), so 0 passed
+     * r2 cleanup    generated by rtld or ignored by _start(), so 0 passed
+     */
+}
+
+#endif /* !_TARGET_ARCH_THREAD_H_ */
-- 
2.33.1


