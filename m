Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvns-0003eR-JR
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:58:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvno-0003bi-SF
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:38 -0500
Received: from [2607:f8b0:4864:20::82f] (port=45655
 helo=mail-qt1-x82f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnn-0006tG-21
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:36 -0500
Received: by mail-qt1-x82f.google.com with SMTP id g13so12151356qtk.12
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOISPYYKecMk71RBzznUZbzYo3FGryyldBKKzRc7muU=;
 b=4ULHoJ3ykdpdMFRGZq/Sz+CSGGZLQ5nyPEbJkKgIYEsI3Txr4+mxkYQ66lgur9hgU+
 Fxl11zOK1S2eMNl5Luxpc8XXeHMPqSJWaAyqjoBvS7NFDpd7L0HcN/62osQxQ8pLTHs/
 Cw8UI93IamYSyuFtykjozq9uNBWaXABR617xtHu9SwP2PQJ+uEOZhuwSavHH/40w2Eu5
 XiUDykBLJi82mv5YW62HWSw+shijLSTVEXLSBYpnmRotjO9x0vUxC+5OVCunX7rT+s23
 iN7AvRE61uwXg2gU4sTmyaJqQfQzk2kqqQ/1OB3Vz80akjyODjIYF3por7H5Hhy9yMKq
 vQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rOISPYYKecMk71RBzznUZbzYo3FGryyldBKKzRc7muU=;
 b=b/7mgW0zXye3BxR8sSvAXvoTptDy5Dcpmv1+Ui0LNFqpOQr6f67nBv2eUoxRb1FbEF
 6nfj5YZIu/fv9BmOPWpEsm6izHTR2l9PBAASP0EqxqFY4hSGXizEbZVLHqA2nWyNc7rk
 YLjmz6WbsxAe4XEYnnRL7DXIxfMJqCrvxgSBIVwDYmaPKCw9d+Cre2gEulSzcWxry1hM
 S7jVBBGaT2EWRBnbq5zXZTy4s0dfIko85Tqiz5pvsuL6G9H700f+IfWDn1u1YqOwX4NH
 F+AfqtlUgWazG4PIYT6nc0UcpOqOhMtV8DWG0F7n+9748tC1OUeu9vkOL7S2A53z1Oi8
 yD5g==
X-Gm-Message-State: AOAM532YNef+tLrkT80gkiqquSVWOVC1GK0kf2rr7pwbJwXpYhDYPTTn
 IvPm8CJ4vU80m6RIqe6HjMazIlZ+XOxjnw==
X-Google-Smtp-Source: ABdhPJwh5gDOtmdq3GBnEIXd6tHKW2vKNQXjA7q4HvbKwY2LAsrS3QbwMk3Uqkzr3Ew+AE7N9uitWw==
X-Received: by 2002:a05:6638:2186:: with SMTP id
 s6mr22138665jaj.138.1636343533517; 
 Sun, 07 Nov 2021 19:52:13 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:13 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 04/37] bsd-user/i386/target_arch_signal.h: Remove
 target_sigcontext
Date: Sun,  7 Nov 2021 20:51:03 -0700
Message-Id: <20211108035136.43687-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::82f;
 envelope-from=imp@bsdimp.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 08 Nov 2021 03:58:38 -0000

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index a90750d602..e262667bda 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -27,10 +27,6 @@
 #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
-struct target_sigcontext {
-    /* to be added */
-};
-
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-- 
2.33.0


