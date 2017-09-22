Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvUWi-0007iS-ER
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 16:26:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dvUWg-0007aa-8O
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:26:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dvUWf-00058A-5p
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:26:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41384)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dvUWZ-00055W-P2; Fri, 22 Sep 2017 16:26:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1FCBD7123;
	Fri, 22 Sep 2017 20:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B1FCBD7123
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.124.97] (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7117660BE1;
	Fri, 22 Sep 2017 20:26:06 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Gerd Hoffmann <kraxel@redhat.com>, "Emilio G . Cota" <cota@braap.org>
References: <20170922161345.331-1-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <cae93aba-ca97-1d21-354d-aab209ce05cd@redhat.com>
Date: Fri, 22 Sep 2017 15:26:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170922161345.331-1-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="QKpr6CPG6jWFjxP1jTLmd8I0f0PTlWhSV"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 22 Sep 2017 20:26:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] scripts/orderfile: keep MAINTAINERS at
 bottom
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
X-List-Received-Date: Fri, 22 Sep 2017 20:26:19 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QKpr6CPG6jWFjxP1jTLmd8I0f0PTlWhSV
Content-Type: multipart/mixed; boundary="d0iW7vTJTBJ9lqnEMnjVjavdK9nFVvkhB";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Emilio G . Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <cae93aba-ca97-1d21-354d-aab209ce05cd@redhat.com>
Subject: Re: [PATCH] scripts/orderfile: keep MAINTAINERS at bottom
References: <20170922161345.331-1-f4bug@amsat.org>
In-Reply-To: <20170922161345.331-1-f4bug@amsat.org>

--d0iW7vTJTBJ9lqnEMnjVjavdK9nFVvkhB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/22/2017 11:13 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  scripts/git.orderfile | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index ac699700b1..34619769c2 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -27,3 +27,4 @@ Makefile*
>  # code
>  *.c
> =20
> +MAINTAINERS

Well, after any file that matches above, but before any file that
doesn't match any pattern, so not strictly the end.

But why not earlier with the build system?  Generally, if you are going
to add a file, you are going to also tweak a Makefile to get it to build
- at which point, a MAINTAINERS tweak feels more on par with a Makefile
tweak.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--d0iW7vTJTBJ9lqnEMnjVjavdK9nFVvkhB--

--QKpr6CPG6jWFjxP1jTLmd8I0f0PTlWhSV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlnFcd0ACgkQp6FrSiUn
Q2o6ywf7BAl5P9hknD37LOzo/t8F50TF1Ov7kzbdLSCEQpiN7IueJbg79m1b5qEf
aAU2/6beqmK5Ay/5bAoDmmIbuoqr91vh0+Tlf1bJVjD8JGq1Z8hcLnbUhFqJOPvT
XzkHSRlbtWOAcd75AKAQ93i8UHwSdXxlMIJdi4larVZ32t48MEWW9JaJ1pGlYHd2
8OQRKBRutgD/96AcqdjGOYHU+8BqvJ4UNDAJz6o8cvI1E4gwd8jnaOrQe1gZOWSJ
/OV987skPZr4Zm6gl+fpILLqAx3Us7w/eI/ettVoIEjRbiRQ8q5y+qpCXvAM29Na
JwWrpFMsdp21o9yXIyCke3gvvZvY8g==
=ZMy2
-----END PGP SIGNATURE-----

--QKpr6CPG6jWFjxP1jTLmd8I0f0PTlWhSV--

