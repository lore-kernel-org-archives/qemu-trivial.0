Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midNy-0007M6-1J
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNw-0007DS-3b
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:32 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:45945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNs-00012H-5S
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:31 -0400
Received: by mail-il1-x12d.google.com with SMTP id i12so6240748ila.12
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DBw1z07QxBjDRozLTIiFysXXDLukelVSqTbuJA83t5o=;
 b=b4pXlupF0hNesRscRiWHuUkJp9e7XtUZnQduNoSFm0j5gd/+pAuJ6iQZf8TTPtq/qW
 KvlBaGGnst7PV4mOWUR7suASWBNPhLdjF7GCyV7rYjZGUzgifkZqJEfcVh7VgnoYfnRG
 Xc/YPe36VAiPvyS+ubAEyGKvFM0xATq83Uie+3lnAUkZqj/bDAWEuK3/fWNC1cTHXCTh
 puonoiLjqMqM11nB3kvn8UI1yGbDS0usHZUGsNjqqxU2SR4C2YUYWsbgUkBGkqvbITXh
 3Az4aKvsbOkS1j8owljJBxrbLODiUkdz06lzVdLX1OBUy77eMSX7d24DQIlNzp5dHnf1
 gAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DBw1z07QxBjDRozLTIiFysXXDLukelVSqTbuJA83t5o=;
 b=MdguEebUvKnTTXVGQk722Q0ZPKanVBhSwWtn8MVTCVKWWs3zh8dUcyyo3r6JqhXiLp
 Qz7ISKWAl1deDx3UihyVRYkRRlbi+jh/ruINMRtKI5lCQg7SjOB1C8vgD+iqkmU5K19f
 EW/0NuJsVSL/dr5Tq2Xgd/JP/eVRu1b6RpLw5atSCZJdqetrtRiPH2fwE/7PeNV4sNGO
 r1JR/0Cf9t/aoLDr9zpDoSZoxAC5qFURY6vVN9Om7ct5pIzbF0j5ArVUcQ2Rzn0Aa0s2
 DZoBmCGl3rCAqavNWmIeNKvvodqeG0UWr0X/Tla8a+WKxSCqW0dp3SlO20Zu0WkRvvSn
 UArg==
X-Gm-Message-State: AOAM531PjtS9v07r0a6SB/qIfBuva/u41W3PijF/2x6BdCU3RYRYAycW
 A+LUkorVzFC+HmCoHDHt+izt7w==
X-Google-Smtp-Source: ABdhPJxeFs4iSeDpceBrluaHSxHdSusYFkNBP9DVPBbj14zdGE2qUnegKlN6/bD8oRn6Um2iHpLMCQ==
X-Received: by 2002:a92:c26d:: with SMTP id h13mr22659768ild.229.1636034787145; 
 Thu, 04 Nov 2021 07:06:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:26 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v3 19/29] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
Date: Thu,  4 Nov 2021 08:05:26 -0600
Message-Id: <20211104140536.42573-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:32 -0000

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 973183d99c..3aaced474b 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -54,4 +54,24 @@
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
+    uint32_t    __gregs[32];
+
+    /*
+     * Originally, rest of this structure was named __fpu, 35 * 4 bytes
+     * long, never accessed from kernel.
+     */
+    abi_long    mc_vfp_size;
+    abi_ptr     *mc_vfp_ptr;
+    abi_int     mc_spare[33];
+} target_mcontext_t;
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


