Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsEy-0000GY-Od
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEv-0000Bn-5o
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:25 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:36728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEl-0000IO-DR
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:24 -0400
Received: by mail-il1-x131.google.com with SMTP id h10so19081565ilq.3
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhGZ41nOlvsySd2XyLCyulTBUhHoEjSzSjYsF8X0b4I=;
 b=BXXaiuZAdQ7m1ifomxu1G7S3+MWfyEKqI4Ltq54yjgCRw0gR92KrX8RFIzw5Q4tHiC
 a055TTvMy25DSVUHrfM7sndHN1pEOSIetNfMn6UfxL0IO8si9DRqjLGccxr/8J+YNp7R
 qM9hOsI/KLK4zT+Q+QdTc5YAHl7sdh8SkvrFNSpLaC3bP4QAQ77AqXkCuid0++A/R3lL
 nGV0uCpDxJmVWSLODZYykiOTFolQkEaQddOGZWcKenBSePj4bSm3DIuV2+u905Mz8rr5
 2D3fz2ZUsJQd0Pc9dsGx5SpLEFNhMeT0gpQR887/DPWOxzD0V5PJHx+P35Q8fm1Ks6sD
 ZAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhGZ41nOlvsySd2XyLCyulTBUhHoEjSzSjYsF8X0b4I=;
 b=171ya7Yq19rAYwHA7+gJfEFUW7ivotb7klfl1i68WJjcEMr6nAU5ZvxRJzicpbbr1Q
 U4msAsvBW1+/OGBKp76aia0UesioFPjgVKPtmgTT5Co81Bhzql0DxoYvza8dyWz4rsPq
 Q0w8ZIZNV5T+5TU+Qby3aGqFLtOPtMjc4T+OW/BqRCR9iuz/aeAhGukN89npcbY/Pxmp
 4YtakdX+gAvnpMakaUjgeBVZdpcm883fc2gmxokxONdJQV8+aDLri7aeclCdtLd9sk2H
 Q5BROvga8mW3fCYR82z8XC5S0+m5rymC8KWE2Vi6cscHPYzGlRHTh7aq62k+UhpXW5tB
 iKvA==
X-Gm-Message-State: AOAM530BMfPZO91v8z3tlc6Eb7vjK5nKkAS+nbeFC77+SORit4GLzBRd
 /lgS5aTo85T0RcI/m7bwtnr6xryASpQ=
X-Google-Smtp-Source: ABdhPJz4UWipIdRt6PxNOTDwOfwrk7eJnwwK6a86IUFB6i6ic7JCZev5vDJ5PI8nXS8Gii4cXd92uw==
X-Received: by 2002:a92:da91:: with SMTP id u17mr3680522iln.242.1634661913850; 
 Tue, 19 Oct 2021 09:45:13 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:13 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Klye Evans <kevans@FreeBSD.org>
Subject: [PATCH 07/24] bsd-user/arm/target_arch_cpu.h: Implment trivial EXCP
 exceptions
Date: Tue, 19 Oct 2021 10:44:30 -0600
Message-Id: <20211019164447.16359-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:25 -0000

Implent EXCP_UDEF, EXCP_DEBUG, EXCP_INTERRUPT, EXCP_ATOMIC and
EXCP_YIELD. The first two generate a signal to the emulated
binary. EXCP_ATOMIC handles atomic operations. The remainder are fancy
nops.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 94c9109c3f..f22384676a 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -47,6 +47,34 @@ static inline void target_cpu_loop(CPUARMState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
         switch (trapnr) {
+        case EXCP_UDEF:
+            {
+                /* See arm/arm/undefined.c undefinedinstruction(); */
+                info.si_addr = env->regs[15];
+                info.si_signo = TARGET_SIGILL;
+                info.si_errno = 0;
+                info.si_code = TARGET_ILL_ILLADR;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
+        case EXCP_DEBUG:
+            {
+
+                info.si_signo = TARGET_SIGTRAP;
+                info.si_errno = 0;
+                info.si_code = TARGET_TRAP_BRKPT;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+        case EXCP_ATOMIC:
+            cpu_exec_step_atomic(cs);
+            break;
+        case EXCP_YIELD:
+            /* nothing to do here for user-mode, just resume guest code */
+            break;
         default:
             fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
                     trapnr);
-- 
2.32.0


