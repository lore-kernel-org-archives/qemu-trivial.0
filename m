Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eLt1u-0001x8-1C
	for mharc-qemu-trivial@gnu.org; Mon, 04 Dec 2017 10:51:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1eLt1s-0001wJ-Hy
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 10:51:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1eLt1n-0004pO-3g
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 10:51:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1eLt1e-0004lo-9Z; Mon, 04 Dec 2017 10:51:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 409A681DF5;
	Mon,  4 Dec 2017 15:51:21 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-178.brq.redhat.com
	[10.40.204.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00DEC6F456;
	Mon,  4 Dec 2017 15:51:19 +0000 (UTC)
To: Shravan Rajinikanth <shravan2x@utexas.edu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Qemu-block <qemu-block@nongnu.org>
References: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <fa45711a-9203-423f-b9a9-e2006847f6f4@redhat.com>
Date: Mon, 4 Dec 2017 16:51:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="S7uETFX67lh9cVKxsGN7PexPPPBeCU3W4"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 04 Dec 2017 15:51:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-img: Fixed grammatical
 error in dump_human_image_check
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
X-List-Received-Date: Mon, 04 Dec 2017 15:51:37 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--S7uETFX67lh9cVKxsGN7PexPPPBeCU3W4
Content-Type: multipart/mixed; boundary="vToFEXbENmoSSR62gOXWF9dBOIHWKe6bS";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Shravan Rajinikanth <shravan2x@utexas.edu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Qemu-block <qemu-block@nongnu.org>
Message-ID: <fa45711a-9203-423f-b9a9-e2006847f6f4@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qemu-img: Fixed grammatical error in
 dump_human_image_check
References: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
In-Reply-To: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>

--vToFEXbENmoSSR62gOXWF9dBOIHWKe6bS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2017-12-02 23:37, Shravan Rajinikanth wrote:
> Signed-off-by: Shravan Rajinikanth <shravan2x@utexas.edu>
> ---
>  qemu-img.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/qemu-img.c b/qemu-img.c
> index 68b375f..bea9268 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -580,7 +580,7 @@ static void dump_human_image_check(ImageCheck *chec=
k, bool quiet)
>          if (check->leaks) {
>              qprintf(quiet,
>                      "\n%" PRId64 " leaked clusters were found on the i=
mage.\n"
> -                    "This means waste of disk space, but no harm to da=
ta.\n",
> +                    "This means disk space is wasted, but data is safe=
=2E\n",
>                      check->leaks);
>          }

How exactly is this a grammatical error?  (I'm not a native English
speaker, but it always seemed perfectly OK to me)

Max


--vToFEXbENmoSSR62gOXWF9dBOIHWKe6bS--

--S7uETFX67lh9cVKxsGN7PexPPPBeCU3W4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFGBAEBCAAwFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlolbvYSHG1yZWl0ekBy
ZWRoYXQuY29tAAoJEPQH2wBh1c9AiKkH/24nN0RnTDKLE98nMoIdfEqASjqxU8QF
mfXsyJqht+s/AM4GyEw4xv10YZAcUzB6wWAcYmlLKV+zU/LUdSG6P1amp8eJV50X
3fTyEUPzpGaEszd+xHmmPgv326phQjKy5cJMWG7IMf9eR+z6kUMW3GS+ULjG2oaU
cokXFLqNXa8n8SW+emxBM8P2e6rYpHRRV4gsUKTmMGZ9ku0NkwCQJ+xmdFFThKjD
pkAqR8aJ/iVGSkgMsX8s5QrEOxqbtCWYP2Z40LjUbPZ7ZEkJjd0gFMt16CT06459
a4DM+4WakBZT/quKg3vyZISAlcB859IV1sxI0nmjCcF2/NRfzUsK8cA=
=lc/h
-----END PGP SIGNATURE-----

--S7uETFX67lh9cVKxsGN7PexPPPBeCU3W4--

