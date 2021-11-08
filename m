Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvnX-00037e-5I
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:58:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnV-00030Z-GH
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:17 -0500
Received: from [2607:f8b0:4864:20::130] (port=34394
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvnS-0006Ne-Cm
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:58:17 -0500
Received: by mail-il1-x130.google.com with SMTP id j28so15559801ila.1
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YUhiVOQnmpNFSdmZg3CHyQkzJYfHEf7WcwU0TPM0Y70=;
 b=NNBR2W4KKRaa+vALqQtroaCEwpJ8TiTn3n58gVdQHZIv+EKT0VbPjjK9ozYkxYfrnA
 tDDQvTUU26MRdCChGuFMxyhXWi2mqZgpmcCvatPWZ8B8eIQ7fIG9ZqLFgueehvT71mES
 d9csfnGeFQ0cJCKLolb/cQH/LTnbuxvr20GIi0Gr/3blQHt5GBH5nrsJ/CwzLDqR5PAJ
 ufnlHcUucN22YJgC+XQSEq5BZ+A5us8+tRYG0vESjO31uXK75OgvKAXlcSWVzyTdaUSl
 B8drv4sueY0A5WfI1/9BaO4ZMVCfoPTMZMNj7cnQ3lBG7J1xfOzZDp2WfRaq5Wj7K3G7
 M2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YUhiVOQnmpNFSdmZg3CHyQkzJYfHEf7WcwU0TPM0Y70=;
 b=jXROzWSmGD5MhZKmvNdlTe/pa92qC5a1PRJrALwqUvd+q6wrYMb/f1z4E5nt2bKce+
 BrmSjNKhp21JBGFMQlrZlm4krBpYPUfwI91S02LCE/zqo9l4PvRkAkcZn0BDBo3dwK7k
 n+vtTF+ypgx8ce4FoUiCquYXOekCohUV5vdt9cCxdhpVm3k7APr8YT46LIertFVG86ah
 lbn1umb5CmVzIZmaQ/1c0D4+Out20KpJuNFRBFTe/+1fUItXBj0rz0J/RGo7Q0er6TOe
 b2xZa4KNda2bdId8JdqoAJQ/NZUcahn0zmrRvgTSlMNhA8pls8jjW/6yfFIw7+Ah9Avk
 5K+w==
X-Gm-Message-State: AOAM532FyNfI+SE3CKoJHn8O00+t7aYxBrfEnj86LSs3CPluDj9OJYpB
 qhXEZbySZOI97by+rMB7bq+kH4ZpFp7GAA==
X-Google-Smtp-Source: ABdhPJwL92l/utPA1Id8kJWwVT9NbqH7IkBUV2vhLWXCHBBuXofMTHzx2UA+8rqnprp7pheOaYJfpw==
X-Received: by 2002:a5d:8c8b:: with SMTP id g11mr10558808ion.116.1636343534337; 
 Sun, 07 Nov 2021 19:52:14 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:14 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 05/37] bsd-user/i386/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Sun,  7 Nov 2021 20:51:04 -0700
Message-Id: <20211108035136.43687-6-imp@bsdimp.com>
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
X-List-Received-Date: Mon, 08 Nov 2021 03:58:17 -0000

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


