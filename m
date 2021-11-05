Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmG-0005I9-3J
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplx-0004SB-Vi
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:10 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplu-00049H-DL
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:09 -0400
Received: by mail-io1-xd31.google.com with SMTP id v65so9301792ioe.5
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IfRWeGYD+0hbc23c7Edg1M5XjxcHd+iZ98b19hdHbHg=;
 b=IhcYbX5abXFL8PzO6fye0GhR32iHsBReyOxGNf/pTJNi9mstsrcv3CgMqe7K2cPms/
 7CQJbm6SA7Ac3LuV6fDBfYaSw2nk8Cl5KL6KTKjgJOWpZYnJZrTdKEcRXdKoHxn/hOkq
 8gE3ZfTSrGQPJrnu1+v3mRcfft4spZ2GZoDI1Q/8BkMMR3zSbMoD6RJiGwOoUry3JYUU
 imiSmnn/F+B7PyaX49gBfV8M/OS9yoZbp1ZMawlj0hvwjQ4kIC7zVKTp9eqobdG2fpEQ
 VI7T1rE08gPpEus/Mo1KfqAW4/MhOanMf9tsuZs4k/O223Z2pRReqf+q230KMA6vvv6O
 uamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IfRWeGYD+0hbc23c7Edg1M5XjxcHd+iZ98b19hdHbHg=;
 b=FltYnMqdab3Mkdd7UwurI2a8LQpxUB2xWRn5ZEjv0/ZztcpUw2jKdtHddYrIp8Qjtp
 1n2MimPWa6W5D63uQgIfhujgSCvGDX72vSUw+wUS6r2J8VXXOYkO5HqMzhEXDe+loDeZ
 aCoEJ3CzZVj4X1Thq7yfM9W2BT+adv/cFpExRRK6ZrLBqW1PA5Miq+l+pM7GhQDYPNCh
 DLsgWIFppkYBCGDtPJgRqWm2veofYNCMviXWVm0Fu7afhbUq0oiG6AMt10dka7hev4Zg
 vPqyBYbXFrvTmVmsLOrB2DWEMKKKkTbWxqMdPGqIXyNKNYWUUbf7QK+tSrXn1Yt7mV+d
 AWDw==
X-Gm-Message-State: AOAM5316wW0yboTuT2nRTlSy5Df1hORhkj/XMVL/q/Z2FsRFmJpowxJd
 kGGhh96Dc0RygXrEVWz6OAjWOw==
X-Google-Smtp-Source: ABdhPJyOymMXn+1riwIqYgIiXFhlwjQ4xqOySg02neCZZGhb/AHOIUrEA1fLfY671M/zDA6/8gthdw==
X-Received: by 2002:a05:6638:d16:: with SMTP id
 q22mr7146028jaj.35.1636082405556; 
 Thu, 04 Nov 2021 20:20:05 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:05 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Kyle Evans <kevans@FreeBSD.org>,
 Olivier Houchard <cognet@ci0.org>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v4 19/36] bsd-user/arm/target_arch_cpu.h: Implement data abort
 exceptions
Date: Thu,  4 Nov 2021 21:19:00 -0600
Message-Id: <20211105031917.87837-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:10 -0000

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
index 9f9b380b13..905a5ffaff 100644
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
2.33.0


