Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VOcR7-000584-0v
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2013 19:54:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VOcQz-00053l-QH
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 19:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VOcQr-0000DQ-HX
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 19:54:25 -0400
Received: from mail-la0-f41.google.com ([209.85.215.41]:38985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VOcQr-0000DE-Ak
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 19:54:17 -0400
Received: by mail-la0-f41.google.com with SMTP id ec20so4419405lab.28
	for <qemu-trivial@nongnu.org>; Tue, 24 Sep 2013 16:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4o02mjAEw4HiPeG9x6K09tshgg4R2rk7zXcZ0f5DUJ0=;
	b=LPCiYyz/sJsgSD78BhwNmjjS6Rlc2zga6NY0NTE1KnCJlPnj1AfHtToeV/xpKkXNVX
	ULrNEm/nmrdBpEAtxoW0/xPpY2sXMQGj5eyTMANYs5tJNjAEmSftMUtTb1uzKx/lvQoD
	HgwWlVnZfcRmQvn53Ny/UboNjCCC5klSbnE6UbSzcLQualeyd1YovtjTqHJMJDOiC626
	w5Plv3UOTqB/tHT9wIFO/GdYkxBtV7JmJ8GB876QTa2HQpUolqyY3s4Au6XWS2vUNteh
	8BoXEMFIjoEYMyAhAiebI1wHiXVYy0mioJ/gUFwqHlMuldKJvoDd4+pH7ID85XlW03CX
	A4Yw==
X-Gm-Message-State: ALoCoQnF+SgEBhEUnnT3zbu4wQrxefxFk/xTv3IOl0N49q00APLEqX+KZ9N+6kE6SIq+IfLCN3m8
X-Received: by 10.152.29.103 with SMTP id j7mr26599495lah.7.1380066856049;
	Tue, 24 Sep 2013 16:54:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Tue, 24 Sep 2013 16:53:55 -0700 (PDT)
In-Reply-To: <1380041161-13266-4-git-send-email-chouteau@adacore.com>
References: <1380041161-13266-1-git-send-email-chouteau@adacore.com>
	<1380041161-13266-4-git-send-email-chouteau@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Sep 2013 08:53:55 +0900
Message-ID: <CAFEAcA9A1JD7hPqZ5Y5d4UDFSa4DqJZOz_yTrjH92B7h8N-Lug@mail.gmail.com>
To: Fabien Chouteau <chouteau@adacore.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 3/3] Add ARM registers definitions in
	Monitor commands
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2013 23:54:30 -0000

On 25 September 2013 01:46, Fabien Chouteau <chouteau@adacore.com> wrote:
> --- a/monitor.c
> +++ b/monitor.c
> @@ -3351,6 +3351,23 @@ static const MonitorDef monitor_defs[] = {
>      { "cleanwin", offsetof(CPUSPARCState, cleanwin) },
>      { "fprs", offsetof(CPUSPARCState, fprs) },
>  #endif
> +#elif defined(TARGET_ARM)
> +    { "r0",     offsetof(CPUARMState, regs[0])  },
> +    { "r1",     offsetof(CPUARMState, regs[1])  },
> +    { "r2",     offsetof(CPUARMState, regs[2])  },
> +    { "r3",     offsetof(CPUARMState, regs[3])  },
> +    { "r4",     offsetof(CPUARMState, regs[4])  },
> +    { "r5",     offsetof(CPUARMState, regs[5])  },
> +    { "r6",     offsetof(CPUARMState, regs[6])  },
> +    { "r7",     offsetof(CPUARMState, regs[7])  },
> +    { "r8",     offsetof(CPUARMState, regs[8])  },
> +    { "r9",     offsetof(CPUARMState, regs[9])  },
> +    { "r10",    offsetof(CPUARMState, regs[10]) },
> +    { "r11",    offsetof(CPUARMState, regs[11]) },
> +    { "r12",    offsetof(CPUARMState, regs[12]) },
> +    { "r13|sp", offsetof(CPUARMState, regs[13]) },
> +    { "r14|lr", offsetof(CPUARMState, regs[14]) },
> +    { "r15|pc", offsetof(CPUARMState, regs[15]) },
>  #endif

No, I really don't want to see another target #ifdef ladder, please.
Put a 'static const MonitorDef *monitor_defs;' into CPUClass,
and initialize it in each target's class init function, please.
(You'll need to move the appropriate sections of the current
static array in monitor.c plus the per-target functions that
it references into target-*/cpu.c.) Look at gdb_num_core_regs
as an example of where we made this kind of abstraction.

-- PMM

