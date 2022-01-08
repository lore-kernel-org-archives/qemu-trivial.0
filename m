Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66J2-0005fK-R2
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:38:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Io-0005NN-8U
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:15 -0500
Received: from [2607:f8b0:4864:20::d33] (port=35707
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Il-0003Sb-T2
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:13 -0500
Received: by mail-io1-xd33.google.com with SMTP id y70so10125199iof.2
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGafu069XHHYypYBdA9I4L4GZtYRvDK9ebq4zTQT5yc=;
 b=3OYuVO4vi5T5ma2n302/zq3+/PyhsjpmA4hYm3zVcawmfhTgCr/nd+mr5BTHU6WxDB
 1G+c1D8EyzupbWcla3ADfxRRMS1a7BjhedsZbnN8HWPCvGyDKPiHsm/FE4UI+sf6nZ5b
 ZUhQ+gnwS5F5mfPuDXZl28IT2GblcL9OwCqj7T5BIyvvwXtLOkQEwZxy/gRY60s8Wjr3
 GeQUtQ/Z4bmFUgC6aArsKxPjV31ymxGHhT0r1j4bihLvIjThrLGUshO6GwHDq2zQNZOS
 SW5tkJCfh+fk2h8ONwJvJoVlJIakst8IQ/7IlMvgA+1yn3FKJj0S7Cnad163/MGJNdDl
 uzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGafu069XHHYypYBdA9I4L4GZtYRvDK9ebq4zTQT5yc=;
 b=ICZCaLaBdG0E2mYCReMrN5wnOA26/MeWThyBZaQ41IRsasDyTAbeY4q60ehCIUOifo
 AHOAz4nBe4PryPWYrOobrUei/D8iBZ6GPeYTJUZzv9bfSeswucNh5uXBXHXehAqZKmoG
 58UXofqiWjldhVwmpQNj5dawPBefSgd2GEizSOoceHVCaycy88f5hqjf2y/ObHPXh7rJ
 uj06DFNuTBAVqEWmm45LY1AcyIF6+K9n//K9k0BD801+LAWO3uNVMQ5dUb0Bma8dUtR7
 Ul8hM8sczsyboF7/knySyGF4Ftpy4m2kNbu1s6krji7z0YGzPGEUyVe/WFZ2n3bDAvD7
 KCFw==
X-Gm-Message-State: AOAM532HREgNlA/Snnad2kHM2xXMEpsa/n5zMDqi2wpsl8+V4zRALU7Y
 SeRSoWbPhAEpwfN25xa5sAiSDA==
X-Google-Smtp-Source: ABdhPJzzEeX/ANNBDdKf7nSDwYlyni9OGifrHxbQ9XjBP9l/4YcB1RNQTMjLXLEhnqJZUfKFt5CcyQ==
X-Received: by 2002:a05:6602:2e8f:: with SMTP id
 m15mr5544661iow.7.1641627489879; 
 Fri, 07 Jan 2022 23:38:09 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:09 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Kyle Evans <kevans@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PULL 27/37] bsd-user/arm/target_arch_elf.h: arm get hwcap
Date: Sat,  8 Jan 2022 00:37:27 -0700
Message-Id: <20220108073737.5959-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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

Implement get_elf_hwcap to get the first word of hardware capabilities.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_elf.h | 72 +++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
index 15b5c66511f..02d25b89264 100644
--- a/bsd-user/arm/target_arch_elf.h
+++ b/bsd-user/arm/target_arch_elf.h
@@ -31,6 +31,76 @@
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
-#define ELF_HWCAP 0
+#define ELF_HWCAP get_elf_hwcap()
+
+#define GET_FEATURE(feat, hwcap) \
+    do { if (arm_feature(&cpu->env, feat)) { hwcaps |= hwcap; } } while (0)
+
+#define GET_FEATURE_ID(feat, hwcap) \
+    do { if (cpu_isar_feature(feat, cpu)) { hwcaps |= hwcap; } } while (0)
+
+enum {
+    ARM_HWCAP_ARM_SWP       = 1 << 0,
+    ARM_HWCAP_ARM_HALF      = 1 << 1,
+    ARM_HWCAP_ARM_THUMB     = 1 << 2,
+    ARM_HWCAP_ARM_26BIT     = 1 << 3,
+    ARM_HWCAP_ARM_FAST_MULT = 1 << 4,
+    ARM_HWCAP_ARM_FPA       = 1 << 5,
+    ARM_HWCAP_ARM_VFP       = 1 << 6,
+    ARM_HWCAP_ARM_EDSP      = 1 << 7,
+    ARM_HWCAP_ARM_JAVA      = 1 << 8,
+    ARM_HWCAP_ARM_IWMMXT    = 1 << 9,
+    ARM_HWCAP_ARM_CRUNCH    = 1 << 10,
+    ARM_HWCAP_ARM_THUMBEE   = 1 << 11,
+    ARM_HWCAP_ARM_NEON      = 1 << 12,
+    ARM_HWCAP_ARM_VFPv3     = 1 << 13,
+    ARM_HWCAP_ARM_VFPv3D16  = 1 << 14,
+    ARM_HWCAP_ARM_TLS       = 1 << 15,
+    ARM_HWCAP_ARM_VFPv4     = 1 << 16,
+    ARM_HWCAP_ARM_IDIVA     = 1 << 17,
+    ARM_HWCAP_ARM_IDIVT     = 1 << 18,
+    ARM_HWCAP_ARM_VFPD32    = 1 << 19,
+    ARM_HWCAP_ARM_LPAE      = 1 << 20,
+    ARM_HWCAP_ARM_EVTSTRM   = 1 << 21,
+};
+
+static uint32_t get_elf_hwcap(void)
+{
+    ARMCPU *cpu = ARM_CPU(thread_cpu);
+    uint32_t hwcaps = 0;
+
+    hwcaps |= ARM_HWCAP_ARM_SWP;
+    hwcaps |= ARM_HWCAP_ARM_HALF;
+    hwcaps |= ARM_HWCAP_ARM_THUMB;
+    hwcaps |= ARM_HWCAP_ARM_FAST_MULT;
+
+    /* probe for the extra features */
+    /* EDSP is in v5TE and above */
+    GET_FEATURE(ARM_FEATURE_V5, ARM_HWCAP_ARM_EDSP);
+    GET_FEATURE(ARM_FEATURE_IWMMXT, ARM_HWCAP_ARM_IWMMXT);
+    GET_FEATURE(ARM_FEATURE_THUMB2EE, ARM_HWCAP_ARM_THUMBEE);
+    GET_FEATURE(ARM_FEATURE_NEON, ARM_HWCAP_ARM_NEON);
+    GET_FEATURE(ARM_FEATURE_V6K, ARM_HWCAP_ARM_TLS);
+    GET_FEATURE(ARM_FEATURE_LPAE, ARM_HWCAP_ARM_LPAE);
+    GET_FEATURE_ID(aa32_arm_div, ARM_HWCAP_ARM_IDIVA);
+    GET_FEATURE_ID(aa32_thumb_div, ARM_HWCAP_ARM_IDIVT);
+    GET_FEATURE_ID(aa32_vfp, ARM_HWCAP_ARM_VFP);
+
+    if (cpu_isar_feature(aa32_fpsp_v3, cpu) ||
+        cpu_isar_feature(aa32_fpdp_v3, cpu)) {
+        hwcaps |= ARM_HWCAP_ARM_VFPv3;
+        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
+            hwcaps |= ARM_HWCAP_ARM_VFPD32;
+        } else {
+            hwcaps |= ARM_HWCAP_ARM_VFPv3D16;
+        }
+    }
+    GET_FEATURE_ID(aa32_simdfmac, ARM_HWCAP_ARM_VFPv4);
+
+    return hwcaps;
+}
+
+#undef GET_FEATURE
+#undef GET_FEATURE_ID
 
 #endif /* _TARGET_ARCH_ELF_H_ */
-- 
2.33.1


