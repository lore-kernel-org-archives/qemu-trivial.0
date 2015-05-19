Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yui1D-0000ju-2B
	for mharc-qemu-trivial@gnu.org; Tue, 19 May 2015 09:57:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yui17-0000d5-O5
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 09:57:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yui13-0006nO-Vb
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 09:57:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Yui0v-0006hA-Ia; Tue, 19 May 2015 09:56:57 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 949F02655;
	Tue, 19 May 2015 13:56:56 +0000 (UTC)
Received: from [10.3.113.128] (ovpn-113-128.phx2.redhat.com [10.3.113.128])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4JDutBG019244; Tue, 19 May 2015 09:56:55 -0400
Message-ID: <555B4127.4030700@redhat.com>
Date: Tue, 19 May 2015 07:56:55 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>,
	Martin Cerveny <M.Cerveny@computer.org>, qemu-devel@nongnu.org
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
	<1431519294-8873-2-git-send-email-M.Cerveny@computer.org>
	<555B31D9.2090806@suse.de>
In-Reply-To: <555B31D9.2090806@suse.de>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="AxPn34jUE8ls0hU7QkowFmdIla0xMtu4W"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] scripts: qom-*: add
	network syntax
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
X-List-Received-Date: Tue, 19 May 2015 13:57:13 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AxPn34jUE8ls0hU7QkowFmdIla0xMtu4W
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/19/2015 06:51 AM, Andreas F=C3=A4rber wrote:
> Am 13.05.2015 um 14:14 schrieb Martin Cerveny:
>> Add network syntax parsing (ip address, port) to qom-* scripts.
>>
>> Signed-off-by: Martin Cerveny <M.Cerveny@computer.org>
>> ---
>>  scripts/qmp/qom-fuse |   13 ++++++++++++-
>>  scripts/qmp/qom-get  |   12 +++++++++++-
>>  scripts/qmp/qom-list |   12 +++++++++++-
>>  scripts/qmp/qom-set  |   12 +++++++++++-
>>  scripts/qmp/qom-tree |   12 +++++++++++-
>>  5 files changed, 56 insertions(+), 5 deletions(-)
>=20
> Could some Python guru please take a look at this?

That disqualifies me (still a python newbie), but I still see something
questionable:

>> =20
>> -srv =3D QEMUMonitorProtocol(socket_path)
>> +connection =3D socket_path.split(':')
>> +if len(connection) =3D=3D 2:
>> +    try:
>> +         port =3D int(connection[1])
>> +    except ValueError:
>> +         raise QMPBadPort
>> +    connection =3D ( connection[0], port )

Won't that mishandle IPv6 connections, such as something like [::1]:8000
for connecting to port 8000 on localhost, since it splits into more than
2 pieces when splitting on :?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--AxPn34jUE8ls0hU7QkowFmdIla0xMtu4W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVW0EnAAoJEKeha0olJ0Nq87sH/3WNQ3gKEcggTz7XpDMNYYM/
nPiqvhH0KRFB+QE2e6DU7qoJAgwWSFGUTOtdd8Vdlt0IRY2OWpwgLO8w0FArNtRX
E9qd3vv1eAIZJUSacJrsV5r392xQ6xDlomp16SPxdNShqIJlNStt6lJhiRuhiOK1
6maYtULUUwzq2VE3FIqQyVCPdYB9v41n3C+eUoa1qbMkUoCdmX52StynQwWQIH31
J9frQEmK+IjYUuzCeLBuyV6GPCWFry9+M+bgZYhDCPvVd1C4WFPeHtJki5OTsk5a
Usm5xiIrH9NI3W+bqdwEQ9lIckfEpWCTYcMvTB+IDw/K7EtjRME4NxMXPWQBDHM=
=pWWu
-----END PGP SIGNATURE-----

--AxPn34jUE8ls0hU7QkowFmdIla0xMtu4W--

