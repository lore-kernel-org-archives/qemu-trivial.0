Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dEFS7-000701-Eo
	for mharc-qemu-trivial@gnu.org; Fri, 26 May 2017 09:38:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dEFS5-0006ym-AR
	for qemu-trivial@nongnu.org; Fri, 26 May 2017 09:38:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dEFS4-0008EY-Fo
	for qemu-trivial@nongnu.org; Fri, 26 May 2017 09:38:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dEFRz-0008Df-5i; Fri, 26 May 2017 09:38:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21D1337EEB;
	Fri, 26 May 2017 13:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 21D1337EEB
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 21D1337EEB
Received: from [10.10.120.133] (ovpn-120-133.rdu2.redhat.com [10.10.120.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8450478DF2;
	Fri, 26 May 2017 13:38:39 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170526101337.4096-1-marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <86c34b52-15df-8c57-ae43-308c17f321aa@redhat.com>
Date: Fri, 26 May 2017 08:38:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170526101337.4096-1-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ALv5RmJNQAKbv7pxmB6XODeFtmmRxN5Fu"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 26 May 2017 13:38:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-ga: remove useless
 allocation
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
X-List-Received-Date: Fri, 26 May 2017 13:38:50 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ALv5RmJNQAKbv7pxmB6XODeFtmmRxN5Fu
Content-Type: multipart/mixed; boundary="IG7Lr1l6IrwdT54A6OBKQBL5r7KIoR65M";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <86c34b52-15df-8c57-ae43-308c17f321aa@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qemu-ga: remove useless allocation
References: <20170526101337.4096-1-marcandre.lureau@redhat.com>
In-Reply-To: <20170526101337.4096-1-marcandre.lureau@redhat.com>

--IG7Lr1l6IrwdT54A6OBKQBL5r7KIoR65M
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/26/2017 05:13 AM, Marc-Andr=C3=A9 Lureau wrote:
> There is no need to duplicate a fixed string.
>=20
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/commands-posix.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--IG7Lr1l6IrwdT54A6OBKQBL5r7KIoR65M--

--ALv5RmJNQAKbv7pxmB6XODeFtmmRxN5Fu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZKC/eAAoJEKeha0olJ0Nq6GAH/3izaHwACPicTOgbZJPUQvO1
784vySPqIUZ7RpV6RCs1IY1gIIofi16mOfTlOJAmKkMHifcdTeMfX7zgJ+O4kKUZ
E5/HCZVBKrzhLplK2SCg7D4HHoxpB+2QWHrcUlnkQLKbkCJ5Uhf8ypxH3tzPD91T
2xeBVAhY7/nmstzaH10UlEiSyWLAIVYZrrugaROCu1yRZWDThZCMQ6bHu4kaUp0L
FGsLwYp6MT+8TSCEhZlM5ctVuU/FaropW6GLaiLwaJEUFXJPLnU5msyOeMpuUZB1
tRaPqfic905sjtJ233+g0RVSZ21V8OFw4R7gngoGJ65P/D8zBzfKOX8REU00Y0A=
=/OhK
-----END PGP SIGNATURE-----

--ALv5RmJNQAKbv7pxmB6XODeFtmmRxN5Fu--

