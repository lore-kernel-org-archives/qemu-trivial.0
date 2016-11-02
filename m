Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1w9m-000453-Jz
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 10:04:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c1w9h-00041a-AB
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 10:04:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c1w9g-00037n-DG
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 10:04:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1c1w9b-00032w-2T; Wed, 02 Nov 2016 10:04:35 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 361B0338842;
	Wed,  2 Nov 2016 14:04:34 +0000 (UTC)
Received: from [10.3.116.16] (ovpn-116-16.phx2.redhat.com [10.3.116.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA2E4XTs008317; Wed, 2 Nov 2016 10:04:33 -0400
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, armbru@redhat.com
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
Date: Wed, 2 Nov 2016 09:04:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="msRtsrI4ib3SPmvr234mnWKBetQiwASqO"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 02 Nov 2016 14:04:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] qapi-schema: clarify 'colo' state for
 MigrationStatus
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
X-List-Received-Date: Wed, 02 Nov 2016 14:04:45 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--msRtsrI4ib3SPmvr234mnWKBetQiwASqO
Content-Type: multipart/mixed; boundary="PG7A3gJkXXid04GBriivTWrh4JFVDAu5V";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, armbru@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
Subject: Re: [PATCH v2] qapi-schema: clarify 'colo' state for MigrationStatus
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>

--PG7A3gJkXXid04GBriivTWrh4JFVDAu5V
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/02/2016 02:44 AM, zhanghailiang wrote:
> VM can not get into colo state unless users enable 'x-colo'
> capability for migration, Here it is necessary to clarify
> this.
>=20
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
> v2:
> - Clarify colo state for RunState too as Eric suggested.
> ---
>  qapi-schema.json | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--PG7A3gJkXXid04GBriivTWrh4JFVDAu5V--

--msRtsrI4ib3SPmvr234mnWKBetQiwASqO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYGfJxAAoJEKeha0olJ0NqtbMH/0dalMyhB9hBQiLl1EoLazc/
VND4Hnvnq3ql0ST56aPugI/m5awVVF1KMEFxrHdv4/uFkjltC3SKsxNLl0dPFDbH
WsCDLWVELwMf/evWZSXFlDWq/UxSytqyVsZVzif8+zGoY65a11oj1HfWgWBpsFKl
Nkpinwtri3bbaU2q7MpRpQoWSbEeudlyQQb649gYrnBxbMSjMgouofVgQRbk3Vm2
B8xHl1tvAe617A9q/AKWom7KlcyyZFOtmnTchtxhOmlAVDSjgRRCC4+Iwblhq+FA
Hy7dQ2EwAaP8crPqc8wBPTNFxbANEp7nPIz+dkHsOJNzbFn3N14qksZTZfUwQ3g=
=2vai
-----END PGP SIGNATURE-----

--msRtsrI4ib3SPmvr234mnWKBetQiwASqO--

