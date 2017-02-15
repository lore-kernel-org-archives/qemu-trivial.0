Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdwv5-0001d7-8O
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2017 05:34:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwv3-0001bO-Em
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:34:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwv2-00053i-Ik
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:34:41 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43635)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cdwux-00051L-S4; Wed, 15 Feb 2017 05:34:36 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AF9DE4217C;
	Wed, 15 Feb 2017 13:34:35 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 018CA264;
	Wed, 15 Feb 2017 13:34:34 +0300 (MSK)
To: Igor Pavlikevich <ipavlikevich@gmail.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <CA+O_+ExjKRNyfbXWzh7RRHgTjqTBC+WscYCiBGyjLK2XOvoPmQ@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <97012317-0db8-a272-1802-7a402ebe78a5@msgid.tls.msk.ru>
Date: Wed, 15 Feb 2017 13:34:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CA+O_+ExjKRNyfbXWzh7RRHgTjqTBC+WscYCiBGyjLK2XOvoPmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/acpi/tco.c: fix tco timer stop
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
X-List-Received-Date: Wed, 15 Feb 2017 10:34:42 -0000

06.02.2017 17:44, Igor Pavlikevich wrote:
> TCO timer does not actually stop
> 
> Signed-off-by: Igor Pavlikevich <ipavlikevich@gmail.com>
> ---
>  hw/acpi/tco.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
> index 8ce7daf..b4adac8 100644
> --- a/hw/acpi/tco.c
> +++ b/hw/acpi/tco.c
> @@ -49,6 +49,7 @@ static inline void tco_timer_reload(TCOIORegs *tr)
>  static inline void tco_timer_stop(TCOIORegs *tr)
>  {
>      tr->expire_time = -1;
> +    timer_del(tr->tco_timer);
>  }
> 
>  static void tco_timer_expired(void *opaque)
> 

I'm not sure this is really trivial change.
Can you elaborate a bit please?

And please Cc qemu-devel@ too (doing this now).

Thanks,

/mjt

