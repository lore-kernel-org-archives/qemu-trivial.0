Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwDNw-0005CY-Dc
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 10:25:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1SwDNp-0005Ba-DW
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:25:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1SwDNf-00082E-H8
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:25:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1SwDNf-000820-8h; Tue, 31 Jul 2012 10:25:03 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6VEP0LY021806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 31 Jul 2012 10:25:00 -0400
Received: from [10.3.113.77] (ovpn-113-77.phx2.redhat.com [10.3.113.77])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6VEOxFX022993; Tue, 31 Jul 2012 10:24:59 -0400
Message-ID: <5017EABA.1020005@redhat.com>
Date: Tue, 31 Jul 2012 08:24:58 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
	<87pq7c9fng.fsf@blackfin.pond.sub.org>
In-Reply-To: <87pq7c9fng.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.4.3
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig9750D98629B8A5D748141D9F"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, patches@linaro.org,
	qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Avoid explicit
 list of directories in clean target
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
X-List-Received-Date: Tue, 31 Jul 2012 14:25:19 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig9750D98629B8A5D748141D9F
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 07/31/2012 08:19 AM, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>=20
>> Avoid having an explicit list of directories in the 'clean'
>> target by using 'find' to remove all .o and .d files instead.
>>

>>  	rm -f qemu-options.def
>> -	rm -f *.o *.d *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *=
=2Epod *~ */*~
>> +	find . -name '*.[od]' | xargs rm -f
>> +	rm -f *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ =
*/*~
>=20
> Shit happens if you somehow manage to create a "mean" file name in the
> build tree.  Sure you don't want to -print0 | xargs -0?

Except that 'find -print0' and 'xargs -0' are both GNU extensions, not
available everywhere.  We may be requiring gmake and gcc, but are we
also requiring GNU find?

The POSIX way to write this, without relying on extensions, is:

find . -name '*.[od]' -exec rm -f {} +

(although then you get into the arguments of whether 'find -exec {} +'
is portable yet, even though it has now been required by POSIX for more
than 4 years.)

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enig9750D98629B8A5D748141D9F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBCAAGBQJQF+q6AAoJEKeha0olJ0NqxLsH/3T6tbJusjkRoUntujgAEsgy
ruH0w5ON4e2jXaIvV7/VXiZ1ooG0bX74r76q3DcKfcWVUKyRrUyO6E5MA6ORnCLY
pIfDoutbiNPmpgnPLSRg0FqNrN3nlSEP4KJag/9r2nu2+RuoCE/YSMUIGlLKY2ON
LtP9XccBDtvbu7/JAKoyBzdO+If4656DUnE+v6q1TSMQX6n2Pl5hTsvo4bPAWVDm
7RBbYRzkQdtyV2kgKnmnAd2GNh9ccSdeg1ivLVy/mdgBLZ4Yua53Yx7Z+U12UHDh
tZ3uewuTBxBK6cUrhoQPKLHM3vMzfbuM17Q5hhPryDXw4+jBxjQPeD9ulc23wv0=
=Y7YL
-----END PGP SIGNATURE-----

--------------enig9750D98629B8A5D748141D9F--

