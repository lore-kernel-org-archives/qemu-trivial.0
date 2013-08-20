Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBlYk-0000B1-NI
	for mharc-qemu-trivial@gnu.org; Tue, 20 Aug 2013 09:01:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBlYe-00009H-Fi
	for qemu-trivial@nongnu.org; Tue, 20 Aug 2013 09:01:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBlYZ-0002i9-Dr
	for qemu-trivial@nongnu.org; Tue, 20 Aug 2013 09:01:12 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:40911)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBlYZ-0002hk-7E
	for qemu-trivial@nongnu.org; Tue, 20 Aug 2013 09:01:07 -0400
Received: by mail-lb0-f173.google.com with SMTP id 10so452248lbf.18
	for <qemu-trivial@nongnu.org>; Tue, 20 Aug 2013 06:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fvVw4/pEZPHO78c/ZswXTlNa8Sppdp33L6FtQUjuABg=;
	b=Qm0+CBhYd89BasZJecWE5Uqq125IBwETdKBmbuhPGdAkbPQq+fS0S+mfQHqQkqz7WA
	Mct4+l92chH04rrp77sGp5tNtlq1qNGxgGh8G/jjhwJW2c0CX9pNedBKjpgb/6gE4TxR
	xNwe7o5URie265YwyWD3G2+U4sqzdRquHLKgygtTc4OiV+kFHWVlKePBtvVhYHa09Mmb
	8e/3QlactObks4awmQe31oEajmuH5ge7oA4ocvFzAEG6EokAabt/Ofl3Ewj8awhYpWK4
	4IRl0XFlJm6W34qvc/Fvd+/6faRMUQvBPAjIXpLpUvEjc6Ii3IS50zsVn7Ph4mSpC8Q6
	WUwQ==
X-Gm-Message-State: ALoCoQm8xeYz6uzyvjIXAeW3iXMX2PvblGXmF6dttkI6mq/YDIV9AHo2uc2p5cROB4MtZu0lghGU
X-Received: by 10.152.3.42 with SMTP id 10mr1257405laz.22.1377003666050; Tue,
	20 Aug 2013 06:01:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Tue, 20 Aug 2013 06:00:46 -0700 (PDT)
In-Reply-To: <1375727067-22126-1-git-send-email-peter.maydell@linaro.org>
References: <1375727067-22126-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Aug 2013 14:00:46 +0100
Message-ID: <CAFEAcA9TN+DwcjRtAC0n7iipdPtdqR60VxH5L2Oyu8e73iiFMw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jia Liu <proljc@gmail.com>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/openrisc/openrisc_sim:
 Avoid using uninitialised variable 'entry'
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
X-List-Received-Date: Tue, 20 Aug 2013 13:01:17 -0000

Ping for qemu-trivial now 1.7 is open.

thanks
-- PMM

On 5 August 2013 19:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> clang warns that cpu_openrisc_load_kernel() can use 'entry' uninitialized:
>
> hw/openrisc/openrisc_sim.c:69:9: error: variable 'entry' is used
>       uninitialized whenever '&&' condition is false [-Werror,-Wsometimes-uninitialized]
>     if (kernel_filename && !qtest_enabled()) {
>         ^~~~~~~~~~~~~~~
> hw/openrisc/openrisc_sim.c:91:19: note: uninitialized use occurs here
>     cpu->env.pc = entry;
>                   ^~~~~
>
> Fix this by not attempting to change the CPU's starting PC unless
> we actually loaded a kernel.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/openrisc/openrisc_sim.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index a08f27c..4595fa9 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -86,9 +86,9 @@ static void cpu_openrisc_load_kernel(ram_addr_t ram_size,
>                      kernel_filename);
>              exit(1);
>          }
> -    }
>
> -    cpu->env.pc = entry;
> +        cpu->env.pc = entry;
> +    }
>  }
>
>  static void openrisc_sim_init(QEMUMachineInitArgs *args)
> --
> 1.7.9.5
>
>

