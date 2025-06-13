Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uQ0N9-00033E-GM
	for mharc-qemu-trivial@gnu.org; Fri, 13 Jun 2025 05:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uQ0My-0002z5-WF
 for qemu-trivial@nongnu.org; Fri, 13 Jun 2025 05:06:42 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uQ0Mu-0002dI-65
 for qemu-trivial@nongnu.org; Fri, 13 Jun 2025 05:06:38 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e819aa98e7aso1737415276.2
 for <qemu-trivial@nongnu.org>; Fri, 13 Jun 2025 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749805595; x=1750410395; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=74HaimTdbSL1bD+t0uPPJJc0xDzsWxH7INW1uQ7Wgsg=;
 b=F0F2g5A610Op4rDg1z187JzKrh+jUpb7MFtXfTXaOc3znfDRWbCUXpRnBtn6pFKGXG
 GkT41jEtyAIP+kW24kyCKxJbryO3qorallxLkRkTxQEk8LDW+wVLPqefxfQWdSj3cGdH
 ZtuTg74RsR6x+HtFVRWCDR8I1tHIhcMbrh+UJp0+z3dUcXFRGencU+5NIL9X1EWwVdEq
 swPN5st+f7LbFzWfFBPYPqB33K9nMJV7adQS++dZn2QuRfrGps/bJJcuBkjl7uvRcTJ/
 /k4hbpHyQe1GcADjDl85Q1Q7KExlYan41oLBB0TYl4uiIZ+d1XDo5Q4a+w99ExBAE9A0
 omDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749805595; x=1750410395;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74HaimTdbSL1bD+t0uPPJJc0xDzsWxH7INW1uQ7Wgsg=;
 b=S4F9JxqTs5+lbTDNUmUHHDpvrGowTKS81l49d80ZbXVAzoRLSeFQ+avox3BpVqwjTB
 A3wEAWCfxMgY8zIu36/ZyHOlrOFZHDV0RcqW3+ALUsjAiy3aDzwv0UNqzS4Xk8Lo7S4X
 M2dbQgRAqc+mzkIw4HEEjLDihKdilLbhzDb6z4AsXqupOo05ajQsdma+ZNLoq6K05qO+
 gog6OwUP3AZL1l/oKZoOYux6ldyVFqUDK3yU9QuW1dOKnUrKFGlViKaPv8nf1FVp4fNv
 FrRGOo0neh78g0JlBfSgLJiutO56D7JQIYeuST+rGVDCL/1uCpKfeIHJye8MDLp8oClC
 ODOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2iQm+8ENIH5guSWzCL4z1q4DJNw5qQlFhGWkisCpE/PKFY1Q30OpStX+B6cZhLuq1SlpGUZ4gSUePCRY=@nongnu.org
X-Gm-Message-State: AOJu0YxhuSPcTeHPC7451PSOeKKiLbo5k9kvUHgisK/eWhDPdRvuL1SX
 I/uPdoV4CaO7aKogZaNHL+srLEJCgfj9gi01KmkXSEenxYxkiEEuKVAnIt9tuJ0VSdnuOIg/DFg
 60T5zQJoz325Jxo0wFTb/PqZdyk4Nqsj8meq3tY7mXQ==
X-Gm-Gg: ASbGncvWkcX7GRI1Tb5BdTy5vPgvtSv35nWmaGwIW5MOutot+2Yhg4CdgM3siWSw9Fc
 r+AKja45enpkSM1KQtO4+Dg8Pwh6HDThU4seWGjjx3L8ogs4lqA2IuKvwI4QS5PJmXVK+KdF1+2
 3bUPCdenGItDVQxyyM+xmKxEwb6S+WuR5jNXBuuacdCZpS
X-Google-Smtp-Source: AGHT+IEQeOVp/cROfGsvPraYIEIXrJg1jDCevuBkj2fp/SbY0dwcENZZ5X7PfR8cywNdYGB8HxIUyWQKdhZDEVviHVE=
X-Received: by 2002:a05:690c:9987:b0:710:ea78:8ff with SMTP id
 00721157ae682-7116372a3c4mr35744737b3.23.1749805594972; Fri, 13 Jun 2025
 02:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250606095728.3672832-1-ethan84@andestech.com>
In-Reply-To: <20250606095728.3672832-1-ethan84@andestech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jun 2025 10:06:23 +0100
X-Gm-Features: AX0GCFvvruDwIttjmKmLlPI6bD-XAps0bWdNIgWNGtn5ht7pmBnF1jnDTsgfn88
Message-ID: <CAFEAcA-LhiOL2OJEJzsSTTQ1=QWXOAB=h+yv25szH9SJ3CpmFw@mail.gmail.com>
Subject: Re: [PATCH] qemu-options.hx: Fix reversed description of icount sleep
 behavior
To: Ethan Chen <ethan84@andestech.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 richard.henderson@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 13 Jun 2025 09:06:44 -0000

On Fri, 6 Jun 2025 at 10:58, Ethan Chen via <qemu-devel@nongnu.org> wrote:
>
> The documentation for the -icount option incorrectly describes the behavior
> of the sleep suboption. Based on the actual implementation and system
> behavior, the effects of sleep=on and sleep=off were inadvertently reversed.
> This commit updates the description to reflect their intended functionality.
>
> Signed-off-by: Ethan Chen <ethan84@andestech.com>
> ---
>  qemu-options.hx | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7eb8e02b4b..1f862b19a6 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4936,13 +4936,13 @@ SRST
>      with actual performance.
>
>      When the virtual cpu is sleeping, the virtual time will advance at
> -    default speed unless ``sleep=on`` is specified. With
> -    ``sleep=on``, the virtual time will jump to the next timer
> +    default speed unless ``sleep=off`` is specified. With
> +    ``sleep=off``, the virtual time will jump to the next timer
>      deadline instantly whenever the virtual cpu goes to sleep mode and
>      will not advance if no timer is enabled. This behavior gives
>      deterministic execution times from the guest point of view.
> -    The default if icount is enabled is ``sleep=off``.
> -    ``sleep=on`` cannot be used together with either ``shift=auto``
> +    The default if icount is enabled is ``sleep=on``.
> +    ``sleep=off`` cannot be used together with either ``shift=auto``
>      or ``align=on``.

Whoops. It looks like I introduced this error in commit fa647905e6baae
where I converted the previous unhelpful "sleep=on|off" to say
specifically whether it meant sleep=on or sleep=off: I got it
the wrong way around.

Confirmed against the icount-common.c code that our default is
indeed sleep=on and that the incompatibility with shift=auto
and align=on is the sleep=off setting.

Applied to target-arm.next, thanks.

-- PMM

