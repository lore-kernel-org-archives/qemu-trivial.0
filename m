Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db4CP-0003Xw-3I
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:16:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1db4CM-0003Vp-P9
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:16:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1db4CL-00013T-Sf
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:16:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45650)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1db4CG-0000x7-2N; Fri, 28 Jul 2017 08:16:48 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04323365924;
	Fri, 28 Jul 2017 12:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 04323365924
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.120.22] (ovpn-120-22.rdu2.redhat.com [10.10.120.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 324A177C9A;
	Fri, 28 Jul 2017 12:16:46 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-38-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <3013cc2c-32c6-cd55-cb5c-a9982370e190@redhat.com>
Date: Fri, 28 Jul 2017 07:16:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728053610.15770-38-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="rk4gHXCsn3Prtnkt2jVjir7Qhcl9xNm8k"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 28 Jul 2017 12:16:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 37/47] MAINTAINERS: update docs/devel/
 entries
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
X-List-Received-Date: Fri, 28 Jul 2017 12:16:55 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rk4gHXCsn3Prtnkt2jVjir7Qhcl9xNm8k
Content-Type: multipart/mixed; boundary="5QQDmqcMf5utkGPSkcxwxGKLhdGc7Xr6h";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <3013cc2c-32c6-cd55-cb5c-a9982370e190@redhat.com>
Subject: Re: [PATCH 37/47] MAINTAINERS: update docs/devel/ entries
References: <20170728053610.15770-1-f4bug@amsat.org>
 <20170728053610.15770-38-f4bug@amsat.org>
In-Reply-To: <20170728053610.15770-38-f4bug@amsat.org>

--5QQDmqcMf5utkGPSkcxwxGKLhdGc7Xr6h
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/28/2017 12:36 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Might be useful to point to the commit id that moved locations of the doc=
s.

> ---
>  MAINTAINERS | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--5QQDmqcMf5utkGPSkcxwxGKLhdGc7Xr6h--

--rk4gHXCsn3Prtnkt2jVjir7Qhcl9xNm8k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll7Ky0ACgkQp6FrSiUn
Q2pHdAf8DSEu3CJiWzdcBfpDc+8yyAKcZYUD9sWMCH4HO/g3onDbmQl7EAC3YTmO
XcamA94nBto9CZSFKfByPRZ6A7IsTbKlNN16lPFH8JP59XB6mu2cmnjA7+FSbtya
g0GByFYVNl9OVRlFEpzo6onhd5kA83GpmBa+pJuMBhoYrkIKNtkC8wVP4Lv1/pqJ
5JXt/IXMe4tKR0tWZj6/ufzHqvR4C9wb15kdA7wrqViiwbB40rJv1jK/2+u73CBt
TB8/EUUbkuWsCoFBmPtmK7P06/E6H8jemQL4UrAFDVn8lwCdXeZagp3YSham7zYN
Yrxi8c4YeKoskTlGmrz80S0c+YwFfw==
=WfQ4
-----END PGP SIGNATURE-----

--rk4gHXCsn3Prtnkt2jVjir7Qhcl9xNm8k--

