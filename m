Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwfEz-0004oC-72
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 17:51:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XwfEr-0004mk-SE
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 17:51:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XwfEm-00067u-TB
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 17:51:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58706)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XwfEm-00067m-Kz; Thu, 04 Dec 2014 17:51:04 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB4Mp3Ak032360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 17:51:03 -0500
Received: from [10.3.113.183] (ovpn-113-183.phx2.redhat.com [10.3.113.183])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB4Mp3hu023526; Thu, 4 Dec 2014 17:51:03 -0500
Message-ID: <5480E557.10304@redhat.com>
Date: Thu, 04 Dec 2014 15:51:03 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1417701603-26388-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1417701603-26388-1-git-send-email-armbru@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="uoHEuLFtbqC8breHS9Ccb8JTkbCWpkBGl"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] util: Trivial cleanups
	around g_malloc()
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
X-List-Received-Date: Thu, 04 Dec 2014 22:51:15 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uoHEuLFtbqC8breHS9Ccb8JTkbCWpkBGl
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/04/2014 07:00 AM, Markus Armbruster wrote:
> Markus Armbruster (3):
>   util: Drop superfluous conditionals around g_free()
>   Fuse g_malloc(); memset() into g_new0()
>   util: Use g_new() & friends where that makes obvious sense

Series:
Reviewed-by: Eric Blake <eblake@redhat.com>

Up to the maintainer if they want to touch up your 2/3 subject line.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--uoHEuLFtbqC8breHS9Ccb8JTkbCWpkBGl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUgOVXAAoJEKeha0olJ0Nq/YIH/1lb84djLwaZLsr5r5rDLFoo
Wbjz3p7asabp9rdbB39BAdtYkfstylvExwMtd4kSlhVKgXhraTD52/sntiBIEbbz
a0nTaqYqdzwra9stGs12YLJqf6Y7WRr2tr9NaFmUevCVY79eRELapruCRumRT1aE
usXt0kJp5tDK0OOXTn6/QEKUj74HBCxy+DTqn1f2L++JYcNbQS23x/GQuxjwAovs
DaIRcer6MH9R/zJfrIIt6BjQ/y5txEXAtckwAQoqKa2LDDyXWnkmUyE31fmY3xDw
Fe3KoqCk+WRQaHkaZWPQ0Bw8OJjBWqFEOZ0TZ5+Ub0QKoryfB0DS1tE9GZpQpvM=
=2kQa
-----END PGP SIGNATURE-----

--uoHEuLFtbqC8breHS9Ccb8JTkbCWpkBGl--

