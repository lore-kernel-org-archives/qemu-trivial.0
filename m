Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUaCg-0006IT-5W
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 08:53:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZUaCe-0006Fp-0G
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 08:53:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZUaCd-0002n2-0e
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 08:53:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48118)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZUaCY-0002kn-5d; Wed, 26 Aug 2015 08:53:14 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id C1BAE550D7;
	Wed, 26 Aug 2015 12:53:13 +0000 (UTC)
Received: from [10.3.113.77] (ovpn-113-77.phx2.redhat.com [10.3.113.77])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QCrCWp016803; Wed, 26 Aug 2015 08:53:13 -0400
To: Markus Armbruster <armbru@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
	<1440587838-25595-8-git-send-email-berrange@redhat.com>
	<87lhcyp89e.fsf@blackfin.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
X-Enigmail-Draft-Status: N1110
Organization: Red Hat, Inc.
Message-ID: <55DDB6B1.2060104@redhat.com>
Date: Wed, 26 Aug 2015 06:53:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87lhcyp89e.fsf@blackfin.pond.sub.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="21xBKOEVquec1iSCUcHsOgoL4D4FU0gGo"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 7/7] maint: avoid useless
 "if (foo) free(foo)" pattern
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
X-List-Received-Date: Wed, 26 Aug 2015 12:53:21 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--21xBKOEVquec1iSCUcHsOgoL4D4FU0gGo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/26/2015 06:02 AM, Markus Armbruster wrote:
> "Daniel P. Berrange" <berrange@redhat.com> writes:
>=20
>> The free() and g_free() functions both happily accept
>> NULL on any platform QEMU builds on.
>=20
> Do systems where free(NULL) doesn't work even exist?  Even C89
> guarantees it does nothing.

Solaris 4 was the last (pre-C89) system I am aware of that didn't like
free(NULL).  Ancient history nowadays.

>=20
> My Coccinelle semantic patch finds a few more, because it also fixes up=

> the equally pointless conditional
>=20
>     if (foo) {
>         free(foo);
>         foo =3D NULL;
>     }

The assignment to foo is not pointless, but removing the conditional is
indeed nice.  gnulib's perl script is a lot weaker than coccinelle,
obviously :)

>=20
> @@
> expression E;
> @@
> -	if (E !=3D NULL) {
> -	    g_free(E);
> -           E =3D NULL;
> -	}
> +       g_free(E);
> +       E =3D NULL;

This only checks for g_free() before assignment to NULL; are there any
uses of raw free() that do the same?

> Result (feel free to squash it into your patch):
>=20

Whether squashed in or separate, these additional changes and the
original patch are:
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--21xBKOEVquec1iSCUcHsOgoL4D4FU0gGo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJV3baxAAoJEKeha0olJ0Nq7mUIALATFKayKePoaKCJ7BmLm0qV
28G6YFRHpz9BpTktp8xwv/byZRsn0X/hZIylit7ory4Fm8RdJQAugFiM+MOH1fqa
3aomPuZZrCYAGGJQPi9g21fFU6r+aAHSyrZWTDrj6MQD7Z4UYMUDhRWhO9hbAPtB
ubX9FSWj5TOlCcKGEtO+3gQ8HjR7YIODpLS7LjsV1/JoJXGq89vH8lp6huw7Gmau
kwyduHvIU/WnitD6BmMZORM726H/XaHiK5MHz0SBedZdLV5xul3OXom0TWzF0sVt
1rLcTM5bDssVmgC4lmnXiXDkl4ut/jyaGyWzoxAKXGnWbnVECno249SziB/PSjI=
=Ln6v
-----END PGP SIGNATURE-----

--21xBKOEVquec1iSCUcHsOgoL4D4FU0gGo--

