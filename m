Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2fH-0008Jt-E0
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2fB-00081o-TJ
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:53 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:44655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f9-0002w5-JL
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:53 -0400
Received: by mail-io1-xd30.google.com with SMTP id f9so547521ioo.11
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V2bQIWGL0XqjqPbzVAf7nqAzcBUhtupJ0ypcSsardcc=;
 b=FbyWJOPN4JgY8FvbYmqNCqW46yYYnQeEM76xOFFYhjX6a2jnCf6h1BQEgls21Rh4ks
 7ob40dbj9agR0pXGYKB3ZuNVMum6PUaWmrds6b9G2Gukmbq9wJyM7dY+PcGsMfoKLHJL
 eNDCglkVmwlFA1oMIPCRxv4HqJoQ5ylCpKxaomv8Z+nfTA95iDB6fPcH2xkR+GoRcinK
 kDeHE561o3r8Xrj0rv9w0kjg8vFnoWlmlf+9zF4MNq+UGBVct7wrIiga+n9R+dxsAgBC
 8yA4L/vsa8hjtLj7UeCsDY2wbdcpsYmR3PlkYI9QcfZZz32HkY7R9LurMWBvvUNvhZhp
 DqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V2bQIWGL0XqjqPbzVAf7nqAzcBUhtupJ0ypcSsardcc=;
 b=j7ko3Ug5fUlB1zy8fhFSUh8z/0v7wEW52bz3NQ1lavDPgphe7wF8WpZoUZ3s+fE8xc
 KDueKNWBqthSoSLjc8/lrMJkqeIvCyVMk8W2T0/UO/f3IKL+VhFpnn7Dq2NhCyyj9Df8
 p4AZ/g3TbJlmiQNah5WI/LgUtzf33I1PPdWvi1bCsRsL2yOScE7/VSqake4l6q0U/8fq
 ul97hfrfx6vXoJIhXIVQQENZtjMuPhBLFBJMtwjFwYBWxIQjc3+IG9mFVnxUheA8pkMu
 bXdfUNDWX7euc/pPcn8pWpVZzkQguj+olPb/1VcQ7EzJOUeJNOjJ8Zo7tqLhvN1TQ7NH
 XVFQ==
X-Gm-Message-State: AOAM53104IBgBof1WRRi27QTAMb/P0R40qavRncskTwCmoj9pjgSME8d
 q59GdYkqsjCB9SiYvHV4tGQ9wg==
X-Google-Smtp-Source: ABdhPJw0oSesAjkdoGIfe0Yp23QLnB7YgSIf6XSVFk3U1gK6kftBL64Ofezt98ZmRBfyXwfWmQIRnQ==
X-Received: by 2002:a05:6638:3052:: with SMTP id
 u18mr30704277jak.148.1635893629646; 
 Tue, 02 Nov 2021 15:53:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:49 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 30/30] bsd-user/x86_64/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Tue,  2 Nov 2021 16:52:48 -0600
Message-Id: <20211102225248.52999-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:54 -0000

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/x86_64/target_arch_signal.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 55f742b0a8..e84aff948c 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
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


