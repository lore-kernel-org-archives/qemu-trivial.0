Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zx5H0-0002Au-I0
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 22:43:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zx5Gx-00026e-OB
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 22:43:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zx5Gw-0005ih-Q8
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 22:43:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Zx5Gr-0005fj-OC; Thu, 12 Nov 2015 22:43:29 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id D4B9E3FF;
	Fri, 13 Nov 2015 03:43:28 +0000 (UTC)
Received: from [10.3.113.115] (ovpn-113-115.phx2.redhat.com [10.3.113.115])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAD3hScE029583; Thu, 12 Nov 2015 22:43:28 -0500
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1447353228-30550-1-git-send-email-eblake@redhat.com>
	<20151113022737.GC8057@stefanha-x1.localdomain>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56455C5B.8090305@redhat.com>
Date: Thu, 12 Nov 2015 20:43:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151113022737.GC8057@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="WwsHoCxljMpsUA5njJwqnuvi7TdRAQopW"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tests: Ignore test-blockjob-txn
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
X-List-Received-Date: Fri, 13 Nov 2015 03:43:36 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WwsHoCxljMpsUA5njJwqnuvi7TdRAQopW
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/12/2015 07:27 PM, Stefan Hajnoczi wrote:
> On Thu, Nov 12, 2015 at 11:33:48AM -0700, Eric Blake wrote:
>> Commit 6c6f312d added a new test, but did not mark it for
>> exclusion in .gitignore.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
>> Yeah, I know this affects only non-VPATH builds, which we don't
>> recommend, but we might as well be consistent.
>>
>>  tests/.gitignore | 1 +
>>  1 file changed, 1 insertion(+)
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Another one popped up: bd797fc1 introduced test-timed-average. I'll just
respin a v2 of this, although the subject line will change.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--WwsHoCxljMpsUA5njJwqnuvi7TdRAQopW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWRVxbAAoJEKeha0olJ0NqNFEIAIbo0I2HF5edO2YuXq6OsnMa
qfRhDj+OP8w0P8DUihswM+hyIJYrlahf997tgAWkE+yGluNzXTkwmLURgavPGrRk
OQzG0CX+32LoYxs0XglNaVa2j1kszRSDJjNlX/PMLQ27b/IUkCSwDQsQIgxXRsBi
xmq8gIKA5y6WPkNaXbogLmXXVhRZmuEf0+XtgjLPEmQ0bZ5zgafJUwI8oGoBWHU6
LkALN+bUX7YmHPu1cO7DRToKb9wmaBQJypM9kFV5HqI2MwCUGoTv1QL7Wb90dsbg
9Rqkp90dXjASQMNUnINNh0C4KPruuHW1qmmG9THhcGd8e6Ru3Yq2PnTgZR47x00=
=Af++
-----END PGP SIGNATURE-----

--WwsHoCxljMpsUA5njJwqnuvi7TdRAQopW--

