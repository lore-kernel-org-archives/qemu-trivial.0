Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midNi-0006cM-JN
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNf-0006SJ-5J
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:15 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:38785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNc-0000xC-Oy
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:14 -0400
Received: by mail-io1-xd2b.google.com with SMTP id v65so7010188ioe.5
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=3wOxFoT9veo1eOphH18qdcn59J2C93hUkwM/NkU1yVgNIMH2qAFRtpwnF5W3YQa4xQ
 vWJJ+kD7mQ2F42CqeJknTFvU+ZJt/ymqRGK+XUSB81DslTjCdQmvvDy7gqR5R6T+MM3U
 xiKLRKOKIxlcUHpJxGV7FgSjn3LPDJEo3ph2RopzJmwcHTctrAIgXy+lP1xBdUKdwfUP
 i5Q6pwpASdWSaKAkJ1EAPxSXVikCsSs16HDHYPiZbx1TWJj06eJBsqLTp+4MUS1FTJI1
 ONEhWaO4l0yCmz0YqWcSqpl7uA1C+T2+hByJ6M3LbokrHZXwz05Jz+Y9lvHEOnE97Ctf
 7MEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=KFa7Naj4MBOw8NlMIwU78YCAPQWx5ggaCR3kBXDnuPDB/FKNcc9uJKy4Q4uRkPdOt+
 y5xFvjBCtemjW50TxUR46m+y6e6/7szuG+w2aEa8Eg1W+9QQr7Ah+2oRNMIGMqunzO+b
 HpQL1Jac5aDoeDA8BgZZ3369Ju/0XBCPsNSm3HVOmkOzsdbzGlOIvGERbzdcHsL0rAd+
 pGrEg5DrFsha3BZdgrb1XzBRQjvkitLRO/1MeOU4+tpBfQevQSJthjMkl6tJ7iL7YV4g
 xYyDcVFRl0bJVi3XFomNAev7nKhzh4HlgU5ibfwcYJGeMbOOHN3MyccX62+myANURmVI
 yfQQ==
X-Gm-Message-State: AOAM5311LfKacp+J8bNma5GlyzDWa54aHXwL39itIdpAZGUwfMwuj0oz
 eGsUyAQEciIroC34F6Gq5RokIg==
X-Google-Smtp-Source: ABdhPJz3OvExpkbOPR4TkCNn4ZGaW4uxxc9sOSuGWBleIkgWm+C5x/RWznBF8q7O66uc1Ad0TFlbcA==
X-Received: by 2002:a05:6638:dcc:: with SMTP id
 m12mr3997759jaj.143.1636034771644; 
 Thu, 04 Nov 2021 07:06:11 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:11 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v3 05/29] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
Date: Thu,  4 Nov 2021 08:05:12 -0600
Message-Id: <20211104140536.42573-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:15 -0000

Implement target_cpu_clone_regs to clone the resister state on a fork.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 66215684d6..fa45d9335d 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -36,6 +36,14 @@ static inline void target_cpu_init(CPUARMState *env,
     }
 }
 
+static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
+{
+    if (newsp) {
+        env->regs[13] = newsp;
+    }
+    env->regs[0] = 0;
+}
+
 static inline void target_cpu_reset(CPUArchState *cpu)
 {
 }
-- 
2.33.0


