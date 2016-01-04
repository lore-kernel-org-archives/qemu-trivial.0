Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aG9Ze-0004Kx-2Y
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jan 2016 13:09:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aG9Zc-0004Ii-7M
	for qemu-trivial@nongnu.org; Mon, 04 Jan 2016 13:09:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aG9Zb-0007s6-99
	for qemu-trivial@nongnu.org; Mon, 04 Jan 2016 13:09:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55733)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1aG9ZV-0007r7-2f; Mon, 04 Jan 2016 13:09:33 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 3C2938E221;
	Mon,  4 Jan 2016 18:09:32 +0000 (UTC)
Received: from [10.3.113.119] (ovpn-113-119.phx2.redhat.com [10.3.113.119])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u04I9V2U030786; Mon, 4 Jan 2016 13:09:31 -0500
To: Sitsofe Wheeler <sitsofe@yahoo.com>, qemu-devel@nongnu.org
References: <20151230195338.GA25149@sucs.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <568AB556.4090800@redhat.com>
Date: Mon, 4 Jan 2016 11:09:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20151230195338.GA25149@sucs.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="xs5lLQuwuh2oHVspcBDVPpwCjw9j0RlAg"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] qemu-nbd: Fix
 unintended texi verbatim formatting
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
X-List-Received-Date: Mon, 04 Jan 2016 18:09:41 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xs5lLQuwuh2oHVspcBDVPpwCjw9j0RlAg
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/30/2015 12:54 PM, Sitsofe Wheeler wrote:

[meta-comment] When sending a patch series, it's best to also include a
0/2 cover letter that summarizes the series.  Doable with 'git config
format.coverLetter auto'.

> Indented lines in the texi meant the perlpod produced interpreted the
> paragraph as being verbatim (thus formatting codes were not
> interpreted). Fix this by un-indenting problem lines.
>=20
> Signed-off-by: Sitsofe Wheeler <sitsofe@yahoo.com>
> ---
>  qemu-nbd.texi | 58 +++++++++++++++++++++++++++++----------------------=
-------
>  1 file changed, 29 insertions(+), 29 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--xs5lLQuwuh2oHVspcBDVPpwCjw9j0RlAg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWirVWAAoJEKeha0olJ0NquegH/jSjH7NZcOXAfAZrFbvryAaC
QtTznDN0ZMhXNVsG/g9QKC99zvGicWBU6RxGcePZHa2IUGGDsN7sV960RQFKEWBx
C1o6mTt8OIsRBZYRBRyFj/25QhOOhahjC64oGiw7qc3ozHfJjQVZ8WwVr1Q55VZg
MOrFV3qF4SIZuo4c6Go22FiEgsllmKyTF7F/XquE8TgafZAhR2ySmrqeeKK4OB4R
OzDWVWJWHOj0zmVtw/3nQT7ZpVcr0UtvPPZY3gaU/iPaM6cZq4CXYf3TMwD5jcUF
BA9FxtEagJ1TUWfytc8XGdxEQ1kgeHyjVZiA9Lt0pClGOVUeAKmU2J8gLT+Nn2E=
=k5Q9
-----END PGP SIGNATURE-----

--xs5lLQuwuh2oHVspcBDVPpwCjw9j0RlAg--

