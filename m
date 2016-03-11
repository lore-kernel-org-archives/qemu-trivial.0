Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aeR8e-0005u6-8j
	for mharc-qemu-trivial@gnu.org; Fri, 11 Mar 2016 12:46:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aeR8a-0005nn-UB
	for qemu-trivial@nongnu.org; Fri, 11 Mar 2016 12:46:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aeR8a-00014V-1a
	for qemu-trivial@nongnu.org; Fri, 11 Mar 2016 12:46:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59819)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1aeR8R-00012j-Mw; Fri, 11 Mar 2016 12:45:59 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id CA59385541;
	Fri, 11 Mar 2016 17:45:58 +0000 (UTC)
Received: from [10.3.113.30] (ovpn-113-30.phx2.redhat.com [10.3.113.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2BHjwV5011558; Fri, 11 Mar 2016 12:45:58 -0500
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Siddharth Gupta <siddharthgupta04@gmail.com>, qemu-devel@nongnu.org
References: <CALwKnOgaM2AKdHX+tJ8vh17rh3Hdd4uqdVBCZ=su-Asi=0eL_A@mail.gmail.com>
	<56E2E95F.1080901@mail.uni-paderborn.de>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56E30455.9000803@redhat.com>
Date: Fri, 11 Mar 2016 10:45:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E2E95F.1080901@mail.uni-paderborn.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="164DbxBqEp2pI6jwiwCQTqxxPPSmIXMqr"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] BitsSizedTasks-LargeFrames
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
X-List-Received-Date: Fri, 11 Mar 2016 17:46:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--164DbxBqEp2pI6jwiwCQTqxxPPSmIXMqr
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/11/2016 08:50 AM, Bastian Koppelmann wrote:
> Hi Siddharth,
>=20
> thanks for the patch. Can you resend it inlined into the e-mail instead=

> of an attachment? I usually use git send-email for that.
> My workflow (once you have configured git send-email) would be:
>=20
> - git format-patch -1
> - git send-email --to=3D"qemu-devel@nongnu.org"
> --cc=3D"qemu-trivial@nongnu.org" *.patch
>=20
> Also there is a page on the wiki on how to submit a patch [1]. If you
> want to avoid a lot of re-sending you might want to look into it :).
>=20
> Cheers,
> Bastian
>=20
> [1] http://wiki.qemu.org/Contribute/SubmitAPatch

Also, there's a typo in your subject line (should be 'bitesized', not
'bitssized'). And don't forget to add your Signed-off-by.


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--164DbxBqEp2pI6jwiwCQTqxxPPSmIXMqr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJW4wRVAAoJEKeha0olJ0Nqc5EH/jOeR9E8v993e+0KWQUHrXCu
evOeZrQMXYVAAfXuKcf6oUxQ1A2tKOyec9/WuviG+26LIvakmyDg9ahoJhpd5++s
gWpxI4F6+9DHguDXYAi2tsX7tWjZX7JIJnd4mIWKw5h8OWq45TpPrZo5DXxlnRVt
s00uoKFqSgaVW9f1eFHlMEgzg6qucFQYeeBbDQjVbaU/fgElkyr694QxC/RZaQyG
RXDN7SKJzZgQfIHKUfy6vSMs4lzVofXLrenPWsPRC1Tbam+XrBLZJG+9HJ3TMkEs
AJJj381uEeCSuVqmYeYiaBjD8jRLxXBaohCAWC6Y1xSQ64TFZwpkAZTVuYOwBy8=
=phV5
-----END PGP SIGNATURE-----

--164DbxBqEp2pI6jwiwCQTqxxPPSmIXMqr--

