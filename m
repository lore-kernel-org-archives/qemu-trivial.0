Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66Iz-0005ZX-U5
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:38:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IO-0005Hk-RJ
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:55 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=38509
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IL-0003Ji-6v
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:37:47 -0500
Received: by mail-io1-xd2b.google.com with SMTP id u8so10106309iol.5
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGsTvM8y9NLcTQj3zPOMQgGUhhAudJAW7AN5jbbUbhw=;
 b=GCD1MBThHEOVXHlWkXx4vlEk1jc5RbfUV9e3dz2nQtQ/TfpsI+yp/7KNbA7uZ2CEgm
 npKVdLF3/KL87GY9sLyXqoX9g5QO53CO3DmfC5ye1xrfPDKXQuwH76SpK1X1/EO2GSQN
 29PzGj0Jsl1V+19GWwBILc8HXJkVzVaiPViJIKRWqq+4kIVRRHsi06cuh9wGVQkrG2Wr
 YqvQ+rXjzyf7ViAL8LKmpM2RaQ0KhmwKehYtD5cctsCYeVV3WKhSXgS36tGs/f3iXg8S
 gfK4/+I9dLEloJv+NUdBBdkZ4R1xrKOnLN8HWYCqplPzYQJelm4w3QZUOVa9cjjwDLc/
 tVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGsTvM8y9NLcTQj3zPOMQgGUhhAudJAW7AN5jbbUbhw=;
 b=CMxTfsIQ6mmWcZA5gDM1a0BxX6Z0RT5FeuYfbntvqY+Bt3hAvlKLFYs2x2ZiNMLiFO
 p0Vs6VkKuHmDhfZisKE0O2BUQmr8awRMcGFgjqsUBOfdq8eYh8orVLiWGQVLKz8EMTYv
 SUaJWLJL0Jvyi1iQvowNvhYjvBl/poF6alre1cuUFS9EuffUiJ56CVMKP853AAUBbjwb
 HPNPAx4kVhK36qe7HOeWZeZ0L3w14O9WnSPFbGgmk1tQNskiGx8u1zqtI8UVgSNyaLIU
 AONBFOs4p1osnU7PaxzlbR5PdExfcyYXeNYNVMR/VgNwbHKg6W/xI0vqVbsKnu6FcKxq
 9ZEA==
X-Gm-Message-State: AOAM5313bRQtcKP9Xq64QMaQreTV/17zMbRSE2omzLjxyUjTZh1mL0Pl
 5X+Md/MK6HSGyCLCqM+DfbUWdQ==
X-Google-Smtp-Source: ABdhPJzRpo8Hq6j9cF8aO3qZIYOegXtlsbRQdfhIFL/zqvLczG9y3b0b4xnbhB8zAkq35SA8SNI3bQ==
X-Received: by 2002:a02:cf23:: with SMTP id s3mr30101444jar.201.1641627462843; 
 Fri, 07 Jan 2022 23:37:42 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:42 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/37] Bsd user arm patches
Date: Sat,  8 Jan 2022 00:37:00 -0700
Message-Id: <20220108073737.5959-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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

The following changes since commit 7d4ae4d4978079d564d3b6354c90a949130409fe:

  Merge tag 'pull-request-2022-01-05' of https://gitlab.com/thuth/qemu into staging (2022-01-05 08:47:18 -0800)

are available in the Git repository at:

  git@gitlab.com:bsdimp/qemu.git tags/bsd-user-arm-pull-request

for you to fetch changes up to 18fe5d99f27fa7458724aa367e3c6784c36d5771:

  bsd-user: add arm target build (2022-01-07 22:58:51 -0700)

----------------------------------------------------------------
bsd-user: arm (32-bit) support

This series of patches brings in 32-bit arm support for bsd-user.  It implements
all the bits needed to do image activation, signal handling, stack management
and threading. This allows us to get to the "Hello World" level. The arm and x86
code are now the same as in the bsd-user fork. For full context, the fork is at
https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz (though the the recent
sig{bus,segv} needed updates are incomplete).

v5 changes:
   o Moved to using the CPUArchState typedef and move
     set_sigtramp_args, get_mcontext, set_mcontext, and
     get_ucontext_sigreturn prototypes to
     bsd-user/freebsd/target_os_ucontext.h
   o Fix issues with arm's set_mcontext related to masking
     and remove an unnecessary check.

We're down to only one hunk needing review:
    bsd-user/arm/target_arch_signal.c: arm set_mcontext

Warnings that should be ignored:
   o make checkpatch has a couple of complaints about the comments for the
     signal trampoline, since it's a false positive IMHO.
WARNING: Block comments use a leading /* on a separate line
+    /* 8 */ sys_sigreturn,
WARNING: Block comments use a leading /* on a separate line
+    /* 9 */ sys_exit

----------------------------------------------------------------

Warner Losh (37):
  bsd-user/mips*: Remove mips support
  bsd-user/freebsd: Create common target_os_ucontext.h file
  bsd-user: create a per-arch signal.c file
  bsd-user/i386/target_arch_signal.h: Remove target_sigcontext
  bsd-user/i386/target_arch_signal.h: use new target_os_ucontext.h
  bsd-user/i386/target_arch_signal.h: Update mcontext_t to match FreeBSD
  bsd-user/i386: Move the inlines into signal.c
  bsd-user/x86_64/target_arch_signal.h: Remove target_sigcontext
  bsd-user/x86_64/target_arch_signal.h: use new target_os_ucontext.h
  bsd-user/x86_64/target_arch_signal.h: Fill in mcontext_t
  bsd-user/x86_64: Move functions into signal.c
  bsd-user/target_os_signal.h: Move signal prototypes to
    target_os_ucontext.h
  bsd-user/arm/target_arch_sysarch.h: Use consistent include guards
  bsd-user/arm/target_syscall.h: Add copyright and update name
  bsd-user/arm/target_arch_cpu.c: Target specific TLS routines
  bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
  bsd-user/arm/target_arch_cpu.h: Implement target_cpu_clone_regs
  bsd-user/arm/target_arch_cpu.h: Dummy target_cpu_loop implementation
  bsd-user/arm/target_arch_cpu.h: Implement trivial EXCP exceptions
  bsd-user/arm/target_arch_cpu.h: Implement data abort exceptions
  bsd-user/arm/target_arch_cpu.h: Implement system call dispatch
  bsd-user/arm/target_arch_reg.h: Implement core dump register copying
  bsd-user/arm/target_arch_vmparam.h: Parameters for arm address space
  bsd-user/arm/target_arch_sigtramp.h: Signal Trampoline for arm
  bsd-user/arm/target_arch_thread.h: Routines to create and switch to a
    thread
  bsd-user/arm/target_arch_elf.h: arm defines for ELF
  bsd-user/arm/target_arch_elf.h: arm get hwcap
  bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
  bsd-user/arm/target_arch_signal.h: arm specific signal registers and
    stack
  bsd-user/arm/target_arch_signal.h: arm machine context and trapframe
    for signals
  bsd-user/arm/target_arch_signal.h: Define size of *context_t
  bsd-user/arm/signal.c: arm set_sigtramp_args
  bsd-user/arm/signal.c: arm get_mcontext
  bsd-user/arm/signal.c: arm set_mcontext
  bsd-user/arm/signal.c: arm get_ucontext_sigreturn
  bsd-user/freebsd/target_os_ucontext.h: Require TARGET_*CONTEXT_SIZE
  bsd-user: add arm target build

 bsd-user/arm/signal.c                 | 196 ++++++++++++++++++++++++
 bsd-user/arm/target_arch.h            |  28 ++++
 bsd-user/arm/target_arch_cpu.c        |  39 +++++
 bsd-user/arm/target_arch_cpu.h        | 211 ++++++++++++++++++++++++++
 bsd-user/arm/target_arch_elf.h        | 128 ++++++++++++++++
 bsd-user/arm/target_arch_reg.h        |  60 ++++++++
 bsd-user/arm/target_arch_signal.h     |  88 +++++++++++
 bsd-user/arm/target_arch_sigtramp.h   |  49 ++++++
 bsd-user/arm/target_arch_sysarch.h    |   6 +-
 bsd-user/arm/target_arch_thread.h     |  82 ++++++++++
 bsd-user/arm/target_arch_vmparam.h    |  48 ++++++
 bsd-user/arm/target_syscall.h         |  27 +++-
 bsd-user/freebsd/target_os_signal.h   |   3 -
 bsd-user/freebsd/target_os_ucontext.h |  44 ++++++
 bsd-user/i386/signal.c                |  55 +++++++
 bsd-user/i386/target_arch_signal.h    |  95 ++++++------
 bsd-user/mips/target_arch_sysarch.h   |  69 ---------
 bsd-user/mips/target_syscall.h        |  52 -------
 bsd-user/mips64/target_arch_sysarch.h |  69 ---------
 bsd-user/mips64/target_syscall.h      |  53 -------
 bsd-user/x86_64/signal.c              |  55 +++++++
 bsd-user/x86_64/target_arch_signal.h  | 103 +++++++------
 configs/targets/arm-bsd-user.mak      |   2 +
 meson.build                           |   2 +-
 24 files changed, 1214 insertions(+), 350 deletions(-)
 create mode 100644 bsd-user/arm/signal.c
 create mode 100644 bsd-user/arm/target_arch.h
 create mode 100644 bsd-user/arm/target_arch_cpu.c
 create mode 100644 bsd-user/arm/target_arch_cpu.h
 create mode 100644 bsd-user/arm/target_arch_elf.h
 create mode 100644 bsd-user/arm/target_arch_reg.h
 create mode 100644 bsd-user/arm/target_arch_signal.h
 create mode 100644 bsd-user/arm/target_arch_sigtramp.h
 create mode 100644 bsd-user/arm/target_arch_thread.h
 create mode 100644 bsd-user/arm/target_arch_vmparam.h
 create mode 100644 bsd-user/freebsd/target_os_ucontext.h
 create mode 100644 bsd-user/i386/signal.c
 delete mode 100644 bsd-user/mips/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips/target_syscall.h
 delete mode 100644 bsd-user/mips64/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips64/target_syscall.h
 create mode 100644 bsd-user/x86_64/signal.c
 create mode 100644 configs/targets/arm-bsd-user.mak

-- 
2.33.1


