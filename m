Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoUMz-00050u-DP
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 04:00:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UoUMv-0004wW-VQ
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 04:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UoUMu-0002Or-HA
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 04:00:53 -0400
Received: from cantor2.suse.de ([195.135.220.15]:56195 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UoUMo-0002NG-Un; Mon, 17 Jun 2013 04:00:47 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 8CA7AA51CB;
	Mon, 17 Jun 2013 10:00:45 +0200 (CEST)
Message-ID: <51BEC22A.80101@suse.de>
Date: Mon, 17 Jun 2013 10:00:42 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1371455050-9523-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1371455050-9523-3-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1371455050-9523-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Vladimir Senkov <hangup@gmail.com>, qemu-trivial@nongnu.org,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL trivial/urgent 2/2] fixed a
 copy&paste error in serial.c
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
X-List-Received-Date: Mon, 17 Jun 2013 08:00:55 -0000

Am 17.06.2013 09:44, schrieb Michael Tokarev:
> From: Vladimir Senkov <hangup@gmail.com>
>=20
> Copy&paste error in serial.c causes a crash when attempting
> to read from UART (if there is no data to be read)
>=20
> Signed-off-by: Vladimir Senkov <hangup@gmail.com>
> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Any chance to get the subject improved before the pull is accepted?
E.g., "serial: Fix a copy&paste error" or "char/serial: ..."

Andreas

> ---
>  hw/char/serial.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index b537e42..6382f98 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -424,7 +424,7 @@ static uint64_t serial_ioport_read(void *opaque, hw=
addr addr, unsigned size)
>              ret =3D s->divider & 0xff;
>          } else {
>              if(s->fcr & UART_FCR_FE) {
> -                ret =3D fifo8_is_full(&s->recv_fifo) ?
> +                ret =3D fifo8_is_empty(&s->recv_fifo) ?
>                              0 : fifo8_pop(&s->recv_fifo);
>                  if (s->recv_fifo.num =3D=3D 0) {
>                      s->lsr &=3D ~(UART_LSR_DR | UART_LSR_BI);
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

