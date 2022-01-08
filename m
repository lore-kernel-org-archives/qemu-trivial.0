Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66KV-0006Q3-GN
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:39:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Iq-0005Qo-MS
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:17 -0500
Received: from [2607:f8b0:4864:20::d35] (port=33789
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66In-0003Ts-Gt
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:16 -0500
Received: by mail-io1-xd35.google.com with SMTP id s6so10177883ioj.0
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VqBdes6F8m78x5lq8GFYwJEF8M0bPufEku2jPT9OAWE=;
 b=4LG6DS8ZUcLVBqLW2geNbebFOfJ8oMdGcbt2syJaHDCvy7UwPj1CX2LIWPdj+gaGAI
 pAIMv6vQshh+ErzIyqsEaUD9yalcFvBZzGoDG+UAz9rp0UZ9RjajM3mm8MaUukvUyzMA
 VUr56qDG69uYf0FGdRdaC4VlbK4LeivF61t0yPWuSBcEeovYu1kZcA0M04l990QQuvzC
 X+AJ5nouoQNfVH28XJZ7+O1eGNFPP0tOUX44BnT45CtVTrpItqmbA0Jt3XsRXXTOapHV
 h1d5Xjc3r9jsKgtF5pYDeJTBmksA6Vt/VkxegEnYubLakV5arxvRwHoDuqrtbJCQiH2Z
 JprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VqBdes6F8m78x5lq8GFYwJEF8M0bPufEku2jPT9OAWE=;
 b=K9t0IhI0ggicoKjj2NsyFsnshM+7NeMLMYQwIQK0SwKE45sbDBwKgn/dtGu6rAWRyA
 Yz4SBA9l45EKMcFRR+m9sdPPNaG9/G6H9tsNzyZM5Mi4lxlPqJx4z8ceLUMy7del1T1v
 VSILaA0TK+gM4d2GbXGWe6vqsGYMA3V4bcZmyG3lmTZKQkubgK/JlCTdknjXcmTzAHVK
 qIRkUpbKiHrfnBGX8RfTWweHBuReYYIM3Ye2K9DehE62pX7gjsb98VBDi3r0m2TBgeFG
 zHkeYohFzIP/Cg0HYSFrS21JBJ7LqUDHdiJrTctBb3hXjGP15J+kBXGZZhssHAvpgB25
 YslA==
X-Gm-Message-State: AOAM530AR2WCKBvN7uJvLahwNIzVBM0i7uMV/ZI8IT56e7dDWrNwlQSO
 adnBJkg+LKyDUG9gHO7BGGk6cw==
X-Google-Smtp-Source: ABdhPJwfTK2fOtrAZfVhGRj0Juks3PlcXfjztFJJFCyEkNFEyaQriQV4Jc+LT6/UAu0mSqWUVZRUbw==
X-Received: by 2002:a02:8813:: with SMTP id r19mr32242899jai.34.1641627492548; 
 Fri, 07 Jan 2022 23:38:12 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:12 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 30/37] bsd-user/arm/target_arch_signal.h: arm machine context
 and trapframe for signals
Date: Sat,  8 Jan 2022 00:37:30 -0700
Message-Id: <20220108073737.5959-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:20 -0000

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 973183d99ca..9527335cc98 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -54,4 +54,32 @@
 #define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
 #define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
 
+/*
+ * Floating point register state
+ */
+typedef struct target_mcontext_vfp {
+    abi_ullong  mcv_reg[32];
+    abi_ulong   mcv_fpscr;
+} target_mcontext_vfp_t;
+
+typedef struct target_mcontext {
+    abi_uint    __gregs[TARGET__NGREG];
+
+    /*
+     * Originally, rest of this structure was named __fpu, 35 * 4 bytes
+     * long, never accessed from kernel.
+     */
+    abi_ulong   mc_vfp_size;
+    abi_ptr     mc_vfp_ptr;
+    abi_int     mc_spare[33];
+} target_mcontext_t;
+
+#include "target_os_ucontext.h"
+
+struct target_sigframe {
+    target_siginfo_t    sf_si;  /* saved siginfo */
+    target_ucontext_t   sf_uc;  /* saved ucontext */
+    target_mcontext_vfp_t sf_vfp; /* actual saved VFP context */
+};
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.1


