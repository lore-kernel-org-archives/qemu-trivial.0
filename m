Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r7vGV-0001pJ-1x
	for mharc-qemu-trivial@gnu.org; Tue, 28 Nov 2023 05:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r7vGQ-0001ow-OV
 for qemu-trivial@nongnu.org; Tue, 28 Nov 2023 05:24:22 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r7vGN-0001n4-KV
 for qemu-trivial@nongnu.org; Tue, 28 Nov 2023 05:24:22 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-548f0b7ab11so7101835a12.1
 for <qemu-trivial@nongnu.org>; Tue, 28 Nov 2023 02:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701167057; x=1701771857; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PLtMjpEjt957Y6uNi/prBFDVDdUpYxmByZfZDgExx38=;
 b=k2gUSI6wxrAUTaGDyKyQ02sOlNBHLt4Lbqig3YzkCwK3jQ/61lXh8Ot15BwY7/MatY
 Ty53fS+B3LhHclA6zY/gQmzjwJKlE+AiPorjBOEQf2QK+OmJGYQmV8pq5/rO8oajn70n
 VM12lqMJjkbxTNl+9nyp/HanJLIE8J1YhGkm4W8nzk93S0OcmjZqp9g+iox+4vn1Tpls
 vQlHdEMu+SFAROFKlnY7+o72Jl63ju/H598KtU6xcvjvqFTO+MSsz0BmvZ2WXQEWnd54
 zsV28pM5Ljdfws44wlGpRvRYXWjoaqW5GMjVLFHNqf0KOliLkNqha87S86HEjsC+9hSl
 oS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701167057; x=1701771857;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PLtMjpEjt957Y6uNi/prBFDVDdUpYxmByZfZDgExx38=;
 b=gO0ZwLpzqJNslbX22w1ik1bVgTX2AMvvFTZa0kvGiFLXcKQ2RmHZQJFmqLtE5nNFZR
 JPI4dBVWd3kTm9ITgvZhbxIkIEX88SmAm6tx5BugjfRsRuWIddqbaBVPYGOOxwrYGcJs
 Kiq0Gz08e8B6uv/1EZvGl8y4QhV+of/nrsjWuLaYrDfX3OpnvXix4aWQZsMTQDeMIllK
 uCz4f32af3j4opcm3igXlpLcZHa5SBNEVbpFhyn1jgOHrkOU6ggIa0Uquc/X7MW3ZauV
 gE4tie0V4F7NnK+6D3sRnQci6HUpXPvEr39tWnF9n4j45iz1JZbmgzFBb68bi2ylYSWN
 iWXg==
X-Gm-Message-State: AOJu0YweKyxxa/xquX3f0zl9LeeWmlOYSOobpSJEa2atfHyZYYfz6P6O
 MoOqKWbw1HiVKQr88rs6qTkwZ7g2GhTmIMMkWqIMMA==
X-Google-Smtp-Source: AGHT+IGQne7bMsx1OYZyFxt8JZi3hutMlQ0KnydGNXJgCmPJKTZhfV/HWuSeAFDeBCKleKZn02yD5lSFIoTBlJoH9pY=
X-Received: by 2002:a05:6402:ca9:b0:54b:8a3:33d4 with SMTP id
 cn9-20020a0564020ca900b0054b08a333d4mr8313637edb.21.1701167057341; Tue, 28
 Nov 2023 02:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20231127194258.138603-1-arorajai2798@gmail.com>
In-Reply-To: <20231127194258.138603-1-arorajai2798@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Nov 2023 10:24:06 +0000
Message-ID: <CAFEAcA90WMfVxn8V5m730ggoOJhj=3-Wz5mt79ktZf==Pz7L1g@mail.gmail.com>
Subject: Re: [PATCH] accel/kvm: Turn DPRINTF macro use into tracepoints
To: Jai Arora <arorajai2798@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Nov 2023 10:24:23 -0000

On Mon, 27 Nov 2023 at 19:44, Jai Arora <arorajai2798@gmail.com> wrote:
>
> To remove DPRINTF macros and use tracepoints
> for logging.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1827
>
> Signed-off-by: Jai Arora <arorajai2798@gmail.com>
> ---
>  accel/kvm/kvm-all.c    | 32 ++++++++++----------------------
>  accel/kvm/trace-events |  2 +-
>  2 files changed, 11 insertions(+), 23 deletions(-)

Hi; thanks for sending in this patch.

(I've CC'd the KVM maintainer.)

> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index e39a810a4e..d0dd7e54c3 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -69,16 +69,6 @@
>  #define KVM_GUESTDBG_BLOCKIRQ 0
>  #endif
>
> -//#define DEBUG_KVM
> -
> -#ifdef DEBUG_KVM
> -#define DPRINTF(fmt, ...) \
> -    do { fprintf(stderr, fmt, ## __VA_ARGS__); } while (0)
> -#else
> -#define DPRINTF(fmt, ...) \
> -    do { } while (0)
> -#endif
> -
>  struct KVMParkedVcpu {
>      unsigned long vcpu_id;
>      int kvm_fd;
> @@ -331,7 +321,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
>      struct KVMParkedVcpu *vcpu = NULL;
>      int ret = 0;
>
> -    DPRINTF("kvm_destroy_vcpu\n");
> +    trace_kvm_dprintf("kvm_destroy_vcpu\n");

Rather than using a single tracepoint for every line
that was previously a DPRINTF, it's preferable to
use tracepoints whose name indicates what they're doing.
Users can turn tracepoints on and off individually, and they
might, for instance, only want to trace when the vcpu is
destroyed and not also the very large number of events
that will happen for kvm_cpu_exec entry/exits.

If you look at the current set of events in accel/kvm/trace-events
you can see the general style: the tracepoint name itself
tells you the "what has happened", the arguments provide
more info (eg which CPU did we just destroy), and it's
rarely necessary to pass a string into the tracepoint function.

thanks
-- PMM

