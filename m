Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipm4-0004b0-1y
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplm-0004Kp-W5
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:00 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:45770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipll-000466-6M
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:58 -0400
Received: by mail-il1-x12f.google.com with SMTP id i12so8227867ila.12
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0aoD6kQGvGec2fmTrLm6bXRNADKHnrqvYBTPMgruHQg=;
 b=V/iIR1dYnCG+e4eXQXyCkYHYrRkKzy4L+8lwR6TFkFtO7z+B8ZrJkYY74YhD2Dc7Zu
 9f0wlOqaN89ZwIvEdm46klv13QeIQIZy9Ye9Z7tJBzQFO81HosobLLVtpJXx23akjwhv
 LAme2s3ZIOiityWCjHZ5TKWKr07acv343V88WBPqqHDTQX79pdEw6MfqrTBV+HHY4g+6
 6kCEvB8Lwnf/5gUh9yvgeB5+ykvLkt7s40xw4a1a3nuTO90tuKN8t88eImKF+bk/3WrI
 8MASV0qPdiuPa8zjVrWbRneQmGgkG4iznBJWGrpq8YUiaBAXLnf31T9OBwQjbb/MJ8gU
 ZzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0aoD6kQGvGec2fmTrLm6bXRNADKHnrqvYBTPMgruHQg=;
 b=TXRda9uH648FkmZah3C2sdZKABWZl7wjXILEguxu1FoKfHJr+OokupxXp/Cs6KMXrf
 G8+3ry6WxwbScwj05mGvcbZ6envpRUCZAtVILw3IHAUK85MjU5X9ItPmrxSxzPS8Q1+L
 mRj4nJ2cwvC/ukL89CkzHb8ZBlQclBjON/ASKWZ3iESXPBPz8LDqjIHE6xyauKzL2nf4
 k0QbDADMzsuMYck5KIOo93BI3glMjuv6gIVa3Wuhjes612YPRcQ+Ok+e5nFGHsTfWZRQ
 XtjOdDEAhHw9vg4M7U1oRmoD88/jNY1jWGPviOhZ5uipGajci6FWA5+20tROyuk8kBnx
 J2DA==
X-Gm-Message-State: AOAM531tEZrNyd4ZNhK213scBos1AdybZHBNy7niIP4XBYMFWgUX2Uy6
 dWkFzz6q7l1vqzfay0gX7swc7VtxrZaTxQ==
X-Google-Smtp-Source: ABdhPJyHTqNCBbKxViV1tszZNb2rZOuirvSglCJOfn7JvUh7sJseTqKeDpYBR/FyNA9PO4tf7d++yA==
X-Received: by 2002:a05:6e02:20c3:: with SMTP id
 3mr22912632ilq.314.1636082395832; 
 Thu, 04 Nov 2021 20:19:55 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:55 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v4 10/36] bsd-user/x86_64/target_arch_signal.h: Fill in
 mcontext_t
Date: Thu,  4 Nov 2021 21:18:51 -0600
Message-Id: <20211105031917.87837-11-imp@bsdimp.com>
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:00 -0000

Fill in target_mcontext match the FreeBSD mcontext_t structure. Also
define the size correctly.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/x86_64/target_arch_signal.h | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index e84aff948c..720e3939c3 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -28,8 +28,62 @@
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
 typedef struct target_mcontext {
+    abi_ulong   mc_onstack;     /* XXX - sigcontext compat. */
+    abi_ulong   mc_rdi;         /* machine state (struct trapframe) */
+    abi_ulong   mc_rsi;
+    abi_ulong   mc_rdx;
+    abi_ulong   mc_rcx;
+    abi_ulong   mc_r8;
+    abi_ulong   mc_r9;
+    abi_ulong   mc_rax;
+    abi_ulong   mc_rbx;
+    abi_ulong   mc_rbp;
+    abi_ulong   mc_r10;
+    abi_ulong   mc_r11;
+    abi_ulong   mc_r12;
+    abi_ulong   mc_r13;
+    abi_ulong   mc_r14;
+    abi_ulong   mc_r15;
+    uint32_t    mc_trapno;
+    uint16_t    mc_fs;
+    uint16_t    mc_gs;
+    abi_ulong   mc_addr;
+    uint32_t    mc_flags;
+    uint16_t    mc_es;
+    uint16_t    mc_ds;
+    abi_ulong   mc_err;
+    abi_ulong   mc_rip;
+    abi_ulong   mc_cs;
+    abi_ulong   mc_rflags;
+    abi_ulong   mc_rsp;
+    abi_ulong   mc_ss;
+
+    abi_long    mc_len;                 /* sizeof(mcontext_t) */
+
+#define _MC_FPFMT_NODEV         0x10000 /* device not present or configured */
+#define _MC_FPFMT_XMM           0x10002
+    abi_long    mc_fpformat;
+#define _MC_FPOWNED_NONE        0x20000 /* FP state not used */
+#define _MC_FPOWNED_FPU         0x20001 /* FP state came from FPU */
+#define _MC_FPOWNED_PCB         0x20002 /* FP state came from PCB */
+    abi_long    mc_ownedfp;
+    /*
+     * See <machine/fpu.h> for the internals of mc_fpstate[].
+     */
+    abi_long    mc_fpstate[64] __aligned(16);
+
+    abi_ulong   mc_fsbase;
+    abi_ulong   mc_gsbase;
+
+    abi_ulong   mc_xfpustate;
+    abi_ulong   mc_xfpustate_len;
+
+    abi_long    mc_spare[4];
 } target_mcontext_t;
 
+#define TARGET_MCONTEXT_SIZE 800
+#define TARGET_UCONTEXT_SIZE 880
+
 #include "target_os_ucontext.h"
 
 struct target_sigframe {
-- 
2.33.0


