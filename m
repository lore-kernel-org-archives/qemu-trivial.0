Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQKMR-0007st-8v
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 13:33:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WQKML-0007iz-CU
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 13:33:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WQKMG-0007Oe-VE
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 13:32:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:22913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WQKM7-0007NT-JW; Wed, 19 Mar 2014 13:32:43 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2JHWefV011302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 19 Mar 2014 13:32:41 -0400
Received: from [10.3.113.45] (ovpn-113-45.phx2.redhat.com [10.3.113.45])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2JHWdJG027969; Wed, 19 Mar 2014 13:32:40 -0400
Message-ID: <5329D4B7.4090602@redhat.com>
Date: Wed, 19 Mar 2014 11:32:39 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1395247965-13889-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1395247965-13889-1-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Odq9bwJKpfVrLJf2JxNLAN7UxSUFtUnX3"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] scripts: add sample
 model file for Coverity Scan
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Mar 2014 17:33:02 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Odq9bwJKpfVrLJf2JxNLAN7UxSUFtUnX3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/19/2014 10:52 AM, Paolo Bonzini wrote:
> This is the model file that is being used for the QEMU project's scans
> on scan.coverity.com.  It fixed about 30 false positives (10% of the
> total) and exposed about 60 new memory leaks.
>=20
> The file is not automatically used; changes to it must be propagated
> to the website manually by an admin (right now Markus, Peter and me
> are admins).
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Double S-o-B looks odd.


> + *
> + * Copyright (C) 2014 Red Hat, Inc.
> + *
> + * Authors:
> + *  Markus Armbruster <armbru@redhat.com>
> + *  Paolo Bonzini <pbonzini@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or,=
 at your
> + * option, any later version.  See the COPYING file in the top-level d=
irectory.

Aren't the license and authors blurbs usually in the other order?


> +
> +#define NULL (void *)0

Missing ()

> +#define assert(x) if (!(x)) __coverity_panic__();

Will this break any 'if () assert(); else {}' blocks?  Obviously, such
blocks already violate coding convention, but you might as well make
this definition safe to use for older code.

> +
> +static void __write(uint8_t *buf, int len)

Will the fact that you used 'int len' instead of 'size_t' bite us on 32-
vs. 64-bit?  Same for __read.


> +void *
> +g_malloc0 (size_t n_bytes)
> +{
> +    void *mem;
> +    __coverity_negative_sink__((ssize_t) n_bytes);
> +    mem =3D calloc(1, n_bytes =3D=3D 0 ? 1 : n_bytes);
> +    if (!mem) __coverity_panic__ ();

Is it worth being consistent on spacing before (?

> +void g_free (void *mem)
> +{
> +    if (mem) {
> +        free(mem);
> +    }

Doesn't coverity already know that free(NULL) is a no-op, without you
having to repeat it?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Odq9bwJKpfVrLJf2JxNLAN7UxSUFtUnX3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTKdS3AAoJEKeha0olJ0NqtpUIAI9EorODi+CmuGra49SjrFUV
1GwWx+pRmIZIBNK6FaGf6AipJJCcyKwH3tCJDPvJrW/Uns3BL/Jay+BiOSRBVBuB
vH0w9RzK9v0TmekXs5c7dKL8Yd7PwBFZrKhabrY+dsH/A4iOVuGckT1FQbkU8y7o
BUdGHM5xbX972uWyyoYTmpxX56BRsdooR3wTrleuBAPLGdVpRbtKAL/IGwi9jKfG
/2+G0rbaQGjxymvXIFJYitiLEtTpJ+74Ayvy0Nri/IcmnZ7FtB0Ojp8Gzr2ZIF9m
opzDAGm7KJuTR1+V0NVvWXDstupmqpuLIGgZrqpjdu59q14AIPfHfKRwnSikDKM=
=y9Kt
-----END PGP SIGNATURE-----

--Odq9bwJKpfVrLJf2JxNLAN7UxSUFtUnX3--

