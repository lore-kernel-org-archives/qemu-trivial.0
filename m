Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miplp-0004MM-4t
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miple-0004Am-UB
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:50 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:41609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplc-00042S-GO
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:50 -0400
Received: by mail-il1-x129.google.com with SMTP id i9so8227418ilu.8
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N4lcEk/ClAeFeQ3e0ZN2TFMzonlfqSNAu0iwaNY3yxc=;
 b=A356aFL5/27F4ADePxdAXUUKDYnR0qufKDZpDDOE+m4epfikrV/5Ofowb9wrmezTf8
 PWSdG7LrRs/VyYWd8nbV1BN3EObH/PpaIavrlm+2aWADvRQaJVFAOFfgC8UKm6BmuLSs
 j8f4JhI29zhrCw8eqDG8bphJ11MrX9UwyooySpCVSeNnCVpMay0ZZng1IW3OOfMWDAML
 65gYm08ILpnAVEN9u9rjdQuZPYcDIsAYKXdYn2hrSohDR2kFU9zC+diiz+3/FQVBlhiQ
 xHVOEGD/E9u/b7695aJiVqOn/pDeZpB3H1MOSbDXp5nAFJAODXqRofzc5r3MmLqggJOM
 /bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N4lcEk/ClAeFeQ3e0ZN2TFMzonlfqSNAu0iwaNY3yxc=;
 b=11w6KWHJlTxvwdNeyr9+TYFvmAx5eHiH8WDQNQeBIEAD7jq8LqRfEKXjO3LY0qPGmG
 I3SHCoTEPn9C/0LYrnkLK7T6OHvMYaPCCix3MIgZGbzTzrokUtzIweb9mYx3AedwJ9z3
 vosewfHyrD7vNPomQWrKoqc7lPzQ3395NdszVuf8up+TX+W3N3EQM5CJJCZ1HI0IJiiT
 ar9aIDBLn3aB2CLoQnjotr8hRf7rm/gvD0M3PdLlVq84adllkte1e9IuSYpGAM05R5GB
 ZKmjhxH0+F9O+hLAmXyJstvpaHHuZRJb3hLqpR0Tl/AErg0vueUYGx9WtvLMwX5sJUvl
 WpUQ==
X-Gm-Message-State: AOAM530RPhPvUN8pX75kNJjhWIORb7jg8fdQjPI1VSjvqvF5iFl/HG2l
 HjiyD75TvRp3N7/SFYS0AmkApg==
X-Google-Smtp-Source: ABdhPJxRXZTesQrzPNcQhI41F5F3vICaws7paZJ8ujgPe8XiUcm0elSw3FQI5/4B8TSkfO/XwhzW8A==
X-Received: by 2002:a05:6e02:16c7:: with SMTP id
 7mr15345161ilx.201.1636082387256; 
 Thu, 04 Nov 2021 20:19:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:46 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v4 01/36] bsd-user/mips*: Remove
Date: Thu,  4 Nov 2021 21:18:42 -0600
Message-Id: <20211105031917.87837-2-imp@bsdimp.com>
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
X-List-Received-Date: Fri, 05 Nov 2021 03:19:51 -0000

FreeBSD has dropped support for mips starting with FreeBSD 14. mips
support has been removed from the bsd-user fork because updating it for
new signal requirements. Remove it here since it is a distraction.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mips/target_arch_sysarch.h   | 69 ---------------------------
 bsd-user/mips/target_syscall.h        | 52 --------------------
 bsd-user/mips64/target_arch_sysarch.h | 69 ---------------------------
 bsd-user/mips64/target_syscall.h      | 53 --------------------
 4 files changed, 243 deletions(-)
 delete mode 100644 bsd-user/mips/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips/target_syscall.h
 delete mode 100644 bsd-user/mips64/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips64/target_syscall.h

diff --git a/bsd-user/mips/target_arch_sysarch.h b/bsd-user/mips/target_arch_sysarch.h
deleted file mode 100644
index 6da803a408..0000000000
--- a/bsd-user/mips/target_arch_sysarch.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- *  mips sysarch() system call emulation
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
-
-#include "target_syscall.h"
-#include "target_arch.h"
-
-static inline abi_long do_freebsd_arch_sysarch(CPUMIPSState *env, int op,
-        abi_ulong parms)
-{
-    int ret = 0;
-
-    switch (op) {
-    case TARGET_MIPS_SET_TLS:
-        target_cpu_set_tls(env, parms);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        if (put_user(target_cpu_get_tls(env), parms, abi_ulong)) {
-            ret = -TARGET_EFAULT;
-        }
-        break;
-
-    default:
-        ret = -TARGET_EINVAL;
-        break;
-    }
-
-    return ret;
-}
-
-static inline void do_freebsd_arch_print_sysarch(
-        const struct syscallname *name, abi_long arg1, abi_long arg2,
-        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    switch (arg1) {
-    case TARGET_MIPS_SET_TLS:
-        gemu_log("%s(SET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        gemu_log("%s(GET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    default:
-        gemu_log("UNKNOWN OP: %d, " TARGET_ABI_FMT_lx ")", (int)arg1, arg2);
-    }
-}
-
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/mips/target_syscall.h b/bsd-user/mips/target_syscall.h
deleted file mode 100644
index aacc6ddf9f..0000000000
--- a/bsd-user/mips/target_syscall.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/*
- *  mips system call definitions
- *
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef _MIPS_SYSCALL_H_
-#define _MIPS_SYSCALL_H_
-
-/*
- * struct target_pt_regs defines the way the registers are stored on the stack
- * during a system call.
- */
-
-struct target_pt_regs {
-    /* Saved main processor registers. */
-    abi_ulong regs[32];
-
-    /* Saved special registers. */
-    abi_ulong cp0_status;
-    abi_ulong lo;
-    abi_ulong hi;
-    abi_ulong cp0_badvaddr;
-    abi_ulong cp0_cause;
-    abi_ulong cp0_epc;
-};
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-#define UNAME_MACHINE "mips"
-#else
-#define UNAME_MACHINE "mipsel"
-#endif
-
-#define TARGET_HW_MACHINE       "mips"
-#define TARGET_HW_MACHINE_ARCH   UNAME_MACHINE
-
-/* sysarch() commands */
-#define TARGET_MIPS_SET_TLS     1
-#define TARGET_MIPS_GET_TLS     2
-
-#endif /* !_MIPS_SYSCALL_H_ */
diff --git a/bsd-user/mips64/target_arch_sysarch.h b/bsd-user/mips64/target_arch_sysarch.h
deleted file mode 100644
index e6f9c00d5f..0000000000
--- a/bsd-user/mips64/target_arch_sysarch.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- *  mips64 sysarch() system call emulation
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
-
-#include "target_syscall.h"
-#include "target_arch.h"
-
-static inline abi_long do_freebsd_arch_sysarch(CPUMIPSState *env, int op,
-        abi_ulong parms)
-{
-    int ret = 0;
-
-    switch (op) {
-    case TARGET_MIPS_SET_TLS:
-        target_cpu_set_tls(env, parms);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        if (put_user(target_cpu_get_tls(env), parms, abi_ulong)) {
-            ret = -TARGET_EFAULT;
-        }
-        break;
-
-    default:
-        ret = -TARGET_EINVAL;
-        break;
-    }
-
-    return ret;
-}
-
-static inline void do_freebsd_arch_print_sysarch(
-        const struct syscallname *name, abi_long arg1, abi_long arg2,
-        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    switch (arg1) {
-    case TARGET_MIPS_SET_TLS:
-        gemu_log("%s(SET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        gemu_log("%s(GET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    default:
-        gemu_log("UNKNOWN OP: %d, " TARGET_ABI_FMT_lx ")", (int)arg1, arg2);
-    }
-}
-
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/mips64/target_syscall.h b/bsd-user/mips64/target_syscall.h
deleted file mode 100644
index bf4c598b13..0000000000
--- a/bsd-user/mips64/target_syscall.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- *  mips64 system call definitions
- *
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef _MIPS64_SYSCALL_H_
-#define _MIPS64_SYSCALL_H_
-
-/*
- * struct target_pt_regs defines the way the registers are stored on the stack
- * during a system call.
- */
-
-struct target_pt_regs {
-    /* Saved main processor registers. */
-    abi_ulong regs[32];
-
-    /* Saved special registers. */
-    abi_ulong cp0_status;
-    abi_ulong lo;
-    abi_ulong hi;
-    abi_ulong cp0_badvaddr;
-    abi_ulong cp0_cause;
-    abi_ulong cp0_epc;
-};
-
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-#define UNAME_MACHINE "mips64"
-#else
-#define UNAME_MACHINE "mips64el"
-#endif
-
-#define TARGET_HW_MACHINE       "mips"
-#define TARGET_HW_MACHINE_ARCH  UNAME_MACHINE
-
-/* sysarch() commands */
-#define TARGET_MIPS_SET_TLS     1
-#define TARGET_MIPS_GET_TLS     2
-
-#endif /* !_MIPS64_SYSCALL_H_ */
-- 
2.33.0


