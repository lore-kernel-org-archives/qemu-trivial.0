Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmF-0005GE-MU
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplu-0004Pd-Dy
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:07 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:39886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplr-00048D-P7
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:06 -0400
Received: by mail-io1-xd2a.google.com with SMTP id r3so7828936iod.6
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=MZ/vc/uwwMM0D4ZGvXXSa+8JpjH1La9hcwghoui1HGO/gFzC8EMAFuAfMn2/xReDwX
 g+2gj4bqsuBz7hk+W5PcypWYYNf6Q2RXBgz3s43tsedBYfz+P7k8Z9ITQebKBH4YEfGM
 UHQXCEZ7GBkaim6C69pYGTVMRRvXk3ZFdtgTe2csDZJup2tdrmGYrLCABis4KI3dd8Lk
 xc9vU66qA9jwyOHUI1KFiwVw9mzURmQXyeEBrQe7AZNFA4AovD2mHWqBembQKMcSQlGm
 TQDlapVuooqim9D1xMon1EfvYrdiin6/zVoF0IDJmcVDpnBCpDp2CTSVMbtztZkmTvzE
 8Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=4pFaLQo1WDyMMt6wuF6LhzrcPvjc+23ZR+Mb5ZAqG7DyX7SIkvbp7w8ogRFo3Px8mi
 PkTyLWoTYGk/eV8y7jzfELkmkxzFUUdZdav6asr2KCRA8PKvkaSdMDFpUNKRJA57V2i7
 MpV9MEYQHrEQ5hTeIcWL+iGNruP3LRUqqarbcN/qXdOUGe4fZz9TFGkt4jNNwhzs4IUO
 hf2RURDyn7lPsn0/Cm+HOy7r65/ltfn3ZD3I8ebzO6D36LLvqO38c2AbvQvaRaUAgM+d
 Mv6X1l7LSS6QCdGQnWNyyoO6Z5/Bvw/0NqAOCnJO1TPman+tK2ijIXO1OYyR9vxm5BdP
 7I2Q==
X-Gm-Message-State: AOAM531oeyYcdjcig69KXslq/s0Oos7ZOWI4v1iug4iFO1S3dc/Fn3Nx
 m4nGTqLRZzg4KyyWwise8zDofQ==
X-Google-Smtp-Source: ABdhPJxla9FITUmU/XG7eNbWa2IPDTC1oVHDVn8ZxnC9wFLU2qew942nyuCUsa9e40iSLKnzmF2Wfg==
X-Received: by 2002:a02:2345:: with SMTP id u66mr6906527jau.129.1636082402573; 
 Thu, 04 Nov 2021 20:20:02 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:01 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 16/36] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
Date: Thu,  4 Nov 2021 21:18:57 -0600
Message-Id: <20211105031917.87837-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:08 -0000

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


