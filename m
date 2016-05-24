Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5FYJ-0005SM-4N
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 12:51:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b5FYD-0005Ot-Q1
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 12:51:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b5FY8-0000zs-TR
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 12:51:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b5FY2-0000xk-Fh; Tue, 24 May 2016 12:51:14 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C08BD8F302;
	Tue, 24 May 2016 16:51:13 +0000 (UTC)
Received: from [10.3.116.141] (ovpn-116-141.phx2.redhat.com [10.3.116.141])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4OGpDdq030804; Tue, 24 May 2016 12:51:13 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1464103479-26913-1-git-send-email-peter.maydell@linaro.org>
	<1464103479-26913-3-git-send-email-peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57448680.2070600@redhat.com>
Date: Tue, 24 May 2016 10:51:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1464103479-26913-3-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="2HE9cPcpgmplBiugXhJVpPSieidE6ex6H"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 24 May 2016 16:51:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/4] tests: Remove
 unnecessary glib.h includes
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
X-List-Received-Date: Tue, 24 May 2016 16:51:30 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2HE9cPcpgmplBiugXhJVpPSieidE6ex6H
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/24/2016 09:24 AM, Peter Maydell wrote:
> Remove glib.h includes, as it is provided by osdep.h.
>=20
> This commit was created with scripts/clean-includes.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

> +++ b/tests/ds1338-test.c
> @@ -21,7 +21,6 @@
>  #include "libqtest.h"
>  #include "libqos/i2c.h"
> =20
> -#include <glib.h>
> =20
>  #define IMX25_I2C_0_BASE 0x43F80000

I'm guessing we don't care about the double blank lines left for
cleanups like this (I know I don't, just pointing it out in case someone
else does).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--2HE9cPcpgmplBiugXhJVpPSieidE6ex6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXRIaAAAoJEKeha0olJ0NqZlIIAIEz66I/2d49gPIPH7v19bvs
YfeFGJ3wZekd219azDlp98cUTEe1koEBTchbq5M78857Q3hsA/HuwR5hZHnX3wXx
9RDdDkBhcUzzy1T6NcwM7chuGEonHEBDxrm6Ai1fRBHEAiyKmLioTq8nrIk0J2em
qObip2JPZP07qd4qm9rSqBfaRfa2LJqEZzKNL8FF0SRHe4IfjQJSgQ40AU20ad88
9XBzRqCvExkzpIMuNU+Q7Pryr8OZBZ22UullE6+8ED1H1ZFb8Fo7mO5fUgEjpqeA
quk1wk3yGMRsMYSkXCf8GTuejpr2VEw9zG0qE5g+8UzS090ByG57fSi23jj7bjI=
=9/8C
-----END PGP SIGNATURE-----

--2HE9cPcpgmplBiugXhJVpPSieidE6ex6H--

