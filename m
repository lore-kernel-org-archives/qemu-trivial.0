Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVfF0-0003DC-DB
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 10:37:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVfEv-00037P-7H
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 10:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVfEu-0001o2-2r
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 10:37:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56162)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dVfEo-0001ku-LD; Thu, 13 Jul 2017 10:37:06 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 651137CE14;
	Thu, 13 Jul 2017 14:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 651137CE14
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 651137CE14
Received: from [10.10.121.60] (ovpn-121-60.rdu2.redhat.com [10.10.121.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC2236FABA;
	Thu, 13 Jul 2017 14:37:04 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1499955697-28045-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <da746ef9-1d03-5054-7ce5-7f7193b0894d@redhat.com>
Date: Thu, 13 Jul 2017 09:37:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499955697-28045-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="jwFCwkCXBVOnGVjaw0AVfCIrV4KNdgxVJ"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 13 Jul 2017 14:37:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Drop ancient
 Solaris 9 and earlier support
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
X-List-Received-Date: Thu, 13 Jul 2017 14:37:17 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jwFCwkCXBVOnGVjaw0AVfCIrV4KNdgxVJ
Content-Type: multipart/mixed; boundary="beWsWH7pXqNvgoNmF7FUKpMIKfajdUFK9";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: patches@linaro.org
Message-ID: <da746ef9-1d03-5054-7ce5-7f7193b0894d@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] configure: Drop ancient Solaris 9 and
 earlier support
References: <1499955697-28045-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1499955697-28045-1-git-send-email-peter.maydell@linaro.org>

--beWsWH7pXqNvgoNmF7FUKpMIKfajdUFK9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/13/2017 09:21 AM, Peter Maydell wrote:
> Solaris 9 was released in 2002, its successor Solaris 10 was
> released in 2005, and Solaris 9 was end-of-lifed in 2014.
> Nobody has stepped forward to express interest in supporting
> Solaris of any flavour, so removing support for the ancient
> versions seems uncontroversial.
>=20
> In particular, this allows us to remove a use of 'uname'
> in configure that won't work if you're cross-compiling.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not a big thing, but it's a start on cleaning out some
> of the untested and untestable cruft from configure...

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--beWsWH7pXqNvgoNmF7FUKpMIKfajdUFK9--

--jwFCwkCXBVOnGVjaw0AVfCIrV4KNdgxVJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZZ4WQAAoJEKeha0olJ0NqMjIIAJ+6uyISgomOALlQpyx/P/Wv
cLnx98RYz13gaJlN5mNS7pomiOsw4CDqAzTNGLUmdmHb5oYTPlvdXvilgVWJPvd0
pXOuNYINZ92NUipWCiH1ud9EcIxak/yAC9cHwCDvJ5XJEh9KjRUCAghWUz23mAA/
+v2e4DIXqYZMoQU8iG6rH97agDpLDRPwEbgndeLfM9n7l9FI4vnxZhAR/iSanvOV
Y8WJ2kG9CVxehHxJTrYM7bqE+plRSDSm23Dq3go3OPxp5R3iA8ck7dDGCAijznfk
sVKUIskUzwNrmmMP8Yzv2AgHP2K8rgm2EtIcFWQfX3LbQqKVF2VcFgRBozBvMrM=
=P1ks
-----END PGP SIGNATURE-----

--jwFCwkCXBVOnGVjaw0AVfCIrV4KNdgxVJ--

