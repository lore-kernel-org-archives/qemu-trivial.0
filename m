Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsEi-0008KI-2W
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEh-0008I9-41
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:11 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:35485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEe-0000B2-93
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:10 -0400
Received: by mail-io1-xd2e.google.com with SMTP id h196so21163475iof.2
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0UUskACfV2zCuBONtYOvwkg8JEg6xz8QNgav6wf0dw=;
 b=pjl7hvfSTkv+8GXaH66+yD6m0n8QUBIJTiOBJORyk1Gf0UpDkF6s5nxPjp9TvOn3gx
 MxYNjurTEe+WxiHuNLTkiW9MAAhNlYL+XG6OeZegQdFYoBwPUjQzDOvc+CCiveB3FO00
 w0Ni+Nyi8IwJU3ibRNuxp+2Zk/3D29FIdmDhMuSBdDTfkPaQ4/mbvyrjhaA1JVaPN2Mi
 whvLcYb+gBRJNSgudNuFK0QrGWT69mbsgwHCBULrdAaifSy6J5rcvUbncuynKfvu+oGY
 z4U0zQ4HA5P/Te/EH3Hoh5aZVYc62E0z9NRDwlvEBH8VVJzvWgWNE8g95W+ujzPqwg7x
 r27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A0UUskACfV2zCuBONtYOvwkg8JEg6xz8QNgav6wf0dw=;
 b=cYPZD+9LWk7D2fmOGGMOZ+bpvdHToKMPCAisVZq0ojXsBl9AqhKTnN3jOPrEHIIryk
 Y7Ghespk7wmsUb/E0hIfUBNTi8ptNmi+hDHt6/WuMBuf9jQCqzVcaFL9pOlTB3w8LXBW
 oXCzX37eBw6jLg0lLGolhtAaJs3V4SGL6sfwl+BJng6L1gvyNMojRSXG/lbb15IwOksd
 AyG9v/7Xg1tX8B/lohWsYe92AZsVM4z0bELu0KVkitavQND7wfMB9hymjxu3lkm0HgDW
 gedfyoCSgKoJq+itydPhTFa96W3oQrIjb8pkhr++n1s9wBjkxjJTAADPdUmRCeyiUia0
 W2aA==
X-Gm-Message-State: AOAM531Oz01rs+LqRb6G2jT9q/4pdu4i5OCtrtizdV2rc5s934hDKKR4
 Bv43jgy6SQdpsKvJ7a4KLMgI0Q==
X-Google-Smtp-Source: ABdhPJxiaPB2ipe9zaj3AnJTZEEqgn01+1unrEyCAIfW141UjqXUCZNEhfQADCfBqgWAD5PjAdVAzg==
X-Received: by 2002:a05:6602:1514:: with SMTP id
 g20mr20084425iow.9.1634661906534; 
 Tue, 19 Oct 2021 09:45:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 02/24] bsd-user/arm/target_syscall.h: Add copyright and update
 name
Date: Tue, 19 Oct 2021 10:44:25 -0600
Message-Id: <20211019164447.16359-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2021 16:45:11 -0000

The preferred name for the 32-bit arm is now armv7. Update the name to
reflect that. In addition, add Stacey's copyright to this file and
update the include guards to the new convention.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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
2.32.0


