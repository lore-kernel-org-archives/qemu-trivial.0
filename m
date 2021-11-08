Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvpB-0006nI-4a
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 23:00:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvp9-0006fU-5F
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:59 -0500
Received: from [2607:f8b0:4864:20::129] (port=42735
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvp7-0000tU-FT
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:58 -0500
Received: by mail-il1-x129.google.com with SMTP id y17so15562012ilb.9
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qz2DLL0tx93vRkMGyLNPCCWpP2HVx1ms+ORRUByobBY=;
 b=6kERkSJ5C5WvQZulIoet5WKKZYaFQwEo1gwteXoWW2YNu40WSfPkRpB1JIktAQt/cA
 rdbZjcSbWEUZoKJWMdVDjfQN5zo5CYWaYXUlPq4PjHf9aWrR03mn8V6Vksu52CBVTSz9
 EscsUoWBJQyGY2PnWBqpefO/L056TGW+6XGstXjPCzxszKFTaw+1gMtZJ/dkSTu9L8tf
 avs4bg0yoGu5l/RHdGWp7hX3cWWKGFk+a23nGWe1WviS503xT6BloiaeWs2C9RGsCpCC
 2RCM/myK7vRVVu0KP/T1qeEXdJmJKeVF3oqEIUoXvDfh7EsdofUkO/uIhWGQaKSzh9Du
 hDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qz2DLL0tx93vRkMGyLNPCCWpP2HVx1ms+ORRUByobBY=;
 b=PWCLX5ACm9Pi33/sKofqajtC4lgFK78R3BmtcytNo9RnhubAm6aSVVmBtawOduC/xw
 5duFedGncq2toN8NM4/ajrVecfFsr0+Ak16ByuacfkmOta662GbLaB2dbxb8NK09LKWm
 wLeeq2jSheg2i/zBRnvy9BnZy0OUs4OrgQfxT9aaXRingQMUatc/e8VV0J/wYHzaVfJp
 pTp734H3t1/8R1ma+O4/g/8Zw+BUFi48kcT8i87565QyEeVn1r3uoy/2+vGRQ+l0fQgJ
 YJJnNgz87J2a8Isgzq72FYrmIelPGVqT6ZYHRZMyfcb32yy+YFb/9O20XzZsh708xaWD
 Qegg==
X-Gm-Message-State: AOAM530fb5eYS6mPEbGyHUqcWgyb8zB/WfhLEtW0ZzJzapl9c+bpX5ch
 +NFQgzUvsQFFXdjAFW4ZGyh5TYesL8p0ig==
X-Google-Smtp-Source: ABdhPJwlmtWfJ/R+w5Y3qSjnVidOoOBTozG3p2EM817YPRkkHeOIcJjFDLaoeZi4eh6reyq6xOts8A==
X-Received: by 2002:a05:6602:2f15:: with SMTP id
 q21mr6064941iow.113.1636343558086; 
 Sun, 07 Nov 2021 19:52:38 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:37 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v5 30/37] bsd-user/arm/target_arch_signal.h: arm machine
 context and trapframe for signals
Date: Sun,  7 Nov 2021 20:51:29 -0700
Message-Id: <20211108035136.43687-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 03:59:59 -0000

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 973183d99c..9527335cc9 100644
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
2.33.0


