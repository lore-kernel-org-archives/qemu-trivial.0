Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipm8-0004oH-Cy
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplu-0004Pf-UY
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:07 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:45768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipls-00048M-HC
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:06 -0400
Received: by mail-il1-x12c.google.com with SMTP id i12so8228073ila.12
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=VPByo9HSGRWQMPnFe4gpIC5P1pp52UMI+mhoFA6vLrAiYRYztBkpFVCwrneHQestxc
 RytprFGqceDKPPMq1lKopmu6F12H+fk9g05fsNwFpW2qPTT8ZlcvZjLwqN7+bXd3m29a
 Eg4lgRgOZOVqBmxTEJOy/Zm1Wsouhz/RGCsLRLoLfAik7Th3KcXZ6xmLf29fGXj0pqBa
 CUvuMWEwvX6TQXBQON0VgNOrgMIa0096FibzmmLLhMQW7BVZ87NA0iVk2Jg5n4SNZsQX
 63Rx0yGk63Zii2v1lwO9tS3cOndcBI6gk4Io4jj96UZT8Qj9j0Yisf7d7slPOWA17T7V
 iFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLFz+hfOtxy/QWMpxfsl9nCO3CdG/6n25bbQ+o+tB/w=;
 b=3MJzeLC0DKeuRM8lW5a3tPzY+pKGFjm97KeiA3Vx6CAAYYDPEbXjTXBB4AcQUkfvp9
 /nhCZPZi88JhFuGEYrwB97FRJW2cP+5u3RgZSWy6lUCIg/WDniYYFsC0BHgeHjncmf7Z
 iSlwst4yp6dnW2iuVaKfgvJG+WuE+Vk401yMJ8hwj5P4HjzvFdK8o+Cww2AZ+NfE3OmX
 f7oQr91hfcxSH6qmiMoWaD6zvPtmpetT+TabX4dD9+kgtQABjTfrPsyN51v7Mv/LTJ7o
 T2dJWwxz+LpdMGfU3DANjv2sh4inSRoUigS3L3lT+bzwd43MIoZvE58vhi1Zkc17mkOq
 Nb2g==
X-Gm-Message-State: AOAM532cT4epyL5ZyqXvZFjdiiTVEYTnDGK/DSuIX/MRT+Oq8v2RbMlO
 cEYaptGeah/etEav7Fn/loGG4w==
X-Google-Smtp-Source: ABdhPJzfc+BIQNUDZL4sUrXb6FSJA9lhy4K8vLjwmTO1RSz9/AuTI4pY4nc11OPMFuefwZ5SwbLxZg==
X-Received: by 2002:a92:d411:: with SMTP id q17mr23469321ilm.116.1636082403517; 
 Thu, 04 Nov 2021 20:20:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Sean Bruno <sbruno@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 17/36] bsd-user/arm/target_arch_cpu.h: Dummy
 target_cpu_loop implementation
Date: Thu,  4 Nov 2021 21:18:58 -0600
Message-Id: <20211105031917.87837-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:08 -0000

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


