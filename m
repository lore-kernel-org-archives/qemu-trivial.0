Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xh4Ho-0006zd-NW
	for mharc-qemu-trivial@gnu.org; Wed, 22 Oct 2014 18:21:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Xh4Hg-0006rC-RX
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 18:21:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Xh4HT-0008Tw-W6
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 18:21:36 -0400
Received: from resqmta-ch2-04v.sys.comcast.net ([69.252.207.36]:58494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Xh4HT-0008Tb-Pl
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 18:21:23 -0400
Received: from resomta-ch2-10v.sys.comcast.net ([69.252.207.106])
	by resqmta-ch2-04v.sys.comcast.net with comcast
	id 6NMN1p0022JGN3p01NMN4Z; Wed, 22 Oct 2014 22:21:22 +0000
Received: from [192.168.43.132] ([166.171.121.227])
	by resomta-ch2-10v.sys.comcast.net with comcast
	id 6NJb1p00x4uUXdA01NJetJ; Wed, 22 Oct 2014 22:19:10 +0000
Message-ID: <54482D38.5080904@redhat.com>
Date: Wed, 22 Oct 2014 16:18:32 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Max Reitz <mreitz@redhat.com>, Zhang Haoyu <zhanghy@sangfor.com>, 
	qemu-devel <qemu-devel@nongnu.org>
References: <201410211604116199416@sangfor.com> <5446265E.306@redhat.com>
In-Reply-To: <5446265E.306@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="6GhlrpN7TNjquXbIopre8KpGdgLLkoA3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1414016482;
	bh=OMbS2c0uCrQeOae74e98ZX9altiVkploVkvXWqNQYPw=;
	h=Received:Received:Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type;
	b=bGGHPqboT8rlnTdFwFC8MWPE3ZJxcXY9vEHKVvO9i5Y4WuPx0ijLNn2LLUAe2ZvPk
	QBbDFBA22c8qbaariEKU2U96PoXurEBxD+sWaYxETd/+6I5PQsqD+/ZMiZlsg0+8DY
	6exdH8D/vqyAQGRxNFd719j2X5rXiexDVcl5yUwj6mLwguhJnORhxpognHiXyftjcs
	acx9X6bxH9Dw4uKl2cEwXqJkCLliqywO3tpgetw7axYUvPqEdXwud+1rHdJWZ4bDfH
	w1Sp33gCSHz6zQmR2d554GDGfMXf24AUO4+XFxDIUkFx25cJA6D6Y9yPPGkkX9d++6
	VvyE0afKVf7pg==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 69.252.207.36
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] snapshot: use local
 variable to bdrv_pwrite_sync L1 table
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
X-List-Received-Date: Wed, 22 Oct 2014 22:21:42 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6GhlrpN7TNjquXbIopre8KpGdgLLkoA3t
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/21/2014 03:24 AM, Max Reitz wrote:
> On 2014-10-21 at 10:04, Zhang Haoyu wrote:
>> Use local variable to bdrv_pwrite_sync L1 table,
>> needless to make conversion of cached L1 table between
>> big-endian and host style.
>>
>> Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
>> ---
>>   block/qcow2-refcount.c | 22 +++++++---------------
>>   1 file changed, 7 insertions(+), 15 deletions(-)
>>

I know we're up to v5 and that Max already took it into his branch, but..=
=2E


>>       l1_size2 =3D l1_size * sizeof(uint64_t);
>> +    l1_table =3D g_try_malloc0(align_offset(l1_size2, 512));
>=20
> I wanted to propose using qemu_try_blockalign(), but since it'd require=

> a memset() afterwards, it gets rather ugly.

Not after this recent patch:

https://lists.gnu.org/archive/html/qemu-devel/2014-10/msg02499.html

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--6GhlrpN7TNjquXbIopre8KpGdgLLkoA3t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUSC04AAoJEKeha0olJ0Nqwn0H/jgoRjBy91tvxYaQotIlrdKg
pkjSs0ERTtsoKtKn3nCwcXxchBB9bDK8IBBrXcF5RO6sf1WKsQPmuP//WAVUW0jP
LufnXqvJYyk7aypndVyXz+xAaCZPX0BCiB3iXYQxThsahzWcmnLl6yqlg2ocnhiT
44AKZOfPnsU74pYMSmNhiSXSAn6JhQgBjj+Rqei2gpxBVEIxwDRo00g1y8A4j3vO
A6N8gjkcuVd2LlDxyYyhrJ4bys9rJWr0RDH3Cu3A3rXEdqY7gmq6SIBpOY3/XbxU
C7fV0pf5ZNp9gbCCJxkrmkarNkjdbf8ExCg7UKL2joaGXKbLjCPS0IQpk74cFMo=
=okS1
-----END PGP SIGNATURE-----

--6GhlrpN7TNjquXbIopre8KpGdgLLkoA3t--

