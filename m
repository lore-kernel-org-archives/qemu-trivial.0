Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEkU9-0006oJ-Fn
	for mharc-qemu-trivial@gnu.org; Tue, 05 Aug 2014 15:33:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XEeNc-0006dX-Vf
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 09:02:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XEeNY-0007cj-K8
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 09:02:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XEeNN-0007Yp-TP; Tue, 05 Aug 2014 09:02:02 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s75D1OxY018003
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 5 Aug 2014 09:01:25 -0400
Received: from [10.3.113.131] (ovpn-113-131.phx2.redhat.com [10.3.113.131])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s75D1LbF019437; Tue, 5 Aug 2014 09:01:22 -0400
Message-ID: <53E0D5A1.1060801@redhat.com>
Date: Tue, 05 Aug 2014 07:01:21 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1407143992-9248-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1407143992-9248-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="BLCsI8R9WVT7ITEFLv5NA0jd3fRjFlHD0"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 05 Aug 2014 15:33:22 -0400
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, stefanha@redhat.com, mst@redhat.com,
	qemu-trivial <qemu-trivial@nongnu.org>, marcel.a@redhat.com,
	luonengjun@huawei.com, armbru@redhat.com, lcapitulino@redhat.com,
	av1474@comtv.ru, kraxel@redhat.com, aliguori@amazon.com,
	imammedo@redhat.com, dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, afaerber@suse.de, dgilbert@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v4 0/8] don't use Yoda conditions
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
X-List-Received-Date: Tue, 05 Aug 2014 13:02:24 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BLCsI8R9WVT7ITEFLv5NA0jd3fRjFlHD0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/04/2014 03:19 AM, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> $WHATEVER: don't use 'Yoda conditions'
>=20
> 'Yoda conditions' are not part of idiomatic QEMU coding
> style, so rewrite them in the more usual order.
>=20
> v4:
>  - trivial typo for patch 1/8 suggested by Eric, thanks.

Series: Reviewed-by: Eric Blake <eblake@redhat.com>

Adding qemu-trivial in cc.

> Gonglei (8):
>   CODING_STYLE: Section about conditional statement
>   usb: don't use 'Yoda conditions'
>   audio: don't use 'Yoda conditions'
>   isa-bus: don't use 'Yoda conditions'
>   don't use 'Yoda conditions'
>   spice: don't use 'Yoda conditions'
>   vl: don't use 'Yoda conditions'
>   vmxnet3: don't use 'Yoda conditions'
>=20


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--BLCsI8R9WVT7ITEFLv5NA0jd3fRjFlHD0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJT4NWhAAoJEKeha0olJ0NqDCwH/jB4jJ535+KWEHoU25Xyvz0w
bTSe6I0qfP2qgG3oIcMuJTl4jlS/OA0wF8sdcUEuRpZIEe01cDuYkxwlE1Ugi5xW
SUTjx6510DkLGhl+9Gb/GpRUUDcAHth/P2RfS7bru1zSj7WyzHXvMn/Mz1FgTTSC
Gw2xIMwmgMFIU00sv3xmmfKyu7Knl9eoceEYY+HTAPpMdXD9MwI9a3bX1mh6jXlR
IT5eJKmSJUB0uZlGdKQvihn8B/7UTi/x2EWTzwyE+EihBlnxjX8EDjtcUSUn1S6D
hLmhvFGvjOJEuIdCAnREO6mg2c4pogpm+ykRbK5iKWYg5BJzfAsytPbM+WSTKg8=
=BIoW
-----END PGP SIGNATURE-----

--BLCsI8R9WVT7ITEFLv5NA0jd3fRjFlHD0--

