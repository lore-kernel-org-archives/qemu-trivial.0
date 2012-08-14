Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1J1n-0006Hd-Ig
	for mharc-qemu-trivial@gnu.org; Tue, 14 Aug 2012 11:27:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T1J1j-00063v-JE
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 11:27:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T1J1h-0005NM-Fq
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 11:27:27 -0400
Received: from cantor2.suse.de ([195.135.220.15]:47073 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1T1J1f-0005Mx-27; Tue, 14 Aug 2012 11:27:23 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id AE5B098E46;
	Tue, 14 Aug 2012 17:27:21 +0200 (CEST)
Message-ID: <502A6E57.9070402@suse.de>
Date: Tue, 14 Aug 2012 17:27:19 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1344953582-24303-1-git-send-email-alex@securiforest.com>
In-Reply-To: <1344953582-24303-1-git-send-email-alex@securiforest.com>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Alejandro Martinez Ruiz <alex@securiforest.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ehci: fix assertion typo
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
X-List-Received-Date: Tue, 14 Aug 2012 15:27:29 -0000

Am 14.08.2012 16:13, schrieb Alejandro Martinez Ruiz:
> Signed-off-by: Alejandro Martinez Ruiz <alex@securiforest.com>
> ---
>  hw/usb/hcd-ehci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Patch looks like a sensible bugfix for 1.2, we most likely don't intend
to overwrite the status. Gerd, could you take a second look?

Andreas

>=20
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index b043e7c..104c21d 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -2010,7 +2010,7 @@ static void ehci_fill_queue(EHCIPacket *p)
>          p->qtdaddr =3D qtdaddr;
>          p->qtd =3D qtd;
>          p->usb_status =3D ehci_execute(p, "queue");
> -        assert(p->usb_status =3D USB_RET_ASYNC);
> +        assert(p->usb_status =3D=3D USB_RET_ASYNC);
>          p->async =3D EHCI_ASYNC_INFLIGHT;
>      }
>  }
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

