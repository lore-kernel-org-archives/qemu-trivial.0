Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66KV-0006R1-Qr
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:39:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66In-0005M7-VA
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:15 -0500
Received: from [2607:f8b0:4864:20::12e] (port=40861
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Il-0003Sp-TL
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:13 -0500
Received: by mail-il1-x12e.google.com with SMTP id c4so6477799iln.7
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C7KyPYzl/HUi0qh8zJoH8Xb7K1UuKIwCMgwQW4DXlog=;
 b=i/fE096/gEVdrerUB9NpQbfFIvjLJH1vlJ6TV+HYTMi8ThOmqGcNnoCxUJloGtS6PR
 20IabUM/8xq1bm0gMlMBoWxTLC8MIgmrCXcIzFelrhONn7iDv95BBLX8OLiTs9HBotXW
 eKlWwg4UX6X/fpU9xcomSHmsam/dpqLLYGJj4smAYKBs3sBPasNKd2ALN93cDOTf03yA
 9unoMK1LFU6pvPEPq5Y3VxH+VEoZSc90cdlynYzq/GlRIUwf1y9hO41g7+VvwlSF4FEC
 0FIOmDD+VuYOfcypfADCvqowpSyJAxTmQ6vI57c/W7RTxOAcPZfPFFc6/jyE25LS8Q9B
 RNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C7KyPYzl/HUi0qh8zJoH8Xb7K1UuKIwCMgwQW4DXlog=;
 b=ny8q1pAOtIjC7GzpctJCoollcNjhMbysXTTaG/rXcz2oeOHr3F4RF2TSXoo/5Efg2d
 439VgUoyM2/8jgdeFEeBmkePqM1Eqzg0uqeUXAWzokABQEwTjPcuq0DkUbpExhX3kvWI
 x13CNg1Q3SXPVHN/E4LnHdoF2Xw+9ilwwHHDAH2xk3JkGh9NcAtFy5Rhb2bw8yQqhJpS
 jSDb78b0ktWpa4SeERRKRZeumDQfWVogYvB9AaMAgXfJ0S1vmbgrOIyEYrWoqP7URQSs
 kNW5Aal4Nz1o3/nKn3zUp+QBz3y4zwagVS5JL8dMoZ7yhPp/1yPC6vMPl9NL16wB9ozB
 apTw==
X-Gm-Message-State: AOAM53339ze1You+4MeUZgP94UFR0VV6YdFQHh/IuoS+d74j36iLac5K
 29O4KF2D1SK42wEYgyXKHLQE3A==
X-Google-Smtp-Source: ABdhPJy3uYWVZVYPYYF8+u7A/qPHfrZV7WRR8R9nhiYvqSw/MdpkwZhJQ6YIKpv9DggTNoLWhtYmyg==
X-Received: by 2002:a05:6e02:5cd:: with SMTP id
 l13mr5735962ils.119.1641627490760; 
 Fri, 07 Jan 2022 23:38:10 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:10 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 28/37] bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
Date: Sat,  8 Jan 2022 00:37:28 -0700
Message-Id: <20220108073737.5959-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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

Implement the extended HW capabilities for HWCAP2.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_elf.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
index 02d25b89264..4a0215d02ed 100644
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
2.33.1


