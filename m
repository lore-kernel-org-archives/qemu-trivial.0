Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvoI-0005Cr-WF
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:59:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvoH-00056r-4q
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:05 -0500
Received: from [2607:f8b0:4864:20::42b] (port=46638
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvoE-0008Kn-KE
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:04 -0500
Received: by mail-pf1-x42b.google.com with SMTP id o4so676096pfp.13
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4oZ5iwXqrJmDcU+2qXHAQ++/SNnYAx62sujgKs8Ho4M=;
 b=PvUeTMgN885XhJuKwa4LoMcKbwULkKoBW0eTfmjnXuT0KtKY4bL4ZwKhqNkWLbyg2F
 yLnWWoSVBPunLqZA3wieBmnI/aIKLVCbMO8ouYrmntFh/9vCmAAtXYPsuNj2kW8B06D5
 2v+2sboCWdWClzcac2u92UEDGl/xFyd+54tK/ZkAYUYsp2qiObysJ4dEbIpJibQd+cKn
 m/7AkpsImVe5k4Rd8f7oCHcFL7lpW2i6lc0X0VGRLZT1O+LBlF1ZNdmJSM/VbmaGMTb/
 WQU7EXXrXzJamGWAe6zlovFiK+t6tWIJKkHlY0Roknfpg+XNEOtKu5O63tK9BQUY/s4n
 zgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4oZ5iwXqrJmDcU+2qXHAQ++/SNnYAx62sujgKs8Ho4M=;
 b=7oWD39YcfRg5c9EngjnrV4++zwmXUUhUuSlJKgSRmrm0QB/D9FzuofjWpN8yjnvO7w
 6/KjXn8NNwvtcQcgnXW0HclK1QbkN4Ue1LM6Hj05uGBz4JYt2+pK9wAcsKT8Qd9N0Jnt
 YEsMw396hCR3aJC16wVcFqCuT7ZmxSdIx0bkE3UCclAM/Q44SqbYDHH6Y14rXjxfwI7i
 ohem6YzsvPTMUkuOpEZht3GqEstBoBXKYiqzrJwMekulDS2yCCJAST7MSLA9ecaBmYrc
 3eoE+0siJBIkNWroluQCGq1b1uXGESEI1oY5Dngr1tMsGx09i1OQNkidMWOZW3PY0+zd
 pCUA==
X-Gm-Message-State: AOAM533fyqx/ydqPNVqOih4uP7TN11sGpl/EnXZuqNMlBfdoGb0R7qbc
 BggZ2pG16GMqWplBmS9Kax5C4OSUnOrb6A==
X-Google-Smtp-Source: ABdhPJz8xGzgiab25RBf/itPVeHqnz0njYapsXV1UTiJ3llF7+cP1k5Cgbx/pQEen50H7NATQvAXVQ==
X-Received: by 2002:a92:dc0c:: with SMTP id t12mr46060285iln.198.1636343553575; 
 Sun, 07 Nov 2021 19:52:33 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:33 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v5 25/37] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
Date: Sun,  7 Nov 2021 20:51:24 -0700
Message-Id: <20211108035136.43687-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=imp@bsdimp.com; helo=mail-pf1-x42b.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 03:59:05 -0000

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
index 0000000000..11c7f76583
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
2.33.0


