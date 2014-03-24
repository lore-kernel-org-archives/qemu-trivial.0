Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS62h-0005DA-8x
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 10:39:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WS62a-0004zn-FO
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 10:39:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WS62W-0001Eh-2p
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 10:39:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:3527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WS5ZV-0006y2-5g; Mon, 24 Mar 2014 10:09:49 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2OE9lXt005008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Mar 2014 10:09:47 -0400
Received: from [10.3.113.70] (ovpn-113-70.phx2.redhat.com [10.3.113.70])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2OE9lWE012534; Mon, 24 Mar 2014 10:09:47 -0400
Message-ID: <53303CAA.3050306@redhat.com>
Date: Mon, 24 Mar 2014 08:09:46 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1395655300-16866-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1395655300-16866-1-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="tSaqO4HArj86lkFAO12vg1ol04ANxsnNv"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3] scripts: add sample model file for
	Coverity Scan
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
X-List-Received-Date: Mon, 24 Mar 2014 14:39:57 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tSaqO4HArj86lkFAO12vg1ol04ANxsnNv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/24/2014 04:01 AM, Paolo Bonzini wrote:
> This is the model file that is being used for the QEMU project's scans
> on scan.coverity.com.  It fixed about 30 false positives (10% of the
> total) and exposed about 60 new memory leaks.
>=20
> The file is not automatically used; changes to it must be propagated
> to the website manually by an admin (right now Markus, Peter and me
> are admins).
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Double S-o-B still looks odd.

> ---
>  scripts/coverity-model.c | 183 +++++++++++++++++++++++++++++++++++++++=
++++++++
>  1 file changed, 183 insertions(+)
>  create mode 100644 scripts/coverity-model.c
>=20
> +
> +#define NULL (void *)0

Still missing ()

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--tSaqO4HArj86lkFAO12vg1ol04ANxsnNv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTMDyqAAoJEKeha0olJ0NqVeQH/1yad5qwLGCsbAhTONQdd8g4
r7a19WlEOIZMOozRCF8noGZBKfoJ6uzG4TQDQNfuLH02aerWdRnPA0fYnfyjerhO
t/JdInORl+Vt0vFhtH0R69iMiHG7t4B9s3uU9qkUEzDkwIrq1gcqvuQyi2ozxd2/
kedl8Cq3MXdEWoOXBrNIgGAMlXcjn/p2Nj+lEb8t2hAPVfXPWlFvBATqWVhj819o
wspbGZaZPRUmk72r37FHdL5ac1P6lA7mhWq7TaxKGOX/E6q4LsRBq2hLT9Z7P+So
8h1mmQa3v3eesePtMV3Bvf85BegncQLrEkDxfNm3eUT5QbP4zEGOJ8OvsQc5M1Q=
=fvnj
-----END PGP SIGNATURE-----

--tSaqO4HArj86lkFAO12vg1ol04ANxsnNv--

