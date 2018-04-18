Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8nES-00070V-9z
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 09:34:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f8nEN-0006xe-SC
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 09:34:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f8nEH-0000NH-SZ
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 09:34:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33052 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1f8nE9-0000Bv-AE; Wed, 18 Apr 2018 09:34:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6158EB6F6;
	Wed, 18 Apr 2018 13:34:24 +0000 (UTC)
Received: from [10.10.123.194] (ovpn-123-194.rdu2.redhat.com [10.10.123.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B97C1DB20;
	Wed, 18 Apr 2018 13:34:14 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	Olaf Hering <olaf@aepfle.de>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <7d58cb4c-9202-34d1-bfe0-1e4edc108be1@redhat.com>
Date: Wed, 18 Apr 2018 08:34:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180418124753.GM27579@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="TJUIfCo0r3vzTVK9QJFaplcfNvBGuAHBG"
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 18 Apr 2018 13:34:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 18 Apr 2018 13:34:24 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
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
X-List-Received-Date: Wed, 18 Apr 2018 13:34:42 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TJUIfCo0r3vzTVK9QJFaplcfNvBGuAHBG
Content-Type: multipart/mixed; boundary="miVI4qHVoD0MudEZ26gi02PEkGwq5R9PT";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 Olaf Hering <olaf@aepfle.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7d58cb4c-9202-34d1-bfe0-1e4edc108be1@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v1] configure: require glib-2.24
References: <20180418123838.3511-1-olaf@aepfle.de>
 <20180418124753.GM27579@redhat.com>
In-Reply-To: <20180418124753.GM27579@redhat.com>

--miVI4qHVoD0MudEZ26gi02PEkGwq5R9PT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/18/2018 07:47 AM, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Apr 18, 2018 at 02:38:37PM +0200, Olaf Hering wrote:
>> Since usage of g_realloc_n was introduced, glib-2.22 can not be used a=
nymore.
>> Fixes commit 418026ca43 ("util: Introduce vfio helpers")
>=20
> Normally we expect ./include/glib-compat.h to be changed in this scenar=
io
> to add compat for the missing symbol.

Or rewrite the offending addition of g_realloc_n to use something like
g_renew that IS available in 2.22 (this is not the first time the issue
has appeared; see commit 071d405, for example).

>=20
> IIRC, one of Peters desired build targets required 2.22, but I guess we=

> missed this bug because that platform would not enable vfio functionali=
ty ?

Which platform?  CentOS 6 is at glib 2.28; we also require 2.30 for
building on mingw.  I'm not seeing an easy document that says which
distros we still actively support, and which culprit distro has the
oldest glib.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--miVI4qHVoD0MudEZ26gi02PEkGwq5R9PT--

--TJUIfCo0r3vzTVK9QJFaplcfNvBGuAHBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlrXSVUACgkQp6FrSiUn
Q2q00wgApfrqgOUKX1cVqPnX/1M0/2BgOwI6fLdEiqj+FeEciWhHv0hVqa1m8RWP
qkukskBa+jlu4EnK+lnruNyZG7idmekrOZCCR7YUwNIgn5OsCMh+3jYKyMpmlaL1
p/OohKzFozkWLbazBUdXrGfiefckrpSK+Pmrk2xW5JAVWeQkNRG7eRQF/tS+ua9k
Xi0fPWzGpWq4CqOqwRXkZTtY2nTZDvYVRGu2BSkdNztepYpY483lLgZ2UPFA5vTj
HzHDUpIWfU9t9/SsVYr0rCx4ac9uIhQGNhzYRA3fPrYSSNkmBMN3awUkPCJpG3m0
CyYUHzVRSm6etpH7gggz2HcLSEwbRQ==
=mcva
-----END PGP SIGNATURE-----

--TJUIfCo0r3vzTVK9QJFaplcfNvBGuAHBG--

