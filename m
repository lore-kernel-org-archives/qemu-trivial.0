Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2f7-0007hV-JK
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f3-0007TQ-E8
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:45 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:47019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ez-0002ri-TZ
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:45 -0400
Received: by mail-io1-xd2f.google.com with SMTP id i79so273688ioa.13
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DBw1z07QxBjDRozLTIiFysXXDLukelVSqTbuJA83t5o=;
 b=vbCTh54/CADMH+2MA3WMBgkSSWLDBfiuc/042J+pOc9s5kz+L+ZOzpr6YtNuITV8f0
 Trr4IH1R/Rmr6ZB31dIcNe4gvU7c2qrlKoN4ZSbfBdVyDoxa86suuPMBVSXTGNN8ZG6A
 Qdxr5v2SlkIn4+8iMjpbRvk2jKCUQekFEjcXwfkQqVZttfZIrsUXYse+0B79lzNaU4B3
 fKvNTFmQbwBwtDlWCP55Lq/mPx+lb23flQV3LYWFBMJGqgeA0BRiZKJiuFf7XXHqzFO0
 ELb6IW5OcB0MqSIW8PKkTNn6zddB0yKz/kxte83AJmzspmJHWIxlLU57VwrYY6RCTfG+
 r2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DBw1z07QxBjDRozLTIiFysXXDLukelVSqTbuJA83t5o=;
 b=kCdafkqKRI1spLajB6X6q5zp5jVvMpibRN73DLsLVUSyKyiWOqSwwEhtAFhQqjriz3
 XCTuVVtKjwtTC7R2PZg58bkjJV6cptFWhVBqFoy6jHeUxPASFEzZ4kJz7x/1UC+oDUkG
 IDvnfGQA6brlmsjTBt9C15kA8zWHXwgnyq0zkpYtx33CKCetOYcdt9e9yxrRLVH8hWuo
 bihw2tX8yC9PVEXgGTVoiAVT7yQDu2orfI0NHv0/t1e+xz3g/b4loh+CD0y5g1OkKxIW
 krfOwNLZZno2cKPsdsiIexHM8m56zHBjjW3rEwu7S0qiexr8g8nSzZ8BDmEWxi8kt4dX
 m46A==
X-Gm-Message-State: AOAM531+XrzPDA81hmIogfOe3XHXaZJyEPb9vTIn9JWTZL2LXsbYmUai
 jXglEzsG6si8SXi90h9ujBsHOA==
X-Google-Smtp-Source: ABdhPJxF6umoMF9236OevwoUlaRrGwaQDt1jCgcqMbXn7J4pRuhLe2jZhE+r4aZrYh/tH+lgLXwVjQ==
X-Received: by 2002:a05:6638:144d:: with SMTP id
 l13mr30268056jad.121.1635893620870; 
 Tue, 02 Nov 2021 15:53:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:40 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 20/30] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
Date: Tue,  2 Nov 2021 16:52:38 -0600
Message-Id: <20211102225248.52999-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:45 -0000

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


