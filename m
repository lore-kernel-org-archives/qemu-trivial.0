Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duUUM-0002b3-Vx
	for mharc-qemu-trivial@gnu.org; Tue, 19 Sep 2017 22:11:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1duUUI-0002Vv-RN
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 22:11:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1duUUH-0004Z5-U7
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 22:11:42 -0400
Received: from ozlabs.org ([103.22.144.67]:34653)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1duUU8-0004SS-SZ; Tue, 19 Sep 2017 22:11:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3xxjsX5W4Hz9sBW; Wed, 20 Sep 2017 12:11:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1505873488;
	bh=IPZcGhSSOiU5G0BFf5cyPI3YYRZrvJcqO+1wWxfc/SI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+kcHMmIuQstaaCxTVIrzTzNXn3KOmnG1WYRcK8TfyiiTZXGjlld+HuKQq95qdB2B
	3j2EJguLSjR39TDlcYVMyxYbRyZw7FF1CeQZJR7LqweULPuEcWa9IBpi6EoRBdfC9j
	iXihfwcXsveieA8OJFJlrvIuMlLdVC7hTk8szJy8=
Date: Wed, 20 Sep 2017 11:00:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, "open list:PowerPC" <qemu-ppc@nongnu.org>
Message-ID: <20170920010024.GB5520@umbus.fritz.box>
References: <20170919141603.27713-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <20170919141603.27713-1-eblake@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH] ppc/pnv: Improve macro parenthesization
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
X-List-Received-Date: Wed, 20 Sep 2017 02:11:45 -0000


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2017 at 09:16:03AM -0500, Eric Blake wrote:
> Although none of the existing macro call-sites were broken,
> it's always better to write macros that properly parenthesize
> arguments that can be complex expressions, so that the intended
> order of operations is not broken.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>

Applied to ppc-for-2.11, thanks.

> ---
>  include/hw/ppc/pnv_xscom.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 3757b2cab9..38077b4796 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -54,7 +54,7 @@ typedef struct PnvXScomInterfaceClass {
>   *   PCB SLAVE   0x110Fxxxx
>   */
>=20
> -#define PNV_XSCOM_EX_CORE_BASE(base, i) (base | (((uint64_t)i) << 24))
> +#define PNV_XSCOM_EX_CORE_BASE(base, i) ((base) | ((uint64_t)(i) << 24))
>  #define PNV_XSCOM_EX_CORE_SIZE    0x100000
>=20
>  #define PNV_XSCOM_LPC_BASE        0xb0020

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnBvagACgkQbDjKyiDZ
s5J1ag/+KzYGD2H8lgUlser8sWN5x4sueaj/ufXFBjeeWlQVyJrXPP7Ta9elMBX8
rF2gXZ+ToHoXoRmQ0Kn6lqwB1RKxer2Gl7dgk1L+9P6/Fdxji9d9AGE014p9EQz4
N5BciZkNwCx+uuuzmWjctJ4Y9gVkAmVmhNACHnI7SS4woyaKnjBo7+D4vEN+LuX3
SU5vj8WpZXxHa64Bo/zVyrsR9KBKtiaOD6ExN/1AjF3mW9I/9s1s/ShAGQ/MHXqL
1MZU1R619fRlLyeN+ohS7MFgnbmfZmJRwYAYJjY46IgxRk0Fr0oTElIHgeVMBVeg
7Xof24yQ1V78ezulkOxGOwEDzgZcGkHbhnI5J7xnyZ21IR9Qhf+WCvQmQFt+c0MJ
KB5JLDVQOp3ZAD7xCFP7VgucvNXbMnLD/2hU+NkzjrG3iBAB7Ef1F+H2YilCweu+
1pDdhlLe9GSEYRHPINQ2hLYArPm4wLInUi8P/D+2lM/b4Yv/ZP8/PeGn3p0H+XJ0
IS9H6GFbZk1fdI+0CB8vrOeeLg/69gvkFPPjHBp/nQ2/CkGp5uW3c/QbfYZMmvgB
0iSYkBg3NhtW7NKWYGgxHbQABTYlVuUCSioWifg2O5oMp2hMnRwebfzdRbQTZav2
J20gHFwywN6d5syRME4WN4zbDT3PKNpScusU0OWRDXhwBeK5OyI=
=W+Za
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--

