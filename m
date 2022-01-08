Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66Jp-00063G-EH
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:39:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ie-0005K2-IK
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:11 -0500
Received: from [2607:f8b0:4864:20::12c] (port=45672
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0003Mj-73
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:02 -0500
Received: by mail-il1-x12c.google.com with SMTP id t8so6457631ilf.12
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0H+m4LDBE01vFVrI9/EJo5rUemEcZhwntbPVg9Vpa6c=;
 b=osC5SJXbPxU4OcvFO+TIWLUT6Lh1U6of1ZgrJWeGnERvW5BPtQwEyoucQfmN7FSZP1
 0JYcoV1j13BCoFo8BD3lYXDYXnLkNy4Gd5fIyymUB+7hT7fwKrA8HNGeQBH3HToOVVwF
 5wzdL/z/93gWGj9QeOS4DSwDOgw+d1Lo13PSfFa3ce2BniMTMXpyjOw5AUIZ+4FTdKdo
 X0wBeC3G7AjRVkpNKeXDoVX5bx32+ykd6MTnUDwa/FvRZ0C6+WMwwiydJEXVHcjjv88f
 IFU9bG3O9AGh0ANcYTzyfLJarqC9DFUjMaJC21+vOKKgpKsAM+yp8pqR8l8K04eYFPF/
 VHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0H+m4LDBE01vFVrI9/EJo5rUemEcZhwntbPVg9Vpa6c=;
 b=5Ed155hWVsqJgLUfc2rbAFGRTPOKHd2/gGd7bpZl4iMX7AYIRLTqOhtyBKFP3IH2wg
 QXYf02iq+fXRV5b7/fRnNQPJZbtovTimxHLVASzCMHxFxbPpsu44gcYuxQ9Xd2uJHCkr
 G19sIKPhTDGIrCbMtK8wD5tJapzFmYYkAba/Fu8q5ugtlYWFocGcnNvcsXwTjLTaNXtX
 jNIbBIgX2I063PwNd164pO/3erkdBpHZ/kwzbT4NjeNvMCQHwq+t+YToGkKPUFX0pn2f
 E0WWSndANjMXraFQ/FHUNy7bUUOsoFPxhFWewFw0AKsZpDwIvRO4OHwVBZFgbfI51n8G
 bANQ==
X-Gm-Message-State: AOAM532i7H/D9+m/mqXvuXs7nfYO5j+13A/yIDdrc8RXOfEIJ3GH2H9T
 X8NJjYbTBr5gVWDMdFRbsh8ZUA==
X-Google-Smtp-Source: ABdhPJwHHwgzafTWPB7iMYAZ0fGjjUj7/QXs7K1MwEKmJu7tWDI0ysKtXLgcqgHPnYuZLTyYeE82hg==
X-Received: by 2002:a92:dc8c:: with SMTP id c12mr29411185iln.43.1641627476596; 
 Fri, 07 Jan 2022 23:37:56 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:56 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 14/37] bsd-user/arm/target_syscall.h: Add copyright and update
 name
Date: Sat,  8 Jan 2022 00:37:14 -0700
Message-Id: <20220108073737.5959-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:14 -0000

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
index ef4b37f0178..a5f2bb4e011 100644
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
2.33.1


