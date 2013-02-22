Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8lN4-0003U4-AO
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2013 00:40:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1U8lN1-0003OW-Mb
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 00:40:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1U8lN0-0000Ub-O5
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 00:40:31 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:50772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1U8lMw-0000Ti-ST; Fri, 22 Feb 2013 00:40:27 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	12F9B728004A; Fri, 22 Feb 2013 06:40:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id CG80-4NCjYmO; Fri, 22 Feb 2013 06:40:23 +0100 (CET)
Received: from [192.168.178.35] (p54AD9A8B.dip.t-dialin.net [84.173.154.139])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	B635B7280047; Fri, 22 Feb 2013 06:40:22 +0100 (CET)
Message-ID: <512704C5.1010706@weilnetz.de>
Date: Fri, 22 Feb 2013 06:40:21 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>, 
	Anthony Liguori <aliguori@us.ibm.com>
References: <1361483888-8976-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1361483888-8976-1-git-send-email-hpoussin@reactos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] xhci: fix bad print
	specifier
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
X-List-Received-Date: Fri, 22 Feb 2013 05:40:32 -0000

Am 21.02.2013 22:58, schrieb Herv=C3=A9 Poussineau:
> This fixes the following compilation error:
> hw/usb/hcd-xhci.c:1156:17: error: format =E2=80=98%llx=E2=80=99 expects=
 argument of type
> =E2=80=98long long unsigned int=E2=80=99, but argument 4 has type =E2=80=
=98unsigned int=E2=80=99
>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> ---
>  hw/usb/hcd-xhci.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 5796102..07afdee 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -1152,8 +1152,8 @@ static XHCIStreamContext *xhci_find_stream(XHCIEP=
Context *epctx,
> =20
>      if (sctx->sct =3D=3D -1) {
>          xhci_dma_read_u32s(epctx->xhci, sctx->pctx, ctx, sizeof(ctx));
> -        fprintf(stderr, "%s: init sctx #%d @ %lx: %08x %08x\n", __func=
__,
> -                streamid, sctx->pctx, ctx[0], ctx[1]);
> +        fprintf(stderr, "%s: init sctx #%d @ " DMA_ADDR_FMT ": %08x %0=
8x\n",
> +                __func__, streamid, sctx->pctx, ctx[0], ctx[1]);
>          sct =3D (ctx[0] >> 1) & 0x07;
>          if (epctx->lsa && sct !=3D 1) {
>              *cc_error =3D CC_INVALID_STREAM_TYPE_ERROR;


Reviewed-by: Stefan Weil <sw@weilnetz.de>

Anthony, this is a build regression in git master, so we should not
wait for qemu-trivial to apply it.

Thanks,

Stefan


