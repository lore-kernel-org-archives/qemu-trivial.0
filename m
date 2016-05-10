Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0EDe-0007br-Ka
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 16:25:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b0EDT-0007HD-Uk
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 16:25:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b0EDR-0006UP-CO
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 16:25:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34113)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b0EDC-0006MC-7p; Tue, 10 May 2016 16:24:58 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1FF2C049D4F;
	Tue, 10 May 2016 20:24:57 +0000 (UTC)
Received: from [10.3.113.79] (ovpn-113-79.phx2.redhat.com [10.3.113.79])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4AKOueb021618; Tue, 10 May 2016 16:24:57 -0400
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<C84A91D0-D90A-4B7B-B72D-A33E1C189354@alex.org.uk>
	<5732025C.2050703@redhat.com>
	<20160510155444.GC28315@chrystal.uk.oracle.com>
	<20160510163309.GF28315@chrystal.uk.oracle.com>
Cc: Alex Bligh <alex@alex.org.uk>,
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
Message-ID: <57324398.7060106@redhat.com>
Date: Tue, 10 May 2016 14:24:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20160510163309.GF28315@chrystal.uk.oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="DqXCdwiitsfD5TfG7O9Hlx9tLqXJMkWGC"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 10 May 2016 20:24:57 +0000 (UTC)
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
X-List-Received-Date: Tue, 10 May 2016 20:25:25 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DqXCdwiitsfD5TfG7O9Hlx9tLqXJMkWGC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/10/2016 10:33 AM, Quentin Casasnovas wrote:

> Looks like there's an easier way:
>=20
>  $ qemu-img create -f qcow2 foo.qcow2 10G
>  $ qemu-nbd --discard=3Don -c /dev/nbd0 foo.qcow2
>  $ mkfs.ext4 /dev/nbd0
>  mke2fs 1.42.13 (17-May-2015)
>  Discarding device blocks: failed - Input/output error

strace on mkfs.ext4 shows:
=2E..
open("/dev/nbd1", O_RDWR|O_EXCL)        =3D 3
stat("/dev/nbd1", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(43, 1), ...}=
) =3D 0
ioctl(3, BLKDISCARDZEROES, [0])         =3D 0
ioctl(3, BLKROGET, [0])                 =3D 0
uname({sysname=3D"Linux", nodename=3D"red", ...}) =3D 0
ioctl(3, BLKDISCARD, [0, 1000000])      =3D 0
write(1, "Discarding device blocks: ", 26) =3D 26
write(1, "   4096/2621440", 15   4096/2621440)         =3D 15
write(1, "\10\10\10\10\10\10\10\10\10\10\10\1) =3D 15
ioctl(3, BLKDISCARD, [1000000, 80000000]) =3D -1 EIO (Input/output error)=

write(1, "               ", 15               )         =3D 15
write(1, "\10\10\10\10\10\10\10\10\10\10\10\1) =3D 15
write(1, "failed - ", 9failed - )                =3D 9

so it does indeed look like the smaller request [0, 0x1000000] succeeded
while the larger [0x1000000, 0x80000000] failed with EIO.  But I
instrumented my qemu-nbd server to output all of the incoming requests
it was receiving from the kernel, and I never saw a mention of
NBD_CMD_TRIM being received.  Maybe it's dependent on what version of
the kernel and/or NBD kernel module you are running?

I also tried fallocate(1) on /dev/nbd1, as in:
 # strace fallocate -o 0 -l 64k -p /dev/nbd1
but it looks like the kernel doesn't yet wire up fallocate(2) to forward
to the appropriate device ioctls and/or NBD_CMD_TRIM, where strace says:

open("/dev/nbd1", O_RDWR)               =3D 3
fallocate(3, FALLOC_FL_KEEP_SIZE|FALLOC_FL_PUNCH_HOLE, 0, 65536) =3D -1
ENODEV (No such device)

The ENODEV is a rather unusual choice of error.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--DqXCdwiitsfD5TfG7O9Hlx9tLqXJMkWGC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXMkOYAAoJEKeha0olJ0Nq6dsH/1ric8uxsVjOCA+YvXFx1JMj
MHDJ4Wxmft1sPVCBWd9TYft3duOB0CYvpLDD8mg4O4ki5Z+77pN1bki8S9zn221g
OtjfAHTzmFU9zx0vrEmz9cq4sGuCGH5FX4ITrb3TIZ6r4d1R59KVmFZrRrbFdGTt
12RUUmlG5pwO1UWtmLUeo9o3f4bPoKGzRkcyXeR1niDNf4NQhUAhAcr7cN9fC74n
vGo0CQBkbVYKu5Tr7ArJ9zyXY/3QRQLSb9KQuduQ9AR2LJc+W70hFHxrUCzGSvz9
FwbDNmJYmq/KvA4y/CNyvbbs8eMMwDsd2oAG3RFdBI3dpehDLgJ+GniOgICPRZc=
=+cax
-----END PGP SIGNATURE-----

--DqXCdwiitsfD5TfG7O9Hlx9tLqXJMkWGC--

