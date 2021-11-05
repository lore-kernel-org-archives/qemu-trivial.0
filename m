Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmG-0005J4-EL
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm1-0004XT-Su
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:15 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:42878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplz-0004BR-5B
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:13 -0400
Received: by mail-il1-x129.google.com with SMTP id y17so8248468ilb.9
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F9IbbLGjnRnokIuDKxQfCzJoAx075CoGnpnzgfUmRKo=;
 b=o+r8nElG3iCR9bk7QdbDAE/A0lmTYP5RtZS7XOEARN2hyhWqEMr5ogYwXPJT4P8IJ3
 bB4aw9oqBvowgUv0ByB8aNoc0zuZZ2xuOpMr/Kbamqcn06w7ZT9w65Z07aAr/NwQLRfW
 4xz4cSD4NWgD4ENbATeR+mG5g/j5/ElpwiVZLW41SyxDrpxMsdetxHG208kqsYdmgcLh
 lMb050xsM+mpE3iyBwzCGK19f8RKm60QgSEbnHeTBHNk7rKm8I/CAYKZ7789geVxEoF5
 2mnZ8g2z5Zjo+l2Lh6E1UDCfrwGXlHkSE7oOJ9PsqS+/xBX/tMczyE3j7PTDRFMiaiPX
 X4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F9IbbLGjnRnokIuDKxQfCzJoAx075CoGnpnzgfUmRKo=;
 b=F73Rv37D74LUcAjvmlmLP1g0L3Jzhw0RxQPqO7X6IX5y80x2XDm+KV8I9s1lRV6fkB
 VBIEfil25YHRL+dvFRD6xhwO2z2gRKf/RGrRXov06mt7sFAZ+p1U7pkMPyyM/fMwHEqu
 uwW6fVgJz9WT4KO1H2ziZbvX9mn/qdh6kOzA7dNbiIM9AjzDxDFu8Z8oq576NOHnr3Gw
 b1zygu3Rl3NDFIrOW4OQ5vDH7p7I0HrB8mYsN1VUowN+Yh+Qv/LyOEEp1EgPZ6unj72s
 pthpbMKD83YiZ9yVAqZOmgBWlExO5Flw9Q7vZUJpq5P9o4CQ5UHNOiSshaxw18jH7GQy
 elWA==
X-Gm-Message-State: AOAM532LJmaa8eKE5BKRHCpOJFoIAXpQiFUNfFj00QwyxbXeCVZo2oe7
 NXUncBRNlz9mkpSvjh+EFyJo3Q==
X-Google-Smtp-Source: ABdhPJy68Ox0LvXgWo+tH9YM1MJ0iaOv59KpkNWxx53+Sbqc1stQBaLdPAiC3ySF5Wml+k7mY4xXqQ==
X-Received: by 2002:a92:ca48:: with SMTP id q8mr39332048ilo.173.1636082409906; 
 Thu, 04 Nov 2021 20:20:09 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:09 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 23/36] bsd-user/arm/target_arch_sigtramp.h: Signal
 Trampoline for arm
Date: Thu,  4 Nov 2021 21:19:04 -0600
Message-Id: <20211105031917.87837-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:15 -0000

Copy of the signal trampoline code for arm, as well as setup_sigtramp to
write it to the stack.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_sigtramp.h | 49 +++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_sigtramp.h

diff --git a/bsd-user/arm/target_arch_sigtramp.h b/bsd-user/arm/target_arch_sigtramp.h
new file mode 100644
index 0000000000..5d434a9e7e
--- /dev/null
+++ b/bsd-user/arm/target_arch_sigtramp.h
@@ -0,0 +1,49 @@
+/*
+ *  arm sysarch() system call emulation
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
+#ifndef _TARGET_ARCH_SIGTRAMP_H_
+#define _TARGET_ARCH_SIGTRAMP_H_
+
+/* Compare to arm/arm/locore.S ENTRY_NP(sigcode) */
+static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
+        unsigned sys_sigreturn)
+{
+    int i;
+    uint32_t sys_exit = TARGET_FREEBSD_NR_exit;
+    uint32_t sigtramp_code[] = {
+    /* 1 */ 0xE1A0000D,                  /* mov r0, sp */
+    /* 2 */ 0xE2800000 + sigf_uc,        /* add r0, r0, #SIGF_UC */
+    /* 3 */ 0xE59F700C,                  /* ldr r7, [pc, #12] */
+    /* 4 */ 0xEF000000 + sys_sigreturn,  /* swi (SYS_sigreturn) */
+    /* 5 */ 0xE59F7008,                  /* ldr r7, [pc, #8] */
+    /* 6 */ 0xEF000000 + sys_exit,       /* swi (SYS_exit)*/
+    /* 7 */ 0xEAFFFFFA,                  /* b . -16 */
+    /* 8 */ sys_sigreturn,
+    /* 9 */ sys_exit
+    };
+
+    G_STATIC_ASSERT(sizeof(sigtramp_code) == TARGET_SZSIGCODE);
+
+    for (i = 0; i < 9; i++) {
+        tswap32s(&sigtramp_code[i]);
+    }
+
+    return memcpy_to_target(offset, sigtramp_code, TARGET_SZSIGCODE);
+}
+#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
-- 
2.33.0


