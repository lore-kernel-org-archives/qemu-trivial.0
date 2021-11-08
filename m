Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvnv-0003jb-LD
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:58:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnt-0003eW-Os
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:42 -0500
Received: from [2607:f8b0:4864:20::d31] (port=46721
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvns-0006uD-11
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:41 -0500
Received: by mail-io1-xd31.google.com with SMTP id k22so4075402iol.13
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1XrwZ0o7hRgTEhkk9E1BQTq9616nNWJfCEFdNAWs4w=;
 b=iHtHR3+L3TPKMgvw29wWTsuJmwq/CPpAaT3lOZGdLFgE648Hpw3GP/8Cni2Xsh6A62
 XfnGsxoFiLrEyxmfIwttGim2RCFqlXqiByVUPWdi7Gzd3Ydfp4vvUZq3lfXBjdvGUG8w
 CDTTAGDVf4FoGAw5bQwn8MjtlK+FW8gyypZh8zjR6AjNlNugiy7JE1O7rFzHfmzgbDHt
 Xhd+8q4m/hep/KNk7GoW5DwQQ0xRiTXOFeWEBCaPggEBmKqHl0qAny+D7k/hfFzZaaG1
 evnMgOXLpPJTW4sNM+fcKmOvJJcgnL2fB9VbarW1p/UdeCPwRVDbxjLI/gi2LiHrqjw2
 YoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1XrwZ0o7hRgTEhkk9E1BQTq9616nNWJfCEFdNAWs4w=;
 b=v75JIthc2KKZ74ulzy6XgnEvrBbYAA++RPLY5/b0hyxjF6gFF+sCiCJvDxS1CacSKv
 NdXxbVF7AfSB4tktssJNW/csz69x9JYvLct/htJ9YSzm+4n6wNbiqpJQshyodhp84KfZ
 RB3DCY9wjGj83QiJFOaO8H3RErL20240osM6lBdyjUDWY0aEI18gYex9OFnUHj2WxG+J
 97txaLXYnUTQFWv/kBZqkUUrlViTdbPPvzo9c8jawG4IJYJeDqcC1zIS14ZSs3IRGLOQ
 HkZ2sUBfFZmgAIIa016Wxkz91ZMg1fykheeQvA3VOC5sd++y0Qa6DL5M38/Dt/j2zAJ1
 W/og==
X-Gm-Message-State: AOAM533zcgz02Aan9ea3X4S9qjx189AyeMkTZuoq1m/YeWcIpdx7gJDP
 XlsZmEE+sFUmjt8X3ereZ2LP+fJOBenfKw==
X-Google-Smtp-Source: ABdhPJzngoF5WBay+ClD50mdExal44tbM6pudV5iaWjZXs7htVFEPy69H4qABd+0OTWl94gdBN0cTA==
X-Received: by 2002:a92:c261:: with SMTP id h1mr33309867ild.291.1636343556337; 
 Sun, 07 Nov 2021 19:52:36 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:36 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v5 28/37] bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
Date: Sun,  7 Nov 2021 20:51:27 -0700
Message-Id: <20211108035136.43687-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 03:58:42 -0000

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


