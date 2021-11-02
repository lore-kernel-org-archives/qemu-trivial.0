Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2et-0006rP-1b
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2eq-0006j0-UU
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:32 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:36829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2el-0002mT-Dg
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:32 -0400
Received: by mail-io1-xd2f.google.com with SMTP id e144so596297iof.3
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=xW66KkOERG8vF6g8p4i77zHeNKm4xyF/asZ0Hqjw80oVOfq4GxPJKQ6AhwogEEeWVh
 v5P/u2dBX00ZZBldYix4PkCIDI2b8Ska+tCWEEzeygBJw1kxkVBQD6VkefmEkwnb31Tm
 9kSiSKxgjSOmgrexhPElwABuoV2/XpcDTzweslqBAMQ+e2dbaaeECwAlY7pk398wzBfP
 osd9QtKgtwNQAOj3e/CCV1ZTv31/QQiLBwx67H52U6apgY7isuUS55bOVK/NNZghyoyP
 h3BQvWMycoRGTM2bbsvCiXVBUa6nLpvHW6RGiCowpN2GVgClg3U3KkKwPOvSI4Hkx4S0
 zb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=W3gaV3dgTRxX6xS7rY70wdgnD2BkdakKirQ5cg8oQre12i9cCSsuUVOvuoPvuC/Cs+
 HUuJhRIb2qau7vdkvzHDLRzccIl1X4EdjfyvtAhJ3jLB3j2C9OnCQzxoMy2bqWOPt84J
 czwt3qbwoiwMjvcGYdQgscQT0GcBugWuG6eIiWuR5/Jr/uHepf+94uELCw61ywqwU/bh
 BlFW6WxtUJs5V4XaOx2owZRwQ3UH5UYyy0AulJeGuE+uUPU5bvI+p98i6jOxX8Ap76Ff
 fpeIkPrRYGOngZVzaE67QJZRAR3fYcKZgg9IqVxuO66a/oLNc2t4/Ma2Kr7XZAwwnlok
 JBRg==
X-Gm-Message-State: AOAM532wxEoJ4fb++42s53cO6rud0V5lnbd4QeRWIhvAyr8iMgmzr29B
 hRHbTS7GZKePMNfkkiCsY2/Hjw==
X-Google-Smtp-Source: ABdhPJy1Y8E7TpfQDGmxjQghpBhRF3wKmM+s78reJg/82FIUa3gBFM01uOcRkfCfbJlFT0w0Tt1UZg==
X-Received: by 2002:a02:7154:: with SMTP id n20mr29728590jaf.77.1635893606384; 
 Tue, 02 Nov 2021 15:53:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Sean Bruno <sbruno@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 07/30] bsd-user/arm/target_arch_cpu.h: Dummy
 target_cpu_loop implementation
Date: Tue,  2 Nov 2021 16:52:25 -0600
Message-Id: <20211102225248.52999-8-imp@bsdimp.com>
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:33 -0000

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


