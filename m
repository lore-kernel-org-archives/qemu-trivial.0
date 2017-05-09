Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d88s4-0007EB-Pp
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 13:24:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d88s2-0007BB-39
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 13:24:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d88s1-0004X8-5F
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 13:24:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37512)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d88rw-0004UO-Lj; Tue, 09 May 2017 13:24:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 925CE4E8AB;
	Tue,  9 May 2017 17:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 925CE4E8AB
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 925CE4E8AB
Received: from [10.10.123.147] (ovpn-123-147.rdu2.redhat.com [10.10.123.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E15FE5C881;
	Tue,  9 May 2017 17:24:13 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-4-f4bug@amsat.org>
	<2ad7eaf6-3691-f9f1-4d09-204444adbd19@redhat.com>
	<5b9ad5c0-0bcf-2167-57ba-446d1253cdd1@amsat.org>
	<bdc0fa6a-a90c-3f7a-a37c-bc901a6022c2@amsat.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <4cb5814d-d8bb-db4f-3c85-9ef245534f33@redhat.com>
Date: Tue, 9 May 2017 12:24:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <bdc0fa6a-a90c-3f7a-a37c-bc901a6022c2@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="0MRsv8liP4MaKb0iC1rWc503euCCWmk3d"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 09 May 2017 17:24:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/11] hw/misc: add missing
 includes
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
X-List-Received-Date: Tue, 09 May 2017 17:24:23 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0MRsv8liP4MaKb0iC1rWc503euCCWmk3d
Content-Type: multipart/mixed; boundary="on8caxXLOEpjroIxrpFR9lDSKlD4oPq3i";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Message-ID: <4cb5814d-d8bb-db4f-3c85-9ef245534f33@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 03/11] hw/misc: add missing includes
References: <20170508233918.9043-1-f4bug@amsat.org>
 <20170508233918.9043-4-f4bug@amsat.org>
 <2ad7eaf6-3691-f9f1-4d09-204444adbd19@redhat.com>
 <5b9ad5c0-0bcf-2167-57ba-446d1253cdd1@amsat.org>
 <bdc0fa6a-a90c-3f7a-a37c-bc901a6022c2@amsat.org>
In-Reply-To: <bdc0fa6a-a90c-3f7a-a37c-bc901a6022c2@amsat.org>

--on8caxXLOEpjroIxrpFR9lDSKlD4oPq3i
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/09/2017 12:20 PM, Philippe Mathieu-Daud=C3=A9 wrote:

> What about the other include, "hw/sysbus.h"?
> The inlined function create_unimplemented_device() calls
> sysbus_mmio_map_overlap(). Anyone willing to use "hw/misc/unimp.h" will=

> get a compilation failure if he does not include "hw/sysbus.h" and I
> don't think it belongs to "qemu/osdep.h".

That one's probably okay.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--on8caxXLOEpjroIxrpFR9lDSKlD4oPq3i--

--0MRsv8liP4MaKb0iC1rWc503euCCWmk3d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZEfs9AAoJEKeha0olJ0Nq5k8IAIu4QdrYdh+3WbH/YkQ9J7is
s3LOwCuFydYRyl+ddnP7+yTEgeCiE8wbE1sPaMJC5JieBbIQzcohDy1hg3MGuPEy
0y+nB8TRIbh7bsq+Zb0bk5aj1yM7wAL7aN81Vs1SQXz0b9YCK6IN2k8Y1vHUC/zs
d8hhLaRi0NYBXGrr60qHK+eGTn47nY0JWu3ZTjYzWQjBWeqxAu4gr/k6zTZfx7qu
mvP0bdx1YMZ/H0qjwoto8OUrTqCbwj38xfs9k+SjRwthW0wTskRDIxQ2X4O9YXMm
zcxfCOx5ZW3YUZ7I/H8ig1Vj4Pnp4+bLPr0+4lh622C37cT8hEnZGtxUPetBuO0=
=wtYw
-----END PGP SIGNATURE-----

--0MRsv8liP4MaKb0iC1rWc503euCCWmk3d--

