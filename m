Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJ0bB-0002QT-Ub
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 09:06:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1YJ0bA-0002Of-DW
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 09:06:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1YJ0b7-0002Ul-6F
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 09:06:32 -0500
Received: from mout.web.de ([212.227.15.4]:54234)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1YJ0aw-0002Rv-Gb; Wed, 04 Feb 2015 09:06:18 -0500
Received: from md1f2u6c.ww002.siemens.net ([95.157.58.223]) by smtp.web.de
	(mrweb004) with ESMTPSA (Nemesis) id 0MNx4F-1YGYYB3bq7-007Rt8;
	Wed, 04 Feb 2015 15:06:13 +0100
Message-ID: <54D2274F.4040008@web.de>
Date: Wed, 04 Feb 2015 15:06:07 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Pedro Alves <palves@redhat.com>, 
 qemu-trivial <qemu-trivial@nongnu.org>
References: <54CCA038.8000704@web.de> <54D2204B.3010903@redhat.com>
In-Reply-To: <54D2204B.3010903@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="PxvNoS8IEIQcTe64Ve5kmmfgIJTTqbJ9u"
X-Provags-ID: V03:K0:+kJS1n9e/0VASgph7kGOpnRAQs7xDkV5moWgzRxR6raIblCTaEJ
	NFCSMlPidQvBkiTnwgzZ6vO5nIQi9WNMyPGsRXJ3f703vBmWARkEzHZTdpK1tImYJ5kRP4h
	XHVP2sCM51ymxFusDPa1v1Sf40+6emFQfAHjHZnW1Dt2s4w/R+JK+XLtYXSaw31k6wQUpUq
	7byKOFX+98fYZmlNiTw3Q==
X-UI-Out-Filterresults: notjunk:1;
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.15.4
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Add GDB qAttached
	support
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
X-List-Received-Date: Wed, 04 Feb 2015 14:06:33 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PxvNoS8IEIQcTe64Ve5kmmfgIJTTqbJ9u
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

On 2015-02-04 14:36, Pedro Alves wrote:
> Hi, I was skimming the list, and noticed:
>=20
> On 01/31/2015 10:28 AM, Jan Kiszka wrote:
>> @@ -1187,6 +1193,10 @@ static int gdb_handle_packet(GDBState *s, const=
 char *line_buf)
>>              put_packet_binary(s, buf, len + 1);
>>              break;
>>          }
>> +        if (strncmp(p, "Attached", 8) =3D=3D 0) {
>=20
> This looks like it'd mishandle a future qAttached2 packet.
>=20
> It should be doing something like:
>=20
>        if (strncmp(p, "Attached", 8) =3D=3D 0 &&
>           (p[8] =3D=3D '\0' || p[8] =3D=3D ':')) {
>=20
> or:
>=20
>        if (strcmp(p, "Attached") =3D=3D 0 || strncmp(p, "Attached:", 9)=
 =3D=3D 0) {
>=20
>=20
> Likewise other packets, if they have the same issue.
> (I'm not familiar with qemu's stub's internals.)

Thanks for the remark! Will update the patch using the easier readable
second variant.

Jan



--PxvNoS8IEIQcTe64Ve5kmmfgIJTTqbJ9u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTSJ08ACgkQitSsb3rl5xQ5FACgpk2XTf3kTvbQPApWSkDjsBm2
AgsAnA7Q4kypxCmdHWR9XFNbEQBUquid
=7b5H
-----END PGP SIGNATURE-----

--PxvNoS8IEIQcTe64Ve5kmmfgIJTTqbJ9u--

