Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFZ-0000h7-0S
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF3-0000J4-19
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:33 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:40554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEq-0000Os-QH
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:31 -0400
Received: by mail-io1-xd2b.google.com with SMTP id x1so21100480iof.7
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZXbvVPBD59OwL6sbB403nbXxdGqYeYt21ZqWQOQjYmA=;
 b=HRV+TB+o+0xeGJH+ld6FMuhgNIg7t1sRQ315Kwho3kYVqZGY1CGFIOIlCBJkdhMrAs
 Pkrs/q00o44DrQvQVRj24pLEyCH2HbKsYA9kCCuwFFmuxpISqdbyV0WIkBQv7VglYP0Q
 M9odOtG9tIPBWi7Jbn6bA9TVVFtbzmeS78s4M/IwMqN/IgUlvE4E1fZ6YexwP4krs3qs
 rb0JI+sSLom40Ku+BjYnOg6Sr6hCed+GjFt2sjpMcygm2RhS7tmC6OjLcGsb89PlQIEB
 yl1M0xpxnrfBQ1KcGy2+cbBJjNLH8Jh4R4ZvCF98TXa8kXn9ETSsNkX33ns95UQoHITg
 XsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXbvVPBD59OwL6sbB403nbXxdGqYeYt21ZqWQOQjYmA=;
 b=IOKR9O1RNeC2fv8wchwK7egfNkp5YAzmVL6ax8Sb23VxSargol+8ZUsbIcrHX4GF1r
 5Erosg9widhoPEgZUc1otWgMmYVuE4qjPLlbrm7gh3VMNSd1VOmmzKmxkINyejqU7GsT
 Ctv9gch7jHIyLaGTY3zSpcsTrpVbGsnqhMjFa57Tz4vRmUAq2/RYyMUM+/OOYAHsYpfK
 iv1RmFIR7Myuoy8ZXG4IZx66tOY/rGTCJY9tv1GSBMKgnG3Br2NHwv3tVdA6KADZCkCL
 Pn6Ye1UpAnAN6S61IzKI6VUs5YdOGdaGDI6aw1Iv6hIGP3K/dkBtz9ujai8W+EsRBzcx
 CDtw==
X-Gm-Message-State: AOAM531eH5sr+nXABuRfS1kTTDcEuTKtD/JyCRp873KIdL1d730UvFN+
 k69ndjv4a2nJv+sU6g6XQBIkCQ==
X-Google-Smtp-Source: ABdhPJwsXDhJiThaZNAuzYbk9Z6YbHbjba6R5B8OScWpo3ZOD0zaUWoK4QOX7WkzceeTsLVS6eAFnw==
X-Received: by 2002:a02:a18c:: with SMTP id n12mr4881340jah.130.1634661919765; 
 Tue, 19 Oct 2021 09:45:19 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:19 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Klye Evans <kevans@FreeBSD.org>
Subject: [PATCH 13/24] bsd-user/arm/target_arch_thread.h: Routines to create
 and switch to a thread
Date: Tue, 19 Oct 2021 10:44:36 -0600
Message-Id: <20211019164447.16359-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2021 16:45:33 -0000

Implement target_thread_init (to create a thread) and target_set_upcall
(to switch to a thread) for arm.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_thread.h | 71 +++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_thread.h

diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
new file mode 100644
index 0000000000..317364bb84
--- /dev/null
+++ b/bsd-user/arm/target_arch_thread.h
@@ -0,0 +1,71 @@
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
+static inline void target_thread_set_upcall(CPUARMState *regs, abi_ulong entry,
+    abi_ulong arg, abi_ulong stack_base, abi_ulong stack_size)
+{
+    abi_ulong sp;
+
+    /*
+     * Make sure the stack is properly aligned.
+     * arm/include/param.h (STACKLIGN() macro)
+     */
+    sp = (u_int)((stack_base + stack_size) -
+        sizeof(struct target_trapframe)) & ~0x7;
+
+    /* sp = stack base */
+    regs->regs[13] = sp;
+    /* pc = start function entry */
+    regs->regs[15] = entry & 0xfffffffe;
+    /* r0 = arg */
+    regs->regs[0] = arg;
+    regs->spsr = ARM_CPU_MODE_USR;
+    if (entry & 0x1) {
+        regs->spsr |= CPSR_T;
+    }
+}
+
+static inline void target_thread_init(struct target_pt_regs *regs,
+        struct image_info *infop)
+{
+    abi_long stack = infop->start_stack;
+    memset(regs, 0, sizeof(*regs));
+    regs->ARM_cpsr = 0x10;
+    if (infop->entry & 1) {
+        regs->ARM_cpsr |= CPSR_T;
+    }
+    regs->ARM_pc = infop->entry & 0xfffffffe;
+    regs->ARM_sp = infop->start_stack;
+    if (bsd_type == target_freebsd) {
+        regs->ARM_lr = infop->entry & 0xfffffffe;
+    }
+    /* FIXME - what to for failure of get_user()? */
+    get_user_ual(regs->ARM_r2, stack + 8); /* envp */
+    get_user_ual(regs->ARM_r1, stack + 4); /* envp */
+    /* XXX: it seems that r0 is zeroed after ! */
+    regs->ARM_r0 = 0;
+    /* For uClinux PIC binaries.  */
+    /* XXX: Linux does this only on ARM with no MMU (do we care ?) */
+    regs->ARM_r10 = infop->start_data;
+}
+
+#endif /* !_TARGET_ARCH_THREAD_H_ */
-- 
2.32.0


