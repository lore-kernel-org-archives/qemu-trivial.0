Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66Jd-0005yC-Kz
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:39:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ij-0005KR-0b
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:13 -0500
Received: from [2607:f8b0:4864:20::135] (port=42622
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ie-0003Q8-7y
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:06 -0500
Received: by mail-il1-x135.google.com with SMTP id 9so6474718ill.9
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CM117LpYpXND7JkdncohCCBAU91EayOUZoRKvmUOZBw=;
 b=2aFFLW5FyTGUM/6C2u+gQakccnyNVzfv6JLape/JXGsEN/LlDCL0PfzFFgbF0WOk7J
 rMJdF2/ca6G1jxri8E9rc2+76KVfIhyLdIiH4OUi3xh7UCXn1jgB3gGG0irI9KsQPoTn
 LBEkIszjbMXAkcggLTG9DqtHW80B/CoCQRAbScLFVROSjEKl4fi4Y8vIRcZG38TJJX4a
 K5jfaTv/3KGuF8Rq32JmKAOPmmlRS2+pJ8RG9NtAzZVq5DE6gN2LT/37OCfgEfHV8A7S
 AQdcJJIsueszBSqfNZxQ2TYm0YUHexwpejtVEwEj52rBc8FpzjCSwXrJ4o3F6b0ZwmBV
 b4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CM117LpYpXND7JkdncohCCBAU91EayOUZoRKvmUOZBw=;
 b=O2MXPSdFYZnqYtrcz9fCyNYiVZl2ADVMi2IumwIJcJeC2EacIHHvXwBqQulzI4c1gD
 SSxJo/wjlQMCm7BfmT8W9Hne2Sb923o9ofm9AE2HK1RSBbYx3k8GOn3hnYmx3c5o1zpA
 sV53ZSelpRB1pl1cD46j84f/jbb5KTygLH08uO472FdYA+EXWuUbUcfcYB2PdyJqnYjM
 +b8XIRH+b7/NOJO5LGPKXkd5yEf74u6gLb5NYZEeTwWbOLBHscLjmW3iAviPGIEvlWZX
 HEfaAdIfHzTzenP/0ZuSCeJPbq8zCgmadj/9tYqS63sflvDa0/LPT5pGe2rCEXxiKgOD
 YSKA==
X-Gm-Message-State: AOAM531SyeawW9AxI5PwxtA4IwVgduHHJXpYRPzEXEmDHseWwA1JVbxU
 6EfyHuuDM6y1WYyajRy27eptCQ==
X-Google-Smtp-Source: ABdhPJx9bBU2xS0yXTG4BTSzHnm42K3nlhO5wIbbgVsKPaCwNxIm/bF9tl9Bb9gafrb1QsiDGqF/TQ==
X-Received: by 2002:a05:6e02:164c:: with SMTP id
 v12mr2353552ilu.49.1641627482269; 
 Fri, 07 Jan 2022 23:38:02 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:01 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Kyle Evans <kevans@FreeBSD.org>,
 Olivier Houchard <cognet@ci0.org>, Stacey Son <sson@FreeBSD.org>
Subject: [PULL 20/37] bsd-user/arm/target_arch_cpu.h: Implement data abort
 exceptions
Date: Sat,  8 Jan 2022 00:37:20 -0700
Message-Id: <20220108073737.5959-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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
index 9f9b380b137..905a5ffaffa 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -65,6 +65,17 @@ static inline void target_cpu_loop(CPUARMState *env)
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
2.33.1


