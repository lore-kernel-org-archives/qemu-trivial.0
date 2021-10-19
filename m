Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFp-0000qt-Rn
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsFB-0000NA-8Q
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:41 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:39432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEx-0000Ui-PR
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:39 -0400
Received: by mail-il1-x12e.google.com with SMTP id j3so1272445ilr.6
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sdlEbLgXE/NLb9fk1aQgfblb5tQQaJULtHhyMEd7V10=;
 b=7u26lSAdprvYfpIVHFwPLWDKs+w2C2VOvlUf/zHe6Z7rAKIfGHf8QmsJOwKGCzAAQm
 8SAIKHNyI5jvKMIeezuObgJVRcDkSfK8aPcyMToWeQkXH0+YbvYJZFNN5Hp3nGQ+DuXW
 JXRFsx0E/2hvnvyF/SaT5geBzEiKYIGW0ISVoP7s8T5/sY0llBSIg4lvX2GkUQGnv0yk
 B1ekKU9WQimSkr2+S8TvBiUGTOz3KeOAZmnNLdFoipaTo3BpRnos0sd8EICfKVuDRAb/
 Od1wc+pb7UUGaQqE9+h7ZPWLhv925FPry0gAyy1d8cbeaiX/EaVJOvU7+Fra3ZR5ST8J
 qmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sdlEbLgXE/NLb9fk1aQgfblb5tQQaJULtHhyMEd7V10=;
 b=yqM89ExA8S1K2uZ5WMor2SSsTyKrgYIWUG7dZbBHg638kDmurV9AB+J2ktRuCe/qJD
 wbvyT5GBev/eR2dPjk4DRGk/iiFNzJ0hz04eFdEMWJN4ZatHVTQwDAfzyJj6ugxhSmJ0
 F/qy5kTRttP/Tx774dkwDbf4dLPEQBm/lEqdOOMLyHocGnK+ylF4ngUswUZf7d4oC5ON
 fZWKcM5v5yoy8WI0WnSpiHilABrEAmi3OmIQaPleCXdzIdXE1LQS09aktlmZU+ILJwFX
 V2ZNOnuPbAmeiQw3z5ST2fYhbc1FYfR00rO9V8owlRCeEhlU/TeWMZKwdWCZwFUhCbqH
 iSGA==
X-Gm-Message-State: AOAM531Df4nBFW9b3hHgJwE6iSWG4EmdwEDqU9r8kyZqFc5nB9FGt+zf
 sn2NUJIoB++xbuP8fZXsiFfF9Q==
X-Google-Smtp-Source: ABdhPJyXQbyJvX3kDfJOWU9jMrGUPepvJG76dENb/Bk1BWdznpqbE/vAXjw+bdREQGBdwkZ6Svd2Wg==
X-Received: by 2002:a05:6e02:1569:: with SMTP id
 k9mr19562937ilu.317.1634661925593; 
 Tue, 19 Oct 2021 09:45:25 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 19/24] bsd-user/arm/target_arch_signal.h: arm user context and
 trapframe for signals
Date: Tue, 19 Oct 2021 10:44:42 -0600
Message-Id: <20211019164447.16359-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:42 -0000

Arm specific user context structures for signal handling and the closely
related trap frame.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 9fee58ca9c..67355ff28f 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -90,4 +90,42 @@ typedef struct target_mcontext {
     } __fpu;
 } target_mcontext_t;
 
+typedef struct target_ucontext {
+    target_sigset_t     uc_sigmask;
+    target_mcontext_t   uc_mcontext;
+    abi_ulong           uc_link;
+    target_stack_t      uc_stack;
+    int32_t             uc_flags;
+    int32_t             __spare__[4];
+} target_ucontext_t;
+
+struct target_sigframe {
+    target_siginfo_t    sf_si;  /* saved siginfo */
+    target_ucontext_t   sf_uc;  /* saved ucontext */
+};
+
+
+/* compare to sys/arm/include/frame.h */
+struct target_trapframe {
+    abi_ulong tf_spsr; /* Zero on arm26 */
+    abi_ulong tf_r0;
+    abi_ulong tf_r1;
+    abi_ulong tf_r2;
+    abi_ulong tf_r3;
+    abi_ulong tf_r4;
+    abi_ulong tf_r5;
+    abi_ulong tf_r6;
+    abi_ulong tf_r7;
+    abi_ulong tf_r8;
+    abi_ulong tf_r9;
+    abi_ulong tf_r10;
+    abi_ulong tf_r11;
+    abi_ulong tf_r12;
+    abi_ulong tf_usr_sp;
+    abi_ulong tf_usr_lr;
+    abi_ulong tf_svc_sp; /* Not used on arm26 */
+    abi_ulong tf_svc_lr; /* Not used on arm26 */
+    abi_ulong tf_pc;
+};
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


