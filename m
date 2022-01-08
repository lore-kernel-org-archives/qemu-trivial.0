Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66J3-0005gH-2z
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:38:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IU-0005I0-8O
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:57 -0500
Received: from [2607:f8b0:4864:20::d33] (port=34402
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IP-0003KS-D6
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:51 -0500
Received: by mail-io1-xd33.google.com with SMTP id j1so207445iob.1
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/jy48HkNUaUaZfPXMlTQ3cZWu/LfzAMp6hpZ/Zmo3lU=;
 b=HhQ4MSsQAsgHQLXrXodnrzhUS9aeCyIDZyVs92J4CKB0wTWwEpn5v94xhLp47QWEU6
 S5cs36ES8a3slGJBA8iGSWU3wbGtDTkpSq6qSkzCQGs11wqipWoeYxb/m3eQmjtnM6KX
 cRHgCDov19LlNvkJ51mWbBvSqE/bhFJHGOMTMqX9qJKQu0u/6Nm0dUeJO+eExwdKqy+w
 guw3/fn9JV+QKM/jhqiq31jwAHGGO90Pw27on4UKRh/KkMt/BsAebY91aUE3xi5JqOvc
 eFzK/P5J4oKyqEOE0LoMDltj+MVccan/xNQJuyc8ZWA07HG1N6OeQviwyg5rPWH0N2ms
 uaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/jy48HkNUaUaZfPXMlTQ3cZWu/LfzAMp6hpZ/Zmo3lU=;
 b=LTkA2l7u6dp6Q5lRwSh8NNdwSdKlc5W7J+0YRmDfe6oupMs+WVXQ8GcZcM2jUS9S36
 WJJqdJ2Tcl8tISY+itWOwM7CtQ5U4jc3HmYpKoNIfPqu//GfrN25Ozan7fZyslFxtd/f
 8Wxc9dYjcYJrBAdpThffxoABJOsJrXHJ2BgIm+2D0b2c5HmUfyQMA2uGmcqPkn590vxn
 mih+BXcCZAmZP37h4ohk2Gqjx1ShGvL77AU9sJ6pgrUwUvDqMOvhxn2q0m2IXkP2Q3bm
 6jLbEjha2LY7X43P8ECrNjWBT6fu9wrqWz3Kxz5xLdCx41jXqLidy9jFDn4IBjs9KjIT
 qx5w==
X-Gm-Message-State: AOAM5330SjAe2Hhbj/6oGfSWIgKriyTRsTBctCwQqp1omXr+MlU1qSfH
 Ada5iDNHI+fKKd/tQn3WIY/HdA==
X-Google-Smtp-Source: ABdhPJyOjGJJGRb5qOJCS2PKkfDxvf/uM7VDVhmMRoh1yyYDcg3diowGiHuyhIaZ0fQojMNiad1OXQ==
X-Received: by 2002:a02:b11d:: with SMTP id r29mr34055740jah.71.1641627467559; 
 Fri, 07 Jan 2022 23:37:47 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:47 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 05/37] bsd-user/i386/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Sat,  8 Jan 2022 00:37:05 -0700
Message-Id: <20220108073737.5959-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:00 -0000

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/target_arch_signal.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index e262667bdab..bf7263c4f8d 100644
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
2.33.1


