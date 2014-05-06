Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhhXZ-00011j-S0
	for mharc-qemu-trivial@gnu.org; Tue, 06 May 2014 11:44:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WhhXU-0000uw-4H
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 11:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WhhXO-00057S-Ug
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 11:44:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41149)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WhhXE-00055g-J3; Tue, 06 May 2014 11:44:00 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s46FhwwZ029845
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 6 May 2014 11:43:58 -0400
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s46Fhv0w026166; Tue, 6 May 2014 11:43:57 -0400
Message-ID: <5369033D.5060505@redhat.com>
Date: Tue, 06 May 2014 09:43:57 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1399382220-14874-1-git-send-email-peter.maydell@linaro.org>
	<5368F36B.3040804@redhat.com>
	<CAFEAcA_muHezDUmdcvkEqp0pFmCBJ55kUXrSZkuUv05vxpJybw@mail.gmail.com>
In-Reply-To: <CAFEAcA_muHezDUmdcvkEqp0pFmCBJ55kUXrSZkuUv05vxpJybw@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="20KhJ8sUQuhFnobkNOGw1tFwvEd3HBAsS"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Don Slutz <dslutz@verizon.com>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Put tempfiles in
 subdir so we can clean up libtool files
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
X-List-Received-Date: Tue, 06 May 2014 15:44:21 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--20KhJ8sUQuhFnobkNOGw1tFwvEd3HBAsS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/06/2014 08:53 AM, Peter Maydell wrote:

>> # Create a (secure) tmp directory for tmp files.
>>
>> {
>>   tmp=3D`(umask 077 && mktemp -d "./confXXXXXX") 2>/dev/null` &&
>>   test -d "$tmp"
>> }  ||
>> {
>>   tmp=3D./conf$$-$RANDOM
>>   (umask 077 && mkdir "$tmp")
>> } || as_fn_error $? "cannot create a temporary directory in ." "$LINEN=
O" 5
>> ac_tmp=3D$tmp
>=20
> Yuck.
>=20
>> The use of $$ and $RANDOM is safe (even on shells that lack $RANDOM)
>> because of the fact that mkdir is atomic and the umask is correctly se=
t
>> prior to the mkdir.
>=20
> I dislike the use of $RANDOM, because it means we behave
> inconsistently. If it's OK for $RANDOM to expand to "" then we
> should just not use it at all, because that's OK and the same
> everywhere.

It's okay for $RANDOM to expand to "" in the fallback code, for the
platforms that lack mktemp(1); most developers are on a platform that
have mktemp.  The use of $RANDOM makes it harder for an attacker to
pre-create a competing file by the same name, but does not add any
security; so omitting $RANDOM for the fallback path doesn't hurt if you
are that bothered by seeing it present in a dash script.

>=20
> Similarly, if it's OK not to use mktemp on some systems,
> we should use the same non-mktemp code everywhere.

The fallback is not ideal, but tolerable.  It's still better to try and
use mktemp where it exists.

>=20
> We could sidestep this rubbish by not trying to put our temp
> files in /tmp/, and instead just put them in the build directory
> (ie ./conf-temps/ or something similar, which we blow away
> and recreate every time).

Yes, using a different location for temporary files and avoiding /tmp
might also work.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--20KhJ8sUQuhFnobkNOGw1tFwvEd3HBAsS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTaQM9AAoJEKeha0olJ0NqBu0IAIyJD/O0iBcdHa/jtYO6r0b1
VPD/x73CjBPXjOywzYhfvwrZadVBS6hC4fTieurKUOJH2SHKjl54p74WuqR7DIxJ
QsuuPbLniMExTJKv9SzXD5w1eU4gWfSfUWbbcrJFvs2HjqwOR9biw+PRwutxnuTS
InV3E4N0Syqh8i1MdZkcBUJUyYLkcYo/Fxs1To9XwGyY9NZq8MgQzAEirluaDLNq
EyWEYfdNEfTJWBr9u7LgRbzShh6+3U414VxmPyqG15whYqWssLv1Pwy4XHvfLCRs
/itL8Nz72xyZBYS9XiTNZ7oX6CeMVehPUGbUVvlnAzjGtNbTMeQe3HH5fuihWFA=
=YBtU
-----END PGP SIGNATURE-----

--20KhJ8sUQuhFnobkNOGw1tFwvEd3HBAsS--

