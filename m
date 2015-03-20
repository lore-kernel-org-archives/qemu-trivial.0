Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYzoB-0000Ky-2T
	for mharc-qemu-trivial@gnu.org; Fri, 20 Mar 2015 12:30:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YYzo4-0000Kd-Td
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 12:30:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YYzo0-0006KC-ET
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 12:29:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33129)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YYzo0-0006K7-6B; Fri, 20 Mar 2015 12:29:52 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2KGTpT0027813
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 20 Mar 2015 12:29:51 -0400
Received: from [10.3.113.47] (ovpn-113-47.phx2.redhat.com [10.3.113.47])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2KGToFc016770; Fri, 20 Mar 2015 12:29:51 -0400
Message-ID: <550C4AFE.6080007@redhat.com>
Date: Fri, 20 Mar 2015 10:29:50 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1426868789-20873-1-git-send-email-eblake@redhat.com>
In-Reply-To: <1426868789-20873-1-git-send-email-eblake@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ESpMuIi5w9xiI7FtqVeQM3sTObxIbh3I8"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [for-2.3 PATCH] gitignore: Ignore
	more .pod files.
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
X-List-Received-Date: Fri, 20 Mar 2015 16:30:01 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ESpMuIi5w9xiI7FtqVeQM3sTObxIbh3I8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/20/2015 10:26 AM, Eric Blake wrote:
> kvm_stat.{1,pod} started showing up as untracked files in my
> directory, and I nearly accidentally merged them into a commit
> with my usual habit of 'git add .'.  Rather than naming every
> such generated doc file, just exclude the pattern.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> CC: qemu-trivial@nongnu.org
> ---

> -/qemu-nbd.8

> +*.1

Blech. Serves me right for not saving my buffer before hitting send.  v2
coming up that doesn't leak qemu-nbd.8 (or any other man page we might
add outside of section 1).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--ESpMuIi5w9xiI7FtqVeQM3sTObxIbh3I8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVDEr+AAoJEKeha0olJ0NqSosH/2ahiwyJq+0ZDe8NoOU6WMhr
SeE78/GuQEx8u7sLCz5hoaeqxUmCaAGN1IqDGpwQdDv4y/un4eQgI9j+FNoOQ6Tt
223+xwO2l0Rda80T5TAmDuhk71/rFMjFv6u5GvAAZW2Vxd7VheyppnB9nc9VwBEC
g78kRsw17wiJ3ui7wiXgYCwapadCpyXhb+rmgGn4CGl7CgH8N4SpXUYSh7jHWD5d
Rjnhy7whrXwFmGIni46VydJuZNoGn8AXWDQZJN6HuYPYxHzwV26lD7TZswqtG6d3
/8UJnUAmN7zxpHvbPsiXKySYg6/HTeXuPZ/G1F8jWufgamOvSt7RlZ7jR8c6NMc=
=4Sbz
-----END PGP SIGNATURE-----

--ESpMuIi5w9xiI7FtqVeQM3sTObxIbh3I8--

