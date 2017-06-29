Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQcHF-0005DN-11
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 12:26:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dQcHC-0005By-Nl
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 12:26:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dQcHB-0008Fy-8g
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 12:26:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41652)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dQcH5-0008Ci-4G; Thu, 29 Jun 2017 12:26:35 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B1CB1E33F;
	Thu, 29 Jun 2017 16:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9B1CB1E33F
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9B1CB1E33F
Received: from [10.10.123.78] (ovpn-123-78.rdu2.redhat.com [10.10.123.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B06138D560;
	Thu, 29 Jun 2017 16:26:23 +0000 (UTC)
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <20170629162046.4135-1-berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <875e1a54-863c-a632-9cad-9880416d8693@redhat.com>
Date: Thu, 29 Jun 2017 11:26:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170629162046.4135-1-berrange@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="2DRE7LqvELXkQNGNLFGwqbCsNDB2rnjkr"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 29 Jun 2017 16:26:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] backends: remove empty
 trace-events file
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
X-List-Received-Date: Thu, 29 Jun 2017 16:26:43 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2DRE7LqvELXkQNGNLFGwqbCsNDB2rnjkr
Content-Type: multipart/mixed; boundary="48enNOr3CTEmkQTLohCkWet7BsA8Uot2G";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <875e1a54-863c-a632-9cad-9880416d8693@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] backends: remove empty trace-events file
References: <20170629162046.4135-1-berrange@redhat.com>
In-Reply-To: <20170629162046.4135-1-berrange@redhat.com>

--48enNOr3CTEmkQTLohCkWet7BsA8Uot2G
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/29/2017 11:20 AM, Daniel P. Berrange wrote:
> The content of the backends/trace-events file was entirely
> removed in
>=20
>   commit 6b10e573d15ef82dbc5c5b3726028e6642e134f6
>   Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>   Date:   Mon May 29 12:39:42 2017 +0400
>=20
>     char: move char devices to chardev/
>=20
> Leaving the empty file around, causes tracetool to generate
> an empty .dtrace file which makes the dtrace compiler throw
> a syntax error.
>=20
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  Makefile.objs         | 1 -
>  backends/trace-events | 0
>  2 files changed, 1 deletion(-)
>  delete mode 100644 backends/trace-events

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--48enNOr3CTEmkQTLohCkWet7BsA8Uot2G--

--2DRE7LqvELXkQNGNLFGwqbCsNDB2rnjkr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZVSouAAoJEKeha0olJ0NqEWQIAIKw6ZO28mq+lpH03u2U+iox
3z6tqq9y1ud78oHXwPZIK5qp85RKTMSXpHn6MX8zlmCS7ghKL8QqqSu9uvodQB0x
1frUeh81ySx7QNxxzNfUXlcKI3Eq+g8jQkdj/tqd+uxNTrIxApXO1cf6J+cuy2VR
xLC9Blqqgm6KGUGJr4cyu8dRcw4sLisGSYxBdz+qOJNTOSuN3KRDpA3JvHiHDwC1
g8KdJCAcIjypIYU9mJUn5HSJ//jPdG9PUmq8GS7bCPiAzeqQ73NHGD65bSBas1uA
NSDfRA9vrMYvufD2R8m/yGT3FDSodH3QxY51oONiYhaZ2VPkV8hRI4j6OIQG5H4=
=UYio
-----END PGP SIGNATURE-----

--2DRE7LqvELXkQNGNLFGwqbCsNDB2rnjkr--

