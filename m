Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsSon-0003o9-Fu
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 08:00:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dsSoj-0003lC-GJ
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 08:00:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dsSod-0000LE-MC
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 08:00:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52234)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dsSoJ-0008BJ-J1; Thu, 14 Sep 2017 07:59:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 783EB13A4C;
	Thu, 14 Sep 2017 11:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 783EB13A4C
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.120.201] (ovpn-120-201.rdu2.redhat.com [10.10.120.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B31A17A70;
	Thu, 14 Sep 2017 11:59:57 +0000 (UTC)
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <20170913210343.19078-1-eblake@redhat.com>
	<d40b4b1a-76ca-f438-e1d9-e079dc08724c@redhat.com>
Cc: pbonzini@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <f2e7ed9d-079f-1e1b-5d02-2f1ca3a6bb01@redhat.com>
Date: Thu, 14 Sep 2017 06:59:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <d40b4b1a-76ca-f438-e1d9-e079dc08724c@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="e6Otqh2PxBt7bNaBD2LcppXn2oBMabqRc"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 14 Sep 2017 11:59:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] osdep: Fix ROUND_UP(64-bit, 32-bit)
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
X-List-Received-Date: Thu, 14 Sep 2017 12:00:29 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--e6Otqh2PxBt7bNaBD2LcppXn2oBMabqRc
Content-Type: multipart/mixed; boundary="pWUSRSSJIvTnUeBALgRCV6iRl07chFcIv";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <f2e7ed9d-079f-1e1b-5d02-2f1ca3a6bb01@redhat.com>
Subject: Re: [PATCH] osdep: Fix ROUND_UP(64-bit, 32-bit)
References: <20170913210343.19078-1-eblake@redhat.com>
 <d40b4b1a-76ca-f438-e1d9-e079dc08724c@redhat.com>
In-Reply-To: <d40b4b1a-76ca-f438-e1d9-e079dc08724c@redhat.com>

--pWUSRSSJIvTnUeBALgRCV6iRl07chFcIv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/14/2017 03:44 AM, Laszlo Ersek wrote:
> On 09/13/17 23:03, Eric Blake wrote:
>> When using bit-wise operations that exploit the power-of-two
>> nature of the second argument of ROUND_UP(), we still need to
>> ensure that the mask is as wide as the first argument (done
>> by using addition of 0 to force proper arithmetic promotion).
>> Unpatched, ROUND_UP(2ULL*1024*1024*1024*1024, 512) produces 0,
>> instead of the intended 2TiB.
>>
>> Broken since its introduction in commit 292c8e50 (v1.5.0).
>>
>> CC: qemu-trivial@nongnu.org
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>

>> +#define ROUND_UP(n, d) (((n) + (d) - 1) & -((n) - (n) + (d)))
>>  #endif
>=20
> Another way to widen the mask as necessary would be:
>=20
>   (((n) + (d) - 1) & -(0 ? (n) : (d)))

Oh, I like that even better!


>>  #ifndef DIV_ROUND_UP
>> -#define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
>> +#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>  #endif
>=20
> This looks like an independent whitespace fix; should it be in this pat=
ch?

checkpatch complained about the pre-patch spacing in ROUND_UP, and
DIV_ROUND_UP had the same issue 2 lines later.  But you're right that
it's not strictly necessary (or that I should at least call it out in
the commit message).

v2 coming up.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--pWUSRSSJIvTnUeBALgRCV6iRl07chFcIv--

--e6Otqh2PxBt7bNaBD2LcppXn2oBMabqRc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlm6bzwACgkQp6FrSiUn
Q2p47AgAqxYNwOt3lbRFfBwiWvtB4351ecUG2hDZzuuB+3TJaa9+mGetllDF0a5u
xgIIgn+piIeeCZSqLDpzu7g1PIBQZx2Fn3O1q5kUx+VSzP9jJqw6dOMzkfDfAUvR
yc06qV2acYtmo5e+JIHNCLSXoysQbHWPtG8uwYyCV4+95tr+Nu+Z9F559zTt4geG
rljhYpf3Gh5+XW99yPc9U66bYqa0A3U4gZwn+YBECEkQBx0jC8VALLU9TefU7lkE
k9uPgU5RcyA5Ys0HmhWtNHc6QL0wPnKk/c+jueIB47FOJgOYEJDsnLuWS+llRdZv
nafvV9ih1opMkfcMzH6PdgM/lQ0osQ==
=6MbZ
-----END PGP SIGNATURE-----

--e6Otqh2PxBt7bNaBD2LcppXn2oBMabqRc--

