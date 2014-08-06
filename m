Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEux8-00014L-J1
	for mharc-qemu-trivial@gnu.org; Wed, 06 Aug 2014 02:44:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XEqRd-0001XF-L3
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 21:55:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XEqRZ-0001l2-9e
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 21:55:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39159)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XEqRP-0001Rm-1x; Tue, 05 Aug 2014 21:54:59 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s761rrd3023500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 5 Aug 2014 21:53:53 -0400
Received: from [10.3.113.88] (ovpn-113-88.phx2.redhat.com [10.3.113.88])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s761rqnt008897; Tue, 5 Aug 2014 21:53:52 -0400
Message-ID: <53E18AAF.1090902@redhat.com>
Date: Tue, 05 Aug 2014 19:53:51 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>, arei.gonglei@huawei.com
References: <1406879176-4008-1-git-send-email-arei.gonglei@huawei.com>
	<20140805140256.GA16091@redhat.com>
In-Reply-To: <20140805140256.GA16091@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="so9wFLtxonhCdBr5GK1BS198DuUWFWubg"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 06 Aug 2014 02:44:01 -0400
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, stefanha@redhat.com,
	marcel.a@redhat.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, qemu-devel@nongnu.org, armbru@redhat.com,
	av1474@comtv.ru, kraxel@redhat.com, aliguori@amazon.com,
	imammedo@redhat.com, dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, lcapitulino@redhat.com,
	afaerber@suse.de, dgilbert@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3 for-2.2 0/8] don't use Yoda conditions
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
X-List-Received-Date: Wed, 06 Aug 2014 01:55:18 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--so9wFLtxonhCdBr5GK1BS198DuUWFWubg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/05/2014 08:02 AM, Michael S. Tsirkin wrote:
> On Fri, Aug 01, 2014 at 03:46:08PM +0800, arei.gonglei@huawei.com wrote=
:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> $WHATEVER: don't use 'Yoda conditions'
>>
>> 'Yoda conditions' are not part of idiomatic QEMU coding
>> style, so rewrite them in the more usual order.
>=20
>=20
> OK but why stop at these files? How about this
> instead?
>=20

> @ disable commeq @
> expression E;
> constant C;
> @@
> - C =3D=3D E
> + E =3D=3D C
> @ disable commeq @
> expression E;
> constant C;
> @@
> - C =3D=3D E
> + E =3D=3D C

Why is this listed twice?

> @ disable gtr_lss @
> expression E;
> constant C;
> @@
> - C > E
> + E < C

This is wrong for floating point (think NaN); you'd have to audit the
results to make sure only integers are commuted.

> @ disable gtr_lss_eq @
> expression E;
> constant C;
> @@
> - C >=3D E
> + E <=3D C

Ditto.

>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

The idea seems okay to me, but I haven't closely reviewed the patch yet.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--so9wFLtxonhCdBr5GK1BS198DuUWFWubg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJT4YqwAAoJEKeha0olJ0NqSx0IAK4PBdl+wZ2E6+2a3tq9OM9W
lTd3Zd4QbzSmJ3HrlXnUVGCrJDiZ3gKSIn7gzUn46so/H+/pLUfXH92pipYOMT5z
6pP2iljpUVw273Enge+yQnhK8cMXxsGOCvlYjEMkl4RSp0tm1pmPFaqssgm3X++9
GxWQHqBIYtS+FKRjrHR0xZxaKizgUpv2BOC3TP49tiDV0RxEc0WnbF2txxzTmoUL
9IqhG7/JFywNp5mGHTKH+1pOyKm3yrsrWyrD0478LelVT2/kF0CrH/sR+4sxgX0L
vji9gHd6z+QcsMD2Y47kFMG5Gww47iZ/803egLfSb7IIyhVcQZxKED4SxeJ8fRY=
=ohrH
-----END PGP SIGNATURE-----

--so9wFLtxonhCdBr5GK1BS198DuUWFWubg--

