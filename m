Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VbUwy-0001Nt-VO
	for mharc-qemu-trivial@gnu.org; Wed, 30 Oct 2013 08:32:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VbUws-0001Nk-HV
	for qemu-trivial@nongnu.org; Wed, 30 Oct 2013 08:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VbUwn-0007NH-K3
	for qemu-trivial@nongnu.org; Wed, 30 Oct 2013 08:32:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1VbUwn-0007ND-Ax; Wed, 30 Oct 2013 08:32:29 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9UCWQmv027618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 30 Oct 2013 08:32:26 -0400
Received: from [10.3.113.57] (ovpn-113-57.phx2.redhat.com [10.3.113.57])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9UCWJlD020598; Wed, 30 Oct 2013 08:32:20 -0400
Message-ID: <5270FC53.5060002@redhat.com>
Date: Wed, 30 Oct 2013 06:32:19 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Amos Kong <kongjianjun@gmail.com>, Amos Kong <akong@redhat.com>
References: <1383115965-22360-1-git-send-email-akong@redhat.com>
	<CAFeW=pYtDWzZo8CRtp_CzJFAtt4_ycZRG-45i+agEM6uz-4R=g@mail.gmail.com>
In-Reply-To: <CAFeW=pYtDWzZo8CRtp_CzJFAtt4_ycZRG-45i+agEM6uz-4R=g@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="t9esTTvJkQ5aTKGr0cUGBMowkwGU4Hx4h"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] move BlockdevRef definition
 before using it
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
X-List-Received-Date: Wed, 30 Oct 2013 12:32:39 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--t9esTTvJkQ5aTKGr0cUGBMowkwGU4Hx4h
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/30/2013 01:04 AM, Amos Kong wrote:
> On Wed, Oct 30, 2013 at 2:52 PM, Amos Kong <akong@redhat.com> wrote:
>>
>> From: Amos Kong <kongjianjun@gmail.com>
>>
>> @BlockdevRef is used in @BlockdevOptionsGenericFormat and
>> @BlockdevOptionsGenericCOWFormat.
>=20
> NACK this patch.
>=20
> @BlockdevOptions is used in @BlockdevRef, this change is meaningless.

Furthermore, qapi allows circular recursive types, so we can't do full
topological sorting (the generator handles a reference to a type before
its declaration just fine, as long as all names encountered in the file
can be resolved at the time the complete file has been parsed).

If anything, I think that alphabetical ordering _might_ make it easier
to find types, instead of the current ad hoc ordering.  Also, at one
point there was a patch proposed to allow file inclusion, where you
could break out related types/commands into a secondary file rather than
cramming everything into qapi-schema.json, but I don't know if that's
worth reviving.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--t9esTTvJkQ5aTKGr0cUGBMowkwGU4Hx4h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJScPxTAAoJEKeha0olJ0Nq6WgH/1SK7UwxC5Z7JGojkVp1yUUF
Tvya71a6blzWONH1Aif7VaAiWh2Bxx/DIrUynnqJPklch+kXvA6qxNYlPj0ZkcEF
3ARRsfrUOjTBXOoxHNngQKmLplpmx9knF11EtiAV1i3s1BnGS6px78s2cH/b0QxP
CwHAMvHLcgcf5sQTpfB6y+2xpNH/+4FUm6+E7EsDTBJGpWp4YgU9wmHH5KNtGA5P
mVoCHmHrlSBs4mF9qhYojgR2e0KZCxDk4pAezPOGF0Pm/rdCqgsjxXs18Tl1u7ju
2skkEjITVnaZfET8iNQUaVwau7O1Sq8Ki5VySUP3JPL4XrdpoWxiv1hoZcTZ5SU=
=CQB1
-----END PGP SIGNATURE-----

--t9esTTvJkQ5aTKGr0cUGBMowkwGU4Hx4h--

