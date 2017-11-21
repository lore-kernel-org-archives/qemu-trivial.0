Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eH7V3-0001G6-Oh
	for mharc-qemu-trivial@gnu.org; Tue, 21 Nov 2017 07:18:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eH7Ux-0001BP-HK
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 07:17:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eH7Uw-0005Ga-Iy
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 07:17:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33038)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eH7Ur-0005Fn-ON; Tue, 21 Nov 2017 07:17:49 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8391C0587E0;
	Tue, 21 Nov 2017 12:17:48 +0000 (UTC)
Received: from [10.10.121.42] (ovpn-121-42.rdu2.redhat.com [10.10.121.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 522145C552;
	Tue, 21 Nov 2017 12:17:43 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>, Fam Zheng <famz@redhat.com>
References: <20171121095510.29436-1-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <db0b9556-1758-874d-0194-2b77f09173f0@redhat.com>
Date: Tue, 21 Nov 2017 06:17:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171121095510.29436-1-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="4m3jWwWQUUJO6jc2hV4WuKIdpA5VQkG97"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 21 Nov 2017 12:17:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 for-2.11] Makefile: use $(MAKE)
 variable
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
X-List-Received-Date: Tue, 21 Nov 2017 12:17:59 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4m3jWwWQUUJO6jc2hV4WuKIdpA5VQkG97
Content-Type: multipart/mixed; boundary="WrcXid7dr6Q9XNG1OlkkVxngEuMH8wRWj";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, Fam Zheng <famz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <db0b9556-1758-874d-0194-2b77f09173f0@redhat.com>
Subject: Re: [PATCH v2 for-2.11] Makefile: use $(MAKE) variable
References: <20171121095510.29436-1-f4bug@amsat.org>
In-Reply-To: <20171121095510.29436-1-f4bug@amsat.org>

--WrcXid7dr6Q9XNG1OlkkVxngEuMH8wRWj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/21/2017 03:55 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> For some systems (i.e. FreeBSD) the default 'make' is not compatible wi=
th the
> GNU extensions used by QEMU makefiles.
>=20
> Calling the GNU make (gmake) works, however the help displayed refers t=
o the
> host 'make' and copy/paste leads to lot of unobvious errors:
>=20

>=20
> Using the $(MAKE) variable, the help displayed is consistent with the '=
make'
> program used.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2: dropped inconsistent replace in comment (Fam's review)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--WrcXid7dr6Q9XNG1OlkkVxngEuMH8wRWj--

--4m3jWwWQUUJO6jc2hV4WuKIdpA5VQkG97
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAloUGWUACgkQp6FrSiUn
Q2pz+Af/a7i/b69T+bHyDAV+ouooJrrSk1FhaVelO8nUxsDDL55V+rgQ3Oo4/FW6
GJLvup0cKNzURev3uurve5FfE/7uEgbcVvw70ZAzjkkqVg6WZFEMMg625QZTyGXI
ilqcjwCIGSPJSv4J+pqAAoYPoR2N+AivHx6afK+PxTJyDcJlQxrK/KbmOKExy8+6
wrXMRgXMLpJsbjLQuZcoRN+bCXBH7+6j6ka1/AZyJ5GMOJ9tg0NjmwXcqP2aH8vp
JamQl8Z2warq5+gOLtnvrD3VkdOFGh+WdN7ViqS8CeqLx2WZAH+ZIDbEiu5QviZM
dV7bVtsYcQbcXBqwNWWHMakKZAj0nw==
=Szwg
-----END PGP SIGNATURE-----

--4m3jWwWQUUJO6jc2hV4WuKIdpA5VQkG97--

