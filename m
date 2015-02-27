Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRNrB-0005gu-RI
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 11:33:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YRNr8-0005ff-7u
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 11:33:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YRNr4-0002im-SA
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 11:33:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YRNr4-0002iT-Ko; Fri, 27 Feb 2015 11:33:34 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1RGXW32016702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 27 Feb 2015 11:33:32 -0500
Received: from [10.3.113.214] (ovpn-113-214.phx2.redhat.com [10.3.113.214])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1RGXTi2024064; Fri, 27 Feb 2015 11:33:32 -0500
Message-ID: <54F09C57.3030702@redhat.com>
Date: Fri, 27 Feb 2015 09:33:27 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
References: <60b9a8741264d4fc7042ae560ea859cd62babd1e.1425050482.git.crobinso@redhat.com>
In-Reply-To: <60b9a8741264d4fc7042ae560ea859cd62babd1e.1425050482.git.crobinso@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="hqwACqSmeIbmehPtXr9H5jnK9v54Clu0l"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gitignore: Track common.env
	in iotests gitignore
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
X-List-Received-Date: Fri, 27 Feb 2015 16:33:40 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hqwACqSmeIbmehPtXr9H5jnK9v54Clu0l
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/27/2015 08:21 AM, Cole Robinson wrote:
> Rather than track it in the toplevel gitignore
>=20
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>  .gitignore                    | 1 -
>  tests/qemu-iotests/.gitignore | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

I think that the fact that we have multiple .gitignore is confusing, and
would personally lean towards a patch that consolidates ALL ignores into
a single top-level file, instead of having to hunt multiple files for
patterns.  But my opinion on this matter is not strong enough for me to
provide a patch at this time...

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--hqwACqSmeIbmehPtXr9H5jnK9v54Clu0l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJU8JxXAAoJEKeha0olJ0NqdhMH/A1ZLxs/1MeE2z9NCSXRYfKC
2+HzcfpXpS3B3ELmAWT4ikIaURZ3YDxh4g1EixKCBnLxpEcmwIlFz2SvLBKgBSe7
exlrHSL3phOPNJexXrg0M64VbmsDWl9LqIBsCqB09of3ZcFzxp2miZSXuQAhfUoD
hH0f+rg/1GlywRKktkdIJ3M9W7BRd3hXLZl8GF0qP/To2WyjzN7o6gGeBgQGHGBw
MoQ/UWKvNwQpUvnrjgdUz/mmQqQnYdo8zDx6If48O6/5+DHtK/ytpcArAqUAOzLy
QmRcswqYKUfV6S42NwZE18LY+b0rfS4GFm+f8Q5hAXPzBlZjAmqNbO3ZPkeP/hk=
=+vy8
-----END PGP SIGNATURE-----

--hqwACqSmeIbmehPtXr9H5jnK9v54Clu0l--

