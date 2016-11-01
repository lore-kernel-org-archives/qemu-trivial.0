Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1dF2-0003kd-Oj
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 13:52:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c1dF0-0003iJ-Dr
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 13:52:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c1dEz-0001SF-K5
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 13:52:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50862)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1c1dEu-0001PN-Cu; Tue, 01 Nov 2016 13:52:48 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CE2F4E4F6;
	Tue,  1 Nov 2016 17:52:45 +0000 (UTC)
Received: from [10.3.116.16] (ovpn-116-16.phx2.redhat.com [10.3.116.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA1Hqi61031273; Tue, 1 Nov 2016 13:52:44 -0400
To: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
References: <20161101171927.25684-1-sw@weilnetz.de>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <ccba1848-3170-c3d1-07ea-bfa2a02e70b6@redhat.com>
Date: Tue, 1 Nov 2016 12:52:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161101171927.25684-1-sw@weilnetz.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="9CltM0bwen9DPfLiwERfLiHqErUrx9IRA"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 01 Nov 2016 17:52:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Fix typos found by
 codespell
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
X-List-Received-Date: Tue, 01 Nov 2016 17:52:55 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9CltM0bwen9DPfLiwERfLiHqErUrx9IRA
Content-Type: multipart/mixed; boundary="qOX43Lat53rQUGLG9LNHqgmQ2VPaEomM6";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Message-ID: <ccba1848-3170-c3d1-07ea-bfa2a02e70b6@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] docs: Fix typos found by codespell
References: <20161101171927.25684-1-sw@weilnetz.de>
In-Reply-To: <20161101171927.25684-1-sw@weilnetz.de>

--qOX43Lat53rQUGLG9LNHqgmQ2VPaEomM6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/01/2016 12:19 PM, Stefan Weil wrote:
> Fix also some indefinite articles.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>=20
> I still don't understand the comment in docs/colo-proxy.txt.

Me neither.


> +++ b/docs/colo-proxy.txt
> @@ -158,7 +158,7 @@ secondary.
> =20
>  =3D=3D Usage =3D=3D
> =20
> -Here, we use demo ip and port discribe more clearly.
> +Here, we use demo ip and port describe more clearly.
>  Primary(ip:3.3.3.3):
>  -netdev tap,id=3Dhn0,vhost=3Doff,script=3D/etc/qemu-ifup,downscript=3D=
/etc/qemu-ifdown
>  -device e1000,id=3De0,netdev=3Dhn0,mac=3D52:a4:00:12:78:66

Maybe:

Here is an example using demonstration IP and port addresses to more
clearly describe the usage.

The remaining hunks are clear improvements, so:
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--qOX43Lat53rQUGLG9LNHqgmQ2VPaEomM6--

--9CltM0bwen9DPfLiwERfLiHqErUrx9IRA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYGNZsAAoJEKeha0olJ0NqhIYH/RaAODaockaGIRJ7TSq8tP+z
KOpDkf8IxROjBi7QhXmV4F+KnfaViBPLiKX6hwY4bQwcddEXXdNiNg9BXTNldcPI
YPizhDFT2OGqTM8fmAHTyeWXK8IRWpJR0bpA3Jv+fzf4lkcAaI9OAxtzkUoMGSk7
2NSmL2B8DCeQx7u84RdcbTXPpPVzIPNVRlVxqdb21vDR7/7RsLzMZqn5p5ElAWNW
T0ikLeTtXrfwcpmkakPHBHno+4yodsXCtQwHVx+o5sEw8/P9iSwcL02I1bCjHu64
MxaVusJh0m9CdQWIHbaJJg5bxgSwErWnFSVfQZQVpFw5NhnmAbSRpxeeP//BCZ8=
=KD9r
-----END PGP SIGNATURE-----

--9CltM0bwen9DPfLiwERfLiHqErUrx9IRA--

