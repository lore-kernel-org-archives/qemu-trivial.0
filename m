Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqsrG-0001B1-Lb
	for mharc-qemu-trivial@gnu.org; Sat, 09 Sep 2017 23:24:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dqsrC-00019n-QM
	for qemu-trivial@nongnu.org; Sat, 09 Sep 2017 23:24:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dqsrB-0005sk-Tq
	for qemu-trivial@nongnu.org; Sat, 09 Sep 2017 23:24:26 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:54667)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1dqsr9-0005pu-Gn; Sat, 09 Sep 2017 23:24:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3xqbyF0vyGz9sRV; Sun, 10 Sep 2017 13:24:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1505013861;
	bh=FjV197wXjN4CTqmwK4S2kAUHzM1pIxIaoTbHTMQ/bCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDpCl4X7XQ3dNClRr+7PPts75sinxQuu9CeZNyeW4S/t8FHd0SFuRGuwK1lRaGdC1
	WcAx/tNQP3h+AoeTUbv1UQvKSCylLHzUv58VLIJtL0FjAbYAVUNR7hNW//9Pwxbwn/
	fOnQPLkTm4bEaf12pZsnQyB5k2dIBBdLgSID0GiM=
Date: Sun, 10 Sep 2017 13:24:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Laurent Vivier <lvivier@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20170910032413.GB2735@umbus.fritz.box>
References: <1504100343-26607-1-git-send-email-thuth@redhat.com>
	<b98a4c56-f386-f827-5aa7-9a00e6fdf790@amsat.org>
	<CAFEAcA8O5T5cX8XqBVZqXLt5MPvF7qEcJK8Az2GBei07P0dZGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sPkBZsy7C+1fV4MN"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8O5T5cX8XqBVZqXLt5MPvF7qEcJK8Az2GBei07P0dZGQ@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] hw/misc/ivshmem:
 Fix ivshmem_recv_msg() to also work on big endian systems
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
X-List-Received-Date: Sun, 10 Sep 2017 03:24:28 -0000


--sPkBZsy7C+1fV4MN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2017 at 03:59:07PM +0100, Peter Maydell wrote:
> On 30 August 2017 at 15:53, Philippe Mathieu-Daud=E9 <f4bug@amsat.org> wr=
ote:
> > On 08/30/2017 10:39 AM, Thomas Huth wrote:
> >> The problem is that the server side code in ivshmem_server_send_one_ms=
g()
> >> correctly translates all messages IDs into little endian 64-bit values,
> >> but the client side code in the ivshmem_recv_msg() function does not s=
wap
> >> the byte order back. Fix it by passing the value through le64_to_cpu().
> >
> >
> > Yes, we lack BE testing :(
>=20
> My pre-pull-request test set includes s390 and ppc64 bigendian.
> This one was just missed because the 'slow' tests aren't in
> 'make check'.

I'm not what makes sense for staging this fix.  I could take it
through my tree, but it's not an obvious match, since this isn't
really related to ppc at all.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sPkBZsy7C+1fV4MN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlm0sF0ACgkQbDjKyiDZ
s5JL3Q/+Ji8DsCsJIFVYfPchCFbPYIowKAF2c1VyBFHH1Tb6OPNSNoOQmcKBe8hq
ajBPlbpz88DGZJR+ZJNkjBOVcGimHpkC56kZsIvYYcYczerf43x2L8ZFHFeVmDiA
zLiCmL4oWU6BvytOri8SstJyAQiyyQJpDPCZVgsolFB04V0HJ4XAJIU6BKmF5CvX
6Xe0amEFRVa2a1A7aaAW9EjVt72J6XxDe44Ebk6bQYIvfYDnL8Y35rTMBOXwQyEk
LJ6EBuzA8TGxT8EOoysd1eggPa/BG59nGF152I5djDoOYZotZ1W26Azvyv/bOifS
/2OX1mWSexskUcg2Ewgfo2GodwKrAupgmLxpKg7JmsnbGEY06tLbS+oBrJKwPc5i
+zenahnfjampu7PPsgvxJfs074KCTl/chR5XpIBHmGw2Bl1I86XOsdju20tUHR/U
vbSfrYhdlKmIPdXElKOAdGKyR13K/OhiV9frxBLBLlPiK9k8EMJWo/BiD7eOIQjo
LTNvRyhZ1WZLObMmLrlWRYTJ6sxkT04684iHoZPM9Nk6JWjHP7BfkALtsLK7TAr4
TQTyRKyQCsQoX/uw27//QbO12iDptf1L4xZoVljPcmEONKOvolZYxgNfhYmFYsVD
G57PvOLfc/AzlLVgkDevHY8jv3dfj67bIDoG48MjTclCHbZd9Jk=
=VJm5
-----END PGP SIGNATURE-----

--sPkBZsy7C+1fV4MN--

