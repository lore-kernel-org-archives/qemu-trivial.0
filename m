Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66KT-0006Hs-AZ
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:39:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ie-0005Jy-HV
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:11 -0500
Received: from [2607:f8b0:4864:20::130] (port=38684
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IU-0003LU-BI
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:01 -0500
Received: by mail-il1-x130.google.com with SMTP id x15so6494474ilc.5
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oojTYNevouJD4FnDtUcg1HziLTiCetAlphOi7JaWgjk=;
 b=4jeUIZT8GI3JngGBBaki91c2ARK5a3WBVaJ5ytitQ000lcVRK/5YbE1G0ezBmevRMJ
 iYCvWju5nnheRZJgGGl98JmfMGO0XbqbsNPYfW7I8lzZqo5pr04NeU9wBj685VmMyrlI
 OGQOd5I3IP5O7ZTNTVPrr5GVGEqBOOQa+2vqaRxJUbyyZrzpXJKFJU3lK4sjaxkEK8gR
 VBpVvqDRUB/d3fU29pWfgRBHpvlnDXtk2C5ar8vsnz4HHpJy1UTH6JnqmAigNupbtxjd
 YSXpaAX8eQlxWkfpZV0Eyvg72vfa7mErgFe0PNt58z2Sya+Gie10VaqSIs2eMC9xJjbk
 amTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oojTYNevouJD4FnDtUcg1HziLTiCetAlphOi7JaWgjk=;
 b=6gSFYO6G8cVMkPOI9m9UQo4lVf3qs5HQJ7zc2wrp2G9LemiYlL0wjiTFCboZT/USeo
 aNh13ZFsN+16wumv/uA+C/S2QX9tVy+v134oraI2SARtKYLpil1RqwBVW3wnaC7LfGos
 qzOeFhGh/hDWtcchbFfM5isggKud5Sw2b2cj/b+qT9UpRfMMoJEWPPl0bPADj2B7NpqA
 Ee/K3rV9PRt044FmZtNFzgI9QynGVb2tw53Z57rC9xAME9b3rdxlp/6JEtHXWc61x0Lw
 svVxLJApjhjdTZE4A12Q24RveROWpcm/sweJKtJLJ5/nCB0cb8rPuCgZQ/Wq6P6Ob2m3
 B3wQ==
X-Gm-Message-State: AOAM532qQlwm9G/re3ykvuL5kEA+sbHEvnbDI5FxpmErC0S8GJBqAqbx
 qZTtkT9LzTVoes1xy5Dqm2IeCg==
X-Google-Smtp-Source: ABdhPJwchiISq2NN9os5/iWHjOAj93r3uEwGGiAmeVfKCJxThMmZ+Q1j8H9SarBW0SU6XnJcI3qa5A==
X-Received: by 2002:a05:6e02:1708:: with SMTP id
 u8mr26671086ill.308.1641627472552; 
 Fri, 07 Jan 2022 23:37:52 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:52 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 10/37] bsd-user/x86_64/target_arch_signal.h: Fill in mcontext_t
Date: Sat,  8 Jan 2022 00:37:10 -0700
Message-Id: <20220108073737.5959-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:14 -0000
X-List-Received-Date: Sat, 08 Jan 2022 07:38:14 -0000

Fill in target_mcontext match the FreeBSD mcontext_t structure. Also
define the size correctly.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index e84aff948c5..720e3939c31 100644
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
2.33.1


