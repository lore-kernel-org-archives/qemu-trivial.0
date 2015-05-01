Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yo9xH-0005xI-Uc
	for mharc-qemu-trivial@gnu.org; Fri, 01 May 2015 08:22:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yo9xF-0005tV-KS
	for qemu-trivial@nongnu.org; Fri, 01 May 2015 08:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yo9xE-0001L5-On
	for qemu-trivial@nongnu.org; Fri, 01 May 2015 08:22:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Yo9xA-0001Kc-EN; Fri, 01 May 2015 08:22:00 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 12E07A10BD;
	Fri,  1 May 2015 12:22:00 +0000 (UTC)
Received: from [10.3.113.25] (ovpn-113-25.phx2.redhat.com [10.3.113.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t41CLxWw028587; Fri, 1 May 2015 08:21:59 -0400
Message-ID: <55436FE6.8070305@redhat.com>
Date: Fri, 01 May 2015 06:21:58 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1430477086-26830-1-git-send-email-berrange@redhat.com>
In-Reply-To: <1430477086-26830-1-git-send-email-berrange@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="TF8HRDQacL8bbgi6QLsLbX20S7tE1PRq0"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui: remove check for
	failure of qemu_acl_init()
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
X-List-Received-Date: Fri, 01 May 2015 12:22:06 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TF8HRDQacL8bbgi6QLsLbX20S7tE1PRq0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/01/2015 04:44 AM, Daniel P. Berrange wrote:
> The qemu_acl_init() function has long since stopped being able
> to return NULL, since g_malloc will abort on OOM. As such the
> checks for NULL were unreachable code.
>=20
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  ui/vnc.c | 8 --------
>  1 file changed, 8 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--TF8HRDQacL8bbgi6QLsLbX20S7tE1PRq0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVQ2/nAAoJEKeha0olJ0Nq6roH/08S32qQTa7Ytg+Jp8T8edyb
4CTnCDAzm5zTPtJvO9fpqwb2wAyWtia/iboL3NGAuBcP2Pxya74HY6vtqR41ouJW
CzqVqIbvqMDB7HGg80XH9723tztfBmxj41X3ux6DWy/r4mYgw8zztMoJf7sWe/T9
stvlsN2+WsRmivKxVfrMn28KYU2vC8o5jJgm+or11niOxCZdKnBbgICwxvx5MAdf
DfMhMmZgw0TOjSEZCjOBidO7H5SqRmuPLYl+TaKnRhtzqcy439y5RBdwXoutwl2C
3tY6F/gIEPnuCtxaPd/RTM5eRv0r97ien2Kww1mZTlerijy5cEPCqocYrpP1we4=
=MlGB
-----END PGP SIGNATURE-----

--TF8HRDQacL8bbgi6QLsLbX20S7tE1PRq0--

