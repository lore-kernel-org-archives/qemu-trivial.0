Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WSYnX-0005dg-8j
	for mharc-qemu-trivial@gnu.org; Tue, 25 Mar 2014 17:22:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WSYnP-0005Oj-Qa
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 17:22:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WSYl4-00013W-UI
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 17:19:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13174)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WSYkz-00012a-LB; Tue, 25 Mar 2014 17:19:37 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2PLJTe6005037
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 25 Mar 2014 17:19:30 -0400
Received: from [10.3.113.70] (ovpn-113-70.phx2.redhat.com [10.3.113.70])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2PLJRlh001005; Tue, 25 Mar 2014 17:19:27 -0400
Message-ID: <5331F2DF.8040404@redhat.com>
Date: Tue, 25 Mar 2014 15:19:27 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Prasad Joshi <prasadjoshi.linux@gmail.com>
References: <1395779153-4536-1-git-send-email-prasadjoshi.linux@gmail.com>
In-Reply-To: <1395779153-4536-1-git-send-email-prasadjoshi.linux@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="wq4aPJRTxbWhv4QGsi4u9nEAS1UB6LwhO"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, pl@kamp.de,
	qemu-devel@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com
Subject: [Qemu-trivial] for 2.0: Re: [PATCH] qemu-img: Release refernece to
	BlockDriverState
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
X-List-Received-Date: Tue, 25 Mar 2014 21:22:14 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wq4aPJRTxbWhv4QGsi4u9nEAS1UB6LwhO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/25/2014 02:25 PM, Prasad Joshi wrote:

s/refernece/reference/ in the subject

This is worth including in 2.0

> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
> ---
>  qemu-img.c | 1 +
>  1 file changed, 1 insertion(+)

With subject line fixed:
Reviewed-by: Eric Blake <eblake@redhat.com>

Appears to have been introduced in commit 43526ec

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--wq4aPJRTxbWhv4QGsi4u9nEAS1UB6LwhO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTMfLfAAoJEKeha0olJ0Nqry0H/jCpo34oSIORPg7Am0XowlaA
c17YdOkJkVj3nGKNVqawfvuO/97q+R+1NhYUU76h94VZeAdHhSQIvf1GIziuceiH
8+6IzjPx2X58zjJSck+skL7J1BHy83cv/Epqp3ob9uouQwbDx12lptoof1U4JJjP
CtfTsGYv1STap1ieB9EWzOBXyeiNEcDurIXF2d+fVBW/97igG4bctvpamWSxtu/z
3WnxZ+FcS/a5TKReZjkjsIwfpTcyZHti1LCpCM/niqVvVvFt8LCzRrIiFWsJuVxD
K1+btwudEiPd2NRWGuYaRDSLIlLzdahhjnt/Eey+mqqtRRf8dPbak1OO5jtP/nk=
=cAts
-----END PGP SIGNATURE-----

--wq4aPJRTxbWhv4QGsi4u9nEAS1UB6LwhO--

