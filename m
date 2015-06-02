Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzoeK-0007zf-LG
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 12:02:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YzoeH-0007uU-Qd
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 12:02:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YzoeG-0005ZE-VY
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 12:02:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57603)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Yzoe6-0005Vs-Rz; Tue, 02 Jun 2015 12:02:30 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 46A8FA10B3;
	Tue,  2 Jun 2015 16:02:30 +0000 (UTC)
Received: from [10.3.113.29] (ovpn-113-29.phx2.redhat.com [10.3.113.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t52G2RXq004326; Tue, 2 Jun 2015 12:02:27 -0400
Message-ID: <556DD392.3040703@redhat.com>
Date: Tue, 02 Jun 2015 10:02:26 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1433258768-28946-1-git-send-email-berrange@redhat.com>
In-Reply-To: <1433258768-28946-1-git-send-email-berrange@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="R4dPxQrOrnvu9ITgBVhkM8W7n1qpt2KmI"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add .dir-locals.el file to
 configure emacs coding style
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
X-List-Received-Date: Tue, 02 Jun 2015 16:02:42 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--R4dPxQrOrnvu9ITgBVhkM8W7n1qpt2KmI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/02/2015 09:26 AM, Daniel P. Berrange wrote:
> The default emacs setup indents by 2 spaces and uses tabs
> which is counter to the QEMU coding style rules. Adding a
> .dir-locals.el file in the top level of the GIT repo will
> inform emacs about the QEMU coding style, and so assist
> contributors in avoiding common style mistakes before
> they submit patches.
>=20
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  .dir-locals.el | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 .dir-locals.el

Since we already have .exrc to do the same for vim users, I'm all in
favor of this.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--R4dPxQrOrnvu9ITgBVhkM8W7n1qpt2KmI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVbdOSAAoJEKeha0olJ0NqxcAH/jD6bfcUCK2aXPYkPnA1dytr
Zx0WQS4TicXitX8Kz2b2/zUvNPHgSCnAxYyXVPJFnO+L5DeoNfMWkDqK92z2+tu2
XXEQQS2wFAh5TnqR/S9SFz6R61O/Je3C01/E565uBMZ7mchvTu/02ITDjmtnDSNH
xu7HPqMpJk44iTwIdrQgeA7EQPyz5nuY2R/apwJByF3hHzHrAVNJD9L0JWJaOe59
L3lV7GqHMbRYO5HYhM4xKJlAGyrU+5N0Z/epoPT145LsVwVHw4oKGGuW08zfh+iB
WELsmKA5iCbhpocYehpH3pTBOvOA7OZRjCS55nCKr+D53bpBs8UwMcqJSjEFR6E=
=1qQ8
-----END PGP SIGNATURE-----

--R4dPxQrOrnvu9ITgBVhkM8W7n1qpt2KmI--

