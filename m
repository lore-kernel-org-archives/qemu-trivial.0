Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzT6N-0006UJ-Tn
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2015 13:02:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YzT6F-0006Fr-WB
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 13:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YzT6F-0003lV-6I
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 13:02:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YzT68-0003jx-Ov; Mon, 01 Jun 2015 13:02:00 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id D6FE236D044;
	Mon,  1 Jun 2015 17:01:59 +0000 (UTC)
Received: from [10.3.113.29] (ovpn-113-29.phx2.redhat.com [10.3.113.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t51H1x64029826; Mon, 1 Jun 2015 13:01:59 -0400
Message-ID: <556C9006.6010001@redhat.com>
Date: Mon, 01 Jun 2015 11:01:58 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1433145235-13941-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1433145235-13941-1-git-send-email-pbonzini@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="K3mqqJFGdmn7TRFpx07NSxnMKSxi4DeoH"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] translate-all: delete
 prototype for non-existent function
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
X-List-Received-Date: Mon, 01 Jun 2015 17:02:14 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--K3mqqJFGdmn7TRFpx07NSxnMKSxi4DeoH
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/01/2015 01:53 AM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Missed in commit 3a808cc40

> ---
>  translate-all.h | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--K3mqqJFGdmn7TRFpx07NSxnMKSxi4DeoH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVbJAGAAoJEKeha0olJ0NqncAH/jAjNOCQHxuDcziUl/mWXgFC
aeusf0XDYVpu6WO2cK083HAdtrtEfmLKsX/SxbfdI61vpG5KHqUUrZWttQseqbjd
29YAlBGDbE+hqYJw/zpf5iFOfjOr411RAdkq0LxKzrwkBwslQZhsVrPGsvG5GykP
fKU8fV/cXhE7ZQg2Nh4bqtHadkrfkcMvSmTSlHUFli808329jimdZqZt7z22FGTJ
Xv49CWDkxdwZwNdc5y2Ay2C1uujKmlouzdIZuGk3EZq2vHdRGw1viTrALtOav3or
CI3yYaG0MTkLyGbA2/X9S9/RwXZCHPaTk8l/UPG2MUuhryTSszGKGlieMJw80rE=
=bITT
-----END PGP SIGNATURE-----

--K3mqqJFGdmn7TRFpx07NSxnMKSxi4DeoH--

