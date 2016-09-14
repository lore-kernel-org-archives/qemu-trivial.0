Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk4us-0005yv-1g
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:47:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4up-0005xE-LJ
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:47:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4uo-0000qi-Jy
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:47:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54557)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk4uj-0000lx-47; Wed, 14 Sep 2016 03:47:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 423164183E;
	Wed, 14 Sep 2016 10:47:20 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id B4FB7AAB;
	Wed, 14 Sep 2016 10:47:19 +0300 (MSK)
To: work@kota.moe, qemu-trivial@nongnu.org
References: <CACsxjPbpdVhgwGdkBF+9Nac7np532FjauYonkY=NnRfOr2ACAA@mail.gmail.com>
Cc: qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <837998c9-6d10-23d1-f92d-02c26efdd7fe@msgid.tls.msk.ru>
Date: Wed, 14 Sep 2016 10:47:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CACsxjPbpdVhgwGdkBF+9Nac7np532FjauYonkY=NnRfOr2ACAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/timer/imx_gpt: Properly mask control
 register on software reset
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 07:47:32 -0000

07.08.2016 09:50, Donny Yang wrote:
> Signed-off-by: Donny Yang <work@kota.moe>
> ---
>  hw/timer/imx_gpt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
> index 82bc73c..02d875f 100644
> --- a/hw/timer/imx_gpt.c
> +++ b/hw/timer/imx_gpt.c
> @@ -306,8 +306,8 @@ static void imx_gpt_reset(DeviceState *dev)
>      /*
>       * Soft reset doesn't touch some bits; hard reset clears them
>       */
> -    s->cr &= ~(GPT_CR_EN|GPT_CR_ENMOD|GPT_CR_STOPEN|GPT_CR_DOZEN|
> -               GPT_CR_WAITEN|GPT_CR_DBGEN);
> +    s->cr &= GPT_CR_EN|GPT_CR_ENMOD|GPT_CR_STOPEN|GPT_CR_DOZEN|
> +             GPT_CR_WAITEN|GPT_CR_DBGEN;
>      s->sr = 0;
>      s->pr = 0;
>      s->ir = 0;

Hello.  Thank you for the patch.

Please don't send html-formatted emails, patch handling software
dislikes it.

And please include qemu-devel@ on all patches, so more people
can review your changes (Cc'd now).

This change, while one-liner, isn't obvious for anoyne who
isn't familiar with the timer code. I for one don't know what
is happening there and hence don't know if this change is ok
or not.

Maybe someone else can confirm this is right thing to do.

Thanks,

/mjt

