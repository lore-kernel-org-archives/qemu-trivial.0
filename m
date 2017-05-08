Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sYQ-0003VT-9S
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:59:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d7sYO-0003Tc-G8
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:59:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d7sYN-00020c-Hz
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:59:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34300)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d7sYF-0001w1-CT; Mon, 08 May 2017 19:58:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 207F96856;
	Mon,  8 May 2017 23:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 207F96856
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 207F96856
Received: from [10.10.122.86] (ovpn-122-86.rdu2.redhat.com [10.10.122.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5FC418A20;
	Mon,  8 May 2017 23:58:47 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, John Snow
	<jsnow@redhat.com>, qemu-block@nongnu.org
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-5-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56387911-b587-adf0-c65b-ed12374d604d@redhat.com>
Date: Mon, 8 May 2017 18:58:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170508233918.9043-5-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="KW7SIcisNcrGPAvwQestLe73ANH5MJxpA"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 08 May 2017 23:58:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/11] ide/ahci: add missing
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
X-List-Received-Date: Mon, 08 May 2017 23:59:01 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KW7SIcisNcrGPAvwQestLe73ANH5MJxpA
Content-Type: multipart/mixed; boundary="C269A2S98QIBj94gQfMo8gg4PV1b8rrdr";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, John Snow
 <jsnow@redhat.com>, qemu-block@nongnu.org
Message-ID: <56387911-b587-adf0-c65b-ed12374d604d@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 04/11] ide/ahci: add missing includes
References: <20170508233918.9043-1-f4bug@amsat.org>
 <20170508233918.9043-5-f4bug@amsat.org>
In-Reply-To: <20170508233918.9043-5-f4bug@amsat.org>

--C269A2S98QIBj94gQfMo8gg4PV1b8rrdr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/08/2017 06:39 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> qemu/include/hw/ide/ahci.h:260:16: error: field =E2=80=98sglist=E2=80=99=
 has incomplete type
>      QEMUSGList sglist;
>                 ^~~~~~

What are you doing to get this compilation error (configure options,
platform, compiler, etc)?  I can't reproduce it. Is it something that
pops up later when you remove includes from somewhere else, and you're
just pre-emptively adding includes here to allow removal of includes late=
r?

> /qemu/include/hw/ide/ahci.h:272:5: error: unknown type name =E2=80=98ID=
EDMA=E2=80=99
>      IDEDMA dma;
>      ^~~~~~
> qemu/include/hw/ide/ahci.h:273:5: error: unknown type name =E2=80=98IDE=
Bus=E2=80=99
>      IDEBus port;
>      ^~~~~~
> qemu/include/hw/ide/ahci.h:305:15: error: field =E2=80=98parent_obj=E2=80=
=99 has incomplete type
>      PCIDevice parent_obj;
>                ^~~~~~~~~~
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/ide/ahci.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
> index 0ca7c65820..293f9ebcd0 100644
> --- a/include/hw/ide/ahci.h
> +++ b/include/hw/ide/ahci.h
> @@ -25,6 +25,8 @@
>  #define HW_IDE_AHCI_H
> =20
>  #include "hw/sysbus.h"
> +#include "hw/ide/internal.h"
> +#include "sysemu/dma.h"
> =20
>  #define AHCI_MEM_BAR_SIZE         0x1000
>  #define AHCI_MAX_PORTS            32
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--C269A2S98QIBj94gQfMo8gg4PV1b8rrdr--

--KW7SIcisNcrGPAvwQestLe73ANH5MJxpA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZEQY3AAoJEKeha0olJ0NqoL8IALDMIPnOD8FbdQ0LqOICKHTu
hCKRKBS4zpGarbKt6NbRxtAc50kmMFUJCvmYj1UDiRNBhnk3eKF6tPD8Io3TbAME
acknbw5FANxP0zZDlo7niwWPC0oQ8lGGS1+ktcGFGkT0t6Vvu/E48BrG5bLGMAJp
HebvncGTMMtLzhaJ/dDnKg7QG1DNm6ILryysIvjRpIQYgJPhRNZEdUXe/t7mOWqC
CwJKzeUBfhg/ZLVgYgVpLtWG99x0R5UQQygVtVC2nd29mk9gGTUkTpRTkOjugGfr
BqtWCxJbycF8vDduqKcFiDXO96L9EBvVmb04r0YXWU4JDW7FCSsokyUYuM01uBY=
=wYxQ
-----END PGP SIGNATURE-----

--KW7SIcisNcrGPAvwQestLe73ANH5MJxpA--

