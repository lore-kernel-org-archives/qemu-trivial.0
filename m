Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmb-0005ic-N7
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm8-0004oS-Fj
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:20 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:45768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm6-0004Ej-Nz
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:20 -0400
Received: by mail-il1-x12a.google.com with SMTP id i12so8228433ila.12
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yoeAnz3VyRcRL1RlLNODqzA0JM0MBxuW327s+9LBmds=;
 b=UB0EeSrt4oZV63t/p4qS26PjIoi9MqTlpjjW7ihGyeeNDqpHFSmj2luxikMUsI9CfO
 e+B1WmNNaogVyV3iC7zrx4l6rjtHKH8N+GJ572Qd81ZFSEeoL76A3thEHUnUm21W44dd
 Asu4DNm+gKEOxZWrAPc7nzz0Ow7YAgfZ427ON5BjDEZVdDI5RwS4zx8/bpuXIeXv2WhV
 Sf0yltSRBBS80eoMhyFkYclNXAspsiP8mDkqc1SYcH34G7SnbNR3b/df/bl8jZoJ1s+8
 8awHK0vpeOWIBKRbMZts228IJ/2N/9ig0gFxNZNfnPuII/qxj9JNtFP354qhXrM5Wb2E
 jn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yoeAnz3VyRcRL1RlLNODqzA0JM0MBxuW327s+9LBmds=;
 b=gtRnpzsDTyzbBsPnYiN81kKfUX2xQfEouR+7i6Asq4fA/gFxza1l/8cSDod8A4lBSn
 LxGwbIEx9Ruv0mSxpMBnKF0fvvjTg98HGJ2sTUj5I20vM0HgVYyy3sw0ERH4NYdC3vTG
 Rvzr2xrCP2RcbLlT3bNoOx9ZjkXA+zkXS2vyiFmpgzQS32Z0D6bh2OYrtKRhAXwTXsGO
 MjTVLs2X5DgGr9vvNNpHmJYURi/zq5rf++EltF96/rNlKB1Qjjrec/uScQQMij0++GlX
 oyuU5rQtkbqG5UT916ILk6kvuVe5MXrSULqOmtTVRhW2a0zWako5BS8DGd0DdivE4OIx
 Ri/A==
X-Gm-Message-State: AOAM532E3U1aFfERSPsOTfJRjapnDC9u9I2k0nrWtqdjkFxkr11QsaJW
 OTocdkwkOxDguhW9pHRWKE9MPA==
X-Google-Smtp-Source: ABdhPJyOVYS3x7Eputq2oVMVlk4uWPWklj+/s5YUtVlJVe3imYpq8GrmEGlSnrfWtAEHP57vmI7SqQ==
X-Received: by 2002:a92:ca07:: with SMTP id j7mr31032795ils.69.1636082417623; 
 Thu, 04 Nov 2021 20:20:17 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:17 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v4 30/36] bsd-user/arm/target_arch_signal.h: Define size of
 *context_t
Date: Thu,  4 Nov 2021 21:19:11 -0600
Message-Id: <20211105031917.87837-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:20 -0000

Define the native sizes of mcontext_t and ucontext_t so that the tests
in target_os_ucontext.h ensure the size of arm's version of these
structures is correct.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 9527335cc9..f1844dbf22 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -74,6 +74,9 @@ typedef struct target_mcontext {
     abi_int     mc_spare[33];
 } target_mcontext_t;
 
+#define TARGET_MCONTEXT_SIZE 208
+#define TARGET_UCONTEXT_SIZE 260
+
 #include "target_os_ucontext.h"
 
 struct target_sigframe {
-- 
2.33.0


