Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsEj-0008M2-Eg
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEg-0008Hg-TS
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:10 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEb-00008a-W4
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:10 -0400
Received: by mail-io1-xd30.google.com with SMTP id b188so16221707iof.8
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWqt0w9nIvtuJKPGlQZh/j+NHfSlj1plNPQmtP76IXE=;
 b=IMQNB5CbCn0q06lAZ/fjqBFoi8Ws3ZOMhqlRxG//A2Jk3QYxMw9Oijzgs6Nmb3+9fh
 WWuY9N+TaRVlaseHv/fBirr+l8oPV2yDncGqPqM9octbvfbCdnU8EMSkV7kq0qXMPpdO
 c9usm59SX/iM65rWzRrF08mjaq3uWiZK4AvYG22or70i9lE4z5qtnEu2NqhPlrjWphY3
 /Q6Y3JbistAfT1Nzc4eZnomO3FYTOBo0gpj0yxnBwpPXkqcRToTRpq6q3D+GSUT7dmqY
 douN4UsCzyuswhsc8JuRuZ9idI1/CHyk0OKZ2yH1XlhahtF3AldTIBrNM4MJQNrXi7RV
 7qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWqt0w9nIvtuJKPGlQZh/j+NHfSlj1plNPQmtP76IXE=;
 b=lB6tqgPp827/ymltDlezkd4lIoLwUQlqkdltMVN3kLYb4k38+VfdBuDkK3ysHu9zJa
 zOaEOYXaheZ0WbCPErmkisZmMvDvJgG/xGSAfrQ9nRcvE1mQrkjCpT8lgNwfKOB4IoWU
 kNTtL87MrhqJpAbRlvr3dr/5YjwxkGxqAYEHtMVOp/eY3k8aL+t1tMWfVIT0B/fIazXD
 Yakpn0z2hGog1Z+4zOQiBTb4M5HUlBrZ6MmoXmiQ8Dg6yiSXDouakeWtSEBTv3VotTQz
 akUMpldw1bAXM2EIlk9fprtMoYKFHdqiwOtMOTK9SbDn0YuDgwTlw9gPlIQNoY46frfi
 KNag==
X-Gm-Message-State: AOAM533D6Kuezend1X6efeMuaNx9NO/8AMCrTQ7c4x7icG32xzPQyon6
 TLU+nj/csv3JPR2bJlea1ThROSLGyaPXqw==
X-Google-Smtp-Source: ABdhPJyNRIa++mgRdnVuZigD04N4m6nLVCxLc4rQNXVSNcJ16DYeC66TAXa5CSGsQMcJk943CRPA0w==
X-Received: by 2002:a02:ce82:: with SMTP id y2mr4930765jaq.121.1634661903805; 
 Tue, 19 Oct 2021 09:45:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 00/24] bsd-user: arm (32-bit) support
Date: Tue, 19 Oct 2021 10:44:23 -0600
Message-Id: <20211019164447.16359-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This series of patches brings in 32-bit arm support for bsd-user.  It implements
all the bits needed to do image activation, signal handling, stack management
and threading. This allows us to get to the "Hello World" level and also to
satisfy all linking requirements. I've sliced up the current bsd-user fork
versions of all this code into what I hope are right-sized reviewable chunks.

make checkpatch has a couple of complaints about the comments for the signal
trampoline:
WARNING: Block comments use a leading /* on a separate line
+    /* 8 */ sys_sigreturn,

WARNING: Block comments use a leading /* on a separate line
+    /* 9 */ sys_exit

that I think should be ignored.

Warner Losh (24):
  bsd-user/arm/target_arch_sysarch.h: Use consistent include guards
  bsd-user/arm/target_syscall.h: Add copyright and update name
  bsd-user/arm/target_arch_cpu.c: Target specific TLS routines
  bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
  bsd-user/arm/target_arch_cpu.h: Implement target_cpu_clone_regs
  bsd-user/arm/target_arch_cpu.h: Dummy target_cpu_loop implementation
  bsd-user/arm/target_arch_cpu.h: Implment trivial EXCP exceptions
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
  bsd-user/arm/target_arch_signal.h: arm machine context for signals
  bsd-user/arm/target_arch_signal.h: arm user context and trapframe for
    signals
  bsd-user/arm/target_arch_signal.h: arm set_sigtramp_args
  bsd-user/arm/target_arch_signal.h: arm get_mcontext
  bsd-user/arm/target_arch_signal.h: arm set_mcontext
  bsd-user/arm/target_arch_signal.h: arm get_ucontext_sigreturn
  bsd-user: add arm target build

 bsd-user/arm/target_arch.h          |  28 +++
 bsd-user/arm/target_arch_cpu.c      |  39 +++++
 bsd-user/arm/target_arch_cpu.h      | 206 ++++++++++++++++++++++
 bsd-user/arm/target_arch_elf.h      | 128 ++++++++++++++
 bsd-user/arm/target_arch_reg.h      |  60 +++++++
 bsd-user/arm/target_arch_signal.h   | 253 ++++++++++++++++++++++++++++
 bsd-user/arm/target_arch_sigtramp.h |  52 ++++++
 bsd-user/arm/target_arch_sysarch.h  |   6 +-
 bsd-user/arm/target_arch_thread.h   |  71 ++++++++
 bsd-user/arm/target_arch_vmparam.h  |  48 ++++++
 bsd-user/arm/target_syscall.h       |  27 ++-
 configs/targets/arm-bsd-user.mak    |   2 +
 12 files changed, 913 insertions(+), 7 deletions(-)
 create mode 100644 bsd-user/arm/target_arch.h
 create mode 100644 bsd-user/arm/target_arch_cpu.c
 create mode 100644 bsd-user/arm/target_arch_cpu.h
 create mode 100644 bsd-user/arm/target_arch_elf.h
 create mode 100644 bsd-user/arm/target_arch_reg.h
 create mode 100644 bsd-user/arm/target_arch_signal.h
 create mode 100644 bsd-user/arm/target_arch_sigtramp.h
 create mode 100644 bsd-user/arm/target_arch_thread.h
 create mode 100644 bsd-user/arm/target_arch_vmparam.h
 create mode 100644 configs/targets/arm-bsd-user.mak

-- 
2.32.0


