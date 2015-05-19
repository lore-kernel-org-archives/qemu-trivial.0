Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YuiKd-0001A7-1u
	for mharc-qemu-trivial@gnu.org; Tue, 19 May 2015 10:17:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YuiKY-00013N-3O
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 10:17:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YuiKU-0007r6-Af
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 10:17:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YuiKU-0007pL-3w; Tue, 19 May 2015 10:17:10 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4JEH8K0010454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 19 May 2015 10:17:08 -0400
Received: from [10.3.113.128] (ovpn-113-128.phx2.redhat.com [10.3.113.128])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4JEH7gP026806; Tue, 19 May 2015 10:17:07 -0400
Message-ID: <555B45E2.5090008@redhat.com>
Date: Tue, 19 May 2015 08:17:06 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Cerveny <M.Cerveny@computer.org>
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
	<1431519294-8873-2-git-send-email-M.Cerveny@computer.org>
	<555B31D9.2090806@suse.de> <555B4127.4030700@redhat.com>
	<alpine.GSO.2.00.1505191601120.6069@dmz.c-home.cz>
In-Reply-To: <alpine.GSO.2.00.1505191601120.6069@dmz.c-home.cz>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="pbgDKAhTOj2HeDwASa68pXfrWQNXAwtDX"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
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
X-List-Received-Date: Tue, 19 May 2015 14:17:18 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pbgDKAhTOj2HeDwASa68pXfrWQNXAwtDX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/19/2015 08:12 AM, Martin Cerveny wrote:
> Hello.
>=20
> On Tue, 19 May 2015, Eric Blake wrote:
>> On 05/19/2015 06:51 AM, Andreas F=C3=A4rber wrote:
>>> Am 13.05.2015 um 14:14 schrieb Martin Cerveny:
>>>> Add network syntax parsing (ip address, port) to qom-* scripts.
>>>>
>>>> Signed-off-by: Martin Cerveny <M.Cerveny@computer.org>
>>>> ---
>>>>  scripts/qmp/qom-fuse |   13 ++++++++++++-
>>>>  scripts/qmp/qom-get  |   12 +++++++++++-
>>>>  scripts/qmp/qom-list |   12 +++++++++++-
>>>>  scripts/qmp/qom-set  |   12 +++++++++++-
>>>>  scripts/qmp/qom-tree |   12 +++++++++++-
>>>>  5 files changed, 56 insertions(+), 5 deletions(-)
>>>
>>> Could some Python guru please take a look at this?

>>>> +if len(connection) =3D=3D 2:
>>>> +    try:
>>>> +         port =3D int(connection[1])
>>>> +    except ValueError:
>>>> +         raise QMPBadPort
>>>> +    connection =3D ( connection[0], port )
>>
>> Won't that mishandle IPv6 connections, such as something like [::1]:80=
00
>> for connecting to port 8000 on localhost, since it splits into more th=
an
>> 2 pieces when splitting on :?
>=20
> Yes, this is problem, but I copy-paste the same construct from
> scripts/qmp/qmp-shell to be compatible.

Might be worth mentioning that, as justification in the commit message.

> Is the IPv6 support for utilities mandatory ?

I don't have any strong feelings about it (I'm okay if you don't).  But
others might.

> If yes I can make V2.

If so, it would be good to fix qmp-shell, too - which makes it sound
like it would be a separate commit.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--pbgDKAhTOj2HeDwASa68pXfrWQNXAwtDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVW0XiAAoJEKeha0olJ0Nqq5IIAJ+Zljc7AASTAuzH0nfMcNIC
u732LDJQDvhypQQ6gsAO519uWTKIXcAkNvWhCVx17eG+lUYCx0i9MbU2h4ASwRdf
LdouaJtbJL+qqoFvmGpdjQwW1jWs6Eg9xkenttDT+AM7zH4QZBBaw9xwPpvNEtyW
gaSolUIeRya9aYv81Ko6ec4Iu0IUzRPGFLMJg7vQ/FsgD5u/LiTN43S2IIvYRLNo
MNrzfeMsjd8szFSLyDSJ5PxXgFRrj65kavFOtQ/vJIWV5Ccz//1KfbNUwsi4NWgT
ee0JMoFVIGyDlbMf2l6YvHK2VOfsFsTUeebl4CMJXN7MiGAwW8S2kefgQMtqqZU=
=GTki
-----END PGP SIGNATURE-----

--pbgDKAhTOj2HeDwASa68pXfrWQNXAwtDX--

