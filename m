Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFl-0000lj-0F
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF7-0000Ly-HA
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:38 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEt-0000RY-G7
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:34 -0400
Received: by mail-io1-xd32.google.com with SMTP id x1so21100754iof.7
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6nGgWFIo7ezMIOimV7TlzBVMBOdct1aOJnGR3rJ9Fvg=;
 b=0v2Ng0BPQe1xYP1PwUgwzNZndxEYQmBB7pc7E0QtyfqcCcl9+ezKQAfx9+o2VM4weD
 d4o0AAX+lIuv0Uvu70g6PmXc95TBjCDQD5ZPb+nTU5X8QNP44qWn2Kad4l2Zxy4NJSUr
 Xqw02KLlV3nNI5qnkvKCeeKV3ZSXPdVHJP6ZyFl+Br0keesMZ3PZGIWpo+RR8gS8CFn3
 rH2gfmTWvp705wocBLiiNtoasu7arseqZv4MONfqcf8vBg+2KW9h57OCnWC+K4p61pul
 Z9tUvU9xm2wyQ+B2t6NvuKvHXTMo72CiF7WZwRkBu72oMf9GNbkDMcjEWrBaAN8bTjlU
 pRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6nGgWFIo7ezMIOimV7TlzBVMBOdct1aOJnGR3rJ9Fvg=;
 b=m0bkL86HCeMr986ya1mtgxEh8OnqQC8cgdI90D4Sz4EiMcprUHwaAA1ITtUBgLu3Ie
 umhtxg+vd1/WjtmyGrBxbxHhoZVKl57p71Zxw3NbYeFf3CgFu/6gq49B7ldBifkXGSQG
 zT2pULFdBm5ytPvRo0BMTVU1mxDruEeLFE9Jq+5x0TN7fGOB0GU1aMko54OufknXho2C
 eYZ1uXDMqWlUTTpf0Tq4TozaJDY/6swYPcYckyQuRJG5+D48yZmEO3aFz+cOYSHADA0U
 uv+kbHI9nh8ecrFdDsZpPjhrQZjjNRsTcXtvYTRqBdnGVmORM9hAc9by4pDUzN+53pLo
 dQfw==
X-Gm-Message-State: AOAM5325dlzSRak4fKTLZbeEBkBNqaCFDK5u1vzZzN4k+8PFXKMZN0q8
 MEY1HmebOAGrYdWKvPYpRsM06mUxK5ZOPQ==
X-Google-Smtp-Source: ABdhPJwDLa3EVQZjgY2Rz9rCTYOEr4+G83kb9l2234VtZ8zSJ4P4bg9kUgbbftdYdA31QIJBqikvcQ==
X-Received: by 2002:a05:6638:1390:: with SMTP id
 w16mr5112894jad.1.1634661922565; 
 Tue, 19 Oct 2021 09:45:22 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:22 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Klye Evans <kevans@FreeBSD.org>
Subject: [PATCH 16/24] bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
Date: Tue, 19 Oct 2021 10:44:39 -0600
Message-Id: <20211019164447.16359-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:39 -0000

Implement the extended HW capabilities for HWCAP2.

Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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
2.32.0


