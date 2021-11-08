Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvoz-0006BV-Jp
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:59:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvoy-00066U-E5
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:48 -0500
Received: from [2607:f8b0:4864:20::830] (port=35682
 helo=mail-qt1-x830.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvow-0000sB-1W
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:48 -0500
Received: by mail-qt1-x830.google.com with SMTP id j17so447972qtx.2
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5K9w6Dgj9bW+v4mINR6IMzovYCKqh6rwlm+KG2b5Ybg=;
 b=rGwrx3XAvePrp0hsVAZQJa2kXVeuZdt/L3RIC83NzDWj68rDJJ3YEKI1AigXRWc02Z
 cta/X1+lLCSRlAQIzX+pEJoXPc8Xa1FCgs8QNfxcooObttj8O4wPnELzyDXcX2flxD7g
 5vnJqiP1fShxpANdgYBX82niwAyXdA2N2xAr7XVBcdemjvURHjBXEIi0AZJTMYRoAY1z
 FD/UK1sYDSWn5b7IT6D+7tp220y1nV7gfOR92sn8dMXmFBZEXp34Zx0NSCzyfW4E/JXz
 XTIk/MkvL4oYkWFusqKGOp01OrpKOM8QQajk3ri+j9eNYHcIzZ4aP/jhWoDn7DNZweRs
 yvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5K9w6Dgj9bW+v4mINR6IMzovYCKqh6rwlm+KG2b5Ybg=;
 b=cENvtZTuZvuR0XiC+oL61U1Pl33/sLZJ6+M04j+P17fzZ8O2utNjXE6chLHK/PaOHj
 BfttiKamS9fuNyoVEQvAQI5a9HE5Rtg2dhj+lS6wNwhLTJUfIqyMKETd0LHZfJRnwcZb
 akQ+nkkIIs2KqR0oEkMu/9Vk/4+Hv8rxMyTDHkaU6sGOI9snmRpMy06DetYSqQyC0/xq
 s3EMC7TBx9CE1fOPeBsoyoRlO916vtkwPX+oy/tWjxZKkwBYPmya8PAKaXrxZ2alRPuO
 PCBqqK+bX3BzxxT6m+Pjd7lRJYpbL/+WODibhsHbEdWTOQMVPDix7dFIIpgR5w7Ab8I7
 3EGA==
X-Gm-Message-State: AOAM532dgkqGksxpamnTv4uH0xmX2zhlqmpEnY1CV2uL2Of79/BNsggJ
 rL2GNvRPkrHVqnSS7u9UkF9e+mk15bbbgQ==
X-Google-Smtp-Source: ABdhPJwuJaQD5pspEKc7HbJ8ySQC7PwB9nzLF48aqRPIhUJp6NLCJmWBUJlrqceyOBaOIHwtqJZ9FQ==
X-Received: by 2002:a05:6638:14c4:: with SMTP id
 l4mr22620451jak.66.1636343543102; 
 Sun, 07 Nov 2021 19:52:23 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:22 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v5 14/37] bsd-user/arm/target_syscall.h: Add copyright and
 update name
Date: Sun,  7 Nov 2021 20:51:13 -0700
Message-Id: <20211108035136.43687-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::830
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::830;
 envelope-from=imp@bsdimp.com; helo=mail-qt1-x830.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 03:59:48 -0000

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


