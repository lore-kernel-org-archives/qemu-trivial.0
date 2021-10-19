Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFe-0000jD-JR
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF3-0000L8-QK
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:35 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:41875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEs-0000Ql-OE
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:33 -0400
Received: by mail-il1-x130.google.com with SMTP id l7so5739421iln.8
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bm4mXXUPPqTFGXZ3HcGuzjVQuLwXQDNteG+QP2nYyas=;
 b=EBaNUcpTgIX6hPxfWvsDDaA23BEPeqJp6+p2ZpCOXi8LFYBT1AYftegtY3p0GFI00f
 uLmnLbyQS8XSO+dQ/d4V7xyP4rfNvlz4qkveQD/yHqd1726WiGuL2SoM80Uo7StOxfkp
 1n2VqmBbFcNwgazS6ibLxBdAmJexHQyg5hizvB35Jf7vM/ZZ1dQ5SyzLZobhRo++h2Uw
 llgnGC0ZdSfiQxWx/7cCstaHqrRYwTwV3oerA7oWrjnyEP+Z6vtIQhvyJBBd+kw7BfqO
 Eo3ujn1nmZbWX660TssK3t1IIe3cdsO36phnu+WF1AMIBD9XC/B46ayg981i0TNcvbNy
 PVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bm4mXXUPPqTFGXZ3HcGuzjVQuLwXQDNteG+QP2nYyas=;
 b=ls1mzniThaFM6hrahqbbxXiejnrRByyGcBVInqPbXdfXr/yKsdldvTI9E7go0zPu8v
 +bx5cAr/DmGIjB8XNsL8gSly238bfTUdPP5OdgMLNefhaZIt+fyjzeyQGGfmvqAq7ShC
 5o4+Q1lgmyLJ2q+i+RzvLNcDy1/FL4dPl03JK66bCzQk9i8uUwgxM5x+tWxJziASAZ8e
 8OP4zfOzbhR428MY6AbavwbzQo0trtPPgKhlHeZSUVCPtZ2qWpAbj8Qz9RRHoKUl3ct7
 KuAn3cGEhmA6kxPo/j18wU/REHIgKK0kPh6lynJC7KeXlviujI3RVfMbn1TB17Cmd58l
 0RTA==
X-Gm-Message-State: AOAM531MVGM/OmTpgIKT4gsaaS/PFwCsWJqHoLIqDZEJ0UptvlitO0lM
 ylrKPCrv6pBiQrxnzkvuMHH6FA==
X-Google-Smtp-Source: ABdhPJy1N29tIFvxrh4WUbjdF3FiQup2BhDVW8BdcgfS9d+9rkrmMFqDFsvBK6giwf7LZIkLnkX0Dg==
X-Received: by 2002:a05:6e02:1a2d:: with SMTP id
 g13mr18932032ile.123.1634661921395; 
 Tue, 19 Oct 2021 09:45:21 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Klye Evans <kevans@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 15/24] bsd-user/arm/target_arch_elf.h: arm get hwcap
Date: Tue, 19 Oct 2021 10:44:38 -0600
Message-Id: <20211019164447.16359-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:35 -0000

Implement get_elf_hwcap to get the first word of hardware capabilities.

Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_elf.h | 72 +++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
index 15b5c66511..02d25b8926 100644
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
2.32.0


