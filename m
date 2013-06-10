Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um2DY-0000BB-GT
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 09:33:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Um2DS-0008UX-D9
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 09:33:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Um2DN-0008SW-IR
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 09:32:58 -0400
Received: from cantor2.suse.de ([195.135.220.15]:48383 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Um2DF-0008QY-5L; Mon, 10 Jun 2013 09:32:45 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 52D1BA398F;
	Mon, 10 Jun 2013 15:32:44 +0200 (CEST)
Message-ID: <51B5D57B.7040006@suse.de>
Date: Mon, 10 Jun 2013 15:32:43 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: peter.crosthwaite@xilinx.com
References: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
	<b61bfd22e26fd08d9cca73e875c6074a9664c49c.1370236013.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <b61bfd22e26fd08d9cca73e875c6074a9664c49c.1370236013.git.peter.crosthwaite@xilinx.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, aliguori@us.ibm.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/3] char/serial:
	cosmetic fixes.
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
X-List-Received-Date: Mon, 10 Jun 2013 13:33:03 -0000

Hi Peter,

Am 03.06.2013 07:12, schrieb peter.crosthwaite@xilinx.com:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>=20
> Some cosmetic fixes to char/serial fixing some checkpatch errors.
>=20
> Cc: qemu-trivial@nongnu.org
>=20
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
> Needed for the next patch to pass checkpatch. Done as sep patch to not
> obscure that patch.
>=20
>  hw/char/serial.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 66b6348..bd6813e 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -263,8 +263,9 @@ static gboolean serial_xmit(GIOChannel *chan, GIOCo=
ndition cond, void *opaque)
>      if (s->tsr_retry <=3D 0) {
>          if (s->fcr & UART_FCR_FE) {
>              s->tsr =3D fifo_get(s,XMIT_FIFO);
> -            if (!s->xmit_fifo.count)
> +            if (!s->xmit_fifo.count) {
>                  s->lsr |=3D UART_LSR_THRE;
> +            }
>          } else if ((s->lsr & UART_LSR_THRE)) {
>              return FALSE;
>          } else {
> @@ -461,10 +462,11 @@ static uint64_t serial_ioport_read(void *opaque, =
hwaddr addr, unsigned size)
>          } else {
>              if(s->fcr & UART_FCR_FE) {
>                  ret =3D fifo_get(s,RECV_FIFO);
> -                if (s->recv_fifo.count =3D=3D 0)
> +                if (s->recv_fifo.count =3D=3D 0) {
>                      s->lsr &=3D ~(UART_LSR_DR | UART_LSR_BI);
> -                else
> +                } else {
>                      qemu_mod_timer(s->fifo_timeout_timer, qemu_get_clo=
ck_ns (vm_clock) + s->char_transmit_time * 4);

Wanna rebreak this one too in case you respin/pull?

> +                }
>                  s->timeout_ipending =3D 0;
>              } else {
>                  ret =3D s->rbr;
> @@ -534,15 +536,21 @@ static uint64_t serial_ioport_read(void *opaque, =
hwaddr addr, unsigned size)
>  static int serial_can_receive(SerialState *s)
>  {
>      if(s->fcr & UART_FCR_FE) {
> -        if(s->recv_fifo.count < UART_FIFO_LENGTH)
> -        /* Advertise (fifo.itl - fifo.count) bytes when count < ITL, a=
nd 1 if above. If UART_FIFO_LENGTH - fifo.count is
> -        advertised the effect will be to almost always fill the fifo c=
ompletely before the guest has a chance to respond,
> -        effectively overriding the ITL that the guest has set. */
> -             return (s->recv_fifo.count <=3D s->recv_fifo.itl) ? s->re=
cv_fifo.itl - s->recv_fifo.count : 1;
> -        else
> -             return 0;
> +        if (s->recv_fifo.count < UART_FIFO_LENGTH) {
> +            /*
> +             * Advertise (fifo.itl - fifo.count) bytes when count < IT=
L, and 1
> +             * if above. If UART_FIFO_LENGTH - fifo.count is advertise=
d the
> +             * effect will be to almost always fill the fifo completel=
y before
> +             * the guest has a chance to respond, effectively overridi=
ng the ITL
> +             * that the guest has set.
> +             */
> +            return (s->recv_fifo.count <=3D s->recv_fifo.itl) ?
> +                        s->recv_fifo.itl - s->recv_fifo.count : 1;

Here I stumbled over the indentation being 5 chars from '(' or 4 chars
within, but the latter doesn't make sense since it's terminated before.
I would've expected 4 chars from block or aligned below '(' or
4-char-indented from there. But I'm not sure if there are any clear
recommendations, so since it's apparently not using tabs (my initial
suspicion), no objection.

Cheers,
Andreas

> +        } else {
> +            return 0;
> +        }
>      } else {
> -    return !(s->lsr & UART_LSR_DR);
> +        return !(s->lsr & UART_LSR_DR);
>      }
>  }
> =20
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

