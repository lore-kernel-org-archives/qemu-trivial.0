Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midNi-0006bR-DR
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNf-0006SH-5u
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:15 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:37860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNd-0000xg-NN
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:14 -0400
Received: by mail-io1-xd29.google.com with SMTP id y73so7015510iof.4
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=Aep7I0AFEOJdWz7ORLLsHk2dAaAVCXYD7FvYJarVRcdNPuTpxYAXtjSfJ95V73R3en
 lOnGqYQYADHW/Kmh9r4TnIzcKou7QtNdnzry/nIi36DVCDkv+AUXI8KXBWlqd50NxDeK
 q2iiCxw9CoAOIVQ9yvZZCsjqF1FsPx+CP6VCDWkFvjLtoy7uQLsBFMaso/6G6fLQjZhG
 e2+aEgIBCMwxZn+EzciAzqBLR/CDZK7P2TtiXJxMPNyBJZBw+/iVF4/Dbnz0uTt3W2Ke
 tTP88l/5mk0EOR0SpBRScAEmg46v6ItdckVVb5RDZBHgT/vAoVbNFyLPN0FU9ZX2FTCK
 JQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=ioKA9jfbPtpcSps/nOX1+Wq9FiUeDXUKCyuIH5rmrYszzC56gPdSZzNt8vsqHBGzMw
 4reikmEAP60QgJCQ+bx6kPBHL4Gm/RoReC2+aVXH1lVWgoRlE4P97aI/CqS1Q0Dipguo
 Xnuen85LoQqzgpdq4scLr5bdVT1+WA92kOfNVARZMacddHEDyVtysHBHQGvDjybNTigM
 FDYdIej+L/2aepum1zkTPCS6Iang7x5X7X7oaHgvrcbwC5DAC8nr30kX3Jysh9JOxFC0
 lFsOljhZq9rivxdW5Dh/0DWYUzliUuZOC0t58t0Col2WRJqdVgR16986QCpiJiFHtfnT
 kgGA==
X-Gm-Message-State: AOAM5308UYHQ/0McsVGNZuapfLycLk0UEvwajGujemH8yKxmYPkYBrzm
 qcFKuBoCwfF705im2xBA82lh2w==
X-Google-Smtp-Source: ABdhPJxfZ4eU9HYuD0XDcjzdLF/AZ/SGczESVoLWkFGBDQKu4AcQtedLzPlqSLtsFaD4T/fUoAqUNw==
X-Received: by 2002:a05:6638:c49:: with SMTP id
 g9mr4070026jal.54.1636034772726; 
 Thu, 04 Nov 2021 07:06:12 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:12 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sean Bruno <sbruno@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v3 06/29] bsd-user/arm/target_arch_cpu.h: Dummy
 target_cpu_loop implementation
Date: Thu,  4 Nov 2021 08:05:13 -0600
Message-Id: <20211104140536.42573-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:15 -0000

Add a boiler plate CPU loop that does nothing except return an error for
all traps.

Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index fa45d9335d..2484bdc2f7 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -36,6 +36,28 @@ static inline void target_cpu_init(CPUARMState *env,
     }
 }
 
+static inline void target_cpu_loop(CPUARMState *env)
+{
+    int trapnr;
+    target_siginfo_t info;
+    CPUState *cs = env_cpu(env);
+
+    for (;;) {
+        cpu_exec_start(cs);
+        trapnr = cpu_exec(cs);
+        cpu_exec_end(cs);
+        process_queued_cpu_work(cs);
+        switch (trapnr) {
+        default:
+            fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
+                    trapnr);
+            cpu_dump_state(cs, stderr, 0);
+            abort();
+        } /* switch() */
+        process_pending_signals(env);
+    } /* for (;;) */
+}
+
 static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
 {
     if (newsp) {
-- 
2.33.0


