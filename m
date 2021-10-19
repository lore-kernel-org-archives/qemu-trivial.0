Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsEz-0000Gy-1m
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEw-0000Dh-5M
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:26 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:44575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEm-0000Jc-0Y
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:24 -0400
Received: by mail-io1-xd30.google.com with SMTP id r134so21104228iod.11
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vaJwXu/eD2iCjrLKVnfYufKTq6BQat7mctIUm7bBXz8=;
 b=UeINsJ9nReGtA0Qe8jARdFi8nHLVNZo1YLmzpj5NRD75uYex0ET7wDwJlnVsNv+Qcp
 FNQrKWCfAn1svhwF4bCxOdU/RkJtO2MGGoqbMqYfKvFzi2k+SkRAHMPQF542I2eKO0u+
 yaL5luZIjTz0NHcDA4OX0hB4nw5HhIL8QC7mgNsFEYCxsxLXDjeGROTrIX/PRFEXpi7f
 lKQj3XBg8W2uoUAZVe1LTPydJnI1yomDnHc4xNNdzMg4Ahyf1Hwi/Ynw7KF3BVij1Yic
 NhE9LVpDmjVRtz9AZV3pWvDk1h4aum4nsYNBmvPw47pgJIGpvweRB9uHjK6A0cLCcC+N
 E5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vaJwXu/eD2iCjrLKVnfYufKTq6BQat7mctIUm7bBXz8=;
 b=3fddLNzcLQsKQGiJpvh7hc5AxlwAIN3Piiq43ZI1q1cKXLsCTIil6Q0dyRgt+Fa18u
 GdwydK4fas3Q6e5ZVPWCo/NP5hxQqOC0bU0mvL31c90LKqh6643o7XHT8H1exm8xzar3
 U0mvJeoPJWlW/ICY4U9AQIlseEehcpaqllO17fSUmruXG1Bqru8UvE7oQ7rdfinj7wux
 eKZA+Kuq+9Aw5zbL1qFfswFRgtQL6jeoYYZvqVHLwPdKpsT/hK2aqBWosNxJ9d0FCiGb
 1+DchZg1eLGUZpF3wSPWNFfc08u8ClZ6c2mEs27e7A8NqXLP1EGtUhk0k0wVNt25m3Wt
 sZ3g==
X-Gm-Message-State: AOAM530jkbe6qbCJ2jRmPaqaF1B2FGZ9DJRukAQAeQ3RjVb34596rsOj
 WGzAlca91m6CsVL5LWSoCN+4Dw==
X-Google-Smtp-Source: ABdhPJyBWWv4SOzibyK3ygfTOqCr+PekuUQ0FqWKHKj5zv1IzNx0+pjAx6/ZJDxQpG2I8Y7v3WVPKg==
X-Received: by 2002:a05:6602:1504:: with SMTP id
 g4mr19278479iow.133.1634661914968; 
 Tue, 19 Oct 2021 09:45:14 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:14 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Klye Evans <kevans@FreeBSD.org>,
 Olivier Houchard <cognet@ci0.org>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 08/24] bsd-user/arm/target_arch_cpu.h: Implement data abort
 exceptions
Date: Tue, 19 Oct 2021 10:44:31 -0600
Message-Id: <20211019164447.16359-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:26 -0000

Implement EXCP_PREFETCH_ABORT AND EXCP_DATA_ABORT. Both of these data
exceptions cause a SIGSEGV.

Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Olivier Houchard <cognet@ci0.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index f22384676a..62d6ee89b6 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -60,6 +60,17 @@ static inline void target_cpu_loop(CPUARMState *env)
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
2.32.0


