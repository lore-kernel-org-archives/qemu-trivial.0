Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cnqUQ-0000h1-Ul
	for mharc-qemu-trivial@gnu.org; Tue, 14 Mar 2017 13:44:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cnqUP-0000fy-12
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 13:44:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cnqUN-0008BM-Q4
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 13:44:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51578)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cnqUJ-0008AK-9A; Tue, 14 Mar 2017 13:43:59 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A76685547;
	Tue, 14 Mar 2017 17:43:59 +0000 (UTC)
Received: from [10.10.121.52] (ovpn-121-52.rdu2.redhat.com [10.10.121.52] (may
	be forged))
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v2EHhvR6016366; Tue, 14 Mar 2017 13:43:58 -0400
To: Andreas Grapentin <andreas@grapentin.org>, qemu-devel@nongnu.org
References: <20170314165953.18506-1-andreas@grapentin.org>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <ddea3a8a-715e-c24d-e434-3fa55f5d81b2@redhat.com>
Date: Tue, 14 Mar 2017 12:43:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170314165953.18506-1-andreas@grapentin.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="B1Fs9ph5tptvXwmKHoei2nsCKHsc8XJGA"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 14 Mar 2017 17:43:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] use _Static_assert in
 QEMU_BUILD_BUG_ON
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
X-List-Received-Date: Tue, 14 Mar 2017 17:44:06 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--B1Fs9ph5tptvXwmKHoei2nsCKHsc8XJGA
Content-Type: multipart/mixed; boundary="HL8lBm8cdfrnhf8UdF36ilvigx0FFth0m";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Andreas Grapentin <andreas@grapentin.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <ddea3a8a-715e-c24d-e434-3fa55f5d81b2@redhat.com>
Subject: Re: [PATCH v2] use _Static_assert in QEMU_BUILD_BUG_ON
References: <20170314165953.18506-1-andreas@grapentin.org>
In-Reply-To: <20170314165953.18506-1-andreas@grapentin.org>

--HL8lBm8cdfrnhf8UdF36ilvigx0FFth0m
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/14/2017 11:59 AM, Andreas Grapentin wrote:
> QEMU_BUILD_BUG_ON should use C11's _Static_assert, if the compiler supp=
orts it,
> to provide more readable messages on failure.

>=20
> with _Static_assert:
>=20
>> In file included from /qemu/include/qemu/osdep.h:36:0,
>>                  from /qemu/qga/commands.c:13:
>> /qemu/qga/commands.c: In function =E2=80=98qmp_guest_exec_status=E2=80=
=99:
>> /qemu/include/qemu/compiler.h:94:30: error: static assertion failed: "=
not expecting: sizeof(*&gei->finished) > sizeof(void *)"
>>  #define QEMU_BUILD_BUG_ON(x) _Static_assert((x), #x)

Manual copy-and-paste? Because this is missing the ! present in the
actual definition...

>>                               ^
>> /qemu/include/qemu/atomic.h:146:5: note: in expansion of macro =E2=80=98=
QEMU_BUILD_BUG_ON=E2=80=99
>>      QEMU_BUILD_BUG_ON(sizeof(*ptr) > sizeof(void *));   \
>>      ^~~~~~~~~~~~~~~~~
>> /qemu/include/qemu/atomic.h:417:5: note: in expansion of macro =E2=80=98=
atomic_load_acquire=E2=80=99
>>      atomic_load_acquire(ptr)
>>      ^~~~~~~~~~~~~~~~~~~
>> /qemu/qga/commands.c:160:21: note: in expansion of macro =E2=80=98atom=
ic_mb_read=E2=80=99
>>      bool finished =3D atomic_mb_read(&gei->finished);
>>                      ^~~~~~~~~~~~~~
>=20
> Signed-off-by: Andreas Grapentin <andreas@grapentin.org>
> ---

> +++ b/include/qemu/compiler.h
> @@ -90,7 +90,9 @@
>          int:(x) ? -1 : 1; \
>      }
> =20
> -#ifdef __COUNTER__
> +#if defined(CONFIG_STATIC_ASSERT)
> +#define QEMU_BUILD_BUG_ON(x) _Static_assert(!(x), "not expecting: " #x=
)

=2E..here.

But that's trivial, if the maintainer would like to correct the commit
message.

Reviewed-by: Eric Blake <eblake@redhat.com>


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--HL8lBm8cdfrnhf8UdF36ilvigx0FFth0m--

--B1Fs9ph5tptvXwmKHoei2nsCKHsc8XJGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYyCvcAAoJEKeha0olJ0Nqh7gIAI5G2pOR6l50FZhm6zlN2JVX
9m4MjgZvekmbpy2SZPFvTUbPmuln5swuassj/9wy5M+W/00ZJsdyNMmH8AKFuUeu
4za/PCT8g0CxWybaRLhB4aLGXaGErqx/VEXC9ITzR/1rErx3+mWks/I0IjTh+8Ig
Jd+RZ5vMGSmY1RXxi65DEG0TRPRafovVWNlXwFuy9i4EDlXQLBykSTpwzujQjaSb
tgALEHQ7QYdY07NdzTiZBm0WLxdmexRUljHCGyGjZRqEfYk2dtY07eMduTE2tm5S
VJvMKLoTiNAFMzaHkvipDDTRZUWv6PJvTfQSwwppmISCdvgAoMfzNJ3FLuOrolk=
=/QZm
-----END PGP SIGNATURE-----

--B1Fs9ph5tptvXwmKHoei2nsCKHsc8XJGA--

