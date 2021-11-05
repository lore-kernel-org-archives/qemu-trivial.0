Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipm4-0004dF-Ut
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplo-0004Lo-Ey
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:02 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplm-00046j-Vk
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:00 -0400
Received: by mail-io1-xd31.google.com with SMTP id 2so5963401iou.1
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0zcqxxx9i9efPGyMNGiYlMMaZ7Z90otmzxtyKTD4u1s=;
 b=FU4E+e5BGZ8StZdS8YofTWyLMY6Bibvm3gcKaj1PVpm/xJOXUy82TMM0QBUrfH+F99
 r+l51Tswko5UPzUpJSzeUQPRBM9YLAgWViy9GyJ42jReFbKJwDA99taB7w7MzKB4iZJd
 FjAwPt0YLqyT70KjeCCB1x6k/kCRT5jvhNUjtNJjhgyJu9P9SojY8gYLUgXzXzytx9Yd
 EKTfck6XjTimkYq5rEgIlvV/YNtzOQnG6Y9G/p70lXY3nnIwM18/iIQfZei0jLnOm71A
 RXsy435txb4yek6NQlG4VMSYtXFwL5h1Z7HlZPt7f9JGOgmpfgchX//jXkWM9tq93JOl
 inIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0zcqxxx9i9efPGyMNGiYlMMaZ7Z90otmzxtyKTD4u1s=;
 b=DdAg02Q3JVgcf2WYu2djOHrHsi83iDTXFC8uNZMmOmCFwi0+Y4mwaPK68zilJDwLfd
 VXo14LQjR/o4qg41SjzSsGmZyPIlJE9JIvtpe1M4KeD2TfDByNUJj1ISSq46hmMEM55K
 3lHiChRfM6ePwLfvlDYevcBg0TI96QwS2Fjp+kQ+dh/lzuTtHGbdHYb6FqLJVYT36Tvq
 KVse9/yQtoXxlnn29DIdxM3RhvQEylzVrVPa5wF1Y4KrLKDIadwqIsWxgtxeGqPZKic5
 ZUcT4YHD/sDFge/ON58cQeS6o9bFblqcdz3cXs54W33XdM857A+xSgSrv9QtOUuJ1OOJ
 A/nQ==
X-Gm-Message-State: AOAM5304/GTd40jabUzd2zSobYZ8x7Ugfp0bVRSxVf1MWQUbOGofFLhK
 C02JCxMgSt3iKZ2czqG8OUOHkg==
X-Google-Smtp-Source: ABdhPJwafey/NN/waSEqjhmiF3mK62/RzNz1kglWNiO1P8xAPs0KXUpYmFFq/uBglV0n5wZagmX8Iw==
X-Received: by 2002:a5e:d80a:: with SMTP id l10mr39587725iok.182.1636082397988; 
 Thu, 04 Nov 2021 20:19:57 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:57 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 12/36] bsd-user/arm/target_arch_sysarch.h: Use consistent
 include guards
Date: Thu,  4 Nov 2021 21:18:53 -0600
Message-Id: <20211105031917.87837-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:02 -0000

As part of upstreaming, the include guards have been made more
consistent. Update this file to use the new guards.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_sysarch.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/arm/target_arch_sysarch.h b/bsd-user/arm/target_arch_sysarch.h
index 632a5cd453..8cc6bff207 100644
--- a/bsd-user/arm/target_arch_sysarch.h
+++ b/bsd-user/arm/target_arch_sysarch.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
+#ifndef _TARGET_ARCH_SYSARCH_H_
+#define _TARGET_ARCH_SYSARCH_H_
 
 #include "target_syscall.h"
 #include "target_arch.h"
@@ -75,4 +75,4 @@ static inline void do_freebsd_arch_print_sysarch(
     }
 }
 
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
+#endif /*!_TARGET_ARCH_SYSARCH_H_ */
-- 
2.33.0


