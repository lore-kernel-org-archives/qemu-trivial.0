Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkiOl-0005Np-Kk
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 20:52:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZkIJ1-0008LM-6M
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 17:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZkIIq-0003kk-EE
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 17:00:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZkIIE-0003HI-Ae; Thu, 08 Oct 2015 17:00:02 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id D7E9E3C221;
	Thu,  8 Oct 2015 21:00:01 +0000 (UTC)
Received: from [10.3.113.202] (ovpn-113-202.phx2.redhat.com [10.3.113.202])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t98L0169012455; Thu, 8 Oct 2015 17:00:01 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
	<1444332916-16476-2-git-send-email-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5616D94C.4040109@redhat.com>
Date: Thu, 8 Oct 2015 14:59:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1444332916-16476-2-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="tO8sekbXI6hEVrVSMnBqxMKBGOCawfG51"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] hw/dma/pxa2xx: Remove
	superfluous memset
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
X-List-Received-Date: Thu, 08 Oct 2015 21:00:56 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tO8sekbXI6hEVrVSMnBqxMKBGOCawfG51
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/08/2015 01:35 PM, Thomas Huth wrote:
> g_malloc0 already clears the memory, so no need for
> the additional memset here.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/dma/pxa2xx_dma.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
> index d4501fb..3f0a720 100644
> --- a/hw/dma/pxa2xx_dma.c
> +++ b/hw/dma/pxa2xx_dma.c
> @@ -461,7 +461,6 @@ static int pxa2xx_dma_init(SysBusDevice *sbd)
> =20
>      s->chan =3D g_malloc0(sizeof(PXA2xxDMAChannel) * s->channels);

As long as we're here, this should probably be switched to g_new0(), in
part to avoid any chance that the multiply can overflow.

> =20
> -    memset(s->chan, 0, sizeof(PXA2xxDMAChannel) * s->channels);

But this part is correct.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--tO8sekbXI6hEVrVSMnBqxMKBGOCawfG51
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWFtlQAAoJEKeha0olJ0NqGKcIAJNlM5SmvR1bRfXY4FCvp4d7
qDZuXMn4Wv5uUayOgc7lBbjfXV2ZMD4L9QQACdeGSy08udFRvXN/b8b5CdBeUTLU
JZg3XDYL58w0tBPtc33ppAA3KqU+5BWWj5Kkqq08C10twgL8zGO5yYVxGB1T/g6H
jgRHaDgEYWyuL3P6Oh+A9nJOu8smgfMgbkPecwFZTpH55bJiULZyinnJHJTOfnOt
od7ipmFzuv02KyNLAMJFwFliu3gY6yZAB0t+K3tuJCVd2Do04jwmNdJmmfTP0HC5
sukjI0jIM7s3ti19D/mB07RRvdQNhxXvf3agsl+Ab2Fg25qizRFvePrM/d12ZSI=
=6Eph
-----END PGP SIGNATURE-----

--tO8sekbXI6hEVrVSMnBqxMKBGOCawfG51--

