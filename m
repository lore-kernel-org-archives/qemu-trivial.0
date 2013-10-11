Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUj1p-0002OI-C3
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 16:09:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VUj1h-0002FE-Ra
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:09:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VUj1c-0007RE-S0
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:09:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47980)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1VUj1c-0007RA-J9; Fri, 11 Oct 2013 16:09:28 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9BK9RKl022045
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 11 Oct 2013 16:09:27 -0400
Received: from [10.3.113.194] (ovpn-113-194.phx2.redhat.com [10.3.113.194])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9BK9QWE020000; Fri, 11 Oct 2013 16:09:26 -0400
Message-ID: <52585AF5.4090700@redhat.com>
Date: Fri, 11 Oct 2013 14:09:25 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Don Koch <dkoch@verizon.com>, Stefan Weil <sw@weilnetz.de>
References: <1381520073-32674-1-git-send-email-sw@weilnetz.de>
	<52585983.1000606@terremark.com>
In-Reply-To: <52585983.1000606@terremark.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="xIpRGqFRGwi1ESOsST7Eg3CEbqjmW0cCA"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] misc: Spelling and
	grammar fixes in comments
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
X-List-Received-Date: Fri, 11 Oct 2013 20:09:40 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xIpRGqFRGwi1ESOsST7Eg3CEbqjmW0cCA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/11/2013 02:03 PM, Don Koch wrote:

>>   In this method, H/L and X0/X1 is always same position.
>> - This lead us to more speed and less memory.
>> + This leads us to more speed and less memory.
>>   Of cause, the result of both method is quite same
>>   because it's only difference that coefficient position.
>>  */
>>
>=20
> Since you're in the neighborhood, this paragraph needs more fixes:
>=20
>  In this method, H/L and X0/X1 is always in the same position.
>  This leads us to more speed and less memory.
>  Of course, the result of both methods is the same
>  because the only difference is the coefficient position.

Broken record.  This was what was attempted in v1, where the argument
was that the original wording is so obtuse that it is not obvious that
this is the correct replacement.

I actually like the approach of v2.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--xIpRGqFRGwi1ESOsST7Eg3CEbqjmW0cCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJSWFr1AAoJEKeha0olJ0NqAYIH/05KXg89aV5IqStUbLWjRhIm
zkofLmXSesmJG8P4dKylF60/LA0swTlejPWYKUvIcXWxR57Rqm7QgLJ6QuRI1OxU
7qtULsUM/Avt1bCWKvFe3eegFiwoYKsdfefbVpYynVx93wcb1xQA9Pnk8x34L6AN
mRe2a3PvX5JqlPDzCzPTwfgGXjzOWNB+wXrs+4seEZzfBRtyZ6Xchu0XK5Zdk5Tr
uesDH59ow5A2V5H1rzKjsDarGQPJ7SOWx5p9XhHe/gK56R2caFGs/NOSUo1KRmmE
sS/e8UgBHps23C8VOLB+qt/vPMxJ+WBlICg65+wk39npwYg0SBHQIwwocgnsc1E=
=7j7/
-----END PGP SIGNATURE-----

--xIpRGqFRGwi1ESOsST7Eg3CEbqjmW0cCA--

