Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cOokS-0004eR-IT
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jan 2017 11:49:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cOokQ-0004cr-GF
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 11:49:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cOokP-0003C3-LT
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 11:49:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54296)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cOokJ-0003AJ-2s; Wed, 04 Jan 2017 11:49:03 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B59B3D95E;
	Wed,  4 Jan 2017 16:49:03 +0000 (UTC)
Received: from [10.10.117.58] (ovpn-117-58.rdu2.redhat.com [10.10.117.58])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v04Gn2Vm003769; Wed, 4 Jan 2017 11:49:02 -0500
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20170104145624.2849-1-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <37786c56-11a5-3fa8-9eea-ecc61ffda5d0@redhat.com>
Date: Wed, 4 Jan 2017 10:49:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170104145624.2849-1-pbonzini@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="vOBrfASNDvVBRDe94lPplg7xAQa7UFWiL"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 04 Jan 2017 16:49:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-img: remove dead check
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2017 16:49:11 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vOBrfASNDvVBRDe94lPplg7xAQa7UFWiL
Content-Type: multipart/mixed; boundary="tAF1c9KEXNS8t5bx69Gol5LLIr8Liiium";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <37786c56-11a5-3fa8-9eea-ecc61ffda5d0@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qemu-img: remove dead check
References: <20170104145624.2849-1-pbonzini@redhat.com>
In-Reply-To: <20170104145624.2849-1-pbonzini@redhat.com>

--tAF1c9KEXNS8t5bx69Gol5LLIr8Liiium
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/04/2017 08:56 AM, Paolo Bonzini wrote:
> options must be non-NULL here, because it has been checked before.
> Reported by Coverity.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qemu-img.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

(not shown in the diff, but several lines earlier, is:

    if (!options) {
        error_exit("Must specify options (-o)");
    }
)


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--tAF1c9KEXNS8t5bx69Gol5LLIr8Liiium--

--vOBrfASNDvVBRDe94lPplg7xAQa7UFWiL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYbSd8AAoJEKeha0olJ0NqaoMH/A27Tpkm7oBb/SnJQ/1BYzZy
GBOTaV6kWPVkA/fWsbge+Uxcx9/88r9tVfzkFGvXvbeoyIi4VA+uKvsZ9vxLZEM/
ri7AhZOXkbHm3QaiGPszF47lD7rnmc4WXZvMHjRVreI2tXDJN+DHwL1RybdjHMvh
JNyjWfuzZeCJktYiAPQA51Y3Bnleu4+5K5xLoBasYLo4lMaBKuaKUqXvuVQrfkyv
7d2nPfTGbq90YSdockhOml05ilWOvMnh+fIA6oaiZSEkVYd3li6cSSj9AAZ84M7P
yReTBrC6c8M8ToRVv6RhLlhhToWboMyfjh+ALVeN/iy3iHNZawo1odiGz5XFxYA=
=1mH+
-----END PGP SIGNATURE-----

--vOBrfASNDvVBRDe94lPplg7xAQa7UFWiL--

