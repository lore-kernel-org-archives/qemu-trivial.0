Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2fG-0008H1-R1
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2fB-0007xr-2I
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:53 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:36838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f7-0002vL-PY
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:52 -0400
Received: by mail-io1-xd36.google.com with SMTP id e144so597291iof.3
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VxPcRIshgsvl8wAv3aQLcUXSiDUtiOGCvbo2dc4dGpo=;
 b=WUyM68vXwyWTYyHHnrxeSBw6gP6uUcgK334xacx6SvmxvKvL5O1lcqARneRw3pPlhb
 SIrYhwP4Zmu2+4TobSs9bMWb9LIBWeoF7w20iPxCQEy9hOGrTvw6TSaC7g1exNAX3wVj
 ttDiQ2XnHWKAEEFgICW9TlKrTnChtbDTeqTtCTk30IunGV5EqhlbaQk1oh6K9ZmhH8rC
 vRv56/Re0GSKF7k3rsVdZ1yRyoFI177MwVTGec8xAZHLMb9uEaNIF4JkXoQIqulOxaJY
 Z7TVP3eF4Up+Rh3uMT0DQ14PNkdJxLQJSUveLm2jC0PUaL33nkh1popTiA1kPq3zmZRV
 TdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VxPcRIshgsvl8wAv3aQLcUXSiDUtiOGCvbo2dc4dGpo=;
 b=6n/GzOilLoeZdtpO5HK0qlvPRfRWuZIBujSf006lvii/BfG/Qwpbg2GhiC0ABhpB51
 kZgteKZiPLW2Jq/6M9RuzoOdrVVk1lSnjVn7SuSaKtpM71MhtXOPv1DlOsZ/uIEOjFkI
 WHJeb4f2bvA3zl6Km1gxwZmFMhaFwsPjAGnQYb70NYGsl2vZEKes5dLbnWGy88bHvDye
 N1zA9LeTbx7Ym81DhirD2/b+cG9P0WXOMCqzb9f3vyVbzBLxIhnSpKparMqMxfq3h4CG
 JxNrpKVaGy5ZrN3qZvd8nEhhgtvRvXemiC/snJL/W2YN0gle87GLimwMGZsvNdfEmx9n
 yRoA==
X-Gm-Message-State: AOAM532qv6K1ckp6KTvcKlgHN2VK0ZZSlxhZ1AyVZCTDw3CCViWQrNKD
 spYMgIpbot36Nc25k6Z/bPjYow==
X-Google-Smtp-Source: ABdhPJxQ1KwX5N0CT/3qsd3ALOqGceisUddm1McUvN8wrCGzEq6jwj5oPzpioJomY+RpruAtpPCbEA==
X-Received: by 2002:a02:cb58:: with SMTP id k24mr30397443jap.59.1635893628833; 
 Tue, 02 Nov 2021 15:53:48 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:48 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 29/30] bsd-user/i386/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Tue,  2 Nov 2021 16:52:47 -0600
Message-Id: <20211102225248.52999-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:53 -0000

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_arch_signal.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index e262667bda..bf7263c4f8 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
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


