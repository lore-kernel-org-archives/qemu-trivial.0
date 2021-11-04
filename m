Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1midO3-0007gE-0Q
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 10:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO1-0007az-N6
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:37 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:33739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO0-00015Z-3f
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 10:06:37 -0400
Received: by mail-io1-xd29.google.com with SMTP id z206so7073590iof.0
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=QivoQuAjDT9P/5pFJz0dJZ3U5XOYq+JTmo33lkUO5b1V13fUPi70xiyqwjHBqGpJcE
 ZH2Q3mJ1n9PYvxVUSEkudCmo6s1Dv5sOL3DcovRUAranNME6qfZ3zUXHdrDn15RjrMk2
 knOa4MzQ4NvjyLuXGY4OKl3Jhtj0kSCoL55KJT9yFD6jFmIBQMUyFf8TbDoxXdRkvNLc
 QfzkOuRqVWTw05dQQWFgKk0S9uHrXwoMZDK0orv/ne5TX5ustiXHEwz0K0i2xk3Pdx1B
 ZLIjxW7oL1sBZh7P8JRblvfEjC8Ra6CGFTdwJNipNzx4nUR1g3uY0JPIxTtBmhBp8K5w
 f3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=xyoOe2SP4x+lvHoNiOSJpKAhNSFfQKS6m1dIUuMqeumWYe9yMMNeYNfhMVLpGOL587
 FZMqivteVUvJ/pPhGNWNd+LTPOfwoaDpPhnFZqQuAAgWjAdvjvw7H9gdziopYvrTwsyQ
 Sdgt5p3V6rEBH9+3y/ZEcSNulcHjSC3jALHnMQI5ZT8JWOJHw3h7x/VQ75Wifr8EmFJF
 0y788r5L0UYKE9lZrU7sD24vyWFLD8j7t+SoAgnHNqUDdDEtaUbD/fTBznHsOQYKztbA
 IjF9FYt8J0fNBe6zBn2Ytzny7QnnXiWL+s2lmNghDASLYkSXQxFoI0/EauTanG2FHRZz
 WSQg==
X-Gm-Message-State: AOAM530tvz8uZeehEvS9yzFPm0rXzGqIY2xt38CgGCZzvJlrBYB81/yg
 95p11rCS+1oDMX/xJ23sLwgfbg==
X-Google-Smtp-Source: ABdhPJz+QyTtcwwCfY9rs4wgWGXAFZWopCHWcW68y1s9NNL+Sp4BcxjvGqOJ665cFAay4e7Vud4Q9A==
X-Received: by 2002:a05:6602:2089:: with SMTP id
 a9mr30952030ioa.20.1636034795036; 
 Thu, 04 Nov 2021 07:06:35 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:34 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 27/29] bsd-user/x86_64/target_arch_signal.h: Remove
 target_sigcontext
Date: Thu,  4 Nov 2021 08:05:34 -0600
Message-Id: <20211104140536.42573-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 14:06:38 -0000

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


