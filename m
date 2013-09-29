Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQNPg-00023f-LN
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 16:16:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQNPY-0001qf-M1
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 16:16:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQNPS-0002kZ-NG
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 16:16:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VQNPG-0002gn-8v; Sun, 29 Sep 2013 16:15:54 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 97C06429EB;
	Mon, 30 Sep 2013 00:15:53 +0400 (MSK)
Message-ID: <52488A79.8010803@msgid.tls.msk.ru>
Date: Mon, 30 Sep 2013 00:15:53 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: =?UTF-8?B?SsOhbiBWZXNlbMO9?= <jano.vesely@gmail.com>
References: <CA+K+NcStLJod1P3MhWqPJ=jhfMwMuV_cxuivi-QXduwnT2uwqg@mail.gmail.com>
In-Reply-To: <CA+K+NcStLJod1P3MhWqPJ=jhfMwMuV_cxuivi-QXduwnT2uwqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] pci-ohci: Add missing 'break' in
	ohci_service_td
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
X-List-Received-Date: Sun, 29 Sep 2013 20:16:19 -0000

22.09.2013 00:26, J=C3=A1n Vesel=C3=BD wrote:
> Device communication errors need to be reported to driver.
> Add a debug message while at it.
>
> Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
> ---
>   hw/usb/hcd-ohci.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index 35f0878..0396e33 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -1143,7 +1143,9 @@ static int ohci_service_td(OHCIState *ohci,
> struct ohci_ed *ed)
>               switch (ret) {
>               case USB_RET_IOERROR:
>               case USB_RET_NODEV:
> +                DPRINTF("usb-ohci: got DEV ERROR\n");

why is this "DEV ERROR" ?  Note it is about 2 case statements, not one.

>                   OHCI_SET_BM(td.flags, TD_CC, OHCI_CC_DEVICENOTRESPOND=
ING);
> +                break;
>               case USB_RET_NAK:
>                   DPRINTF("usb-ohci: got NAK\n");
>                   return 1;

While the actual interesting change (adding break) looks
correct, and the whole thing is trivial indeed, this area
has a maintainer, -- Cc'ing Gerd for this.  If he's okay
I'll pick it up.

Thanks,

/mjt

