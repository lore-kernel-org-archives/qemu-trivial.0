Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaItc-0002Fd-Sq
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 03:37:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaIta-0002CV-4v
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaItZ-0007KY-9B
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:37:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47980)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaItU-0007FJ-SL; Fri, 11 Sep 2015 03:37:13 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 201B541207;
	Fri, 11 Sep 2015 10:37:12 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 0C91EA52;
	Fri, 11 Sep 2015 10:37:12 +0300 (MSK)
Message-ID: <55F284A8.8060404@msgid.tls.msk.ru>
Date: Fri, 11 Sep 2015 10:37:12 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>, Peter Chubb <peter.chubb@nicta.com.au>
References: <1440085955-27951-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1440085955-27951-1-git-send-email-linux@roeck-us.net>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] imx_serial: Generate interrupt on tx
	empty if enabled
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
X-List-Received-Date: Fri, 11 Sep 2015 07:37:19 -0000


Can we please have some r-b or ACK for this? :)

20.08.2015 18:52, Guenter Roeck wrote:
> Generate an interrupt if the tx buffer is empty and the tx empty interrupt
> is enabled. This fixes a problem seen when running a Linux image since
> Linux commit 55c3cb1358e ("serial: imx: remove unneeded imx_transmit_buffer()
> from imx_start_tx()"). Linux now waits for the tx empty interrupt before
> starting to send data, causing transmit stalls until there is an interrupt
> for another reason.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/char/imx_serial.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
> index f3fbc77..8dc791d 100644
> --- a/hw/char/imx_serial.c
> +++ b/hw/char/imx_serial.c
> @@ -145,7 +145,9 @@ static void imx_update(IMXSerialState *s)
>      uint32_t flags;
>  
>      flags = (s->usr1 & s->ucr1) & (USR1_TRDY|USR1_RRDY);
> -    if (!(s->ucr1 & UCR1_TXMPTYEN)) {
> +    if (s->ucr1 & UCR1_TXMPTYEN) {
> +        flags |= (s->uts1 & UTS1_TXEMPTY);
> +    } else {
>          flags &= ~USR1_TRDY;
>      }
>  
> 


