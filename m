Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJRcJ-0001Lw-Vr
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 17:38:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJRcI-0001Kj-1U
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 17:38:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJRcH-0004fd-3e
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 17:38:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55242)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dJRcC-0004dp-GO; Fri, 09 Jun 2017 17:38:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 603184E04A;
	Fri,  9 Jun 2017 21:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 603184E04A
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 603184E04A
Received: from [10.10.121.94] (ovpn-121-94.rdu2.redhat.com [10.10.121.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 794C517C6D;
	Fri,  9 Jun 2017 21:38:41 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170609150622.4720-1-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <64263ec6-5e92-2a4a-c690-a5129eb71333@redhat.com>
Date: Fri, 9 Jun 2017 16:38:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170609150622.4720-1-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="oEnidHMCO5bS7QbgOdndMkCHPKbONKa1h"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 09 Jun 2017 21:38:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] hw/misc: add missing includes
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
X-List-Received-Date: Fri, 09 Jun 2017 21:38:51 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oEnidHMCO5bS7QbgOdndMkCHPKbONKa1h
Content-Type: multipart/mixed; boundary="otMxuESAppflkXbSNeTbU4wCRvUGGiJUR";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Message-ID: <64263ec6-5e92-2a4a-c690-a5129eb71333@redhat.com>
Subject: Re: [PATCH v2] hw/misc: add missing includes
References: <20170609150622.4720-1-f4bug@amsat.org>
In-Reply-To: <20170609150622.4720-1-f4bug@amsat.org>

--otMxuESAppflkXbSNeTbU4wCRvUGGiJUR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/09/2017 10:06 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> inlined create_unimplemented_device() calls sysbus_mmio_map_overlap().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>=20
> v2: Addressed review feedback from Eric Blake
>=20
>  include/hw/misc/unimp.h | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
> index 3462d85836..52e068ec3e 100644
> --- a/include/hw/misc/unimp.h
> +++ b/include/hw/misc/unimp.h
> @@ -8,6 +8,8 @@
>  #ifndef HW_MISC_UNIMP_H
>  #define HW_MISC_UNIMP_H
> =20
> +#include "hw/sysbus.h"
> +
>  #define TYPE_UNIMPLEMENTED_DEVICE "unimplemented-device"
> =20
>  /**
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--otMxuESAppflkXbSNeTbU4wCRvUGGiJUR--

--oEnidHMCO5bS7QbgOdndMkCHPKbONKa1h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZOxVgAAoJEKeha0olJ0NqqSMIAI0zvUqlnnMFmLSKUaXXshj0
nNCmEL7B4rAn2i1eapG05KfJMMOp3W88orsEJIDTYvtx8/30EfXlseZ/t1/ZF5gk
KQfZIfjhZzyfyJnAULcdTdJgg7Oynu8oqyEIJeZRC7UDMdFVe8J/nZNefuwq114P
ulnZGOPDTUWkwEMQ96iwK3ulcssBhLUqYRn/0gfwbaYCSR6Nc1BiWYBq6AlH8FoG
QZNa+2UxRpUYmoT9jYI1hB+8tJGR5Etkf4n8/zj22fUkltSe8qtcKOZ9qBoj8YkE
X6UPmBU41SUNYUTIrAxj7+mivj2RZvYpO7pS2lTeN9HbDG1xjwC7gCQ/tu+ALuA=
=Qd4a
-----END PGP SIGNATURE-----

--oEnidHMCO5bS7QbgOdndMkCHPKbONKa1h--

