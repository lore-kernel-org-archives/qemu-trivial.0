Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f3Qwl-0005Cn-2C
	for mharc-qemu-trivial@gnu.org; Tue, 03 Apr 2018 14:46:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f3Qwi-0005Ab-BC
	for qemu-trivial@nongnu.org; Tue, 03 Apr 2018 14:46:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f3Qwh-0000O1-EU
	for qemu-trivial@nongnu.org; Tue, 03 Apr 2018 14:46:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58482 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1f3QwZ-0000LP-PV; Tue, 03 Apr 2018 14:46:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54F69722E8;
	Tue,  3 Apr 2018 18:46:07 +0000 (UTC)
Received: from [10.10.123.104] (ovpn-123-104.rdu2.redhat.com [10.10.123.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED2E17C54;
	Tue,  3 Apr 2018 18:46:04 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20180327202152.1799131-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <46f09a31-addb-32e0-d9b6-827166690a72@redhat.com>
Date: Tue, 3 Apr 2018 13:46:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180327202152.1799131-1-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="qZ2UBiHB56auBNwWtwQIq8IqTIyyt6ICy"
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 03 Apr 2018 18:46:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 03 Apr 2018 18:46:07 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.12] dump: Fix build
 with newer gcc
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
X-List-Received-Date: Tue, 03 Apr 2018 18:46:17 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qZ2UBiHB56auBNwWtwQIq8IqTIyyt6ICy
Content-Type: multipart/mixed; boundary="xtIONoTRurS53enMNVvXbEOuOT5yZvFEA";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
Message-ID: <46f09a31-addb-32e0-d9b6-827166690a72@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.12] dump: Fix build with newer gcc
References: <20180327202152.1799131-1-eblake@redhat.com>
In-Reply-To: <20180327202152.1799131-1-eblake@redhat.com>

--xtIONoTRurS53enMNVvXbEOuOT5yZvFEA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03/27/2018 03:21 PM, Eric Blake wrote:
> gcc 8 on rawhide is picky enough to complain:
>=20
> /home/dummy/qemu/dump.c: In function 'create_header32':
> /home/dummy/qemu/dump.c:817:5: error: 'strncpy' output truncated before=
 terminating nul copying 8 bytes from a string of the same length [-Werro=
r=3Dstringop-truncation]
>      strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> But we already have SIG_LEN defined as the right length without needing=

> to do a strlen(), and memcpy() is better than strncpy() when we know
> we do not want a trailing NUL byte.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  dump.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I'll include this in my qapi+misc pull request for 2.12-rc2

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--xtIONoTRurS53enMNVvXbEOuOT5yZvFEA--

--qZ2UBiHB56auBNwWtwQIq8IqTIyyt6ICy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlrDy+wACgkQp6FrSiUn
Q2o3vgf/SVub2+3iCn2l7G4GRrJZctRogD0J/fC9gk3NvANKSiNKBvZzh8QB9B9M
lpxHsNRfDEhxsV8zZXusBzTTwEj7c6Lna1wu5K2JoneQNXLVM2WeI/1s957XqXao
Ag9+i0++px9GMgdB43uWDDDnrGa3WsnyVtGbPZJVyfYwnxxb88I8Vm+ovmU4vpGo
rqbewErui82CH3HpjNUsN9qBZO9+g+tI2bTjnGVDdtJioQSzsBZyHsh+5GkTr2bR
RkjADJ4NtgyxpiGy5d+QyIPjNdCne2CXl+xguV17/MBGTTlxrca6wRU2P+D1SQxz
eAsWOp2LS4NYf02opQ8Xjrv/qITOqQ==
=eT0y
-----END PGP SIGNATURE-----

--qZ2UBiHB56auBNwWtwQIq8IqTIyyt6ICy--

