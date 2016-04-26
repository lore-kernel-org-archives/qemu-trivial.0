Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ausLo-0003aU-Qv
	for mharc-qemu-trivial@gnu.org; Mon, 25 Apr 2016 22:03:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ausLl-0003Sn-VC
	for qemu-trivial@nongnu.org; Mon, 25 Apr 2016 22:03:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ausLi-0003P3-PW
	for qemu-trivial@nongnu.org; Mon, 25 Apr 2016 22:03:41 -0400
Received: from ozlabs.org ([103.22.144.67]:44067)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ausLi-0003Ol-F1
	for qemu-trivial@nongnu.org; Mon, 25 Apr 2016 22:03:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3qv5wh2Bqsz9t6s; Tue, 26 Apr 2016 12:03:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1461636212;
	bh=SDFvECckm+cgkebJE5eaC7BMLEKDLFb9yWzaCLqmnpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYS9eU+Qt4BkeI/JLXtZYBlIR+QW4mDdDZqlJcrJFR/FhfLQz9uuc4a4Y9kW0cVao
	ZV2xcAg1+LggbMrGB1DIQx7d99nLKbGc5Ba0pzpEvmZ+A1a8sj4yCQ4BQ6NOBJa6bN
	L6xj2hgCoqNPlIC2OxjXH8fbU8QakymrENEKU1HI=
Date: Tue, 26 Apr 2016 12:02:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Zhou Jie <zhoujie2011@cn.fujitsu.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20160426020230.GH15176@voom.fritz.box>
References: <1461598566-28454-1-git-send-email-zhoujie2011@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFBW6CQlri5Qm8JQ"
Content-Disposition: inline
In-Reply-To: <1461598566-28454-1-git-send-email-zhoujie2011@cn.fujitsu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH] Added negative check for get_image_size()
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
X-List-Received-Date: Tue, 26 Apr 2016 02:03:43 -0000


--nFBW6CQlri5Qm8JQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2016 at 11:36:06AM -0400, Zhou Jie wrote:
> This patch adds check for negative return value from get_image_size(),
> where it is missing. It avoids unnecessary two function calls.
>=20
> Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>

Applied to ppc-for-2.7, thanks.

> ---
>  hw/ppc/spapr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index feaab08..ccea633 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1842,6 +1842,10 @@ static void ppc_spapr_init(MachineState *machine)
>          exit(1);
>      }
>      spapr->rtas_size =3D get_image_size(filename);
> +    if (spapr->rtas_size < 0) {
> +        error_report("Could not get size of LPAR rtas '%s'", filename);
> +        exit(1);
> +    }
>      spapr->rtas_blob =3D g_malloc(spapr->rtas_size);
>      if (load_image_size(filename, spapr->rtas_blob, spapr->rtas_size) < =
0) {
>          error_report("Could not load LPAR rtas '%s'", filename);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nFBW6CQlri5Qm8JQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXHsw2AAoJEGw4ysog2bOS7xMP/jTnj1ApBTpEMAL4VSvuqTLM
Fh6TLQm02PgxXmXVaL6PNc99uZ6xAbOApJV919zc73w8T6UlMY0XlXx8UF8TuIGs
YR1l2xzBWjl/MqatME734//+yiCnns52KX+Qv5uQ8SY3Y3OxgwtSJmB9nWpWI//I
HGI/6Posm2MzZb53l5HaVbOUMzb66c+x6Fk0QjCa9X1REhELe6REg4ng0c555BB6
TNxJAjRzqS30qCibmyfy3YfSFQRV9qMlI/fbhgRAvb3xig7/GVshgOtQ0waq1H7O
m6+5EPSkJ6jDDPq74Vy8VvnDCW/rjNPjUqp3NVuOdt8uLKd5d235PApcOUiIfzkr
kndXcUY84wdR3IP8IYU1DOXhzpWavU34Ur7hK/CzQhw4aD1qxNGIPlzaKqo1clwu
CyFkBLFUZqHTJZpx0zEcRliNGPmctAIVrP8DbH51QiFy6UYG5vWEhDIsuQ3WMTVg
LQQyoLUDlXDxirufKNmOEXUzIOQ/j3/sn3gdcYlk/MdPHzymZ1CKis/TIwly2YJc
K9pUbJOi4crAL3qSLIF8C0K27hlum0+D7SmL6FX+ehIX2vzRMA9gW5yCNFZ9d5w/
4Ht5v/8PubmUgFmtvST2ZWzmeeo/T8tovZ6R84BFXgb2BEotdmSWNRpWslwejwQQ
XU+6Rvg1thFZJUugVWoP
=v+4P
-----END PGP SIGNATURE-----

--nFBW6CQlri5Qm8JQ--

