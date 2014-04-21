Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WcGHn-0004sm-Of
	for mharc-qemu-trivial@gnu.org; Mon, 21 Apr 2014 11:37:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WcGHl-0004sA-Hr
	for qemu-trivial@nongnu.org; Mon, 21 Apr 2014 11:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WcGHk-0002hD-FE
	for qemu-trivial@nongnu.org; Mon, 21 Apr 2014 11:37:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WcGHe-0002gO-3D; Mon, 21 Apr 2014 11:37:26 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3LF9KvQ009722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 21 Apr 2014 11:09:20 -0400
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3LF9JTv027334; Mon, 21 Apr 2014 11:09:19 -0400
Message-ID: <5355349E.6060601@redhat.com>
Date: Mon, 21 Apr 2014 09:09:18 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, mjt@tls.msk.ru,
	aliguori@amazon.com
References: <5353B7F9.4060803@gmail.com>
In-Reply-To: <5353B7F9.4060803@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="cVV4Fs4EE0dCc66xF31qNfu1ofB18ffu5"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] vl: Avoid to close
 stdout after finish 'writeconfig' option
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
X-List-Received-Date: Mon, 21 Apr 2014 15:37:34 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cVV4Fs4EE0dCc66xF31qNfu1ofB18ffu5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/20/2014 06:05 AM, Chen Gang wrote:
> After finish 'writeconfig' to stdout (with '-'), we want to copy/past
> the related information mannually, not for redirection ('readconfig'
> does not support '-').
>=20
> So we can not close the stdout, or next options which may use stdout
> will not be displayed.

Grammar, and awkward to read.  May I suggest:

vl: avoid closing stdout with 'writeconfig'

'writeconfig' supports output to stdout (with '-'); when that happens,
we must not close stdout, or further command line options that also use
stdout will be impacted.  (Although 'writeconfig' was copied from
'readconfig', the latter does not have the problem because it does not
support reading from '-')

>=20
>=20
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  vl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

With the improved commit message,

Reviewed-by: Eric Blake <eblake@redhat.com>


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--cVV4Fs4EE0dCc66xF31qNfu1ofB18ffu5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTVTSeAAoJEKeha0olJ0Nq1WIIAI69r3n2xZJbT8/oJJbVSoo5
txXNrzsLYiQwGc6egngxg6B7++KgjiauuY1KP2HGjRET+2GLnUbfRX9C2yNOvDew
yJ/fk7BmispKQQ39wdw6cS4ECreM4ArS4YkRjEojz+nBm70jBjuIfCsiJKj5aD5Z
WM5V2UYNBTBZQ1PZ2QflX3Q2opYpJ35c1xbfrsWYr5/vmHw+HfD85wYFBX8q5PvE
3fy7QgDj09Uqg3gOtW1QNLLB5pQo8PJfK4Uzc+1/C3pTPttzHE3JECZPv2+4RB6b
gb5UU4N0kNA+EFhr5R8ffmhCydxB1iO7tWo5L9UsmbiSPwL3wh840g2+GyaU5i4=
=bBXv
-----END PGP SIGNATURE-----

--cVV4Fs4EE0dCc66xF31qNfu1ofB18ffu5--

