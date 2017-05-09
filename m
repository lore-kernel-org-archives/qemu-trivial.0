Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7saA-0004tt-VX
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 20:00:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d7sa8-0004s6-6Z
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 20:00:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d7sa7-0002oB-3P
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 20:00:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d7sZw-0002k5-45; Mon, 08 May 2017 20:00:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4D28804EB;
	Tue,  9 May 2017 00:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C4D28804EB
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C4D28804EB
Received: from [10.10.122.86] (ovpn-122-86.rdu2.redhat.com [10.10.122.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0ACE0A2514;
	Tue,  9 May 2017 00:00:32 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-10-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <b0c4d068-3bc1-3611-df36-0f76b7717856@redhat.com>
Date: Mon, 8 May 2017 19:00:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170508233918.9043-10-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="AfEuGi6tvkB0KIo7Pd10DDoeMDpb3qlsX"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 09 May 2017 00:00:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 09/11] target/sparc: fix
 DEBUG_MMU DPRINTF() arguments
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
X-List-Received-Date: Tue, 09 May 2017 00:00:49 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AfEuGi6tvkB0KIo7Pd10DDoeMDpb3qlsX
Content-Type: multipart/mixed; boundary="KCSumNVlJfVQhJbakpp4uuxRvJ7WO3bHD";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Message-ID: <b0c4d068-3bc1-3611-df36-0f76b7717856@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 09/11] target/sparc: fix DEBUG_MMU DPRINTF()
 arguments
References: <20170508233918.9043-1-f4bug@amsat.org>
 <20170508233918.9043-10-f4bug@amsat.org>
In-Reply-To: <20170508233918.9043-10-f4bug@amsat.org>

--KCSumNVlJfVQhJbakpp4uuxRvJ7WO3bHD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/08/2017 06:39 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> invalid since 96df2bc99f9
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/sparc/ldst_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
> index 57968d9143..aa83a49a88 100644
> --- a/target/sparc/ldst_helper.c
> +++ b/target/sparc/ldst_helper.c
> @@ -1631,7 +1631,7 @@ void helper_st_asi(CPUSPARCState *env, target_ulo=
ng addr, target_ulong val,
> =20
>              if (oldreg !=3D env->immu.mmuregs[reg]) {
>                  DPRINTF_MMU("immu change reg[%d]: 0x%016" PRIx64 " -> =
0x%016"
> -                            PRIx64 "\n", reg, oldreg, env->immuregs[re=
g]);
> +                            PRIx64 "\n", reg, oldreg, env->immu.mmureg=
s[reg]);

Please take this opportunity to fix the broken definitions of
DPRINTF_MMU() and friends so that they don't bit-rot when not defined.
There are plenty of other examples of re-writing broken #defines to
instead favor an if (0) { printf(...) } to benefit from -Wformat
checking even when the debugging is disabled.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--KCSumNVlJfVQhJbakpp4uuxRvJ7WO3bHD--

--AfEuGi6tvkB0KIo7Pd10DDoeMDpb3qlsX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZEQagAAoJEKeha0olJ0NqnzAH/AsbLvyJh98voTASJGEyPJOu
4Nk3ZvPf1EVdorBumNLfGEas3jPmE1XKeIwfMWpoUyZVXLBovhlyG6XT20n8iKLs
A8/rJKGODK2ZSBaFCCOrAr0ptOg2EiJdqY1D3k7Q7uCnYWNx+ngZPdIVYkCXv+NR
1/L16FsvSGpzslRu7Z2FMfzjm7pOqU/HXQyEbbUv+Qv0qxX+7oUMT4TWJUdZZbeJ
hlMtIiQAbVBMqjOo3KH4qxUYKXyD+I6tfuch20qKx4fL5MfuBhD7XdHEPhbABtQc
gsszn0lpntPkFwfQ58a8h22oT6D8TvQPW/GdDfkM77YrRl8gxC/BtG/q05uAJTs=
=JWC1
-----END PGP SIGNATURE-----

--AfEuGi6tvkB0KIo7Pd10DDoeMDpb3qlsX--

