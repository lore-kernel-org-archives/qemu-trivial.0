Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midNo-0006mh-PY
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNi-0006bN-9D
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:18 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:35736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNg-0000yg-Rw
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:17 -0400
Received: by mail-io1-xd36.google.com with SMTP id c206so5499009iof.2
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IfRWeGYD+0hbc23c7Edg1M5XjxcHd+iZ98b19hdHbHg=;
 b=LeP6zOjpqzmz7oAA6qpb8Uk9asUMapdUePjyRhueMQV+kiwVZEfH0Y16l4ZEQ/1s2a
 kHI6gDFepgYq0TEWkr3tmZVxEfOYr8FcH0stMeO9j1AENaszz57UpSBXQWVHsRsFYtQp
 CxlFHxcvJ1GMkICPXmcKWyujAQIcdvCOE4y39W7+E1pxlWy3Ei6jgYom4DIXV8oL0rVN
 Ej1Pe7H+DQybd4G2K66whFX1PMQRNoIub0xDP6CeCnlT1V80qDt+O+cOuna1zSA3ZBSg
 d5sh8f8BeYmnG4umzgpjJqdC8Rrll7bU14ay+pwa7toWa45yXI/GMVATyIvvkSP9OQdQ
 IftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IfRWeGYD+0hbc23c7Edg1M5XjxcHd+iZ98b19hdHbHg=;
 b=fa4ilihH2W6s33IIUTbhuOH7ZuRAIBW+wmetZbBvlxnYM+8beynvQ6E9Xyzzr4Bd51
 7/5mrTwQjcRPSQATIy4GLJ2plnp3DarZdex3nM93boBYeZF2EXDt4crRt3h46xqVPZwf
 TnyRI+N8Xz+ihArTnXv5jOa3hkYvCTW8uNcm+EEsmRHrJdQGSBXAsqKU1v0FrQ0/1xCj
 XZxMcMhfqEQWAOoc6DHzTeyApad8ZBK8OK4MUZBksg36h5mbmbrQSA3CU5958Z8+puXs
 bqh3igkeGsFjYuv1AWqFc/BmLB9UehGDJYfrTSIy50uCPsNs9gVivlghl9efzlzx9iZR
 0XsQ==
X-Gm-Message-State: AOAM530gyn666iSSP6Au1jQmi7HsF7A9K7rM3WX5uU8id2F4Pp0f7Z6X
 pydZ07czuSaJIxtBfkZKRrCcRg==
X-Google-Smtp-Source: ABdhPJwq8ymXxE1ym0hZw9FLXwwgOieua/vFimL1af6IM+AaaHmuei1o10IHt9STbPNq/9pSrZhBag==
X-Received: by 2002:a5d:9d85:: with SMTP id ay5mr26323164iob.203.1636034774788; 
 Thu, 04 Nov 2021 07:06:14 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:14 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@FreeBSD.org>, Olivier Houchard <cognet@ci0.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v3 08/29] bsd-user/arm/target_arch_cpu.h: Implement data abort
 exceptions
Date: Thu,  4 Nov 2021 08:05:15 -0600
Message-Id: <20211104140536.42573-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:18 -0000

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


