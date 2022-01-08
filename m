Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6HEY-000167-FO
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 14:18:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6HEW-00015n-Sc
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 14:18:32 -0500
Received: from [2607:f8b0:4864:20::1030] (port=33460
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6HEU-00053P-HD
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 14:18:32 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so7716399pjl.0
 for <qemu-trivial@nongnu.org>; Sat, 08 Jan 2022 11:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tTFuxXZUmeoRJYbjMVOPg6CPeWqT2HFOzYWOdzGQR8M=;
 b=nIdYMbu2NHqmoUfFgDL0tPHyEH95Bx+pibml2L+yHhOXKcBm0lxQNrCocSFjzE0vvA
 Fk6y+4Ea1YD9CXzt0xlJHvgksWv+qVjjTTmXe5b5Pd3X7YUj/sgY+fR5TH9kT2DuxX+2
 X/su7Ccw65vgEOsTfbnaJQfyH3VruPJd+aa9iAJDd4jRoDL9ELl19Sz+XmRSD/Xb4eIa
 vnzlMQpRokkFui8ouv2Wf5sxr6VRK9E5mhG6nZDXE2Ij3L94hjeknUVHE4T3GhaH7ZIu
 ymXBdByIK2dg0pUMxU+EE1MnMzJ1/xVnZ5qFy7pIfKSMw9AmX/TRfkJpwYB0j55/cn0t
 JBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tTFuxXZUmeoRJYbjMVOPg6CPeWqT2HFOzYWOdzGQR8M=;
 b=74gW8Vkr7e8Y2ISeNovBCDYmeFdulAwv8oW2Iva6Y8dQGNCuIBrC0eZKP7ya9L/8HH
 +ICjkATZEbeqbw0GhMxKHgpuLKzjYCwXGQ1BBH+GULnipgA5AtU6DBcg/a7+o37aiv3u
 Q9UnI+XArFnVAis4gH85LP81pLUu5ooCNH9CZ/yovAEHRvYPX411QkolAL2vqHkleAK2
 7gKVjtmJkylSP7n2SCYP21eR5v2lbrx7X8vo7CC9T4eR5qsEcd5+Ci+u+eb3Fh94OeqM
 RHW8onxc/F8asQS5GmVHOuavnJQQbAVKey1FgYWO0LtEi9IPX5+1WAzyviv7nzd5V52K
 jVGw==
X-Gm-Message-State: AOAM531ceroCkx3wMTumUd296+juRPoMPiw6GDsezh43gptC9Vb86sSk
 SLa2rOrVPipmhV3Vq0BHQhshYA==
X-Google-Smtp-Source: ABdhPJxuGAzYMGJ/D2oWjXkYgUQOKRrWM90xlbQItsMMvoN8zwtisQrUlO5MTONbZ64bV+yx8wDSsQ==
X-Received: by 2002:a17:902:76c1:b0:149:989d:c6e3 with SMTP id
 j1-20020a17090276c100b00149989dc6e3mr47045424plt.127.1641669509093; 
 Sat, 08 Jan 2022 11:18:29 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s8sm2725356pfu.58.2022.01.08.11.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 11:18:28 -0800 (PST)
Subject: Re: [PULL 00/37] Bsd user arm patches
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20220108073737.5959-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb90df62-bbf9-c54a-0dbf-5c0604fc004d@linaro.org>
Date: Sat, 8 Jan 2022 11:18:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 08 Jan 2022 19:18:33 -0000

On 1/7/22 11:37 PM, Warner Losh wrote:
> The following changes since commit 7d4ae4d4978079d564d3b6354c90a949130409fe:
> 
>    Merge tag 'pull-request-2022-01-05' of https://gitlab.com/thuth/qemu into staging (2022-01-05 08:47:18 -0800)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:bsdimp/qemu.git tags/bsd-user-arm-pull-request
> 
> for you to fetch changes up to 18fe5d99f27fa7458724aa367e3c6784c36d5771:
> 
>    bsd-user: add arm target build (2022-01-07 22:58:51 -0700)
> 
> ----------------------------------------------------------------
> bsd-user: arm (32-bit) support
> 
> This series of patches brings in 32-bit arm support for bsd-user.  It implements
> all the bits needed to do image activation, signal handling, stack management
> and threading. This allows us to get to the "Hello World" level. The arm and x86
> code are now the same as in the bsd-user fork. For full context, the fork is at
> https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz (though the the recent
> sig{bus,segv} needed updates are incomplete).
> 
> v5 changes:
>     o Moved to using the CPUArchState typedef and move
>       set_sigtramp_args, get_mcontext, set_mcontext, and
>       get_ucontext_sigreturn prototypes to
>       bsd-user/freebsd/target_os_ucontext.h
>     o Fix issues with arm's set_mcontext related to masking
>       and remove an unnecessary check.
> 
> We're down to only one hunk needing review:
>      bsd-user/arm/target_arch_signal.c: arm set_mcontext
> 
> Warnings that should be ignored:
>     o make checkpatch has a couple of complaints about the comments for the
>       signal trampoline, since it's a false positive IMHO.
> WARNING: Block comments use a leading /* on a separate line
> +    /* 8 */ sys_sigreturn,
> WARNING: Block comments use a leading /* on a separate line
> +    /* 9 */ sys_exit
> 
> ----------------------------------------------------------------
> 
> Warner Losh (37):
>    bsd-user/mips*: Remove mips support
>    bsd-user/freebsd: Create common target_os_ucontext.h file
>    bsd-user: create a per-arch signal.c file
>    bsd-user/i386/target_arch_signal.h: Remove target_sigcontext
>    bsd-user/i386/target_arch_signal.h: use new target_os_ucontext.h
>    bsd-user/i386/target_arch_signal.h: Update mcontext_t to match FreeBSD
>    bsd-user/i386: Move the inlines into signal.c
>    bsd-user/x86_64/target_arch_signal.h: Remove target_sigcontext
>    bsd-user/x86_64/target_arch_signal.h: use new target_os_ucontext.h
>    bsd-user/x86_64/target_arch_signal.h: Fill in mcontext_t
>    bsd-user/x86_64: Move functions into signal.c
>    bsd-user/target_os_signal.h: Move signal prototypes to
>      target_os_ucontext.h
>    bsd-user/arm/target_arch_sysarch.h: Use consistent include guards
>    bsd-user/arm/target_syscall.h: Add copyright and update name
>    bsd-user/arm/target_arch_cpu.c: Target specific TLS routines
>    bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
>    bsd-user/arm/target_arch_cpu.h: Implement target_cpu_clone_regs
>    bsd-user/arm/target_arch_cpu.h: Dummy target_cpu_loop implementation
>    bsd-user/arm/target_arch_cpu.h: Implement trivial EXCP exceptions
>    bsd-user/arm/target_arch_cpu.h: Implement data abort exceptions
>    bsd-user/arm/target_arch_cpu.h: Implement system call dispatch
>    bsd-user/arm/target_arch_reg.h: Implement core dump register copying
>    bsd-user/arm/target_arch_vmparam.h: Parameters for arm address space
>    bsd-user/arm/target_arch_sigtramp.h: Signal Trampoline for arm
>    bsd-user/arm/target_arch_thread.h: Routines to create and switch to a
>      thread
>    bsd-user/arm/target_arch_elf.h: arm defines for ELF
>    bsd-user/arm/target_arch_elf.h: arm get hwcap
>    bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
>    bsd-user/arm/target_arch_signal.h: arm specific signal registers and
>      stack
>    bsd-user/arm/target_arch_signal.h: arm machine context and trapframe
>      for signals
>    bsd-user/arm/target_arch_signal.h: Define size of *context_t
>    bsd-user/arm/signal.c: arm set_sigtramp_args
>    bsd-user/arm/signal.c: arm get_mcontext
>    bsd-user/arm/signal.c: arm set_mcontext
>    bsd-user/arm/signal.c: arm get_ucontext_sigreturn
>    bsd-user/freebsd/target_os_ucontext.h: Require TARGET_*CONTEXT_SIZE
>    bsd-user: add arm target build
> 
>   bsd-user/arm/signal.c                 | 196 ++++++++++++++++++++++++
>   bsd-user/arm/target_arch.h            |  28 ++++
>   bsd-user/arm/target_arch_cpu.c        |  39 +++++
>   bsd-user/arm/target_arch_cpu.h        | 211 ++++++++++++++++++++++++++
>   bsd-user/arm/target_arch_elf.h        | 128 ++++++++++++++++
>   bsd-user/arm/target_arch_reg.h        |  60 ++++++++
>   bsd-user/arm/target_arch_signal.h     |  88 +++++++++++
>   bsd-user/arm/target_arch_sigtramp.h   |  49 ++++++
>   bsd-user/arm/target_arch_sysarch.h    |   6 +-
>   bsd-user/arm/target_arch_thread.h     |  82 ++++++++++
>   bsd-user/arm/target_arch_vmparam.h    |  48 ++++++
>   bsd-user/arm/target_syscall.h         |  27 +++-
>   bsd-user/freebsd/target_os_signal.h   |   3 -
>   bsd-user/freebsd/target_os_ucontext.h |  44 ++++++
>   bsd-user/i386/signal.c                |  55 +++++++
>   bsd-user/i386/target_arch_signal.h    |  95 ++++++------
>   bsd-user/mips/target_arch_sysarch.h   |  69 ---------
>   bsd-user/mips/target_syscall.h        |  52 -------
>   bsd-user/mips64/target_arch_sysarch.h |  69 ---------
>   bsd-user/mips64/target_syscall.h      |  53 -------
>   bsd-user/x86_64/signal.c              |  55 +++++++
>   bsd-user/x86_64/target_arch_signal.h  | 103 +++++++------
>   configs/targets/arm-bsd-user.mak      |   2 +
>   meson.build                           |   2 +-
>   24 files changed, 1214 insertions(+), 350 deletions(-)
>   create mode 100644 bsd-user/arm/signal.c
>   create mode 100644 bsd-user/arm/target_arch.h
>   create mode 100644 bsd-user/arm/target_arch_cpu.c
>   create mode 100644 bsd-user/arm/target_arch_cpu.h
>   create mode 100644 bsd-user/arm/target_arch_elf.h
>   create mode 100644 bsd-user/arm/target_arch_reg.h
>   create mode 100644 bsd-user/arm/target_arch_signal.h
>   create mode 100644 bsd-user/arm/target_arch_sigtramp.h
>   create mode 100644 bsd-user/arm/target_arch_thread.h
>   create mode 100644 bsd-user/arm/target_arch_vmparam.h
>   create mode 100644 bsd-user/freebsd/target_os_ucontext.h
>   create mode 100644 bsd-user/i386/signal.c
>   delete mode 100644 bsd-user/mips/target_arch_sysarch.h
>   delete mode 100644 bsd-user/mips/target_syscall.h
>   delete mode 100644 bsd-user/mips64/target_arch_sysarch.h
>   delete mode 100644 bsd-user/mips64/target_syscall.h
>   create mode 100644 bsd-user/x86_64/signal.c
>   create mode 100644 configs/targets/arm-bsd-user.mak

Applied, thanks.


r~

