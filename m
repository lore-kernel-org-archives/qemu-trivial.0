Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9ISo-0008IL-C8
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 12:28:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1T9ISl-0008Gl-Nk
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 12:28:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1T9ISg-0003ln-Lm
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 12:28:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1T9ISg-0003li-DC; Wed, 05 Sep 2012 12:28:18 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q85GSFqN031831
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 5 Sep 2012 12:28:15 -0400
Received: from [10.3.113.60] (ovpn-113-60.phx2.redhat.com [10.3.113.60])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q85GSEsF017021; Wed, 5 Sep 2012 12:28:15 -0400
Message-ID: <50477D9E.1010408@redhat.com>
Date: Wed, 05 Sep 2012 10:28:14 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1346851582-9296-1-git-send-email-riegamaths@gmail.com>
	<50477269.8050807@redhat.com>
	<87d320e9uk.fsf@blackfin.pond.sub.org>
	<50477C74.7050606@redhat.com>
In-Reply-To: <50477C74.7050606@redhat.com>
X-Enigmail-Version: 1.4.4
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig11F39D3F85E51B7CE51032E1"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, riegamaths@gmail.com,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] block: Don't forget to delete temporary
	file
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
X-List-Received-Date: Wed, 05 Sep 2012 16:28:25 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig11F39D3F85E51B7CE51032E1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/05/2012 10:23 AM, Paolo Bonzini wrote:
> And finally, the whole get_tmp_filename is unsafe because there is a
> race window between closing and reopening the file, if the directory is=

> writable and does not have the sticky bit.
>=20
> So the patch is an improvement, but there is still something unpleasing=

> in this code...

I absolutely agree that there is a nasty race here.  If you aren't going
to use the fd, then mktemp() is sufficient (and just as racy, but then
you are at least honest that you don't care about the race); in all
other situations, if you want a temporary file name but want to avoid a
race, then it feels like you should be returning the fd from mkstemp()
still open (or at a bare minimum, auditing ALL callers to make sure they
only use the temporary name with O_CREAT|O_EXCL, and that they retry in
a loop in case they lose the race, at which point they are reinventing
the loop already done on their behalf by mkstemp()...).

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enig11F39D3F85E51B7CE51032E1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQEcBAEBCAAGBQJQR32eAAoJEKeha0olJ0Nq2roIAK9EWZ4XEj35E9bCD/aTcJQw
hO2QQtrYVk7QG2Imaxpvw/C2lEJ22+gGFbQMKntLF8YzTszOjv7+09Ejc4HrrODG
RGOGXTNrlmxkPsF1v2MHt9dXj5jKwJ5pegjuhGmmfLU5mzPuidDfHTxbpidxl4ZY
3XwW2YlWqRnRai74bZxGqejJ0bTKBES/Ka4mZh55t/NODP0NJm77G59N2ABdDsif
+VzUCdOSmabD+cKGwaL+KZW+NP0pi+9jvLd7bPLNB+D63sv/+3RtUSaycFEM5FN1
GEsVVhpqIa8EA/Yg/xL3PSKs5kBTDf2wZXMceRSSOXp4l09/IUjGRzx9Iqsdnmk=
=WqWK
-----END PGP SIGNATURE-----

--------------enig11F39D3F85E51B7CE51032E1--

