Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfsEp-0007k9-2L
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2015 12:22:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZfsEm-0007hV-Ot
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZfsEl-0006IY-St
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZfsEh-0006HC-Kk; Sat, 26 Sep 2015 12:22:07 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 0ADE98E68A;
	Sat, 26 Sep 2015 16:15:40 +0000 (UTC)
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8QGFYnI014595; Sat, 26 Sep 2015 12:15:35 -0400
To: Shraddha Barke <shraddha.6596@gmail.com>, kvm@vger.kernel.org,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
References: <1443170278-9318-1-git-send-email-shraddha.6596@gmail.com>
	<1443170278-9318-3-git-send-email-shraddha.6596@gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5606C4A1.60509@redhat.com>
Date: Sat, 26 Sep 2015 10:15:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443170278-9318-3-git-send-email-shraddha.6596@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="EuoraqkL6ibUvVDmOciV2opmg4guD8Orm"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/3] Target-ppc: Remove
	unnecessary variable
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
X-List-Received-Date: Sat, 26 Sep 2015 16:22:13 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EuoraqkL6ibUvVDmOciV2opmg4guD8Orm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/25/2015 02:37 AM, Shraddha Barke wrote:
> Compress lines and remove the variable.
>=20

> +++ b/target-ppc/kvm.c
> @@ -1782,8 +1782,7 @@ uint32_t kvmppc_get_tbfreq(void)
> =20
>      ns++;
> =20
> -    retval =3D atoi(ns);
> -    return retval;
> +    return atoi(ns);

atoi() is lousy; it cannot properly detect user input errors.  This
should probably be converted to use the appropriate qemu_strtol variant
instead.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--EuoraqkL6ibUvVDmOciV2opmg4guD8Orm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWBsSmAAoJEKeha0olJ0NqhKAH/2yu7OdT83+/AGDc95MwT2Lp
hif8cllpZR0ILRezGDwQp++/B3XnSwXxvGlMLXvNh9uXVRKiFkbGEdOViq1vva2j
RW5rrvz0syRo+O1fNZ32pad4zuSdASP2HNq4e/xm8Z4aYNLvNlmyvnlRfdPaVIqL
wM+VCOuX+SHa1jNG9QdSxCJUNfwWlRqNYbhOWBTj6bvaV0+dsb+VQygmtabzfrIT
UpnTNnZJCWI61O+bekSWoSDpCRGkpjc/putLiYAdCFCF3h+EmabkNOpslabB9dOl
y6f+bmwBIWV/iIDLNDGDyp6g2IMgrGDJG3kTdnK3vN30a0sqlwvN+cSC6afI18Q=
=iT3e
-----END PGP SIGNATURE-----

--EuoraqkL6ibUvVDmOciV2opmg4guD8Orm--

