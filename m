Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UHwbe-00029B-FZ
	for mharc-qemu-trivial@gnu.org; Tue, 19 Mar 2013 09:29:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UHwba-00022g-Ab
	for qemu-trivial@nongnu.org; Tue, 19 Mar 2013 09:29:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UHwbV-0000wu-MG
	for qemu-trivial@nongnu.org; Tue, 19 Mar 2013 09:29:30 -0400
Received: from cantor2.suse.de ([195.135.220.15]:38658 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UHwbS-0000pM-Pv; Tue, 19 Mar 2013 09:29:22 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 52AC0A50E4;
	Tue, 19 Mar 2013 14:29:22 +0100 (CET)
Message-ID: <51486831.4070802@suse.de>
Date: Tue, 19 Mar 2013 14:29:21 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>
References: <1363692343-22299-1-git-send-email-kwolf@redhat.com>
In-Reply-To: <1363692343-22299-1-git-send-email-kwolf@redhat.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] serial: Fix debug format
	strings
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
X-List-Received-Date: Tue, 19 Mar 2013 13:29:32 -0000

Am 19.03.2013 12:25, schrieb Kevin Wolf:
> This fixes the build of hw/serial.c with DEBUG_SERIAL enabled.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/serial.c b/hw/serial.c
> index 48a5eb6..0ccc499 100644
> --- a/hw/serial.c
> +++ b/hw/serial.c
> @@ -306,7 +306,7 @@ static void serial_ioport_write(void *opaque, hwadd=
r addr, uint64_t val,
>      SerialState *s =3D opaque;
> =20
>      addr &=3D 7;
> -    DPRINTF("write addr=3D0x%02x val=3D0x%02x\n", addr, val);
> +    DPRINTF("write addr=3D0x%" HWADDR_PRIx " val=3D0x%" PRIx64 "\n", a=
ddr, val);

Are you intentionally dropping 02 in both places? That changes output FWI=
W.

Andreas

>      switch(addr) {
>      default:
>      case 0:
> @@ -527,7 +527,7 @@ static uint64_t serial_ioport_read(void *opaque, hw=
addr addr, unsigned size)
>          ret =3D s->scr;
>          break;
>      }
> -    DPRINTF("read addr=3D0x%02x val=3D0x%02x\n", addr, ret);
> +    DPRINTF("read addr=3D0x%" HWADDR_PRIx " val=3D0x%02x\n", addr, ret=
);
>      return ret;
>  }
> =20
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

