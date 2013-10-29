Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VbFg0-0007HU-RG
	for mharc-qemu-trivial@gnu.org; Tue, 29 Oct 2013 16:14:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1VbFfu-00079f-4i
	for qemu-trivial@nongnu.org; Tue, 29 Oct 2013 16:14:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1VbFfp-0001pD-4t
	for qemu-trivial@nongnu.org; Tue, 29 Oct 2013 16:14:02 -0400
Received: from nodalink.pck.nerim.net ([62.212.105.220]:37848
	helo=paradis.irqsave.net) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>)
	id 1VbFfe-0001oV-Qk; Tue, 29 Oct 2013 16:13:47 -0400
Received: by paradis.irqsave.net (Postfix, from userid 1002)
	id 4F5148746D9; Tue, 29 Oct 2013 21:13:44 +0100 (CET)
Received: from irqsave.net (unknown [192.168.77.2])
	by paradis.irqsave.net (Postfix) with ESMTP id 924FC8746C4;
	Tue, 29 Oct 2013 21:13:42 +0100 (CET)
Date: Tue, 29 Oct 2013 21:13:42 +0100
From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20131029201341.GC2948@irqsave.net>
References: <1383057871-3897-1-git-send-email-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1383057871-3897-1-git-send-email-stefanha@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 62.212.105.220
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] usb: drop unused
	USBNetState.inpkt field
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
X-List-Received-Date: Tue, 29 Oct 2013 20:14:07 -0000

Le Tuesday 29 Oct 2013 =E0 15:44:31 (+0100), Stefan Hajnoczi a =E9crit :
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/usb/dev-network.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
> index 660d774..4c532b7 100644
> --- a/hw/usb/dev-network.c
> +++ b/hw/usb/dev-network.c
> @@ -637,7 +637,6 @@ typedef struct USBNetState {
>      unsigned int out_ptr;
>      uint8_t out_buf[2048];
> =20
> -    USBPacket *inpkt;
>      unsigned int in_ptr, in_len;
>      uint8_t in_buf[2048];
> =20
> --=20
> 1.8.3.1
>=20
>=20
Reviewed-by: Benoit Canet <benoit@irqsave.net>

