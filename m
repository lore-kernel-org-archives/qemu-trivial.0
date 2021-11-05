Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmd-0005pE-1m
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipmD-000571-Mq
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:25 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipmB-0004Gf-2p
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:25 -0400
Received: by mail-il1-x12e.google.com with SMTP id x9so8253425ilu.6
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZMgOxsjywTPo5T1ggnwREDuM1RtRZU+bSRes/2xG2MQ=;
 b=3y+IE4TOuz1KfEUs0jSJrledmYnS2yVUWhJ6472jQ0m0tp1qEh9LuiS+EQC0cBBYtl
 OxtC0DitJFh+3BBiNWub7B4eZPiyWvfgiTMf6DTpk077ZA+UvAJa92dqYzAsWoFbbsHY
 igXiwZHcn6fBwr6wtiD2fXxGCOhgGFTL9Q68lggy4rMugecL6VcRRhB7oUlDWGvR3mbR
 pZtE74i6/6LJxGVI1ywYZi6Cm2gAfvv/wa6YITu3l+d3gKGirWmzp567+Wh12Nd2C4iJ
 q7A9JEXGa8krSkL5ASGwjofqhZcHG9Y6vFYVfIe0WwuU01aQIsfEcbRvP1p+tWbNi08j
 j+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZMgOxsjywTPo5T1ggnwREDuM1RtRZU+bSRes/2xG2MQ=;
 b=Dtz7jmgt8VkM3q3CrEDJfictylr+LP2uDbinoVcLueAcdh1y+qH3sv9XmSmkDpU8md
 GVQnwU/xlD2XQ0JN+7oIDCN6j+ECbK6hqrBgkx0lHoPXQuHqr5wgv5J6RNr9lzkEEjqj
 7we3AuuExWu/++IVvgWjFQaB29bS1ti2oQS76o2K//EPO0jTrZGE8uo+rIQooTmELeG3
 ViO3YkjvUeD2NCGFyjaCQbp5EFiLfZVYGSEYeUhTc9yLH4xvdI1s2ctRBiEIFy+VClco
 /hU1nhw5A+YzAkzsqtPoQZXt3i+TKuItF2XePr0vFunmNkIm+n2iUZCCGgSujs4TnjYz
 ASow==
X-Gm-Message-State: AOAM533ID9HdLOfcsJ+6a13uCftGhv6Sze1jvSdxH70diQvl+l1f3XmI
 Au1hzliX6u5rVjMvGtK/HL8/JQ==
X-Google-Smtp-Source: ABdhPJzfhOe3vO8HAy4JrnUHGqPoqgxThJgg91196lu8b4X4/y/AGylrCUmuLA/6/WGjSPaxHRe+MQ==
X-Received: by 2002:a92:cd84:: with SMTP id r4mr25038479ilb.137.1636082421660; 
 Thu, 04 Nov 2021 20:20:21 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:21 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v4 34/36] bsd-user/arm/target_arch_signal.c: arm
 get_ucontext_sigreturn
Date: Thu,  4 Nov 2021 21:19:15 -0600
Message-Id: <20211105031917.87837-35-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:26 -0000

Update ucontext to implement sigreturn.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c             | 9 +++++++++
 bsd-user/arm/target_arch_signal.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index d32e3b4560..344ce69cea 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -188,3 +188,12 @@ abi_long set_mcontext(CPUARMState *env, target_mcontext_t *mcp, int srflag)
 
     return err;
 }
+
+/* Compare to arm/arm/machdep.c sys_sigreturn() */
+abi_long get_ucontext_sigreturn(CPUARMState *env, abi_ulong target_sf,
+                                abi_ulong *target_uc)
+{
+    *target_uc = target_sf;
+
+    return 0;
+}
diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 83ecfaafef..5a4a9d5345 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -91,5 +91,7 @@ abi_long set_sigtramp_args(CPUARMState *regs, int sig,
                            struct target_sigaction *ka);
 abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp, int flags);
 abi_long set_mcontext(CPUARMState *regs, target_mcontext_t *mcp, int srflag);
+abi_long get_ucontext_sigreturn(CPUARMState *regs, abi_ulong target_sf,
+                                abi_ulong *target_uc);
 
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


