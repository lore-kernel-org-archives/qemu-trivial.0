Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2f2-0007N7-2U
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f0-0007Hl-Sz
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:42 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:47016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ex-0002r5-Nr
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:42 -0400
Received: by mail-io1-xd2c.google.com with SMTP id i79so273598ioa.13
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1XrwZ0o7hRgTEhkk9E1BQTq9616nNWJfCEFdNAWs4w=;
 b=jQWnxoEziai3SJE6ywkOR4R8P+qr1tU+Ov+7QU1XTo6Z3KuLzt+/wPT10oG4ypqwPj
 glsSLW+FZAB8YIZ5j7GsoOwF2xO7vTgAX/d6h4IEPZ7L5ZGO1jJ9dmd8nPMqpzDSKlZB
 wn/v9oNJiqDH5VOEf55NhaiTuKIk8dQCX7C8WTvoSWaB/dNJeCMx/wRFmvDi9iU6Wmdv
 t4ts1mUCsXCAZgrV4Jn7kIfIYNbsa7cLEvqMA72Cj6vPPE7Z2InKwRFv39NtD8Jx6s1E
 NDN4Ir2TUIzZvgIooexRB+YJOBHWkf+RlT2SXmB7kJvutQQl6hmDxnw3o+YyjB6yrsTs
 zI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1XrwZ0o7hRgTEhkk9E1BQTq9616nNWJfCEFdNAWs4w=;
 b=OI9A3GNDinmZVpaztiCjWLKnfpleUANqfHDRqDn3cusk9FBMkY9pPzUSXgAbDcVY3F
 VqcaYNCQBerCMiko9rGqghbrvctbldhJ89LRho6+/qsQZSwhj84e2Ri9+3arZR3Ssfdp
 D6g9RI89NR9t5W/GdnMYpFsuCgZIqmMBtwPcf3wcJ2eyYLm1T318jrzE1jQZKqxM6qFm
 TgrFnQZByBUwoPamFZr4fusVr51Y+gUY7wuk3WLZD4feZvNV3bnwgmrxZGoLBJwa8904
 CvWSMe4ym5YxMJFsTYtYBkys3wuJqVxeLQh42SYWkPOjhHC268qucbLYGLQ4zmGMejJz
 c4MA==
X-Gm-Message-State: AOAM533bnJhNP4WfmSWEsjM45osXJrBVYssE3tFpT/9iU+Bb0dVHorhJ
 I2Vm03Y5HI4EKWUIODe3m2Ls+A==
X-Google-Smtp-Source: ABdhPJy0s321dQIXr+0Nc2hYhstT1z2z9+xitHUjyDNQ1yrmKBAd8TiN0ZzgNhFlSn629f0OMzyb/w==
X-Received: by 2002:a5d:8ad2:: with SMTP id e18mr28345809iot.144.1635893618027; 
 Tue, 02 Nov 2021 15:53:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:37 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 17/30] bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
Date: Tue,  2 Nov 2021 16:52:35 -0600
Message-Id: <20211102225248.52999-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:43 -0000

Implement the extended HW capabilities for HWCAP2.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_elf.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
index 02d25b8926..4a0215d02e 100644
--- a/bsd-user/arm/target_arch_elf.h
+++ b/bsd-user/arm/target_arch_elf.h
@@ -32,6 +32,7 @@
 #define ELF_EXEC_PAGESIZE       4096
 
 #define ELF_HWCAP get_elf_hwcap()
+#define ELF_HWCAP2 get_elf_hwcap2()
 
 #define GET_FEATURE(feat, hwcap) \
     do { if (arm_feature(&cpu->env, feat)) { hwcaps |= hwcap; } } while (0)
@@ -64,6 +65,14 @@ enum {
     ARM_HWCAP_ARM_EVTSTRM   = 1 << 21,
 };
 
+enum {
+    ARM_HWCAP2_ARM_AES      = 1 << 0,
+    ARM_HWCAP2_ARM_PMULL    = 1 << 1,
+    ARM_HWCAP2_ARM_SHA1     = 1 << 2,
+    ARM_HWCAP2_ARM_SHA2     = 1 << 3,
+    ARM_HWCAP2_ARM_CRC32    = 1 << 4,
+};
+
 static uint32_t get_elf_hwcap(void)
 {
     ARMCPU *cpu = ARM_CPU(thread_cpu);
@@ -100,6 +109,19 @@ static uint32_t get_elf_hwcap(void)
     return hwcaps;
 }
 
+static uint32_t get_elf_hwcap2(void)
+{
+    ARMCPU *cpu = ARM_CPU(thread_cpu);
+    uint32_t hwcaps = 0;
+
+    GET_FEATURE_ID(aa32_aes, ARM_HWCAP2_ARM_AES);
+    GET_FEATURE_ID(aa32_pmull, ARM_HWCAP2_ARM_PMULL);
+    GET_FEATURE_ID(aa32_sha1, ARM_HWCAP2_ARM_SHA1);
+    GET_FEATURE_ID(aa32_sha2, ARM_HWCAP2_ARM_SHA2);
+    GET_FEATURE_ID(aa32_crc32, ARM_HWCAP2_ARM_CRC32);
+    return hwcaps;
+}
+
 #undef GET_FEATURE
 #undef GET_FEATURE_ID
 
-- 
2.33.0


