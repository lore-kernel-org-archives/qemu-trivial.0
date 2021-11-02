Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2et-0006sE-84
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2er-0006k4-6n
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:33 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2en-0002nD-FE
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:32 -0400
Received: by mail-io1-xd34.google.com with SMTP id v65so584356ioe.5
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWk7jgZj/MHyj5WnW05WLTLrlZ4T/i5ovr49MB5ozuI=;
 b=u+k0FlXwN3UBJDubPLSZYDWuSnoaXqUmWKX0o3cxu8JSvcvNU2eaDQOdL1dKvAPNy4
 RoFq0MH2c+Lksl1TGjlqaQczv7mN+rVT/7ClCOS9ZcvlH+aPDRop1gRvKgX/Q2YWhBOH
 N9oUY0dQNRgfNg0sIDcdV+5nSUClHFN30g42GYzY3itPlWUekwIhzUOhYE58moZIUSo9
 iwODhHwzAOSRxJ+pldKXRl5DFmycgS7fP4fJUfjRlSleNFvgEZP1oZTsZ1qhcwyG4XQo
 ULExiPjmLeLZKJHFH9w1murND3JC+r/zAKg7zH2w7dh32KDRZy126Qnk++UPgKMIE3Ml
 AWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWk7jgZj/MHyj5WnW05WLTLrlZ4T/i5ovr49MB5ozuI=;
 b=A6nKIdNLzgSdopIoc4UXMrZEd9m691ubiUOCwlErFgZfOL2bx6BG7LBMFky3KtCi5O
 9AcGQCFk8FKRtsFfLK6GD51oNZ3gr1PNFDz+naK7+7gaRYMiUHKBcfriVGt0Pw4nmvNZ
 vVg5drBqx9+J5/ZPo2DvjXmYjCddPzrRK8dZxVAOJIrcT2YbxqDcTRYHpJKbKdrOtvtd
 LcZUmwXYlUVABw+yonVHVsEHnP6JNxSTOxps4eo+5x2O+hroHFIoPNP9kgRUUOLoeGOY
 roiAW4pIMB/6w0U/B5FEiI9UXEf1saFH4GcayliuoOKLLOXHRLkuO/e44ZHhhKQBlyHr
 CaQQ==
X-Gm-Message-State: AOAM5325TNkGCsH42gp/5ZjMONOXBTPMgykgICif0pnGUI1TfL1/Qnvm
 xgR8tXeGrhVjuHFxhFEVVijaF+DRtZGLYA==
X-Google-Smtp-Source: ABdhPJwFbeVxJrdV7whbdOQg9rJFIaLVXeUe7OWWuGNDFXuq+ykGlmw9sUS5LvUbXszKbBxmnU7eMA==
X-Received: by 2002:a05:6602:2b0b:: with SMTP id
 p11mr28960325iov.62.1635893608383; 
 Tue, 02 Nov 2021 15:53:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Kyle Evans <kevans@FreeBSD.org>,
 Olivier Houchard <cognet@ci0.org>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 09/30] bsd-user/arm/target_arch_cpu.h: Implement data abort
 exceptions
Date: Tue,  2 Nov 2021 16:52:27 -0600
Message-Id: <20211102225248.52999-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:33 -0000

Implement EXCP_PREFETCH_ABORT AND EXCP_DATA_ABORT. Both of these data
exceptions cause a SIGSEGV.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Olivier Houchard <cognet@ci0.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 609b78b4e2..cdb9440a65 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -90,6 +90,17 @@ static inline void target_cpu_loop(CPUARMState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
+        case EXCP_PREFETCH_ABORT:
+            /* See arm/arm/trap.c prefetch_abort_handler() */
+        case EXCP_DATA_ABORT:
+            /* See arm/arm/trap.c data_abort_handler() */
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            /* XXX: check env->error_code */
+            info.si_code = 0;
+            info.si_addr = env->exception.vaddress;
+            queue_signal(env, info.si_signo, &info);
+            break;
         case EXCP_DEBUG:
             {
 
-- 
2.33.0


