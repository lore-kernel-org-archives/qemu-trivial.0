Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U9L0g-00015i-C9
	for mharc-qemu-trivial@gnu.org; Sat, 23 Feb 2013 14:43:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1U9L0Z-00013w-Uc
	for qemu-trivial@nongnu.org; Sat, 23 Feb 2013 14:43:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1U9L0T-00042l-Q6
	for qemu-trivial@nongnu.org; Sat, 23 Feb 2013 14:43:43 -0500
Received: from mail-ia0-x233.google.com ([2607:f8b0:4001:c02::233]:59526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1U9L0T-00042a-M4
	for qemu-trivial@nongnu.org; Sat, 23 Feb 2013 14:43:37 -0500
Received: by mail-ia0-f179.google.com with SMTP id x24so1487076iak.10
	for <qemu-trivial@nongnu.org>; Sat, 23 Feb 2013 11:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=cvVCTBpn79aqXrTLwqc7rQ7X5ULd7CtSrTmyydPh1p4=;
	b=c2Vw8yQMwz+eD3i1txls+FT58KTsHyz67/XLc/aW73eBBT3f4VjrgXwmz1Y1V7KxvV
	CUrBPCPifDes24SMHmCCXDMTY6h65eGn+f9d9KgnZ095aZZunygF8bREAdgKpGeBcMyk
	M+i1dmY/gC02K1X2G46B+WeRuoUEOL1fH+dUE89/iQGpNOsoQB1WERpNCY19F1mg3SaQ
	Ez6ByejWxhcANEjHEmA+u5JKmSVR/uNbZn6YsZXGSUrZ20q7Wts2XVtFEsP0X4gsqo+B
	P8SYaxi1mpmO9/VC/J8e36zaEntdZNymGrhfmw0Oxh1YrvO4PXCHyORUsTiPeO6wGr16
	nz1Q==
X-Received: by 10.50.45.200 with SMTP id p8mr1010719igm.104.1361638166444;
	Sat, 23 Feb 2013 08:49:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.81.83 with HTTP; Sat, 23 Feb 2013 08:49:05 -0800 (PST)
In-Reply-To: <1361483888-8976-1-git-send-email-hpoussin@reactos.org>
References: <1361483888-8976-1-git-send-email-hpoussin@reactos.org>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 23 Feb 2013 16:49:05 +0000
Message-ID: <CAAu8pHuEiyJPuzwNg5343Sh+j_-oDCDH82pXwzSUrkuMnhPcRg@mail.gmail.com>
To: =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c02::233
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
X-List-Received-Date: Sat, 23 Feb 2013 19:43:49 -0000

Thanks, applied.

On Thu, Feb 21, 2013 at 9:58 PM, Herv=C3=A9 Poussineau <hpoussin@reactos.or=
g> wrote:
> This fixes the following compilation error:
> hw/usb/hcd-xhci.c:1156:17: error: format =E2=80=98%llx=E2=80=99 expects a=
rgument of type
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
> @@ -1152,8 +1152,8 @@ static XHCIStreamContext *xhci_find_stream(XHCIEPCo=
ntext *epctx,
>
>      if (sctx->sct =3D=3D -1) {
>          xhci_dma_read_u32s(epctx->xhci, sctx->pctx, ctx, sizeof(ctx));
> -        fprintf(stderr, "%s: init sctx #%d @ %lx: %08x %08x\n", __func__=
,
> -                streamid, sctx->pctx, ctx[0], ctx[1]);
> +        fprintf(stderr, "%s: init sctx #%d @ " DMA_ADDR_FMT ": %08x %08x=
\n",
> +                __func__, streamid, sctx->pctx, ctx[0], ctx[1]);
>          sct =3D (ctx[0] >> 1) & 0x07;
>          if (epctx->lsa && sct !=3D 1) {
>              *cc_error =3D CC_INVALID_STREAM_TYPE_ERROR;
> --
> 1.7.10.4
>
>

