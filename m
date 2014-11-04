Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XleER-0006iX-08
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 08:33:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XleEL-0006iN-DH
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 08:33:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XleEH-0008Q7-22
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 08:33:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XleEG-0008Px-P8; Tue, 04 Nov 2014 08:33:00 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sA4DWkeU003252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 4 Nov 2014 08:32:46 -0500
Received: from [10.3.113.108] (ovpn-113-108.phx2.redhat.com [10.3.113.108])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sA4DWjbV000942; Tue, 4 Nov 2014 08:32:45 -0500
Message-ID: <5458D57C.9030700@redhat.com>
Date: Tue, 04 Nov 2014 14:32:44 +0100
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1415018910-11600-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1415018910-11600-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="dDJVf8Mlem8wqNSeHRsLmVHH9ifEssWGH"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc.texi: fix typos
	for x509 examples
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
X-List-Received-Date: Tue, 04 Nov 2014 13:33:09 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dDJVf8Mlem8wqNSeHRsLmVHH9ifEssWGH
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/03/2014 01:48 PM, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Fix typos made people confuesd:

Spelling:
s/confuesd/confused/

Grammar: would read better as:

Fix typos that caused confusion for some people:

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--dDJVf8Mlem8wqNSeHRsLmVHH9ifEssWGH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUWNV8AAoJEKeha0olJ0NqxF4IAISWyCD/1m99up3H9KjQE/dw
BFw4l+5Wo73kldxYfXl1UDOhBgjbjsRVBfOYEIcBFRknwEmk+v/AZLgjQCevdVZP
i4ssws757bAQ/GytZN4gG4fg/F5quNMSINKUPKWUrwpxhNom7eTGMqVaQFHVftA0
G0o60CY9gyguxPYGz5WJFp9j5hdoO5BURXwCISbTdlC7WqG+3h0FAQj4wbs3oHDk
KVqHX2yiGyYKqAQrxmIOzqgZPlNZL5AFE7SHLGa23ekZEFxK6EuyBVil930TpwVj
0JhJEmo8oa6RYjEA5hWDqxCQA/UIKppJ+rMpNZ9cWh/om+Ljgefbjml5LLSpd3U=
=kT01
-----END PGP SIGNATURE-----

--dDJVf8Mlem8wqNSeHRsLmVHH9ifEssWGH--

