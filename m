Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvpd-0007CB-3y
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 23:00:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpT-00076B-K8
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:22 -0500
Received: from [2607:f8b0:4864:20::72a] (port=35496
 helo=mail-qk1-x72a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpS-0000zf-8J
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:19 -0500
Received: by mail-qk1-x72a.google.com with SMTP id az8so14380600qkb.2
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 20:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zU+m2dj4H6cVY5IXZl2McfoeKw+azePnbjkTpHB+KrU=;
 b=8N+E5L7KYKyhQ3CKu8U/oBBMPGBoz9yprQUf5HlujxyE7ErYlPrhOkjgBi+EW94UE0
 sFAK7kJSTyBgpRZLcMRJPZusoFUgmgev0WMk+8+Jb/hLGdPg7jiYKrIRQBMOd7IwBxeX
 JYGHu8JMubOwL/wgR1SHbT/htAojTEQVYL/b7AVJ5azf4bqahTr+zbM2XBIo1TQH5PPu
 G3ghIgNw8oPaJ35NOakb0jp114GMIctXyTaHiMJP5iFkHfrH/o/nbac4et7HO3V3EPTw
 1PmBjEZ2okNejwK4jJCC97cbfXBMAM28YPkmSx/JL2LuXrmsDaGqPTdh1LqggUE1wuzF
 CaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zU+m2dj4H6cVY5IXZl2McfoeKw+azePnbjkTpHB+KrU=;
 b=ipvQ5vQEXu7+3+sDAwl25ek0aBPqJbuNTkjIJAX6ImRuHn20bLMzjM1HbgcX+qeHxv
 Ze7nKMBi/465zUbAsAJa2F7ScMmekDhvxRcOQmwh8y+9YIayNNd6/nqzzR6n1vT6fIeC
 M/IsqbS+94ABkkQOYFiQVFCcNQY5+UlxsIvTjz6EcDn8zN/v6wsc97hT4iYyLQzbxFy/
 5+Pt8FdX2smOSgqLm+42R5pd/96wABKqakc2FAoFjLycxtw08vQPcx7/+zBDw+VvR3/d
 b8CPKFCIZ0WUvSJ07x2yT80TFOE16C793kDASf49xuc+FmIUPokxvmKBqxiTeV6E1otu
 v4tQ==
X-Gm-Message-State: AOAM5329wFIHwwEiv0Wh3DRwRKECgSq6AcuUorim0YuZhQTm3Z6XaJnc
 Y2McnV53Wl5bFsc9AyOfNGMDIoSbQe0+1w==
X-Google-Smtp-Source: ABdhPJxsUKg1cIF96ekePZGSkqEC2hlatOETv4EkwHEZCLsLvsx6heKNqV2gPWu9QjegFPYwdiiO2Q==
X-Received: by 2002:a05:6638:a2d:: with SMTP id
 13mr21401774jao.12.1636343563364; 
 Sun, 07 Nov 2021 19:52:43 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:43 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 36/37] bsd-user/freebsd/target_os_ucontext.h: Require
 TARGET_*CONTEXT_SIZE
Date: Sun,  7 Nov 2021 20:51:35 -0700
Message-Id: <20211108035136.43687-37-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::72a;
 envelope-from=imp@bsdimp.com; helo=mail-qk1-x72a.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 04:00:23 -0000

Now that all architecutres define TARGET_[MU]CONTEXT_SIZE, enforce
requiring them and always check the sizeof target_{u,m}context_t
sizes.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_ucontext.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/bsd-user/freebsd/target_os_ucontext.h b/bsd-user/freebsd/target_os_ucontext.h
index dd61aec7cc..41b28b2c15 100644
--- a/bsd-user/freebsd/target_os_ucontext.h
+++ b/bsd-user/freebsd/target_os_ucontext.h
@@ -27,10 +27,8 @@ typedef struct target_ucontext {
     int32_t             __spare__[4];
 } target_ucontext_t;
 
-#ifdef TARGET_MCONTEXT_SIZE
 G_STATIC_ASSERT(TARGET_MCONTEXT_SIZE == sizeof(target_mcontext_t));
 G_STATIC_ASSERT(TARGET_UCONTEXT_SIZE == sizeof(target_ucontext_t));
-#endif /* TARGET_MCONTEXT_SIZE */
 
 struct target_sigframe;
 
-- 
2.33.0


