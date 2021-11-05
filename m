Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmB-0004yc-A0
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipli-0004Gh-WF
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:56 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplg-000440-Mu
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:54 -0400
Received: by mail-il1-x129.google.com with SMTP id j28so8271989ila.1
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uyxbbQF80/XM90AkSm9sfWQoRQdroYy3zT6tj7fuzSM=;
 b=gUzhFJ+m6gVCo0IVbvzNb9vIKJDZOREqpnlVvzWej1XgQea6sRgzANMIaSe/eUpYvv
 48sUgqtZ4MqR1zwjVRKxQ2DCwy0BmKbTec5DeFk8ZIRW9AfqTz0Y7BAo9ig0P/sbRyiI
 stkQJgV+Z14GUDyaje9asE3I7+p4G9Ay9aGXIwXLGbnEAG4lECILUHCXxe5PWqPxLUZf
 Js+BpIFr/TqdO5tJSCafmi2kQNu8cce89JZQ7bEbcXYdMt+avQTz4mRiBUq4AUcXE73v
 E6xiVl8o6pRYC0EfwPycJiFVlJYnJVYVC65t/S/3RfgM9CM314UN8c2NHaHnNlT4lKsJ
 0Q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uyxbbQF80/XM90AkSm9sfWQoRQdroYy3zT6tj7fuzSM=;
 b=myv+rmzpPsBWjlAydMCMaXOI68qh/GampEBmV+oDjFQ2r+ZzPS6NWrjTDIj0EniT2g
 /xJSBWIqBMaTTBfOkwGrjWf/ITKlGDeu+9crAGtwPmwqh9Z1TdYDolfczORVbJwy9hLQ
 UiW6nQHQMrN7LErHSu7HygglzTyrS0iqiUKmY0O9bLAaW/jIonDP2X31J5YIYcvrZeKx
 EQ40hacOLRuSSiMiBBk0A9TCR+HLDokm0CnpaafSdYW63z2xm+6GZLVMyDjQFxs/7PkQ
 CxFuzVI/urUFtw/6/D7t38Stp5yeFs8Uo7KbOnfsNrte9CaPkn2vsoUg/uRaMmW9u0z5
 cxWA==
X-Gm-Message-State: AOAM5334t1t500VWWJNgVEyiID2sdGRv/gMaJC899yuAflFDQTsFc3E0
 qRM5bjKddaz/77YRviK8R1ksLw==
X-Google-Smtp-Source: ABdhPJzm0ueogUqa54TooubBKIrJmszRV4HXCRYu0LetXr5XCWiQdVBZsCv7wG0HNc2xzk5n0Z4sew==
X-Received: by 2002:a05:6e02:1c47:: with SMTP id
 d7mr20175541ilg.6.1636082391748; 
 Thu, 04 Nov 2021 20:19:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:51 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v4 06/36] bsd-user/i386/target_arch_signal.h: Update
 mcontext_t to match FreeBSD
Date: Thu,  4 Nov 2021 21:18:47 -0600
Message-Id: <20211105031917.87837-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:19:56 -0000

Fill in target_mcontext_t to match the FreeBSD mcontex_t. Also tag the
current size of mcontext and ucontext to enable size checking for i386.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_arch_signal.h | 46 ++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index bf7263c4f8..701c6f964f 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -28,8 +28,54 @@
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
 typedef struct target_mcontext {
+    abi_ulong   mc_onstack;     /* XXX - sigcontext compat. */
+    abi_ulong   mc_gs;          /* machine state (struct trapframe) */
+    abi_ulong   mc_fs;
+    abi_ulong   mc_es;
+    abi_ulong   mc_ds;
+    abi_ulong   mc_edi;
+    abi_ulong   mc_esi;
+    abi_ulong   mc_ebp;
+    abi_ulong   mc_isp;
+    abi_ulong   mc_ebx;
+    abi_ulong   mc_edx;
+    abi_ulong   mc_ecx;
+    abi_ulong   mc_eax;
+    abi_ulong   mc_trapno;
+    abi_ulong   mc_err;
+    abi_ulong   mc_eip;
+    abi_ulong   mc_cs;
+    abi_ulong   mc_eflags;
+    abi_ulong   mc_esp;
+    abi_ulong   mc_ss;
+
+    int32_t     mc_len;                 /* sizeof(mcontext_t) */
+#define _MC_FPFMT_NODEV         0x10000 /* device not present or configured */
+#define _MC_FPFMT_387           0x10001
+#define _MC_FPFMT_XMM           0x10002
+    int32_t     mc_fpformat;
+#define _MC_FPOWNED_NONE        0x20000 /* FP state not used */
+#define _MC_FPOWNED_FPU         0x20001 /* FP state came from FPU */
+#define _MC_FPOWNED_PCB         0x20002 /* FP state came from PCB */
+    int32_t     mc_ownedfp;
+    abi_ulong mc_flags;
+        /*
+         * See <machine/npx.h> for the internals of mc_fpstate[].
+         */
+    int32_t     mc_fpstate[128] __aligned(16);
+
+    abi_ulong mc_fsbase;
+    abi_ulong mc_gsbase;
+
+    abi_ulong mc_xfpustate;
+    abi_ulong mc_xfpustate_len;
+
+    int32_t     mc_spare2[4];
 } target_mcontext_t;
 
+#define TARGET_MCONTEXT_SIZE 640
+#define TARGET_UCONTEXT_SIZE 704
+
 #include "target_os_ucontext.h"
 
 struct target_sigframe {
-- 
2.33.0


