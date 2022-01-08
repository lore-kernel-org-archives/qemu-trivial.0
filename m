Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66Js-00064Z-L1
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:39:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ii-0005KL-Lx
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:13 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=40605
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ic-0003Pa-9g
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:06 -0500
Received: by mail-io1-xd2f.google.com with SMTP id q5so10092335ioj.7
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=++7dSM6FOSmYgDBj5XseBjuyEkBOfEOXIVkqPoKsD28=;
 b=uMfFRUX95Eqn6hNLJh0tz2++CanMMADMxmtrqMeW9UXk88mrJmF1sW5Ddf2Z9u8FxJ
 8O1ZOpc9wUIHdmcjhmkQnZ29VMuisjQcPXD2qrdFT5kUm/VGHagvYhpOT26kvSYxzXTG
 5IrSQJ6sCJ8zt3tDM8WATPQW9qAc4pusGXF5KWoJkW3MDM89POVep0Uh45ypiLNB6FGm
 TYvtpxCOCbsCysZO1R8RcIWPzit6LXQI5KY1c33EpbPIasvJe4NstB3UnDefoTkXDMnI
 WP97Hnt2j8fo5saFUk7cJJvg5twktU9OIFPAo4iSdeeCNo7lRpKLkz/SNw+YBjWKFhP2
 NNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=++7dSM6FOSmYgDBj5XseBjuyEkBOfEOXIVkqPoKsD28=;
 b=lQaL9Z8pAw3NJABhSmna2AuHUjKfp7J/6wyJv50DJep6Y8hAzIDqaSc1G/++IIyvXg
 kFABt66DKB26LHIgyciq3lCEMtnVktIcqYJeHJltnPYk40Amb2nXqByooNt+g3xrbh1B
 z2PG1EUHG9I+BD0u+Z1rD6OSrAb22soAoPHPSo2bfaUZMJawdHvMgIfyFiAfRJnKEEKB
 eSV0HTwXrkOG3CVzRLS1fJ1mrt3q027ohRbQ+yqrC2pCHwjTLwOEzMo7I6hBRWyl1T7v
 X6/MtUdh33XXF+c+G+gE5SY6DLgVcWch5doWL4ekbKDWgoS6A7CjvN7lo7mioReEjOUT
 t/VQ==
X-Gm-Message-State: AOAM533/mrTXPJ5EwlyWDeBvmytOEoFvGLIosgLv+x91A52PBI6+k6nS
 9cHmi7dmHCMKinJBhVGe3fxi9w==
X-Google-Smtp-Source: ABdhPJxNehLA6zndt5JJYSIRcAPE60nQ/mS5pzqZ02RGuTUYnJ/TceFskDRK+Wyux4e18HkxsMeLIQ==
X-Received: by 2002:a05:6602:2e8d:: with SMTP id
 m13mr32436394iow.68.1641627480497; 
 Fri, 07 Jan 2022 23:38:00 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:00 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Sean Bruno <sbruno@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 18/37] bsd-user/arm/target_arch_cpu.h: Dummy target_cpu_loop
 implementation
Date: Sat,  8 Jan 2022 00:37:18 -0700
Message-Id: <20220108073737.5959-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:16 -0000

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
index fa45d9335d6..2484bdc2f7a 100644
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
2.33.1


