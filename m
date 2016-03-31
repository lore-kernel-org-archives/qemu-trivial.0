Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1alfJO-0006D3-FF
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2016 12:19:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1alfJM-0006AM-5h
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 12:19:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1alfJL-00042k-BY
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 12:19:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1alfJG-00041w-S6; Thu, 31 Mar 2016 12:19:02 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0B30C050064;
	Thu, 31 Mar 2016 16:19:01 +0000 (UTC)
Received: from [10.3.113.124] (ovpn-113-124.phx2.redhat.com [10.3.113.124])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2VGJ1B9029844; Thu, 31 Mar 2016 12:19:01 -0400
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1459429690-6144-1-git-send-email-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56FD4DF4.40004@redhat.com>
Date: Thu, 31 Mar 2016 10:19:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <1459429690-6144-1-git-send-email-berrange@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="d21FAgH3dkqT1Dlf1lw5hVjiO2VROS6XF"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] net: fix missing include
 of qapi/error.h in netmap.c
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
X-List-Received-Date: Thu, 31 Mar 2016 16:19:09 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--d21FAgH3dkqT1Dlf1lw5hVjiO2VROS6XF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/31/2016 07:08 AM, Daniel P. Berrange wrote:
> The netmap.c file fails to build on FreeBSD with
>=20
> net/netmap.c:95:9: warning: implicit declaration of function 'error_set=
g_errno' is invalid in C99 [-Wimplicit-function-declaration]
>      error_setg_errno(errp, errno, "Failed to nm_open() %s",
>      ^
> net/netmap.c:432:9: warning: implicit declaration of function 'error_pr=
opagate' is invalid in C99 [-Wimplicit-function-declaration]
>      error_propagate(errp, err);
>      ^
>=20
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  net/netmap.c | 1 +
>  1 file changed, 1 insertion(+)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--d21FAgH3dkqT1Dlf1lw5hVjiO2VROS6XF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJW/U30AAoJEKeha0olJ0Nqs5kH/Rvx329RKO1WlGf1XhWpQhPS
it/7C2ozZfYEbWnNLFtwIO13TK9cJyztxoTX5SzIEZkjB9/jPq+R5aCyfCL/AHc2
g5/lu08Zthkfiut7ZYbTYepxLiRDFyFRh/xrUuKBt1gmEM1XnIMGH+7JwJA/XQRr
kTBLFs2uiqquapamc2lcF6Sp1Rg+YlC+s41BWq7NahciK8yWV/HzHinbbOyrWJvu
f6ei3dVv4/vaOHdctYsbNPoShuq+5xKnofXmj9rX2qZUB4XP2obuEuTRg1lB/EKE
ohI1Rj0n9s61cpp2ScB055nI6LS6uVCfNtPKYt6TIGk4DwlKk//7Svcq5ifUXyo=
=9GR3
-----END PGP SIGNATURE-----

--d21FAgH3dkqT1Dlf1lw5hVjiO2VROS6XF--

