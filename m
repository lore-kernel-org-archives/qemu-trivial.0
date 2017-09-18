Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1du4kP-0005pK-Ny
	for mharc-qemu-trivial@gnu.org; Mon, 18 Sep 2017 18:42:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1du4kN-0005nQ-D3
	for qemu-trivial@nongnu.org; Mon, 18 Sep 2017 18:42:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1du4kM-0003UO-Gx
	for qemu-trivial@nongnu.org; Mon, 18 Sep 2017 18:42:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43768)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1du4kF-0003RH-S1; Mon, 18 Sep 2017 18:42:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF944883B8;
	Mon, 18 Sep 2017 22:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BF944883B8
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.124.97] (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B53A5C880;
	Mon, 18 Sep 2017 22:42:25 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
References: <20170918214649.17550-1-eblake@redhat.com>
	<dfe4dc28-4011-e7a7-aa1f-54e340f091d2@amsat.org>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:Network Block Dev..." <qemu-block@nongnu.org>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <53ea39b4-7926-d29b-fb28-3f2295dc394d@redhat.com>
Date: Mon, 18 Sep 2017 17:42:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <dfe4dc28-4011-e7a7-aa1f-54e340f091d2@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="4Eh3EOPhaqWlCGewO0wwru9vwWILP27lJ"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 18 Sep 2017 22:42:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] nbd-client: Use correct macro
 parenthesization
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
X-List-Received-Date: Mon, 18 Sep 2017 22:42:36 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4Eh3EOPhaqWlCGewO0wwru9vwWILP27lJ
Content-Type: multipart/mixed; boundary="IcoBes5UT5IwaLf4kQ5dM9JrSOITsoRE5";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Message-ID: <53ea39b4-7926-d29b-fb28-3f2295dc394d@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] nbd-client: Use correct macro
 parenthesization
References: <20170918214649.17550-1-eblake@redhat.com>
 <dfe4dc28-4011-e7a7-aa1f-54e340f091d2@amsat.org>
In-Reply-To: <dfe4dc28-4011-e7a7-aa1f-54e340f091d2@amsat.org>

--IcoBes5UT5IwaLf4kQ5dM9JrSOITsoRE5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/18/2017 05:13 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Eric,
>=20
> On 09/18/2017 06:46 PM, Eric Blake wrote:
>> If 'bs' is a complex expression, we were only casting the front half
>> rather than the full expression.=C2=A0 Luckily, none of the callers we=
re
>> passing bad arguments, but it's better to be robust up front.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> Any magic cocci script to verify there aren't no more?

I don't know if cocci can do it; checkpatch tries to check whether macro
arguments are parenthesized, but even that's prone to missing things.  I
just spotted this particular one while reviewing a related patch.


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--IcoBes5UT5IwaLf4kQ5dM9JrSOITsoRE5--

--4Eh3EOPhaqWlCGewO0wwru9vwWILP27lJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlnAS9AACgkQp6FrSiUn
Q2qFxAf/Q1ah6f0PV8Uw3EdDiquMLz2JkJmPyNuS7nERrbtFptfNieRg45YlQxSK
l51mFEbzDEXiAA7irm+lEDp4JSLc9kgNm+QmgPA4Oyci4DKS3pXUJX73eLjab+wb
+wGUW4eWLLV5haf2CzurXxlB5L0oP0pvIKMX+fHgHR1a2nXC5gc6skP8Xb2q5uSs
hcYIGSsPZ9S/3otEPFH/TQLqWCh1gqFaV7yZDz+UOIuXQy9aI52Ka5dS9iL6DviL
tu8nrji8lfrf3b64IIZzRUCo4i4C/RpqPd03eFwdF8XTF41X27re6fJ9Qojcjz1F
wSo/3GiA9ZT8OSvgHLjWR1BFhjMC3A==
=S7lL
-----END PGP SIGNATURE-----

--4Eh3EOPhaqWlCGewO0wwru9vwWILP27lJ--

