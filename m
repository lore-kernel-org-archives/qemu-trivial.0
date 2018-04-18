Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8odM-00049P-EI
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 11:04:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f8odK-00048O-TB
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 11:04:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f8odH-0001At-2D
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 11:04:30 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49456 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1f8od6-00016i-EB; Wed, 18 Apr 2018 11:04:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA964406E8B9;
	Wed, 18 Apr 2018 15:04:12 +0000 (UTC)
Received: from [10.10.123.194] (ovpn-123-194.rdu2.redhat.com [10.10.123.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B3F31C723;
	Wed, 18 Apr 2018 15:04:03 +0000 (UTC)
To: Olaf Hering <olaf@aepfle.de>, qemu-trivial@nongnu.org
References: <20180418145443.6332-1-olaf@aepfle.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <7df49e91-aa65-d775-78eb-ddf53676dd7f@redhat.com>
Date: Wed, 18 Apr 2018 10:04:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180418145443.6332-1-olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="O5DKzP0mPbDx2l0S82kFbO1vtLB4HMCWQ"
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 18 Apr 2018 15:04:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 18 Apr 2018 15:04:12 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] configure: require
 glib-2.24 on Linux
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
X-List-Received-Date: Wed, 18 Apr 2018 15:04:31 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--O5DKzP0mPbDx2l0S82kFbO1vtLB4HMCWQ
Content-Type: multipart/mixed; boundary="rTko5ggjrqQodUoBxdj7Dy1UvuBCK10fn";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Olaf Hering <olaf@aepfle.de>, qemu-trivial@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7df49e91-aa65-d775-78eb-ddf53676dd7f@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] configure: require glib-2.24 on Linux
References: <20180418145443.6332-1-olaf@aepfle.de>
In-Reply-To: <20180418145443.6332-1-olaf@aepfle.de>

--rTko5ggjrqQodUoBxdj7Dy1UvuBCK10fn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/18/2018 09:54 AM, Olaf Hering wrote:
> Since usage of g_realloc_n was introduced, glib-2.22 can not be used
> anymore on Linux. Leave non-Linux unchanged because one developer syste=
m
> still uses it.
> Fixes commit 418026ca43 ("util: Introduce vfio helpers")
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  configure | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Rather than hacking configure, why not fix util/vfio-helpers.c to avoid
g_realloc_n()?  We've done it before; see commit 071d405

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--rTko5ggjrqQodUoBxdj7Dy1UvuBCK10fn--

--O5DKzP0mPbDx2l0S82kFbO1vtLB4HMCWQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlrXXmMACgkQp6FrSiUn
Q2oErwgArtHE1OO3SN414XYyx2BqWj07K+iNuyH4hX51WhfQ6RI6fiIE2lws5H/S
6lCYYcMn1wCndf+5Zd/ZoM4Yl2mHvIcR6UvbqqiMPMSKJ+iBfkj5gH4rOtU8PHp3
zr/rlUGQvIq5wo4RH3sWmAHfzrr2oKrpixNyEdke4/Ga0tnmoVTMfBlzY6cdvQA5
b7fPZMlHNvTo3P+QV1ApRmvxBQdWMPT/PZgaKj25qTf8QoX4YzUgH0hOMV1ndSW/
OEk3JWEgfLYPQ+p5TlqSzRQM7r7S4Jt5beAl6uf/ouzMwrPa6bo59UWpgZ1USCEQ
uvLMblMQ5lCXiXcNn4/HIT4R7MGnPg==
=Z9Pv
-----END PGP SIGNATURE-----

--O5DKzP0mPbDx2l0S82kFbO1vtLB4HMCWQ--

