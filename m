Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WAOBD-0005Vd-81
	for mharc-qemu-trivial@gnu.org; Mon, 03 Feb 2014 13:23:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WAOB6-0005NU-BG
	for qemu-trivial@nongnu.org; Mon, 03 Feb 2014 13:23:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WAOB1-0004ld-Nk
	for qemu-trivial@nongnu.org; Mon, 03 Feb 2014 13:23:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WAOAr-0004jL-MU; Mon, 03 Feb 2014 13:23:13 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s13INAjP027412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Feb 2014 13:23:11 -0500
Received: from [10.3.113.63] (ovpn-113-63.phx2.redhat.com [10.3.113.63])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s13IN9wl000669; Mon, 3 Feb 2014 13:23:10 -0500
Message-ID: <52EFDE8D.4030701@redhat.com>
Date: Mon, 03 Feb 2014 11:23:09 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Amos Kong <akong@redhat.com>
References: <1390467277-16499-1-git-send-email-akong@redhat.com>
	<52ECC317.5060004@msgid.tls.msk.ru>
In-Reply-To: <52ECC317.5060004@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="IPDEG66fIGRShhmqQvv8lBXUpr0J9vndc"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qapi: cleanup redundant variable
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
X-List-Received-Date: Mon, 03 Feb 2014 18:23:33 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IPDEG66fIGRShhmqQvv8lBXUpr0J9vndc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/01/2014 02:49 AM, Michael Tokarev wrote:
> 23.01.2014 12:54, Amos Kong wrote:
>> No need to re-append an expr list, it's ok to return schema.exprs
>>
>> Signed-off-by: Amos Kong <akong@redhat.com>
>> ---
>>  scripts/qapi.py | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)

>> @@ -185,9 +183,8 @@ def parse_schema(fp):
>>              add_enum('%sKind' % expr['union'])
>>          elif expr.has_key('type'):
>>              add_struct(expr)
>> -        exprs.append(expr)
>> =20
>> -    return exprs
>> +    return schema.exprs
>=20
> I don't really know python.  Does it mean that previously,
> this function returned a copy of schema.exprs, but now it
> returns schema.exprs itself, so a caller can modify it?

My python is also weak (hence my lack of R-b), but yes, I believe you
are correct.  On the other hand, parse_schema is only called up front,
so I don't think callers are modifying the return value anyways, so does
it matter?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--IPDEG66fIGRShhmqQvv8lBXUpr0J9vndc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJS796NAAoJEKeha0olJ0NqSqAIAI4rzTDrIKWnAPrTJKKKZOt4
RzYQl0sYjYN/d09JCus9EDCi8x7dq505noedH55lqrBCGQRcMjTU8U+p5e7TiEES
N10riUHykXc6X70gf8weGST5ov18f4DMNdf1QUipdyND38KSSRrVcMm5TuqnFLyM
5I9ZC2iTtLnsHwijeP+6YagZbkcqYwCWzrmpSgS1Wp7DUgMSx/eOSuN7aB6G19WB
gL6AWAWoS5sCO9HbHAK4f7G2PvcN+NFMGbgc0TyeJ9PeAi8kHr5zbRCRHPrjJD39
Wm5w47zxx9pBqyM6dZQfncjCmcoudrHF/OfWcctlUrnx0CGmIxL36LIZYdcdHnU=
=H/ud
-----END PGP SIGNATURE-----

--IPDEG66fIGRShhmqQvv8lBXUpr0J9vndc--

