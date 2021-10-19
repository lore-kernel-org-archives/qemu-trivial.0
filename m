Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFt-0000ye-My
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF8-0000MD-9Z
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:38 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:39431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEv-0000Tk-Kf
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:37 -0400
Received: by mail-il1-x12d.google.com with SMTP id j3so1272378ilr.6
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HXPyN7sGFhivdzz5mJ6Daz8wVt8XXk5Ml8ywJnJegc=;
 b=UXZ7hqN+dmpx2KuhX1N+KxNJxShm6CbC/FRyOwAHm8Q/kG+JJkLWtnervIE9Xldvf2
 0X8B4Mc4MQtYD7Um33X5+QXrLAZQK1KUdRsE0hhxXAmrGILSaS4x7FlrXgi8Lr5SJr1o
 WATYoicTWuySqmmIwVwNmHRNFRlRXbLUCbynpbJLn/GfsJzHzYzqYfBBMt+APkG+tYdQ
 zcxuRvxuCYCC/qAfPYI4DFLDINb6G0YkM1OU7+iloxaF20d1a/NAOw5d1aZR2nx6xSYj
 FVp75MarfUVpFk9G9isUu7suXRFwis7b6No1kWQRh6RgndpiF0sGnzprskSfE8DPMvTK
 GXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HXPyN7sGFhivdzz5mJ6Daz8wVt8XXk5Ml8ywJnJegc=;
 b=DIoEYUMvOHfa9R1tgaBa/Yd5eFIA0JTsNrqbFoaLEBY6WmFOrGsKJngeL9PmQcuCiH
 ex1qoGDA4Dq/Y6diOkcXX8FBckym0tFHkz0IYBHnvr0UeRMC4LIfnMB8CsTHBmI04xIM
 +cewPu9skgnL8ujIS+h2r7ES21jOmquXYB3ZKeJKwBY0oYYU8Ag94XhTXen+9yuP5aBy
 J1hCVV/tNQ6+5roGs3BsXNVaZ6DCKOtJNCj2b1LUzzTtDkLpN4JeEVGSiQMA7lw86PYl
 mwMshw75rA8Ppc3X6U4SxPuLRU0wk9i/qUJuwyLDXQxwCkUVBv/uYQXojc5qtGSuCSlO
 ZrKA==
X-Gm-Message-State: AOAM531B0Ulx5xIhxNlVg2U3jTZY4+RP308sOSN6qs5iLtHXGtjxnAlS
 litRTmBvyC6p7a3XpbyOUDBWdw==
X-Google-Smtp-Source: ABdhPJz3xgfAnhjGe/QZaJ+TipiOxAJKzC+1Y3cbCUHg7WocS49X1WtiRMe97E5q72O0kdd/wS8OIg==
X-Received: by 2002:a05:6e02:194d:: with SMTP id
 x13mr19219455ilu.266.1634661924513; 
 Tue, 19 Oct 2021 09:45:24 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Klye Evans <kevans@FreeBSD.org>
Subject: [PATCH 18/24] bsd-user/arm/target_arch_signal.h: arm machine context
 for signals
Date: Tue, 19 Oct 2021 10:44:41 -0600
Message-Id: <20211019164447.16359-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:39 -0000
X-List-Received-Date: Tue, 19 Oct 2021 16:45:39 -0000

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 973183d99c..9fee58ca9c 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -54,4 +54,40 @@
 #define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
 #define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
 
+/* arm/arm/machdep.c */
+struct target_sigcontext {
+    target_sigset_t sc_mask;    /* signal mask to retstore */
+    int32_t     sc_onstack;     /* sigstack state to restore */
+    abi_long    sc_pc;          /* pc at time of signal */
+    abi_long    sc_reg[32];     /* processor regs 0 to 31 */
+    abi_long    mullo, mulhi;   /* mullo and mulhi registers */
+    int32_t     sc_fpused;      /* fp has been used */
+    abi_long    sc_fpregs[33];  /* fp regs 0 to 31 & csr */
+    abi_long    sc_fpc_eir;     /* fp exception instr reg */
+    /* int32_t reserved[8]; */
+};
+
+typedef struct {
+    uint32_t    __fp_fpsr;
+    struct {
+        uint32_t    __fp_exponent;
+        uint32_t    __fp_mantissa_hi;
+        uint32_t    __fp_mantissa_lo;
+    }       __fp_fr[8];
+} target__fpregset_t;
+
+typedef struct {
+    uint32_t    __vfp_fpscr;
+    uint32_t    __vfp_fstmx[33];
+    uint32_t    __vfp_fpsid;
+} target__vfpregset_t;
+
+typedef struct target_mcontext {
+    uint32_t        __gregs[TARGET__NGREG];
+    union {
+        target__fpregset_t  __fpregs;
+        target__vfpregset_t __vfpregs;
+    } __fpu;
+} target_mcontext_t;
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


