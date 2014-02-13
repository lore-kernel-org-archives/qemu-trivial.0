Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WDuiv-0003pH-Gu
	for mharc-qemu-trivial@gnu.org; Thu, 13 Feb 2014 06:44:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WDuit-0003me-J5
	for qemu-trivial@nongnu.org; Thu, 13 Feb 2014 06:44:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WDuis-0003mr-Mp
	for qemu-trivial@nongnu.org; Thu, 13 Feb 2014 06:44:55 -0500
Received: from mel.v6.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:57514
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1WDuio-0003ij-1M; Thu, 13 Feb 2014 06:44:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 1C06326E1EFF;
	Thu, 13 Feb 2014 12:44:48 +0100 (CET)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaTQn-ePrj3d; Thu, 13 Feb 2014 12:44:48 +0100 (CET)
Received: from [10.10.1.115] (lanoue.act-europe.fr [10.10.1.115])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id E2A7126E1EEA;
	Thu, 13 Feb 2014 12:44:47 +0100 (CET)
Message-ID: <52FCB038.3090500@adacore.com>
Date: Thu, 13 Feb 2014 12:44:56 +0100
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Sebastian Huber <sebastian.huber@embedded-brains.de>, 
	qemu-devel@nongnu.org
References: <1392282978-19368-1-git-send-email-sebastian.huber@embedded-brains.de>
In-Reply-To: <1392282978-19368-1-git-send-email-sebastian.huber@embedded-brains.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/timer/grlib_gptimer:
	Avoid integer overflow
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
X-List-Received-Date: Thu, 13 Feb 2014 11:44:56 -0000

On 02/13/2014 10:16 AM, Sebastian Huber wrote:
> The GPTIMER uses 32-bit registers.  Use a 64-bit operation to get the
> ptimer count, otherwise we end up with a count of 0 for GPTIMER counter
> values of 0xffffffff.

Looks good, thanks Sebastian.

Reviewed-by: Fabien Chouteau <chouteau@adacore.com>

> ---
>  hw/timer/grlib_gptimer.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
> index d5687f6..343563c 100644
> --- a/hw/timer/grlib_gptimer.c
> +++ b/hw/timer/grlib_gptimer.c
> @@ -106,9 +106,9 @@ static void grlib_gptimer_enable(GPTimer *timer)
>      /* ptimer is triggered when the counter reach 0 but GPTimer is triggered at
>         underflow. Set count + 1 to simulate the GPTimer behavior. */
>  
> -    trace_grlib_gptimer_enable(timer->id, timer->counter + 1);
> +    trace_grlib_gptimer_enable(timer->id, timer->counter);
>  
> -    ptimer_set_count(timer->ptimer, timer->counter + 1);
> +    ptimer_set_count(timer->ptimer, (uint64_t)timer->counter + 1);
>      ptimer_run(timer->ptimer, 1);
>  }
>  
> 


