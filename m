Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dRDbr-0004So-5N
	for mharc-qemu-trivial@gnu.org; Sat, 01 Jul 2017 04:18:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dRDbp-0004I1-8Y
	for qemu-trivial@nongnu.org; Sat, 01 Jul 2017 04:18:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dRDbo-0002Gw-BT
	for qemu-trivial@nongnu.org; Sat, 01 Jul 2017 04:18:29 -0400
Received: from ozlabs.org ([103.22.144.67]:49397)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1dRDbg-000237-Fx; Sat, 01 Jul 2017 04:18:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3x05r36N3Lz9sNn; Sat,  1 Jul 2017 18:18:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1498897091;
	bh=5d8pR/b3AAVjczfZlCSvZqoKcQxJU9HuEXXnj9jxbLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guxydG9DjirCBn4b1VguV445ZJa6t+o270Fb2BlNo3+g7MlDMRONePne6ytJ9TYaD
	oWGolyor9mRoG39rgODJ5RgXYCsRYalmBFS+Xpq08uiF0QYHJFprFBU1UXzDETTSkC
	kgBRj0Z/Q6fv6YiC801C/r9/UaHjWqWzXOlyYbsI=
Date: Sat, 1 Jul 2017 17:51:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Message-ID: <20170701075113.GJ13989@umbus.fritz.box>
References: <149881713243.18888.18140083803237379387.stgit@bahia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x+WOirvrtTKur1pg"
Content-Disposition: inline
In-Reply-To: <149881713243.18888.18140083803237379387.stgit@bahia>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH] spapr: refresh "platform-specific"
 hcalls comment
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
X-List-Received-Date: Sat, 01 Jul 2017 08:18:30 -0000


--x+WOirvrtTKur1pg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2017 at 12:05:32PM +0200, Greg Kurz wrote:
> We have more of these since the addition of KVMPPC_H_LOGICAL_MEMOP in 201=
2.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-2.10.

> ---
>  include/hw/ppc/spapr.h |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index a66bbac35242..1826cc4fd696 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -377,9 +377,8 @@ struct sPAPRMachineState {
>   * as well.
>   *
>   * We also need some hcalls which are specific to qemu / KVM-on-POWER.
> - * So far we just need one for H_RTAS, but in future we'll need more
> - * for extensions like virtio.  We put those into the 0xf000-0xfffc
> - * range which is reserved by PAPR for "platform-specific" hcalls.
> + * We put those into the 0xf000-0xfffc range which is reserved by PAPR
> + * for "platform-specific" hcalls.
>   */
>  #define KVMPPC_HCALL_BASE       0xf000
>  #define KVMPPC_H_RTAS           (KVMPPC_HCALL_BASE + 0x0)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--x+WOirvrtTKur1pg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZV1RxAAoJEGw4ysog2bOSn6cQANScSdoTxBePzT1CwZYweePZ
6NRZxjHNh1XQr0uZtq4aBUO+pvqSS3neapd01ZEG9egGJV4NWmcjwCcKp2jfZkn6
cUuHkUBQBRkNxBu2dH0/urzviIeXPBCaeekeqpz93/K2/Wzjc342ebOTGYaTxQ3B
Hd3BJf9JxvfYAAad67eNTJChuoxeBAwqnp5NjYgkdQk5o67NFTuGKnLLaz7uQJua
wZWdnZ36w3U4OtHJi3GxwCIbmQqvuntE8jndNiw/BLS1KyjDj4b9E5C+MJrJjUVo
yeQpEZwcP78xEwzXeKPKKHYEsLho8mREYBC+doROo1dfs4dwBNN4iHnI5DesIXTk
Nxq9CfHCiiFaltFcTGbP5ea9ouhUc5XWYcop/GQtd55G3KqRqXHZyiSz8uQZX8FJ
YX0IDjgYcJPZNtpBCjdlK+pGRRR0OW/6fECCImniuXYfFF6NwpKU4eqWGjv+vGMS
VpR6HPe53HZ6uICQ/y0hcmhU76zXAr/jFL5+w+DNDGvV/odhwVvglEolktX/I7l+
uyy93hN5bjJPUl3ateR5KOBINRL3X0JzlRwlNP4DQP1gyWTAxPqqExx12H1ccFml
nkCJKfTVT6tLPVlh6qxP7G9MQRcTwJMujoHeH2MsYCliJhiGESpgPUDTEEXW4Yv6
D9Zm0Q9avQIMBlsxfo4s
=untr
-----END PGP SIGNATURE-----

--x+WOirvrtTKur1pg--

