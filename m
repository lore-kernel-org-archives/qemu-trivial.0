Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwwbn-0006wU-NG
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 16:37:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dwwbl-0006ul-7D
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 16:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dwwbk-0008Hs-7d
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 16:37:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dwwbd-0008EB-A3; Tue, 26 Sep 2017 16:37:25 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E07883F40;
	Tue, 26 Sep 2017 20:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5E07883F40
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.124.97] (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5C3268708;
	Tue, 26 Sep 2017 20:37:21 +0000 (UTC)
To: =?UTF-8?Q?Carlo_Marcelo_Arenas_Bel=c3=b3n?= <carenas@gmail.com>,
	qemu-devel@nongnu.org
References: <20170926202512.37670-1-carenas@gmail.com>
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <581bdcc9-6826-3fd9-f531-c37041cf34d1@redhat.com>
Date: Tue, 26 Sep 2017 15:37:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170926202512.37670-1-carenas@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="VVhE9VFSVK81iDHQ6KdORkUFwjWqBJ6dN"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 26 Sep 2017 20:37:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gitignore: ignore
 check-qlit test
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
X-List-Received-Date: Tue, 26 Sep 2017 20:37:34 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VVhE9VFSVK81iDHQ6KdORkUFwjWqBJ6dN
Content-Type: multipart/mixed; boundary="RXaREKTuj59o63evAro6okfJ77klwFIRu";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Carlo_Marcelo_Arenas_Bel=c3=b3n?= <carenas@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Message-ID: <581bdcc9-6826-3fd9-f531-c37041cf34d1@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] gitignore: ignore check-qlit test
References: <20170926202512.37670-1-carenas@gmail.com>
In-Reply-To: <20170926202512.37670-1-carenas@gmail.com>

--RXaREKTuj59o63evAro6okfJ77klwFIRu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/26/2017 03:25 PM, Carlo Marcelo Arenas Bel=C3=B3n wrote:

Worth mentioning in the commit message body that it was introduced in
commit 382176b4.

> Signed-off-by: Carlo Marcelo Arenas Bel=C3=B3n <carenas@gmail.com>
> ---
>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/tests/.gitignore b/tests/.gitignore
> index cf6d99c91e..53cb2efaee 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -6,6 +6,7 @@ check-qdict
>  check-qnum
>  check-qjson
>  check-qlist
> +check-qlit
>  check-qnull
>  check-qstring
>  check-qom-interface
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--RXaREKTuj59o63evAro6okfJ77klwFIRu--

--VVhE9VFSVK81iDHQ6KdORkUFwjWqBJ6dN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlnKuoAACgkQp6FrSiUn
Q2rhggf9E0EZDseAZbl3AC/aP/AMMNvnotG/t7QNPpzCDzpCGOtGj68ZAOSx9NOM
c7nSX0JctWZcIegKLjW2KNYSD4KUB+Z16ehLTFcl2j4G14nH6LiPtGimJtl6JVzb
rBiWn5q7hAv9AzjPlcxHhb2FTpG4lKKq6W8BqXCTlE78d0iwWR/ZpIi6YINEUqhm
zilbxWh1Oc5wDXP5XgPaSY4Y10opXY4pJBxC3oBPVH8VrQNYgMDencpfxPF7/cb9
QBXIj3WO5EU4mMpzbxYLasa7iHkVs+LG1tEW6NAznwlA+XSLvmpYSWYd/gdFKbB1
duJV5fmsDTQyNcWCNDkglCt4t+wY6w==
=uFUY
-----END PGP SIGNATURE-----

--VVhE9VFSVK81iDHQ6KdORkUFwjWqBJ6dN--

