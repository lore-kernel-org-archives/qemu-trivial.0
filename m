Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dmM63-00010p-AH
	for mharc-qemu-trivial@gnu.org; Mon, 28 Aug 2017 11:37:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dmM61-0000yN-G1
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 11:37:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dmM60-0006Se-JX
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 11:37:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41000)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dmM5u-0006RF-M9; Mon, 28 Aug 2017 11:36:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A055380C20;
	Mon, 28 Aug 2017 15:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A055380C20
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.122.186] (ovpn-122-186.rdu2.redhat.com [10.10.122.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0AFC56887D;
	Mon, 28 Aug 2017 15:36:51 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1503916557-1292-1-git-send-email-thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <facb59b4-6992-b7a5-7d63-bead2ff29f8a@redhat.com>
Date: Mon, 28 Aug 2017 10:36:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1503916557-1292-1-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="TpvhGFtdWxow6geKGk5CpoJIlSbXLjq6d"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 28 Aug 2017 15:36:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] tests/libqtest: Use a proper error
 message if QTEST_QEMU_BINARY is missing
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
X-List-Received-Date: Mon, 28 Aug 2017 15:37:02 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TpvhGFtdWxow6geKGk5CpoJIlSbXLjq6d
Content-Type: multipart/mixed; boundary="NfNmilSn2gq3B6K08rhGL18WoBxdduvCF";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Message-ID: <facb59b4-6992-b7a5-7d63-bead2ff29f8a@redhat.com>
Subject: Re: [PATCH] tests/libqtest: Use a proper error message if
 QTEST_QEMU_BINARY is missing
References: <1503916557-1292-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1503916557-1292-1-git-send-email-thuth@redhat.com>

--NfNmilSn2gq3B6K08rhGL18WoBxdduvCF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08/28/2017 05:35 AM, Thomas Huth wrote:
> The user can currently still cause an abort() if running certain tests
> (like the prom-env-test) without setting the QTEST_QEMU_BINARY first.
> A similar problem has been fixed with commit 7c933ad61b8f3f51337
> already, but forgot to also take care of the qtest_get_arch() function,=

> so let's introduce a proper wrapper around getenv("QTEST_QEMU_BINARY")
> that can be used in both locations now.
>=20
> Buglink: https://bugs.launchpad.net/qemu/+bug/1713434
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/libqtest.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--NfNmilSn2gq3B6K08rhGL18WoBxdduvCF--

--TpvhGFtdWxow6geKGk5CpoJIlSbXLjq6d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlmkOJMACgkQp6FrSiUn
Q2pp5Qf/aaaROzOvc8KVAnuiZWmN2vhbP63BujduyfcaCb/DBiCrmdZudEy7/0hW
0rpn6scil7E8zaP8NvP7atIrJR+hZHy6vsk3aZjySM4okD1Ftb9VFT3Hc9XPaW8F
RmChnSqfF0P8Z6BPyvr/prJzo1NZI/vmqNbEK2gt+qqNiundHFZOAwrYDRd09pqb
1Pmm8jcS8z8yMA2EfpTFiKwLduRlUAYPOEWse+DE7hbCIMbEarMaHQS8MN/d6wdD
nx6QwqnPpj25SgHJwLc2sw9+Kt2yeKo3ejPf7WXtyMKMLbLjrGWxmHW14SXwqmvN
To9XoEN2xz8/TPEXRzjWf9mTJbS01A==
=lHWA
-----END PGP SIGNATURE-----

--TpvhGFtdWxow6geKGk5CpoJIlSbXLjq6d--

