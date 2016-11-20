Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c8fIU-0006GA-Jz
	for mharc-qemu-trivial@gnu.org; Sun, 20 Nov 2016 22:29:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1c8fIS-0006DG-ND
	for qemu-trivial@nongnu.org; Sun, 20 Nov 2016 22:29:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1c8fIR-0003lX-OB
	for qemu-trivial@nongnu.org; Sun, 20 Nov 2016 22:29:32 -0500
Received: from ozlabs.org ([103.22.144.67]:53497)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1c8fIJ-0003Va-FJ; Sun, 20 Nov 2016 22:29:24 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3tMYx56rHRz9t3N; Mon, 21 Nov 2016 14:29:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1479698953;
	bh=V7HtySI6Giue9Z7IMKuFo0pDRZdW0s0xZgrVRq2sPqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxfToONDYq56+n0Akl64Sf5t/bYAvXnhtuMM/f1aWMEcsY2IT3npfsxc6OlSlDlWi
	uQ680zl2L2IAxzDOKHBADv6pZ/jzBvjIx8p+7qftgot2vdmHd01C0vsqoHnj0Rbu1c
	w2f2tQ5Bgp4h5JQqiMF5ZE17J+1oI13v/SCh/gsU=
Date: Mon, 21 Nov 2016 10:44:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org
Message-ID: <20161120234410.GA18153@umbus.fritz.box>
References: <20161119192303.18784-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <20161119192303.18784-1-sw@weilnetz.de>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH for-2.8] disas/ppc: Fix indefinite
 articles in comments
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
X-List-Received-Date: Mon, 21 Nov 2016 03:29:33 -0000


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2016 at 08:23:03PM +0100, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Low risk, but low priority.  Applied to ppc-for-2.9

> ---
>  disas/ppc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/disas/ppc.c b/disas/ppc.c
> index bd05623..9b5a0e7 100644
> --- a/disas/ppc.c
> +++ b/disas/ppc.c
> @@ -1653,11 +1653,11 @@ extract_tbr (unsigned long insn,
>  #define BBOYBI_MASK (BBOYCB_MASK | BI_MASK)
>  #define BBOATBI_MASK (BBOAT2CB_MASK | BI_MASK)
> =20
> -/* An Context form instruction.  */
> +/* A Context form instruction.  */
>  #define CTX(op, xop)   (OP (op) | (((unsigned long)(xop)) & 0x7))
>  #define CTX_MASK CTX(0x3f, 0x7)
> =20
> -/* An User Context form instruction.  */
> +/* A User Context form instruction.  */
>  #define UCTX(op, xop)  (OP (op) | (((unsigned long)(xop)) & 0x1f))
>  #define UCTX_MASK UCTX(0x3f, 0x1f)
> =20
> @@ -1710,19 +1710,19 @@ extract_tbr (unsigned long insn,
>  #define SC(op, sa, lk) (OP (op) | ((((unsigned long)(sa)) & 1) << 1) | (=
(lk) & 1))
>  #define SC_MASK (OP_MASK | (((unsigned long)0x3ff) << 16) | (((unsigned =
long)1) << 1) | 1)
> =20
> -/* An VX form instruction.  */
> +/* A VX form instruction.  */
>  #define VX(op, xop) (OP (op) | (((unsigned long)(xop)) & 0x7ff))
> =20
>  /* The mask for an VX form instruction.  */
>  #define VX_MASK	VX(0x3f, 0x7ff)
> =20
> -/* An VA form instruction.  */
> +/* A VA form instruction.  */
>  #define VXA(op, xop) (OP (op) | (((unsigned long)(xop)) & 0x03f))
> =20
> -/* The mask for an VA form instruction.  */
> +/* The mask for a VA form instruction.  */
>  #define VXA_MASK VXA(0x3f, 0x3f)
> =20
> -/* An VXR form instruction.  */
> +/* A VXR form instruction.  */
>  #define VXR(op, xop, rc) (OP (op) | (((rc) & 1) << 10) | (((unsigned lon=
g)(xop)) & 0x3ff))
> =20
>  /* The mask for a VXR form instruction.  */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYMjVIAAoJEGw4ysog2bOSisIQANzrLNS9AQqmYlcx6C/CoDFa
09hasznLv91wj2jNNTTe7WyIdSZ1uaWODd+gGeVIgybQJDd0mSwzasT5sMs7kBH+
ePDXNScdv6AQ77/tBuO31N1mRB4h9wH5RzOhi8yhSnqeWhio4mx8LJ6gsqVrvUXq
jX1pjRv6TRJpV7JIMt1SDKbT4OK0cV/XR8ygaJOaPdAZMYftkQ1wQB5pygvXd7az
4R2/OgCrvwPH1N89yzKeWQ5SLXXI5d9natv40OA7aPP2n06lk1tAQVaErtvX7IQo
y5PaAVJo+S4K1j6VgKCNi5Z5AlbySdymQyOs1N6NHnLmOr8k/TDSzkX2zy+0zM+J
m0pPldnLHWqHrA311A0/aLlieUz4Yz5evcHelBfkp9lYEEtRoDkYrHAEkg+HXAL7
KJyeMw379j0ngT6F8dRDOgLVpJXWqM3AGJqAG87VQbx4xDYG154FvHNEbbkAqdwP
/QAlxEA73OHZQ7USXvYmsND/+krYtqi8lZpWU6KDLLPccgvQxTycRepI5AkufBOO
F0FfASdLj/ZvRjhlbLTI+UnS7KEa+1SjQqglg2WvQmqmAJE2F5IonIcdtF6uZIvQ
YeJnK6pndq8nbXA6TcPSs2fedYyMCKqgKEql77JlWqf6P8mUjlb+KC/HkvO+94kI
D7zuVPgXbfr+W/Moh2xA
=CRJB
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

