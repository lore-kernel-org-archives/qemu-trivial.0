Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1THJWS-0007Ve-LL
	for mharc-qemu-trivial@gnu.org; Thu, 27 Sep 2012 15:13:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1THJWP-0007TM-9e
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 15:13:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1THJWK-0008Tk-Si
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 15:13:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1THJWK-0008Tf-Ix; Thu, 27 Sep 2012 15:13:12 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8RJDB3T020343
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 27 Sep 2012 15:13:11 -0400
Received: from [10.3.113.155] (ovpn-113-155.phx2.redhat.com [10.3.113.155])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8RJDBmW015585; Thu, 27 Sep 2012 15:13:11 -0400
Message-ID: <5064A546.9080302@redhat.com>
Date: Thu, 27 Sep 2012 13:13:10 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1348772258-31168-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1348772258-31168-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.4.4
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig201D6CFB87E5688DF357DBD8"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Fix spelling in
 comment (enought -> enough, insure -> ensure)
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
X-List-Received-Date: Thu, 27 Sep 2012 19:13:18 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig201D6CFB87E5688DF357DBD8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/27/2012 12:57 PM, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>=20
> As a non native speaker, I feel that 'ensure' is better here than 'insu=
re'.
> Could a native speaker please confirm that?

As a US speaker, I've seen both words used interchangeably.  I also
checked dictionary.com, where both words imply a guarantee, but 'insure'
has a connotation of a guarantee against loss (think insurance policy)
while 'ensure' tends to be used in most other situations.  That is, I am
in favor of this spelling change for connotation reasons.  But as Peter
pointed out, the sentence has more problems than just a spelling choice.

> - * For the error advice packets must first insure that the
> - * packet is large enought to contain the returned ip header.
> + * For the error advice packets must first ensure that the
> + * packet is large enough to contain the returned ip header.
>   * Only then can we do the check to see if 64 bits of packet
>   * data have been returned, since we need to check the returned
>   * ip header length.
>=20

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enig201D6CFB87E5688DF357DBD8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQEcBAEBCAAGBQJQZKVGAAoJEKeha0olJ0Nq6ccIAKZrEhz04M6hj0YvsKhjbZ6T
IMQcW8xgxjdVIFBwir7QM6IrkGa5h0HnpK33tRqhnyCZjnnUedd0dnJ+jEFTQz2P
SGvZwKsYMp9SIs2rQehe/HpqqFfb2fN8no8iF2KXvFc96bQERUySy/S1IXmYqSY2
3h0hok3S31VWfikb21E0Q8yZre9gZeN16OuOtlEErVFG/GcPfDll2P8Jficlgdj0
QFp7CBknnjPLZvDo0ELc9aL/zIEBHxZi1SzSPqy2G60o0ESNbntO2/RwjVy4bIjR
GOAV1ygEDcerHvelT9Axd5+md73IhhZAEN/JCH81ZlNU5JGdSbg0RAsw9kv9bwQ=
=RW0S
-----END PGP SIGNATURE-----

--------------enig201D6CFB87E5688DF357DBD8--

