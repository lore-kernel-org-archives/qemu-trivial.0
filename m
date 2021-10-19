Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFs-0000x7-Sa
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsFI-0000Ul-MP
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:49 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:33636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF0-0000ZD-Oz
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:45 -0400
Received: by mail-io1-xd2a.google.com with SMTP id n7so21194624iod.0
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGeY1cL3xNaPESfbUDMTLYMl8VTNvNtAa+jInbYxLI8=;
 b=32BhYA10gLry5vJ1oulUQbu5nWHIAajbv5IxxkWukwQpSCw3hfwvOBCqcnoI6/UoY5
 lazrxcNuyIGw6eam+ZJ9YWuCf4tqYvhN5RuzLDzJJqPy6HEVFh4xeahEhmSlJnQoUnPW
 bmZHWVyAAF44ISQo27dQmYZNEhSSoG1ylbVgws7JJchQFXBUQUfoz7Ar5NhP2PWEOvdD
 4NjL/gB00Pr1yv0Sh/j6K/i6v3jRic2pbSic3nUQ5N19pKpE3g9RUh0+6waD9ZbtpRGC
 x8wwBqRqEpujgujdxzRzkSzM4XgMrAq/oaO8EfejHVHInGjEV66qB3Fym3HFg4QHrWkd
 MNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGeY1cL3xNaPESfbUDMTLYMl8VTNvNtAa+jInbYxLI8=;
 b=l6T40nf5lrZ9dHNXpdWZurjKMq+IpcLQyx6Vec4zENb+NFNUE5KJcrs3gKJ45VeP1H
 LnoRXcfWjr/aSsVOywoFd9Kh98k2esDBaGoZQOLFg44lzouNx7K1DbCenAa/goyNfbHK
 sfLt7cwq7eyabFJ9RrsicUZh7DnkP1+cgwoo1m0kd0lKlvthaP3rnTPsbRdMRlIn5ZUa
 OFerFE6bij6kxrQiX4HpeR+VTK9pRAIqgGnH0Fd6x2UofnOA6LfEVWM1/QEv2LQYnhJT
 OYAcuwyZ3EYWgH35okoZXocOyiHg062OKX3KJ/OGDmsL0cP3Qjxsv9sVrrY0dap47w6H
 JnAg==
X-Gm-Message-State: AOAM533/8SjA1yV4UetZJKKSPqiVVOitsgj18ZYVOrKV2ISvAhcQ0CI7
 gXqOQRZmRi3z2ZIPXerRbw/JvQ==
X-Google-Smtp-Source: ABdhPJzP8E9QWHMMvial/gQolRcMyH0Z5SoEbOVifxBV8ZyLgE+ttWy+BkTk/b3SkeMaOJI1lLZP3A==
X-Received: by 2002:a5d:8c83:: with SMTP id g3mr19165095ion.24.1634661929706; 
 Tue, 19 Oct 2021 09:45:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 23/24] bsd-user/arm/target_arch_signal.h: arm
 get_ucontext_sigreturn
Date: Tue, 19 Oct 2021 10:44:46 -0600
Message-Id: <20211019164447.16359-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:49 -0000

Update ucontext to implement sigreturn.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 1d051af9ae..7da68c727c 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -232,4 +232,22 @@ static inline abi_long set_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
     return err;
 }
 
+/* Compare to arm/arm/machdep.c sys_sigreturn() */
+static inline abi_long get_ucontext_sigreturn(CPUARMState *regs,
+        abi_ulong target_sf, abi_ulong *target_uc)
+{
+    uint32_t cpsr = cpsr_read(regs);
+
+    *target_uc = 0;
+
+    if ((cpsr & CPSR_M) != ARM_CPU_MODE_USR ||
+            (cpsr & (CPSR_I | CPSR_F)) != 0) {
+        return -TARGET_EINVAL;
+    }
+
+    *target_uc = target_sf;
+
+    return 0;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


