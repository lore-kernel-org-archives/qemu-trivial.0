Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b09sJ-0001b3-TT
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 11:47:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b09sG-0001Uz-Sp
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b09sD-0008R9-BH
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:47:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b09rq-0008JB-Fd; Tue, 10 May 2016 11:46:38 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7ED2201EA;
	Tue, 10 May 2016 15:46:37 +0000 (UTC)
Received: from [10.3.113.79] (ovpn-113-79.phx2.redhat.com [10.3.113.79])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4AFkaL2029672; Tue, 10 May 2016 11:46:37 -0400
To: Alex Bligh <alex@alex.org.uk>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<C84A91D0-D90A-4B7B-B72D-A33E1C189354@alex.org.uk>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5732025C.2050703@redhat.com>
Date: Tue, 10 May 2016 09:46:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <C84A91D0-D90A-4B7B-B72D-A33E1C189354@alex.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="CoUIRPgwc2KgA4vkrfaenGfSJt28wwCQO"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 10 May 2016 15:46:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Nbd] [Qemu-devel] [PATCH] nbd: fix trim/discard
 commands with a length bigger than NBD_MAX_BUFFER_SIZE
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
X-List-Received-Date: Tue, 10 May 2016 15:47:06 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CoUIRPgwc2KgA4vkrfaenGfSJt28wwCQO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/10/2016 09:41 AM, Alex Bligh wrote:
>=20
> On 10 May 2016, at 16:29, Eric Blake <eblake@redhat.com> wrote:
>=20
>> So the kernel is currently one of the clients that does NOT honor bloc=
k
>> sizes, and as such, servers should be prepared for ANY size up to
>> UINT_MAX (other than DoS handling).
>=20
> Interesting followup question:
>=20
> If the kernel does not fragment TRIM requests at all (in the
> same way it fragments read and write requests), I suspect
> something bad may happen with TRIM requests over 2^31
> in size (particularly over 2^32 in size), as the length
> field in nbd only has 32 bits.
>=20
> Whether it supports block size constraints or not, it is
> going to need to do *some* breaking up of requests.

Does anyone have an easy way to cause the kernel to request a trim
operation that large on a > 4G export?  I'm not familiar enough with
EXT4 operation to know what file system operations you can run to
ultimately indirectly create a file system trim operation that large.
But maybe there is something simpler - does the kernel let you use the
fallocate(2) syscall operation with FALLOC_FL_PUNCH_HOLE or
FALLOC_FL_ZERO_RANGE on an fd backed by an NBD device?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--CoUIRPgwc2KgA4vkrfaenGfSJt28wwCQO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXMgJcAAoJEKeha0olJ0NqhB8H+gOeuscTYXJx8Pr94z5uFr+D
OzSfptZQpFN99WceNPOLil5RNbujcdAL6yyzBC3DKHzTpLwlqfoX7TDzEth+ON77
ApGUrquPxyyxVtYM0vij+Dt8vTc18c1wJs0TRk6IYhYefeTA1b4lEibZadG+Lkni
Ugqd9ecA7gfs8esMe+gnmMDLSSM+Rpb/C0SnLzHnT3+BzlS77H/qLUH0GT80EE39
FMJVbsVpk2xKwoMmHQoh8UYH6DUJI+6P61Z0bFRvIfVken7BumvrXik+JFtbkJop
gx81YRKjkgV3IagTcFGwitAzJmYKJkcqPACur0TMb4d6Ahy5/P8NirK5+Ko4OFg=
=4i1o
-----END PGP SIGNATURE-----

--CoUIRPgwc2KgA4vkrfaenGfSJt28wwCQO--

