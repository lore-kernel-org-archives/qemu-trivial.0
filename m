Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkvEr-0007GI-0q
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 11:39:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bkvEo-0007EC-9g
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:39:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bkvEk-0002F2-4c
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:39:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42612)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bkvEa-00022i-Ke; Fri, 16 Sep 2016 11:39:24 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF81C96A2;
	Fri, 16 Sep 2016 15:39:22 +0000 (UTC)
Received: from [10.3.116.184] (ovpn-116-184.phx2.redhat.com [10.3.116.184])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GFdMev017864; Fri, 16 Sep 2016 11:39:22 -0400
To: "Daniel P. Berrange" <berrange@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<20160916152704.GD9654@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <867362ee-e86d-8610-f8f4-5aeb52ff362e@redhat.com>
Date: Fri, 16 Sep 2016 10:39:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20160916152704.GD9654@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3Wn9q8uA465JeLa3uVJPKjoUbLXow6jI1"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 16 Sep 2016 15:39:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/26] trivial: use
 exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2016 15:39:39 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3Wn9q8uA465JeLa3uVJPKjoUbLXow6jI1
Content-Type: multipart/mixed; boundary="bms089Doqjbiwm9ILc1h3ClJ6SN5VcDqn"
From: Eric Blake <eblake@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <867362ee-e86d-8610-f8f4-5aeb52ff362e@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 00/26] trivial: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
 <20160916152704.GD9654@redhat.com>
In-Reply-To: <20160916152704.GD9654@redhat.com>

--bms089Doqjbiwm9ILc1h3ClJ6SN5VcDqn
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/16/2016 10:27 AM, Daniel P. Berrange wrote:
> On Fri, Sep 16, 2016 at 03:55:51PM +0200, Laurent Vivier wrote:
>> This series is the result of coccinelle patch
>> scripts/coccinelle/exit.cocci
>> provided by the first patch of the series.
>>
>> It replaces exit(0) by exit(EXIT_SUCCESS)
>> and exit(1) by exit(EXIT_FAILURE).
>=20
> Some places use '_exit' and should have had the same
> change applied AFAICT.

And _Exit(), if we use it.

>=20
>> All other exit() are not modified as we don't want
>> to change the behavior.
>=20
> IMHO, modifying the other exit() calls is precisely
> what would make this series useful.
>=20
> eg there's a bunch of places which arbitrarily use
> '-1' instead of '1' as the value for no good reason.

What's more, exit(-1) is awful to use; it results in an exit status of
255 due to truncation on Linux; and further has weird effects on
xargs(1) (which special-cases a status of 255, differently than a status
of 1).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--bms089Doqjbiwm9ILc1h3ClJ6SN5VcDqn--

--3Wn9q8uA465JeLa3uVJPKjoUbLXow6jI1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX3BIpAAoJEKeha0olJ0NqAI8H/j40D86NaD7hrDuxg8Tpej47
ghaykxDSANFYLeDg/0spBXityI/4WhYpwPVbnMIhCCkQFvYZL6BRDmtUTp1gUEJ9
9b8CNXnxAi51eSSfkP8jL8PR+FslDjUJ3mlgt66Gi4KN+Nqk62NT+o2XRYDV3ZSO
nLGVasi8P84jHr5wN7R6DbXCaCfo/Cn82XTHTxZMLB9rZzIEzN5+biHuwAH0+U/v
PffBvQmy8rgE6Dy9FY9x/yzlbrTl8XsheBaB7N2ZZSrUbW57gKKO5dI3DuC3g1pM
4bRw9xodX6ZNlMeUVBkGbY5tzCt5cHWEQ2em87qR+m9VE7PK0k3p7E4Vcmyi1As=
=+ity
-----END PGP SIGNATURE-----

--3Wn9q8uA465JeLa3uVJPKjoUbLXow6jI1--

