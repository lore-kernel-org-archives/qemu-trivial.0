Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogUHO-0008Q4-VZ
	for mharc-qemu-trivial@gnu.org; Thu, 06 Oct 2022 13:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1ogTo7-0008Ji-Bl
 for qemu-trivial@nongnu.org; Thu, 06 Oct 2022 12:33:12 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1ogTo5-0000w6-Ez
 for qemu-trivial@nongnu.org; Thu, 06 Oct 2022 12:33:11 -0400
Received: by mail-pg1-x529.google.com with SMTP id c7so2287215pgt.11
 for <qemu-trivial@nongnu.org>; Thu, 06 Oct 2022 09:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isshiki-clinic-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x+ax/ATrYzaQ5B/UVAZA4kqtENYvIwK5HmJOHghSjNM=;
 b=Pqnr1bOKr4RioA6UpYEG+EagCqMGGZhZlSTNnAaib2f6LdbPG+mBoXyvz0Bwy/GuPl
 mluj4C/9ynjR/kbn1zfnqHUnnNY2VEzWS4RegIS2ibjRDaaSXWGFdEY5uHfyt9pkJ+0l
 5z0PNv9QukGvb3k0kHnVDTE7WMxGJylchwztVjV8fwo208uxsLdXo9sF5Ad4fOXFycqJ
 /F86gC78oXQI59UwuN3GpZcsEqPHVop9MhY8uyQxDWx49/Co9fqrgFHXfXQPZgi6m1pj
 vJkgZ6RH7A7SbiK1etPo2jKz8RNc4FXCYuudZS9It5KEtFxJMk457fSDMjOg9vnlCDDo
 oadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x+ax/ATrYzaQ5B/UVAZA4kqtENYvIwK5HmJOHghSjNM=;
 b=6ywAycCCmXGeksXOp68Ws6jqDDZedifvoxyjnG93AdPzkYURZpyUfehfvelWCMtnXi
 1j9RZLxpUyGK5YQ8Ti99Z/xGVS/C3EGfKpQEVXwojDoe12+C5BWYHhJIqRCwaw5LcATw
 1omw7POrrsj0zYxqz+y6mOkZHXb+rgTEGWX9AVbdRxWTiwoiERK08CRSY46GRD3ugJxN
 IGa9nrNCEOO++2Qflwi0bSHDODqDeUDbeGemdOxN/LGQG/EwA2kL5OolB5TSqXdaVbGk
 QV58VuUYfhRlNpVts4wKaRJjhf6pN6/BlT6ClITJPMV9SB6CnLcOauoqxOrqlojmCg2i
 jtaw==
X-Gm-Message-State: ACrzQf1HCa5I6xpcEnzc/UcSJa2eunqEdCN2lzOudIXVADzLBEAJ+S4d
 iEzc0XklRlpWyETqeQRhyVvapg==
X-Google-Smtp-Source: AMsMyM4xlc4j0x3ajskrEU7aqtqVwG/1Q+ZwUimKccIX1p5uL2K+VQvsjkahFpQ4Aiwi+Cc5dW8duQ==
X-Received: by 2002:a63:494e:0:b0:448:5163:4788 with SMTP id
 y14-20020a63494e000000b0044851634788mr540492pgk.507.1665073985712; 
 Thu, 06 Oct 2022 09:33:05 -0700 (PDT)
Received: from DESKTOP-8TCEJFK.localdomain
 (215.134.178.217.shared.user.transix.jp. [217.178.134.215])
 by smtp.gmail.com with ESMTPSA id
 e88-20020a17090a6fe100b00205d85cfb30sm3079679pjk.20.2022.10.06.09.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 09:33:04 -0700 (PDT)
From: Soichiro Isshiki <sisshiki@isshiki-clinic.com>
X-Google-Original-From: Soichiro Isshiki <sisshiki@mac.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: sisshiki1969 <sisshiki@mac.com>
Subject: [PATCH] linux-user: mprotect() should returns 0 when len is 0.
Date: Fri,  7 Oct 2022 00:38:43 +0900
Message-Id: <20221006153841.10750-1-sisshiki@mac.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=sisshiki@isshiki-clinic.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Oct 2022 13:03:25 -0400
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
X-List-Received-Date: Thu, 06 Oct 2022 16:33:15 -0000

From: sisshiki1969 <sisshiki@mac.com>

For now, qemu-x86_64 returns ENOMEM when mprotect() was called with an argument
len is 0 from a guest process.
This behavior is incompatible with the current Linux implementation,
which mprotect() with len = 0 does nothing and returns 0,
although it does not appear to be explicitly described in man.

This is due to the following function which always returns false if len = 0.

```C
static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
{
    return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
}

```

This patch fix this incompatibility problem.

Signed-off-by: sisshiki1969 <sisshiki@mac.com>
---
 linux-user/mmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 28f3bc85ed..1ed79459ea 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -130,12 +130,12 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
     }
     len = TARGET_PAGE_ALIGN(len);
     end = start + len;
-    if (!guest_range_valid_untagged(start, len)) {
-        return -TARGET_ENOMEM;
-    }
     if (len == 0) {
         return 0;
     }
+    if (!guest_range_valid_untagged(start, len)) {
+        return -TARGET_ENOMEM;
+    }
 
     mmap_lock();
     host_start = start & qemu_host_page_mask;
-- 
2.25.1


