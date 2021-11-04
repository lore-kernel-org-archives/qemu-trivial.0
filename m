Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midO9-0007qu-JG
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO2-0007fZ-T1
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:38 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:45952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO1-000166-2F
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:38 -0400
Received: by mail-il1-x133.google.com with SMTP id i12so6241287ila.12
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YUhiVOQnmpNFSdmZg3CHyQkzJYfHEf7WcwU0TPM0Y70=;
 b=6u7SIMT+3SdYzpEty9PbwDubfIHKZYrPbVn+vro1o/QvfbIwjF0GsHPFcpEz5AjSKO
 3zfXZMDi+NNFrxYP4VAks5C6y2Z/w0HIv2UVwtphZv4jCqRYhKF95F2nTEA7H4nml4WV
 LQG8isxQLlKAkQsVnohfTffVNpHMD/xZJ+1xM+eD0BOu49ukpWOMuaOvXIUpxBg8mqEi
 FglslkPTewIdDmte14qF8m68Bho8+HPs7U7KpNfJdlK3v6oN/LeNOctPj/ToNLrsK9Gi
 0p51QSX/R4rX0IVi/IMvghrCYspygcGBqdtX3ayKOhIysHPMo8d1kJzNy6hSG+R5kZL4
 FoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YUhiVOQnmpNFSdmZg3CHyQkzJYfHEf7WcwU0TPM0Y70=;
 b=XbRiQA3PpJW4jkBZ/RKpl0tnyBsH1rNvzw+DJVO7mYv1fRavR6eCZRdsrYGiQm9F2t
 /h+5/brCWCtxt5en7zB568Mv7wHXVAYRFnFk2+III6kBv3Y4E5FJwD8D7O7pvfPdAi1C
 v1BFZrssHynWWmBXyzxvyqD5BBh+Phevbkce73zDm5bUGrLa0dmhmUankonP0jDPM3hA
 Mb6tzlxji2qFnfLG7t22okKp7ptwQDITXcFi6GydEpR29zNX8IJuKgaAElqLEQaNQ1M6
 xIgLKIq18pqjDOIa6lfjBqjTr+nSWSvrW1+Dya/2FBFNFMyTcxpbK/QZYL06GbbiAlDq
 62TQ==
X-Gm-Message-State: AOAM531W1w0L6sCR8rbG2c0eM8/dh4ukDeUwgXMkNQQNSfI+fVIp6qVS
 JakxfLVKTIO0zxZwHKpB6AdidA==
X-Google-Smtp-Source: ABdhPJyOohsgSWsdYd7UYKXhwBaqoi5e0W5e+6jgo1G2tePoHmuokNhfXiDTiqgkn2tuSkTFP1bcBQ==
X-Received: by 2002:a92:a304:: with SMTP id a4mr34646231ili.78.1636034796027; 
 Thu, 04 Nov 2021 07:06:36 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:35 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 28/29] bsd-user/i386/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Thu,  4 Nov 2021 08:05:35 -0600
Message-Id: <20211104140536.42573-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:39 -0000

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


