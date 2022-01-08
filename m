Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66KV-0006PL-Ap
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:39:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ir-0005TL-6b
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:17 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=46618
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Io-0003UC-Dz
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:16 -0500
Received: by mail-io1-xd2a.google.com with SMTP id x6so10011513iol.13
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ZeA73Y9C2GNlu6BEvq4LLEaMFz/sfyQRf5YDtwolg4=;
 b=jZM6Mj0QDMQVxxdjw+Z5QBwBwaOwuAnP5A9Hw6XS205QSw0WLkl3zsSH2m7Xouxtbk
 lfnBHcs4vzfNts3p4kyp0UeFFeC7wlz3GECP52UM5TWLXXfDlJWk5oLu0nFKFOReo6mi
 NllmxLjhDIBF/N9H+wM+RboUykm3MH1VqLxcduTjSHQxXdre8/f2XGwh5plv0paApEMY
 EwNqgyLWaU3sLo6vSdt9ppmlbOT6wbgrcPgfaBSy1lXOSpnTpFUUZcMmvkC2b9HDNk5f
 857Cl/gcjJW6G2YyXOTuG5p+IiEcg4gppQ79uviHYjpk+JOD+hmOG8hWy5Gpukbxq4kg
 k4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ZeA73Y9C2GNlu6BEvq4LLEaMFz/sfyQRf5YDtwolg4=;
 b=Vt+pdJjbE/PS2fjeBxDI0hXtltSqo3FnH5bIYOWWGKUWE2uYllRK0LkYo0E+HCZaTo
 u8Z00nUHdaYe0pJRMjVmT6ykfyV0DXCq34S7F3IrLI7cmJp9om9f+Euys1eQUZ7DMaS9
 Z+wv8mXQTeNtnE08IHV0TbRW7mM6deAkyDb5iFi63d9GHkCy0MzxyUvE/drsAielAQM4
 zT/dDH+D3/J09Fjq7PiCnSD/yM3tfa+V1GpUA4MsD7phA6jae/U+Sd6CZhhEsKP/9PBv
 9gGBLferltnUZ9FB8pigRFmcHuwJWAwkNFQ9/Ay1IzozSNin4COrddEKR9eYHkzMBFOC
 5P4A==
X-Gm-Message-State: AOAM530CROQwNel28Epe6UPzB9FfIF6dy7/1FFiU4PwJWyGe19iQ7Une
 2NrSIHfJXxuJebqBM/esb4jdHQ==
X-Google-Smtp-Source: ABdhPJz2ZCgSSnULsN3w7PH341XluADiNSZftSeYKPVKPgQS9t6c3FZwGaxFt+W/+G+fDbfGytSpGQ==
X-Received: by 2002:a6b:6614:: with SMTP id a20mr6613636ioc.26.1641627493444; 
 Fri, 07 Jan 2022 23:38:13 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:13 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 31/37] bsd-user/arm/target_arch_signal.h: Define size of
 *context_t
Date: Sat,  8 Jan 2022 00:37:31 -0700
Message-Id: <20220108073737.5959-32-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:20 -0000
X-List-Received-Date: Sat, 08 Jan 2022 07:38:20 -0000
X-List-Received-Date: Sat, 08 Jan 2022 07:38:20 -0000

Define the native sizes of mcontext_t and ucontext_t so that the tests
in target_os_ucontext.h ensure the size of arm's version of these
structures is correct.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 9527335cc98..f1844dbf225 100644
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
2.33.1


