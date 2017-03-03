Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjspF-0004NK-MX
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 14:25:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cjspD-0004LP-7L
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 14:25:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cjspC-0000MD-BI
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 14:25:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cjsp7-0000H7-R7; Fri, 03 Mar 2017 14:25:06 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFE0D80491;
	Fri,  3 Mar 2017 19:25:05 +0000 (UTC)
Received: from [10.10.124.87] (ovpn-124-87.rdu2.redhat.com [10.10.124.87] (may
	be forged))
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v23JP431003634; Fri, 3 Mar 2017 14:25:04 -0500
To: Suramya Shah <shah.suramya@gmail.com>, qemu-devel@nongnu.org
References: <20170303191805.1204-1-shah.suramya@gmail.com>
Cc: marcel@redhat.com, armbru@redhat.com,
	qemu-trivial <qemu-trivial@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <11661735-41ac-1830-6664-216af7cd317e@redhat.com>
Date: Fri, 3 Mar 2017 13:25:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170303191805.1204-1-shah.suramya@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Cfxf2G9cjSjXHbWIRlp4VEq5gHIteOJL8"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 03 Mar 2017 19:25:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Removed header
 qemu-common.h from path.c
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
X-List-Received-Date: Fri, 03 Mar 2017 19:25:12 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Cfxf2G9cjSjXHbWIRlp4VEq5gHIteOJL8
Content-Type: multipart/mixed; boundary="dvV5jh0Ismnwf7p2ooKi2iiKjlt89W23A";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Suramya Shah <shah.suramya@gmail.com>, qemu-devel@nongnu.org
Cc: marcel@redhat.com, armbru@redhat.com,
 qemu-trivial <qemu-trivial@nongnu.org>
Message-ID: <11661735-41ac-1830-6664-216af7cd317e@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] Removed header qemu-common.h from path.c
References: <20170303191805.1204-1-shah.suramya@gmail.com>
In-Reply-To: <20170303191805.1204-1-shah.suramya@gmail.com>

--dvV5jh0Ismnwf7p2ooKi2iiKjlt89W23A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[adding qemu-trivial in cc]

On 03/03/2017 01:18 PM, Suramya Shah wrote:
> Signed-off-by: Suramya Shah <shah.suramya@gmail.com>
> ---

It would have been nice to mention in the subject that this is v2 (v1
was here
https://lists.gnu.org/archive/html/qemu-devel/2017-03/msg00110.html),
and then mention here after the --- that the difference was a fix of a
typo that broke compilation.

Also, the subject line doesn't follow the usual conventions of "topic:
Description", a topic of 'util: ' may be appropriate.

>  util/path.c | 1 -
>  1 file changed, 1 deletion(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/util/path.c b/util/path.c
> index 5479f76..7f9fc27 100644
> --- a/util/path.c
> +++ b/util/path.c
> @@ -6,7 +6,6 @@
>  #include "qemu/osdep.h"
>  #include <sys/param.h>
>  #include <dirent.h>
> -#include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "qemu/path.h"
> =20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--dvV5jh0Ismnwf7p2ooKi2iiKjlt89W23A--

--Cfxf2G9cjSjXHbWIRlp4VEq5gHIteOJL8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYucMPAAoJEKeha0olJ0NqmywH/R4EJXqf+KEN1tMdPoUjKP5+
jlwR/EWB1kuNEyu9Cax/TI5o05wi72DOf48c3g3X0i+ygoNEDSYbgVgIzRopWy+T
ibN6LPWgGs+M+x4dEqn8iAzYxgguxLMCYt73cMpTpdI2W1XeiAy/nLvuXeBtL9/M
gd3P2bOmmkC6uwFQ0dyPWIXiKWXVtRjWhKgfXjq2oZVmUdhyL+5/BrrpUA6hhLWf
z8XtQqaYJuGiB1fruSdCeVP2oNLKuqrNPaa4Lp039Uykw0tdjEdguminb8Euqgu0
jXGpJGCwQgyPm1SMAhBHfO4itAOpKnSGaN0ZYc1Vct6EiA0N079LSNoW2r7RHLI=
=l6tR
-----END PGP SIGNATURE-----

--Cfxf2G9cjSjXHbWIRlp4VEq5gHIteOJL8--

