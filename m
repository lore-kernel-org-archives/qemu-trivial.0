Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0UsG-0005YE-Ro
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2016 10:12:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b0Us9-0005KC-D4
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 10:12:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b0Us4-0003R4-6N
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 10:12:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41055)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b0Urn-0003Nx-6h; Wed, 11 May 2016 10:11:59 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A543A627E5;
	Wed, 11 May 2016 14:11:58 +0000 (UTC)
Received: from [10.3.113.79] (ovpn-113-79.phx2.redhat.com [10.3.113.79])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4BEBw93028968; Wed, 11 May 2016 10:11:58 -0400
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<573245CA.1030104@redhat.com>
	<20160511083412.GG28315@chrystal.uk.oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org, qemu-stable@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57333DAD.8040309@redhat.com>
Date: Wed, 11 May 2016 08:11:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20160511083412.GG28315@chrystal.uk.oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="EEqLRvwFVbo0lt0DBeKEojpndQ7IS5vAg"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 11 May 2016 14:11:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] nbd: fix trim/discard
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
X-List-Received-Date: Wed, 11 May 2016 14:12:27 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EEqLRvwFVbo0lt0DBeKEojpndQ7IS5vAg
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/11/2016 02:34 AM, Quentin Casasnovas wrote:
>> Your patch duplicates what is already present in qemu:
>>
>> commit eb38c3b67018ff8069e4f674a28661931a8a3e4f

> Ha sorry I missed this! I wouldn't have tried to debug/fix myself other=
wise :)

It's okay - you at least sparked a good conversation of what the NBD
protocol itself needs to think about in relation to these issues.

>=20
>> It also helps to state what version of qemu you were testing, as it is=

>> obviously not the (soon-to-be-released) version 2.6 which already has
>> the fix.
>>
>=20
> I was using qemu-2.5.0-rc3 on Gentoo but this was also verified on some=

> Debian systems which appears to be on 1.1.2+dfsg-6a+deb7u12 and on Ubun=
tu
> Xenial 2.0.0+dfsg-2ubuntu1.22.
>=20
> I wrote the patch on top of https://github.com/bonzini/qemu.git:master
> (a7e00e2) which didn't contain the fix last Friday.

The master branch in Paolo's tree doesn't always actively track upstream
(mainly when he is about to post a pull request that needs to be
rebased).  Best is to base patches against true upstream:
git://git.qemu-project.org/qemu.git

>=20
> Anyway, cool if the fix is going into mainline :)

Already in there for the 2.6 release candidates (and final 2.6 should be
later today).  And this thread argues that the stable 2.5.x branch
should indeed backport the identified patch.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--EEqLRvwFVbo0lt0DBeKEojpndQ7IS5vAg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXMz2tAAoJEKeha0olJ0NqqoMH/RNhKif8w+OrLldVyCDODqTU
FfJBef0GfCbUhqTpAo0LvOLczyDKY0whow3NA04vT42qaU7v3QJNfeMXOv7i4V7t
0hF6rGFdwFQCEFg/tR946ZqcxWxi3wqahS2kF70gtZ2d19AOTcd4FtNG+1fBTjy3
eSF6g2iFtZbPShlfPvoSOvYgXIOGrTf5ONOGZ5gVn1APjlsd1jR7rztC51yir3Sk
9uTBIT+tKw/KZsNuHFIk3zNNVnUzEXobcfFZPUA+m6q0o/cT5/YBTpt/obp8sVI2
13tZt1BPrsqZKEsbAOWG0Csw4+YeCd7O2r1oTwL+4M5T9C1koLRE0/bp+K/g5PA=
=QjN+
-----END PGP SIGNATURE-----

--EEqLRvwFVbo0lt0DBeKEojpndQ7IS5vAg--

