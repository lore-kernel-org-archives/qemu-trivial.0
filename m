Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0Up6-0001Lk-H7
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2016 10:09:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b0Up2-0001C7-LO
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 10:09:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b0Up1-0002ol-4L
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 10:09:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b0Uog-0002l1-Ce; Wed, 11 May 2016 10:08:46 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 834CF63307;
	Wed, 11 May 2016 14:08:44 +0000 (UTC)
Received: from [10.3.113.79] (ovpn-113-79.phx2.redhat.com [10.3.113.79])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4BE8h0h008559; Wed, 11 May 2016 10:08:43 -0400
To: Paolo Bonzini <pbonzini@redhat.com>, Alex Bligh <alex@alex.org.uk>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
	<20160510154545.GB28315@chrystal.uk.oracle.com>
	<592DA6FD-75F8-4B7F-AA21-DEA8D591B723@alex.org.uk>
	<20160510160438.GD28315@chrystal.uk.oracle.com>
	<8F0007CD-40E2-43C1-8196-B4BE401B8EF4@alex.org.uk>
	<5732FD8C.1080106@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57333CEB.7050705@redhat.com>
Date: Wed, 11 May 2016 08:08:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5732FD8C.1080106@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="La7s2N2hXlqIJx2ObvXHB59NKq970QbQI"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 11 May 2016 14:08:44 +0000 (UTC)
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
X-List-Received-Date: Wed, 11 May 2016 14:09:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--La7s2N2hXlqIJx2ObvXHB59NKq970QbQI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/11/2016 03:38 AM, Paolo Bonzini wrote:
>=20
>=20
> On 10/05/2016 18:23, Alex Bligh wrote:
>>> Is there a use case where you'd want to split up a single big TRIM re=
quest
>>> in smaller ones (as in some hardware would not support it or somethin=
g)?
>>> Even then, it looks like this splitting up would be hardware dependan=
t and
>>> better implemented in block device drivers.
>>
>> Part of the point of the block size extension is to push such limits t=
o the
>> client.
>>
>> I could make up use cases (e.g. that performing a multi-gigabyte trim =
in
>> a single threaded server will effectively block all other I/O), but th=
e
>> main reason in my book is orthogonality, and the fact the client needs=

>> to do some breaking up anyway.
>=20
> That's why SCSI for example has a limit to UNMAP and WRITE SAME request=
s
> (actually it has three limits: number of ranges per unmap, which in NBD=

> and in SCSI WRITE SAME is 1; number of blocks per unmap descriptor;
> number of blocks per WRITE SAME operation).  These limits however are a=

> different one than the read/write limit, because you want to support
> systems where TRIM is much faster than regular I/O (and possibly even
> O(1) if trimming something that is already trimmed).

Then I think I will propose a doc patch to the extension-info branch
that adds new INFO items for NBD_INFO_TRIM_SIZE and
NBD_INFO_WRITE_ZERO_SIZE (if requested by client and replied by server,
then this can be larger than the normal maximum size in
NBD_INFO_BLOCK_SIZE; if either side doesn't request the info, then
assume any maximum in NBD_INFO_BLOCK_SIZE applies, otherwise UINT32_MAX;
and the two infos are separate items because NBD_FLAG_SEND_TRIM and
NBD_FLAG_SEND_WRITE_ZEROES are orthogonally optional).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--La7s2N2hXlqIJx2ObvXHB59NKq970QbQI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXMzzrAAoJEKeha0olJ0NqrukH/A1sQciumYfQuiwxxYT+HGyw
XWnqbH61ah1A1De4q2moeYRqfZQHg0I3HV2ijb3ahAMzMaSFTG3ZQHy8ScXupCmK
GaYfpMWYanVagTbTjitLiFtIaUcAv3IYaPTRbdeIxH0zlCA8crPgzNAWkyHhmYyR
VyubJwDT26W9pyJvMq/dpMqKSO4sq0xKpCW98gny/J4eZT0k7+GYwQEM1Zx2xGKZ
MTxhzNX36RZXZ21iRdFqCDChyOajuoaTfrNEKvpm43sHWXp0wz86CuTynmyOFZfu
wI+PcInogY5Xj1FWLc3BD3XNley4HikBJ+t9TAT2k5kgVABRfGqRQ+dj/DCh/BA=
=njW/
-----END PGP SIGNATURE-----

--La7s2N2hXlqIJx2ObvXHB59NKq970QbQI--

