Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b09bd-0005Iw-TE
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 11:29:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b09bW-00055N-IL
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:29:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b09bT-0002w8-OP
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:29:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55986)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b09bC-0002pk-Uo; Tue, 10 May 2016 11:29:27 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9237BC05B1C9;
	Tue, 10 May 2016 15:29:24 +0000 (UTC)
Received: from [10.3.113.79] (ovpn-113-79.phx2.redhat.com [10.3.113.79])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4AFTNLn012816; Tue, 10 May 2016 11:29:23 -0400
To: Alex Bligh <alex@alex.org.uk>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
X-Enigmail-Draft-Status: N1110
Organization: Red Hat, Inc.
Message-ID: <5731FE53.6010602@redhat.com>
Date: Tue, 10 May 2016 09:29:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="7cx94P9KitDfHMmlTccjr94HMJ6evHoWs"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 10 May 2016 15:29:25 +0000 (UTC)
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
X-List-Received-Date: Tue, 10 May 2016 15:29:52 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7cx94P9KitDfHMmlTccjr94HMJ6evHoWs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/10/2016 09:08 AM, Alex Bligh wrote:
> Eric,
>=20
>> Hmm. The current wording of the experimental block size additions does=

>> NOT allow the client to send a NBD_CMD_TRIM with a size larger than th=
e
>> maximum NBD_CMD_WRITE:
>> https://github.com/yoe/nbd/blob/extension-info/doc/proto.md#block-size=
-constraints
>=20
> Correct
>=20
>> Maybe we should revisit that in the spec, and/or advertise yet another=

>> block size (since the maximum size for a trim and/or write_zeroes
>> request may indeed be different than the maximum size for a read/write=
).
>=20
> I think it's up to the server to either handle large requests, or
> for the client to break these up.

But the question at hand here is whether we should permit servers to
advertise multiple maximum block sizes (one for read/write, another one
for trim/write_zero, or even two [at least qemu tracks a separate
maximum trim vs. write_zero sizing in its generic block layer]), or
merely stick with the current wording that requires clients that honor
maximum block size to obey the same maximum for ALL commands, regardless
of amount of data sent over the wire.

>=20
> The core problem here is that the kernel (and, ahem, most servers) are
> ignorant of the block size extension, and need to guess how to break
> things up. In my view the client (kernel in this case) should
> be breaking the trim requests up into whatever size it uses as the
> maximum size write requests. But then it would have to know about block=

> sizes which are in (another) experimental extension.

Correct - no one has yet patched the kernel to honor block sizes
advertised through what is currently an experimental extension.  (We
have ioctl(NBD_SET_BLKSIZE) which can be argued to set the kernel's
minimum block size, but I haven't audited whether the kernel actually
guarantees that all client requests are sent aligned to the value passed
that way - but we have nothing to set the maximum size, and are at the
mercy of however the kernel currently decides to split large requests).
 So the kernel is currently one of the clients that does NOT honor block
sizes, and as such, servers should be prepared for ANY size up to
UINT_MAX (other than DoS handling).  My question above only applies to
clients that use the experimental block size extensions.

>=20
> I've nothing against you fixing it qemu's server (after all I don't
> think there is anything to /prohibit/ a server working on something
> larger than the maximum block size), and ...
>=20
>> But since the kernel is the one sending the large length request, and
>> since you are right that this is not a denial-of-service in the amount=

>> of data being sent in a single NBD message,
>=20
> ... currently there isn't actually a maximum block size advertised (tha=
t
> being in another experimental addition), so this is just DoS prevention=
,
> which qemu is free to do how it wishes.

Okay, sounds like that part is uncontroversial, and it is indeed worth
improving qemu's behavior.

>=20
> What surprises me is that a release kernel is using experimental
> NBD extensions; there's no guarantee these won't change. Or does
> fstrim work some other way?

No extension in play.  The kernel is obeying NBD_FLAG_SEND_TRIM, which
is in the normative standard, and unrelated to the INFO/BLOCK_SIZE
extensions.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--7cx94P9KitDfHMmlTccjr94HMJ6evHoWs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXMf5TAAoJEKeha0olJ0NqJPQIAKjgtfUq3+ctnA2Dpc7bd3wi
OZxNZHWkerwA2w9Xd2EYTgvS2AxlJPZW/mjDha/zkwk5cDC4SljaV+JRSW83/t0G
yGzzEsLYhQtA31ZHg4IBpkld9kY3Gk8MTUN2Jry6e8gEV/1J0A/lm+0A1VQF7CN1
I9rLkLR5gC5TKtEqMOrLtQfu3GKsi6VfVZa51k5bZJP1aK7yLfzt6+AicbTUVVDp
qlCWE04gwebPRyug3UjBeij1Sa2QMjfanL27u2cMU1D6q8wNtVoIvIGnGW54Dim+
RWSpmuQjuz1SA9oRw/pWYzhrWZHR9svymwhvGMIkcgnv2xRfl7+7b6/UlI4EA5A=
=q8SZ
-----END PGP SIGNATURE-----

--7cx94P9KitDfHMmlTccjr94HMJ6evHoWs--

