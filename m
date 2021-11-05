Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmF-0005E9-80
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplq-0004NX-Dh
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:04 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:36763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplo-000476-Bg
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:02 -0400
Received: by mail-io1-xd2e.google.com with SMTP id e144so9318615iof.3
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5K9w6Dgj9bW+v4mINR6IMzovYCKqh6rwlm+KG2b5Ybg=;
 b=jB2K9PU6I0f/0+YgbHqJoZv289ASKXkDaDIWwBQ7x/1TyLYnMLJ5kWXI4xNqfTfmbA
 O56Gjj4cc+HC1dlxWYMby/l8BK+qhio0lIwSlX5l3iLpdqykDCb/Bw/HkOwsRY9mYboi
 j4MOEJsyMRXnmEGb4kI7WzSIAWyHjJes1pwE1Fx7lCnWlq+8tLmqnH64d0kz4CDjgqfV
 0WX5N1LlR1FNbbf0hvPl7WmNO43lQ20JBjCBufgCCnkc3rmH5ZprazHy0+/yLdJskC/W
 m1v3W9NjFm4eItI7GpbqzN0bfPwl6ihE1hSV048PML2PBIVW8VIErXWSaHTSCuZ6EgaS
 3jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5K9w6Dgj9bW+v4mINR6IMzovYCKqh6rwlm+KG2b5Ybg=;
 b=bdk+QuGbhrS+PzOpxtR1aaqBgcHhbw5/MxDAWFCorK1PBVkslWo8HTfaooUq6yzBpX
 uJzF8/fN51N4AyEc02Mj4v6wXYsyFcG0vSjKUjGliG3D7lWDhCBznF/fa38olVbHtydu
 8yvItTEI7vyN+a1+kCJTQ1cI/kX2SScNCecThdnpQoe+1Z1xqSPU3xK1anBoHc3t2oI/
 9NXEdqzYpW9HDBp4pDj+xij++RT8S0oFpY4E9kfT9GrTzdA+DKUxWXenHj9/0N0I9uKu
 0zq4UPdqG7wbOzrXcq5YJP1mnxdlopRCbuZNx03b4RX1nBCzf4BBPlcB+4ieHmh3+BSv
 +smA==
X-Gm-Message-State: AOAM5338vj9qeX2sNsWq2KEQQE+GDcypT2UUJLwmO0tHvc1z/i0AJ4l1
 3DIB96nWOXibfSna85uaRu2YKA==
X-Google-Smtp-Source: ABdhPJyskoZ2e/6mCjgDzKJN8+1AE+mJhgFdUtOtJvLlPB+KLeIit5KLFttCXho7MDQ+Opj2ofqmzQ==
X-Received: by 2002:a02:a88f:: with SMTP id l15mr6912381jam.48.1636082399038; 
 Thu, 04 Nov 2021 20:19:59 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:58 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 13/36] bsd-user/arm/target_syscall.h: Add copyright and
 update name
Date: Thu,  4 Nov 2021 21:18:54 -0600
Message-Id: <20211105031917.87837-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:04 -0000

The preferred name for the 32-bit arm is now armv7. Update the name to
reflect that. In addition, add Stacey's copyright to this file and
update the include guards to the new convention.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_syscall.h | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/bsd-user/arm/target_syscall.h b/bsd-user/arm/target_syscall.h
index ef4b37f017..a5f2bb4e01 100644
--- a/bsd-user/arm/target_syscall.h
+++ b/bsd-user/arm/target_syscall.h
@@ -1,5 +1,24 @@
-#ifndef BSD_USER_ARCH_SYSCALL_H_
-#define BSD_USER_ARCH_SYSCALL_H_
+/*
+ *  arm cpu system call stubs
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_ARCH_SYSCALL_H_
+#define _TARGET_ARCH_SYSCALL_H_
 
 struct target_pt_regs {
     abi_long uregs[17];
@@ -31,6 +50,6 @@ struct target_pt_regs {
 #define TARGET_FREEBSD_ARM_GET_TP       3
 
 #define TARGET_HW_MACHINE       "arm"
-#define TARGET_HW_MACHINE_ARCH  "armv6"
+#define TARGET_HW_MACHINE_ARCH  "armv7"
 
-#endif /* !BSD_USER_ARCH_SYSCALL_H_ */
+#endif /* !_TARGET_ARCH_SYSCALL_H_ */
-- 
2.33.0


