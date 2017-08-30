Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dmsTw-0005k8-W1
	for mharc-qemu-trivial@gnu.org; Tue, 29 Aug 2017 22:11:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dmsTu-0005hR-4i
	for qemu-trivial@nongnu.org; Tue, 29 Aug 2017 22:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dmsTt-0006XD-57
	for qemu-trivial@nongnu.org; Tue, 29 Aug 2017 22:11:50 -0400
Received: from ozlabs.org ([103.22.144.67]:46611)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1dmsTn-0006Pf-Bz; Tue, 29 Aug 2017 22:11:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3xhpsQ2B4Cz9sNr; Wed, 30 Aug 2017 12:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1504059098;
	bh=1qAiCzEXC+x54XBKk1cv+ZKyJgJ3A6ZXr8M6lej0P+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exX6BfBU9J4vyHTFVPCFzmy7youCwxoPc3xqkNCsV8t7qCV+IN+3O0gVbC8v5HV+p
	Gs569uOdjGpNLRSZEXWQDf02FJ352lBIMsG3X31EAI6nWGp0OY6FwdTNqdDemyf5Vm
	XsjvzttFv+04N4v/eLpexGW2INDwJRT7ghABRt2E=
Date: Wed, 30 Aug 2017 12:11:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20170830021132.GC3386@umbus.fritz.box>
References: <1504030416-18618-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Content-Disposition: inline
In-Reply-To: <1504030416-18618-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH for-2.11] tests: Fix broken
 ivshmem-server-msi/-irq tests
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Aug 2017 02:11:51 -0000


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2017 at 08:13:36PM +0200, Thomas Huth wrote:
> Broken with commit b4ba67d9a7025 ("libqos: Change PCI accessors to take
> opaque BAR handle") a while ago, but nobody noticed since the tests are
> only run in SPEED=3Dslow mode: The msix_pba_bar is not correctly initiali=
zed
> anymore if bir_pba has the same value as bir_table. With this fix,
> "make check SPEED=3Dslow" should work fine again.
>=20
> Fixes: b4ba67d9a702507793c2724e56f98e9b0f7be02b
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  tests/libqos/pci.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/libqos/pci.c b/tests/libqos/pci.c
> index 2dcdead..28d576c 100644
> --- a/tests/libqos/pci.c
> +++ b/tests/libqos/pci.c
> @@ -120,6 +120,8 @@ void qpci_msix_enable(QPCIDevice *dev)
>      bir_pba =3D table & PCI_MSIX_FLAGS_BIRMASK;
>      if (bir_pba !=3D bir_table) {
>          dev->msix_pba_bar =3D qpci_iomap(dev, bir_pba, NULL);
> +    } else {
> +        dev->msix_pba_bar =3D dev->msix_table_bar;
>      }
>      dev->msix_pba_off =3D table & ~PCI_MSIX_FLAGS_BIRMASK;
> =20
> @@ -138,8 +140,11 @@ void qpci_msix_disable(QPCIDevice *dev)
>      qpci_config_writew(dev, addr + PCI_MSIX_FLAGS,
>                                                  val & ~PCI_MSIX_FLAGS_EN=
ABLE);
> =20
> +    if (dev->msix_pba_bar.addr !=3D dev->msix_table_bar.addr) {
> +        qpci_iounmap(dev, dev->msix_pba_bar);
> +    }
>      qpci_iounmap(dev, dev->msix_table_bar);
> -    qpci_iounmap(dev, dev->msix_pba_bar);
> +
>      dev->msix_enabled =3D 0;
>      dev->msix_table_off =3D 0;
>      dev->msix_pba_off =3D 0;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmmHtQACgkQbDjKyiDZ
s5JHlhAAzG2Wl0hhEktQ7QbnK8rOVw3Jxr6FmLx6sE7ZiCz+a5Ia1F4eb/K8gSBu
t2E1J5+d0CPcIu3l8te8WKKmPseQawNuSyoT4wtWUd9+mAPMvmswXMExEQGpGl9U
gI9A4bZYNf91LV6pzYGhM6buJXWcMDqtY3o52BykrFvz4Q4sWH1hS7rV6oQNEYjr
K4W5gF+siPo0Y4ufD0KDThERSQYkqNKsWPQDsxTh8WOTRG+e3xXwIMGsU5Ww4wU8
2JhD1tw+oRU0Rg1YVz42uap//ba/dIC/DilDeoC964Ryv71a5Vsuh9WR+U9dYgcv
vLC8gYb9b5UcaPv34O/X61RHVFtpTa8TLDkMkIQDwG73pWYSyNKRQn/FzGf3BTiQ
Ml2WkzBzuE6ZwsjOIvxAPK3HqTbXJNaZWLK0/5lKOoLrbRelYNG/LhyENRY4xyzR
Y2a1t88017L6aNez89RG+cCmVs2PUw72OuafklvNpYOBywjUBkcnuAkH8j/BFwPM
qIEZBRV1+lTtkZj8u1Cz8Xd2uhQvIZsugEjBUZN95wfNhAXzpWVaN4iY3Yj+tfAP
y5io2VFYnk7UG5us6SbZdq1xb3khERD/c3tWewzUtp7xyrTBKIPUthFYDyb7LnqD
JqXCfAlzNx8LgKGHRj+vXXQ5vgrC5edIYgnADwZSGVdZbeIk+hY=
=Wuc7
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--

