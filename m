Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmB-0004zW-N5
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplm-0004Kh-K3
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:00 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:36682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplj-00045i-VQ
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:58 -0400
Received: by mail-il1-x130.google.com with SMTP id l8so8272416ilv.3
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZNPpOkk6VPcljeu7Kbkpd5a4MaTSH5kT5BRcPYHMyg=;
 b=5FE3VFxv4iXD64ueP7dHU+oLzLTy+EQhywD59obEdthcS/Srme8FYPb2QVBmFxLp1l
 B+lB9k/W5mRmgphVDyF7MmQS11GSfiS+wmzZQb0hUNnnVGabiaHpFfok8Yy2XzWJcxgL
 LTCGDSbK8QWYWE42xog8rnQq6DYBMo+aJkXDT9raw67X+IMJvPuqkjhJkIyYggoHW4SF
 zxfg9qy6576ogoFZjuSSjdC8XhVTTagARW3yvev/w+5+yZ2efeTZzefmEi+cwEGrlJMF
 eZljbRFYm5UoIvP7V1iO74+4FgxVgSYHz0uGDNKCvPtb2FiSicLLmoE3324ggqoNS3xJ
 EIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZNPpOkk6VPcljeu7Kbkpd5a4MaTSH5kT5BRcPYHMyg=;
 b=h3T1elM0qadXKnZzYU2Egk1h0hWt/cOa7TeXibbUgsMYl9nc3TJTsebG7Y3sfNBFuZ
 oYTd3S6WQ+Rzo5OlYtnPDWCqFvz4fFAw7FWh4cF4PZi4AKnfCZkcp0Oe8HqYVJTciX+b
 d3l3HXCTPWT/bdwKmFSWgtgHIz6s/k6HS4KcaIzOy4C7/vR+1MHYYuLJx9w0gDVQGtnM
 PO1Z2LAtRdMscIRIcgVS7n9oDjl2i4fpd64IuFOp5jcETs4IZZ6DxRQqxADJDC5d77dj
 gqXQ4+cvPtbJ5RMDtgTYwfx6qlbL80Y8AaJpbJS/x6gqYuMnscmoPHe7HcDPzTeNPU6K
 Wjvw==
X-Gm-Message-State: AOAM5332vjV0jIOXOFpWYvRG2DoclR0M99hpEk0GWNvsh7hTfeQYSMX/
 NUhsluD2/Sh8+lxbimU81TtYQg==
X-Google-Smtp-Source: ABdhPJyEM8IKOEywCxlo3LSQUFQFAfEN5NnfYYewtWDfQ5fOv7EaItxxGjPQp2e4zA8On3L/tzTAyg==
X-Received: by 2002:a05:6e02:18c5:: with SMTP id
 s5mr5031515ilu.193.1636082394749; 
 Thu, 04 Nov 2021 20:19:54 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:54 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v4 09/36] bsd-user/x86_64/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Thu,  4 Nov 2021 21:18:50 -0600
Message-Id: <20211105031917.87837-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:00 -0000

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 55f742b0a8..e84aff948c 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -30,14 +30,7 @@
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-typedef struct target_ucontext {
-    target_sigset_t   uc_sigmask;
-    target_mcontext_t uc_mcontext;
-    abi_ulong         uc_link;
-    target_stack_t    uc_stack;
-    int32_t           uc_flags;
-    int32_t         __spare__[4];
-} target_ucontext_t;
+#include "target_os_ucontext.h"
 
 struct target_sigframe {
     abi_ulong   sf_signum;
-- 
2.33.0


