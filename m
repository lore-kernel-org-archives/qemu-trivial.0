Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvnd-0003JV-El
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:58:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnZ-0003EA-6A
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:21 -0500
Received: from [2607:f8b0:4864:20::130] (port=33584
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnW-0006OG-Ti
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:20 -0500
Received: by mail-il1-x130.google.com with SMTP id l19so15634505ilk.0
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=6WpU9QwjmkXfZxOST/jDl4a+upyfk5sH+yrWsqSbb92f229vKOMjy39Y+rmSxlyru/
 Ixo4mjKwt/zJtatMgLmbyvsIVYDru/itWh856mSo9gbu3mGnIiCFfv6uaNEWzxzRnfwu
 dxYxAulgwydpRgAPOLCWl7574xyP3sWD6YZ3577up4PsW+5L0mBqe9Ro+6cX9K8tzzDO
 DkpJlLZfB3T0hT7cC/GBO3Y3mbJZKTyU87lPnZ+TYqpOZhMYz+kjWEBEtAoZ8RA4gjdw
 Hm4R0XcwL0PE0hiuZcIWFIG2s1M3AIBxHdgDW++G80Y3VY5aDD7PqmvWap42cHfx0frz
 ZUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=xtCmLxI1PTHC0kkryuYM0LbUIn/PNll2X9LZK6rZrACBgql/Q8oix8J3SscaREqH9Q
 k0Mz9mu74eY6HQ2Sm1M1VUnavFA2xxorpNhqEv62u0TvFwvUkS7bmHP1jAbUjLfn4/E8
 s1sL4Cl5sHkKmzQAu3op8iWVWfnoADmo52Zz4yjL9FzeNXmsl3lkJwsP2b4QN7JwUKA9
 S/VmRUxje+VVsQ1SeqXj6akth+Z009gxHyrzAiijQSB1nH8eVnJQxO+IMymfHTDKH2KC
 DyvmYdAYCEPvnR00Whid7pT2YwTUCPnjsVVxew2sJG1LNOxU89Sw9FkbkiyfDkhk0HFI
 Y5BA==
X-Gm-Message-State: AOAM531tBYBLa6L76hlowelx4lT9KoW38Odew3xfljoKY45fMauGRBpK
 cZy7YWzppiYu7B+Ozfn0zeW61WdCpPgi9g==
X-Google-Smtp-Source: ABdhPJwa5WM/P+QpaX1KMqunIruOe9udsn/0/lXa7TbZtM4DDLxW9+qMFP07tG06tXQEcIYyY57Rng==
X-Received: by 2002:a05:6602:2cce:: with SMTP id
 j14mr10796549iow.23.1636343537261; 
 Sun, 07 Nov 2021 19:52:17 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:16 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 08/37] bsd-user/x86_64/target_arch_signal.h: Remove
 target_sigcontext
Date: Sun,  7 Nov 2021 20:51:07 -0700
Message-Id: <20211108035136.43687-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 03:58:21 -0000

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 4bb753b08b..55f742b0a8 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
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


