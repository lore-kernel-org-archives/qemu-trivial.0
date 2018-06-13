Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT5sB-0004iI-4E
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 09:31:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT5s9-0004hC-47
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 09:31:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT5s3-00032b-Go
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 09:31:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49896 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fT5ru-0002bA-LA; Wed, 13 Jun 2018 09:31:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88110D4338;
	Wed, 13 Jun 2018 13:31:21 +0000 (UTC)
Received: from localhost (ovpn-117-110.ams2.redhat.com [10.36.117.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF67C2026609;
	Wed, 13 Jun 2018 13:31:20 +0000 (UTC)
Date: Wed, 13 Jun 2018 14:31:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>, John Snow <jsnow@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Message-ID: <20180613133119.GJ24528@stefanha-x1.localdomain>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEkEgRdBLZYkpbX2"
Content-Disposition: inline
In-Reply-To: <20180611141716.3813-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 13:31:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 13:31:21 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v2] CODING_STYLE: Define our preferred
 form for multiline comments
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
X-List-Received-Date: Wed, 13 Jun 2018 13:31:38 -0000


--PEkEgRdBLZYkpbX2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 11, 2018 at 03:17:16PM +0100, Peter Maydell wrote:
> The codebase has a bit of a mix of different multiline
> comment styles. State a preference for the Linux kernel
> style:
>     /*
>      * Star on the left for each line.
>      * Leading slash-star and trailing star-slash
>      * each go on a line of their own.
>      */
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is not my personal favourite, but seemed to be the
> closest we had to consensus in the mail thread for v1;
> I can live with it in order to avoid getting patches which
> use the styles I like even less :-)
> ---
>  CODING_STYLE | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--PEkEgRdBLZYkpbX2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbIRynAAoJEJykq7OBq3PIgkgIAKBe3mYlriWgnIEYwKg6B9vy
vrp7oFz3YLD8bresoacaJpNfpUu+y0B3VoehPFIMaK2I3B7IhGJPaGvAp84g4VWp
bpRoCKx8prLQyJ8lyDu5pdsKNGRqGdd8PBhj3frg66KPGWKlgNA2lSTWPN5gbWVG
DrfCiPisJuCrd3HYpLdNLo5qwofSOX8wVRmkDC6RW/JAoYbueuYxlkq2Uc1tp4sR
Y997OthLHCBec4PrTj12P1RgEV0MgdeQhml0eUEiuF8/VqP5LZynnwquR0GbiN7t
idi/OhbrhGL1NaSMRs1yTDIxamfLhOPu/L8i+NO7Pco8ehV3pBQjFKfPo51VnB4=
=hDWu
-----END PGP SIGNATURE-----

--PEkEgRdBLZYkpbX2--

