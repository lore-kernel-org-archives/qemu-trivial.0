Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwxG4-0002zQ-S9
	for mharc-qemu-trivial@gnu.org; Thu, 02 Aug 2012 11:24:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SwxFu-0002Qw-4q
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 11:24:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SwxFq-00051z-7V
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 11:24:06 -0400
Received: from cantor2.suse.de ([195.135.220.15]:43524 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SwxFj-00050r-Ao; Thu, 02 Aug 2012 11:23:55 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id D357FA341E;
	Thu,  2 Aug 2012 17:23:54 +0200 (CEST)
Message-ID: <501A9B88.2080900@suse.de>
Date: Thu, 02 Aug 2012 17:23:52 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1343896830-3503-1-git-send-email-hpoussin@reactos.org>
	<1343896830-3503-2-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1343896830-3503-2-git-send-email-hpoussin@reactos.org>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] esp: add missing const
	on TypeInfo structures
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
X-List-Received-Date: Thu, 02 Aug 2012 15:24:15 -0000

Am 02.08.2012 10:40, schrieb Herv=C3=A9 Poussineau:
>=20
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Thanks,
Andreas

> ---
>  hw/esp.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/esp.c b/hw/esp.c
> index c6422ad..4b00889 100644
> --- a/hw/esp.c
> +++ b/hw/esp.c
> @@ -816,7 +816,7 @@ static void sysbus_esp_class_init(ObjectClass *klas=
s, void *data)
>      dc->vmsd =3D &vmstate_sysbus_esp_scsi;
>  }
> =20
> -static TypeInfo sysbus_esp_info =3D {
> +static const TypeInfo sysbus_esp_info =3D {
>      .name          =3D "esp",
>      .parent        =3D TYPE_SYS_BUS_DEVICE,
>      .instance_size =3D sizeof(SysBusESPState),
> @@ -1178,7 +1178,7 @@ static void esp_pci_class_init(ObjectClass *klass=
, void *data)
>      dc->vmsd =3D &vmstate_esp_pci_scsi;
>  }
> =20
> -static TypeInfo esp_pci_info =3D {
> +static const TypeInfo esp_pci_info =3D {
>      .name =3D "am53c974",
>      .parent =3D TYPE_PCI_DEVICE,
>      .instance_size =3D sizeof(PCIESPState),
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

