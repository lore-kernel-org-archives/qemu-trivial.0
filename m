Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvoR-0005U9-5U
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:59:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvoM-0005Re-QK
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:10 -0500
Received: from [2607:f8b0:4864:20::529] (port=36554
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvoK-0000Hc-Tw
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:10 -0500
Received: by mail-pg1-x529.google.com with SMTP id g28so5344758pgg.3
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=NWg8hvgygLV7X0Z/9/qbt0t5ljSc2gzeDWgm7opkV+uGJkXzMLznrT8wTv33qVwOdp
 zPLAxIV8jdoHISZnNed47lIE9ZD4MII+kL8X39zxIoFjEYuBu+JyV69zO561bDr/2X8e
 67osp/w8G50t3cwkALg1Xe23r7qBz/t2p81+g+h4Fp/OhUngNUQVXgbNJT7/yFuH2+oo
 lX092XKuaArXt+StTBq/Y/jhRhtSCgAHC0dkAFHP8DCANZM8yX595WK0aiqvNUY4SUek
 vtjX7WlkN+SRNB5eZm8AIMazmHNk3Xo/4IaGxXx8+J8+4NKcEO0O23Cn1B1L6E+TXPCA
 Bc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=r4FngpleNRSHV8LEAt1w4pLRCJyBQCUtjTrtJSMhzdVppaoYB5JeF4d4ltolK+nvCx
 chBz5U8V3lFHEahRlzZa1CyGtVkybgGrpzwyLDZvUBY2WkdomnUGHC+rA65fGO37PaRb
 NXuAvdI9un2jkMymajHUsGKbU/Fq9ur/TU4+1QaA5NkuTbXuJiMqQQtEzR1005n+0Is7
 5b7z84Q7oIu226J28ny/QsOwWLSYUbihsjpCUdA0YpIe7V6/AnaT3rKtZ3pLZSX86u8g
 EJAxjsHCj5QdaJzrZGfVhuF7/sAnCUlp6tO/7Ia5f3j/M3ys1bj1YOYazAw/uqJhvcTn
 qDGg==
X-Gm-Message-State: AOAM530w4g1a3X+0fpTQHb8Ab+ZzOrf4ah0oLjbMS/QUIrsPUT5YOuJw
 BMHmqlTAzw0IuIdhpnrpcU2IBXfy4aLurA==
X-Google-Smtp-Source: ABdhPJw/cdRn+Sqe7gkyp4UB07/FMKrikH07ryGYIjcP1TZzaplc474UYWhVo0Xtx8bZ+ZY0JjosaQ==
X-Received: by 2002:a92:cd8f:: with SMTP id r15mr45348477ilb.278.1636343545975; 
 Sun, 07 Nov 2021 19:52:25 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:25 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v5 17/37] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
Date: Sun,  7 Nov 2021 20:51:16 -0700
Message-Id: <20211108035136.43687-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=imp@bsdimp.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 08 Nov 2021 03:59:11 -0000

Implement target_cpu_clone_regs to clone the resister state on a fork.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 66215684d6..fa45d9335d 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -36,6 +36,14 @@ static inline void target_cpu_init(CPUARMState *env,
     }
 }
 
+static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
+{
+    if (newsp) {
+        env->regs[13] = newsp;
+    }
+    env->regs[0] = 0;
+}
+
 static inline void target_cpu_reset(CPUArchState *cpu)
 {
 }
-- 
2.33.0


