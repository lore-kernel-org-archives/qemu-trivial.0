Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL6vX-0005LR-U7
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 04:16:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YL6vV-0005LI-VM
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:16:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YL6vQ-0000nQ-Ut
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:16:13 -0500
Received: from mail-la0-f41.google.com ([209.85.215.41]:37705)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YL6vQ-0000nB-Ng
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:16:08 -0500
Received: by labpn19 with SMTP id pn19so12944033lab.4
	for <qemu-trivial@nongnu.org>; Tue, 10 Feb 2015 01:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VsTzYNAJEkwtfP7SM/QP0j8bVM03mNYSwq7Jnzt56wQ=;
	b=K3V5mX9NwO4vIbOvQqBCEqpZ4Hdam1U9fqBeIMfjmxWp5D0BftkudgwnLzBAIl4zlC
	WEVh0BfEDt4/9cAwmlP5TziDxJSpB7dxF/K431aLhbpeHlYLJg1S+fYNgJWqv7VC9w/h
	Dk4ggWdqsiq+YMuF6ge3dfsft0UbZ5ioOGw2PYb1DQ6HaLxBNB3uu3x5ZyasVZLBhiWu
	fsD9NbmHszKO6ynC9fdOG0G0l4CLqg3UiLuy4bmtJlTmufKa0bXI/gTVT/ISWLCQMdM4
	084SntrZRyHINVDVSbrJLXSxmgnUGjE3ASWfcMBw5hL/m1SBFbiIbq1TB4FMyqCJV374
	SiLw==
X-Gm-Message-State: ALoCoQkXFYFmxakr0boS7BolUJJzeCmsCH0N6I1GuqjbLGZUeNZF46VGG7ntXrNt7eEnHTM/K4fN
X-Received: by 10.112.213.38 with SMTP id np6mr21812032lbc.36.1423559767342;
	Tue, 10 Feb 2015 01:16:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.141.97 with HTTP; Tue, 10 Feb 2015 01:15:46 -0800 (PST)
In-Reply-To: <a7fa2e9783ee957635d23ddab151a8be97df5b2a.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
	<a7fa2e9783ee957635d23ddab151a8be97df5b2a.1423549659.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Feb 2015 09:15:46 +0000
Message-ID: <CAFEAcA-wWs1sTvVwOTi6Q0rXAXOOO5kWMAaZ0se5asu97B4S5Q@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 14/46] cpu-exec: drop dead
	assignment
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
X-List-Received-Date: Tue, 10 Feb 2015 09:16:15 -0000

On 10 February 2015 at 06:34, Michael Tokarev <mjt@tls.msk.ru> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> All uses of TB inside cpu_exec are dominated by "tb = tb_find_fast(env)",
> and there are no uses after the switch statement.  So the assignment
> is dead, as reported by Coverity.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  cpu-exec.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/cpu-exec.c b/cpu-exec.c
> index fa506e6..4ff1b23 100644
> --- a/cpu-exec.c
> +++ b/cpu-exec.c
> @@ -494,7 +494,6 @@ int cpu_exec(CPUArchState *env)
>                           * interrupt_request) which we will handle
>                           * next time around the loop.
>                           */
> -                        tb = (TranslationBlock *)(next_tb & ~TB_EXIT_MASK);
>                          next_tb = 0;
>                          break;
>                      case TB_EXIT_ICOUNT_EXPIRED:

True, I guess, but presumably this means we're doing unnecessary
work in the next time round the loop re-finding the tb which we
already had...

(Also, why do we have a variable 'next_tb' which holds the
address of the *previous* TB? :-) I think the documentation
of the return value of tcg_qemu_tb_exec() is wrong too. Or
I've misunderstood the code.)

-- PMM

