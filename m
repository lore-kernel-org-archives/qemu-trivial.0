Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z4Vws-000090-C3
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jun 2015 11:05:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Z4Vwm-0008Oc-Aw
	for qemu-trivial@nongnu.org; Mon, 15 Jun 2015 11:05:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Z4Vwg-00070e-RG
	for qemu-trivial@nongnu.org; Mon, 15 Jun 2015 11:05:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Z4VwZ-0006mX-B5; Mon, 15 Jun 2015 11:04:59 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id E798CB6F28;
	Mon, 15 Jun 2015 15:04:58 +0000 (UTC)
Received: from [10.3.113.115] (ovpn-113-115.phx2.redhat.com [10.3.113.115])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5FF4w1G031335; Mon, 15 Jun 2015 11:04:58 -0400
Message-ID: <557EE995.3040608@redhat.com>
Date: Mon, 15 Jun 2015 09:04:53 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1434371759-29592-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1434371759-29592-1-git-send-email-armbru@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="NWOdXojMoscWaLSInMO6UL0UcmihGrQgq"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] qemu-options: Minor doc
	improvements
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
X-List-Received-Date: Mon, 15 Jun 2015 15:05:17 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NWOdXojMoscWaLSInMO6UL0UcmihGrQgq
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/15/2015 06:35 AM, Markus Armbruster wrote:
> Markus Armbruster (2):
>   qemu-options: Improve -global documentation
>   qemu-options: Use @itemx where appropriate

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--NWOdXojMoscWaLSInMO6UL0UcmihGrQgq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVfumZAAoJEKeha0olJ0NqNDEIAInBvGkHQ279M1kcjsmGjEsj
vj1Yz7JI4yG2s8m+qpVbTXOVCTnSz/0zy6y9XEnBYmqvzv94SNdfXQ8OkCtvXeb0
sDzYwgFUyn5Hhgyjz2wvIvEi6mfI99gdtJj9QnfGjRmp4I4/Qs8g+L59s8uECthc
vzCuQhi7T6pnJ+Yw8hvAdjYCbNImQ6u6D5fIVIEo+lUt+QnuZQBjgylGzB/6u83y
V4ahlUe5wFE2ya/LJ/c/BJZPorPikPVzar/YpnnT1llaK6v01d1aCDztrdMQVCGr
4arMM2OXbKYr4+SE5mbDG93LmWy2lcbmAF1yGELPUKlqtxoGw9xqfCpsjzrbfMU=
=zAav
-----END PGP SIGNATURE-----

--NWOdXojMoscWaLSInMO6UL0UcmihGrQgq--

