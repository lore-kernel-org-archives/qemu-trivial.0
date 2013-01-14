Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tus1a-0002qp-7M
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2013 16:56:58 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Tus1W-0002nj-UJ
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 16:56:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Tus1U-0003Ug-Nq
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 16:56:54 -0500
Received: from qmta02.emeryville.ca.mail.comcast.net ([76.96.30.24]:53691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Tus1U-0003UN-G6
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 16:56:52 -0500
Received: from omta19.emeryville.ca.mail.comcast.net ([76.96.30.76])
	by qmta02.emeryville.ca.mail.comcast.net with comcast
	id nrpH1k0091eYJf8A2xwrAC; Mon, 14 Jan 2013 21:56:51 +0000
Received: from [192.168.0.125] ([71.219.16.174])
	by omta19.emeryville.ca.mail.comcast.net with comcast
	id nxuB1k00t3lL5eF01xuJjw; Mon, 14 Jan 2013 21:54:46 +0000
Message-ID: <50F47E7D.4020909@redhat.com>
Date: Mon, 14 Jan 2013 14:54:05 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: mdroth <mdroth@linux.vnet.ibm.com>
References: <1357143311-10927-1-git-send-email-eblake@redhat.com>
	<20130102231421.GC17859@vm>
In-Reply-To: <20130102231421.GC17859@vm>
X-Enigmail-Version: 1.5.0
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2KHTEFGCDUPSSVEGXJTDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1358200611;
	bh=kTiLo7h/wPIKYxOsjIDu3uIhfUza1fMLOtY1q0M1FJQ=;
	h=Received:Received:Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type;
	b=lq8nDU2QUk/2nh/tGo3gQAX5iaqJs9UAf0EFo9cl0JiGwj9hPyLdPICCINpj6KV4B
	T3f3YzhG38RV+/bHp7Fmdd3iOj1Bfcs5qsC2dHTiREgelNTZOS1/AoD9RmuqIoBQsl
	VqK8gYVTrfBzy8XKGYyqM0uZZ12eCk1rLn/q98b2ysn1AWYw/RFv4H6Y1q+NzTHOh6
	YUY6A/r4PENc/CZB/YNWw5lbLbe8OZ+XfykHMSt9zAeXrqYdPIfyJx0DpUWgSBrajq
	5/++mk3HQExPN4Gjk+TD0jqRG+0dLy9MX/7GvnRTZiCmxmWciLzbREJI1ujhj4oEKr
	ALTWfyuwIxRCQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 76.96.30.24
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qga: add missing commas in json docs
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
X-List-Received-Date: Mon, 14 Jan 2013 21:56:56 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2KHTEFGCDUPSSVEGXJTDL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/02/2013 04:14 PM, mdroth wrote:
> On Wed, Jan 02, 2013 at 09:15:11AM -0700, Eric Blake wrote:
>> * qga/qapi-schema.json: Use valid JSON.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>=20
> Thanks, applied to qga branch

Ping.  I don't see this patch in today's qga pull request:
https://lists.gnu.org/archive/html/qemu-devel/2013-01/msg02272.html
Should it go in through the trivial branch instead?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2KHTEFGCDUPSSVEGXJTDL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJQ9H59AAoJEKeha0olJ0Nq0+0IAK1R8VFpp/52MNLKgIj8SiZr
7dSAKnkJKMsmneBBmIaDaZS0uzfh7DfJ0feNBB41ffeXaWRNWxbIEkaueF5cDU6j
thDUPqNul8ghtIRTgLrdhwcj5H2L4eqGf+PjLVwhBj5CKgV6VVUxqt22+SYAAH33
YXHyuieX6hiBz4hOC5YuMsXGtOLl/yXtmP9VTdQi1lMC4izJZIcOAriCmId9psUW
qHtnj9+Mogtg6Kz/nDFx7NmrYGHwQVm3ri3BSouXOq8UJx+77Qj7aKmoQ6IOTnXX
4yPnPVXPtKwKYgHT2pSaB9+iV5LBwAP0npHkDY6j4GDm+lUXwWf0+QXsFVmRiBg=
=eupl
-----END PGP SIGNATURE-----

------enig2KHTEFGCDUPSSVEGXJTDL--

