Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cimiQ-0000Mt-F6
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 13:41:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cimiN-0000LV-Rl
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 13:41:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cimiM-0002hA-Vu
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 13:41:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cimiI-0002ca-JT; Tue, 28 Feb 2017 13:41:30 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79A248047D;
	Tue, 28 Feb 2017 18:41:30 +0000 (UTC)
Received: from [10.10.124.125] (ovpn-124-125.rdu2.redhat.com [10.10.124.125]
	(may be forged))
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1SIfSG4011716; Tue, 28 Feb 2017 13:41:28 -0500
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1488303601-23741-1-git-send-email-thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>, Laszlo Ersek <lersek@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <01709a2f-9230-8c1e-ca6f-396f9ecc4e10@redhat.com>
Date: Tue, 28 Feb 2017 12:41:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1488303601-23741-1-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="dGrebtlFex2ntpdv3GvNGIt2iAxrLAO5I"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 28 Feb 2017 18:41:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] docs: Add a note about mixing bootindex
 with "-boot order"
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
X-List-Received-Date: Tue, 28 Feb 2017 18:41:36 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dGrebtlFex2ntpdv3GvNGIt2iAxrLAO5I
Content-Type: multipart/mixed; boundary="VgJh8kp1bDEfONGHKQlTlM2w8b3GM8TBh";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Laszlo Ersek <lersek@redhat.com>
Message-ID: <01709a2f-9230-8c1e-ca6f-396f9ecc4e10@redhat.com>
Subject: Re: [PATCH] docs: Add a note about mixing bootindex with "-boot
 order"
References: <1488303601-23741-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1488303601-23741-1-git-send-email-thuth@redhat.com>

--VgJh8kp1bDEfONGHKQlTlM2w8b3GM8TBh
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/28/2017 11:40 AM, Thomas Huth wrote:
> Occasionally the users try to mix the bootindex properties with the
> "-boot order" parameter - and this likely does not give the expected
> results. So let's add a proper statement that these two concepts
> should not be used together.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/bootindex.txt | 9 +++++++++
>  qemu-options.hx    | 5 ++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--VgJh8kp1bDEfONGHKQlTlM2w8b3GM8TBh--

--dGrebtlFex2ntpdv3GvNGIt2iAxrLAO5I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYtcRXAAoJEKeha0olJ0NqyAEH/jyj2I4DJdTDXAmiMBbtjp66
ZyDnffpRRORSEl70dq6CymE5h5eLr76rnyiFxJeeSG9p+fAO3Yc701rU5LPI2BmR
Vs1KJuGS+kwoVyijORTi5l8ofjRyOd+fdyeMZaOGswGcMQz21VZ/eLh2+bcdqnDD
evqBWYq66rRClPmAcREi2UJ4cPfOVUEAJtHQjXdwAw/ZIsbpUrqV6Q2kthDs51O2
k41x+Lbwih4c9gx3+WZRF8Is1+d7UOwHllEkGplvoIzaJO1d4pXurRkVBxyBDO3C
B1LXY5tCEXCI2ZjXP3edE/XVflwishRHBqabFNou42xr8dWQQCxcqQyEVMsowBw=
=A2+E
-----END PGP SIGNATURE-----

--dGrebtlFex2ntpdv3GvNGIt2iAxrLAO5I--

