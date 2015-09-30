Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk4UE-0006H6-CE
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 02:15:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ZhAPg-0000Gz-OT
	for qemu-trivial@nongnu.org; Wed, 30 Sep 2015 01:58:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ZhAPf-0006qh-WB
	for qemu-trivial@nongnu.org; Wed, 30 Sep 2015 01:58:48 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1ZhAPb-0006pH-8l; Wed, 30 Sep 2015 01:58:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id AB884140D24; Wed, 30 Sep 2015 15:58:40 +1000 (AEST)
Date: Wed, 30 Sep 2015 15:58:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20150930055858.GD23574@voom>
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JwB53PgKC5A7+0Ej"
Content-Disposition: inline
In-Reply-To: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2401:3900:2:1::2
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH 00/10][TRIVIAL] Define
 categories for some PPC devices
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
X-List-Received-Date: Wed, 30 Sep 2015 05:58:49 -0000


--JwB53PgKC5A7+0Ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2015 at 06:22:02PM +0200, Laurent Vivier wrote:
> Some PPC devices appear uncategorized in the output of
> "-device ?". This series tries to categorize some of
> them.

These all look good to me.

I've merged them to a new 'ppc-next' staging branch at
git://github.com/dgibson/qemu.git

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JwB53PgKC5A7+0Ej
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWC3ohAAoJEGw4ysog2bOSM2MP+wcMyuV5xx3t31a2V6cPt1p7
/ce2cV6hm0dxSqpv3iZppzrC7pxjQQ/KzsYZ9vmIo51pOEZoptsazXNA0xGtf4M5
9RQ+i4/nSCxTAWn9IjaL7/XZSZCP/Fi5PBCS7hsvG7QPBrxCReOSWGbYsJ1FDB2a
dgXf8Zz3L0yXr7RnOzXWe15o9hCAD74qxuvX2yCMKvhENlI7ch+AkLXEJm5/If6k
BqeAIoigIVM9IlmfQORpvBHkB2F02TXvm8X0QV/Qg18kevZOMZyphsqcoAgvKKAn
UdrDSPYOq2eQpwLJv1cGSBA2EoAgblXJPxWdRpv0Hj2jBvh0q7AdmoLUtxgiIh/K
PcfuVmXrlIsUWQJJrjCICqC3oDyckDuornv/B/DzM/xGlBXevnvZNeG0ZM3Yl9PX
/+3SdaRqIfVnNap/b0mJRuLGGHMq7/MTuANnTWAqf+ZjNIwoUFjeKq8ova0NZPz4
ggAesAcYurtddZTo9fHAxY4TFQPyeXcr5iMaODZ48CR7BtEc2DbOmTYRYKwuCbCH
eDUqqFoxnPHKloejnvsI+iA8Qgdf6bUoHxGlUUaQm5j1fD4eNrccMDCGFRBiUwUf
ea23Tq5VA35Pc/0CbuX0IuCxWH/gQPML+hJEeFNyGXJ3ikrwDtW7rr8d4xuQY4HL
FbePJDVcsPvwUdYtsf3D
=xQDj
-----END PGP SIGNATURE-----

--JwB53PgKC5A7+0Ej--

