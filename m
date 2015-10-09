Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zknx2-0004SY-Kp
	for mharc-qemu-trivial@gnu.org; Sat, 10 Oct 2015 02:48:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZkgcS-0004XK-5L
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 18:58:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZkgcP-0007sq-UQ
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 18:58:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54260)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZkgcM-0007oB-LL; Fri, 09 Oct 2015 18:58:26 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 27CD767;
	Fri,  9 Oct 2015 22:58:26 +0000 (UTC)
Received: from [10.3.113.202] (ovpn-113-202.phx2.redhat.com [10.3.113.202])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t99MwPvv026631; Fri, 9 Oct 2015 18:58:25 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1444406198-6521-1-git-send-email-thuth@redhat.com>
	<1444406198-6521-2-git-send-email-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5618468D.5010005@redhat.com>
Date: Fri, 9 Oct 2015 16:58:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1444406198-6521-2-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="BIHIcAOlkarhJXAFL1bc4cuXBdbdhvbNV"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/4] hw/dma/pxa2xx:
 Remove superfluous memset
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
X-List-Received-Date: Fri, 09 Oct 2015 22:58:40 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BIHIcAOlkarhJXAFL1bc4cuXBdbdhvbNV
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/09/2015 09:56 AM, Thomas Huth wrote:
> g_malloc0 already clears the memory, so no need for
> the additional memset here. And while we're at it,
> also convert the g_malloc0 to the preferred g_new0.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/dma/pxa2xx_dma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
> index d4501fb..54cdb25 100644
> --- a/hw/dma/pxa2xx_dma.c
> +++ b/hw/dma/pxa2xx_dma.c
> @@ -459,9 +459,8 @@ static int pxa2xx_dma_init(SysBusDevice *sbd)
>          return -1;
>      }
> =20
> -    s->chan =3D g_malloc0(sizeof(PXA2xxDMAChannel) * s->channels);
> +    s->chan =3D g_new0(PXA2xxDMAChannel, s->channels);
> =20
> -    memset(s->chan, 0, sizeof(PXA2xxDMAChannel) * s->channels);
>      for (i =3D 0; i < s->channels; i ++)
>          s->chan[i].state =3D DCSR_STOPINTR;
> =20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--BIHIcAOlkarhJXAFL1bc4cuXBdbdhvbNV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWGEaNAAoJEKeha0olJ0Nq4FsIAJKauu/mmDHTDEN/2FgTD/nH
auImLycQkkwHIA0zsXwbwFWqVDYJQXUaAAqzIqMmqqJD+bFQAmHNRZR3i9aRxgfR
M+K4XF+CiAa9XOAhez5UXkHUHvh0lHb1AJKkHiPaKZBUXUcRAHn1bxO2YvDKgYzI
6bltlQVtUN2fbm3zWek5icmUGUo7Da5WUw77wkRxE04Lsc6UHhgNtSuVsxWwWkQP
kzTM7GyUowDtZL/i/Uwix0jy5hVXr8CMpWtopnzjBFKUAAWoVlVWnY+cn01oZeXg
icU8Os0Xt2aFmxRjHzzKICo7QQfD/9DmHU8Sk2Y3h3NERzwh3HPtCiRtZrLnJwY=
=Wq26
-----END PGP SIGNATURE-----

--BIHIcAOlkarhJXAFL1bc4cuXBdbdhvbNV--

