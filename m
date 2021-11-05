Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmU-0005ba-1F
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm7-0004nk-Qw
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:20 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:35761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm5-0004Dz-7C
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:19 -0400
Received: by mail-io1-xd32.google.com with SMTP id c206so7788791iof.2
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IR91cAUVFaEvVZgHdJNkNOwMysdIm06F6HU/985m8ck=;
 b=m6yPdNHEFYAOhK2Z27WmbyRsu/Uq0zUCvR9ilL3O1ma1j16qVHBc166wwDr0uu8Xwp
 oUet7ZxMAxOB4QVT9/UrMarPhjPaRsHbvz2BfOuEEca6rKwFJ1A0bNXZwrHEPZFlvhMk
 /yQfYl5yO1k/N17Yr3gXUxKo7actri22ZAzE3QpYLyEt+EEwnz9mlN30i8UAcjr9qwXJ
 XcbMDlJBzE608hsRC4A/opQaeL1ax1cVJCBmrDLL0bEQDJyW0yp3aLG5K/WYQVRX3sbt
 9cf08b68Tx4h7DjaECKdonooNsRx3/oiHkRJIwPY1dUNZJOplE8BC9Ptqn+CDfFp5Gg2
 n+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IR91cAUVFaEvVZgHdJNkNOwMysdIm06F6HU/985m8ck=;
 b=G9YYcy1IEQc9ciI9rocOZnsxrs1d07lv9nCKbp7o0VkrqSDoTpA1WPa3iLiF1rScSZ
 Ky346Aya+6RUssefDkdEfytrLEHhanRs54HXq9DtlQ9xEgQEFXI013brhUi1ReRevtvy
 1qVhmte51/E8Tm/u0Xc4ap89i0AdyMTsOSwazA/P7LTrkpJLumJ31TjZeX8RShSCDK2g
 ucRnJ+1CbN6cowWDQV1Tbbdp45YH8UFq2545hwPQThQ01dg04cR2Y2mqQfkkbUEAbbXt
 nd2IiLX2YC3cCeRLVtkiownlyzgjOcI/wYKYz41e9fK6yk5o2mHZdNZE5TZOL7zE6dWU
 1/OA==
X-Gm-Message-State: AOAM530uJ5AnvtHXc2kJkEBtbFQUDOgGP1pCVhxk7Wtn81jYizBR9fJI
 bq/Idq7CjXBMqBczRvCg56yX1A==
X-Google-Smtp-Source: ABdhPJxcEyrc90Zi3Kcu4+ws5pXb0tEgvloZB1opdjl7CebC11uX8tLQpzduBAhldTFwwb2vi8dtgg==
X-Received: by 2002:a6b:4f15:: with SMTP id d21mr4991298iob.188.1636082416280; 
 Thu, 04 Nov 2021 20:20:16 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:15 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 29/36] bsd-user/arm/target_arch_signal.h: arm machine
 context and trapframe for signals
Date: Thu,  4 Nov 2021 21:19:10 -0600
Message-Id: <20211105031917.87837-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:20 -0000

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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


