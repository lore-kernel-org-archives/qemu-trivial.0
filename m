Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1a34-0002eS-IA
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 10:28:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c1a31-0002d2-Vb
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 10:28:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c1a2y-0001XH-RR
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 10:28:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>) id 1c1a2y-0001Wm-J9
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 10:28:16 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D68A18553F;
	Tue,  1 Nov 2016 14:28:15 +0000 (UTC)
Received: from [10.3.116.16] (ovpn-116-16.phx2.redhat.com [10.3.116.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA1ESFj2022417; Tue, 1 Nov 2016 10:28:15 -0400
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1477979511-15460-1-git-send-email-zhang.zhanghailiang@huawei.com>
Cc: armbru@redhat.com, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <29570f3d-1a97-8b5a-7b0d-628c61004cc0@redhat.com>
Date: Tue, 1 Nov 2016 09:28:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477979511-15460-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Awcpk96UXenGf7gMXmLteXTSXOdATegC0"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 01 Nov 2016 14:28:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qapi-schema: clarify 'colo' state for
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
X-List-Received-Date: Tue, 01 Nov 2016 14:28:21 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Awcpk96UXenGf7gMXmLteXTSXOdATegC0
Content-Type: multipart/mixed; boundary="X5vndcjlVhmI5FqVUc8NxoNUrp3TA312K";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Cc: armbru@redhat.com, qemu-trivial@nongnu.org
Message-ID: <29570f3d-1a97-8b5a-7b0d-628c61004cc0@redhat.com>
Subject: Re: [PATCH] qapi-schema: clarify 'colo' state for MigrationStatus
References: <1477979511-15460-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1477979511-15460-1-git-send-email-zhang.zhanghailiang@huawei.com>

--X5vndcjlVhmI5FqVUc8NxoNUrp3TA312K
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/01/2016 12:51 AM, zhanghailiang wrote:
> VM can not get into colo state unless users enable 'x-colo'
> capability for migration, Here it is necessary to clarify
> this.
>=20
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  qapi-schema.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 8a7b527..d580169 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -462,7 +462,8 @@
>  #
>  # @failed: some error occurred during migration process.
>  #
> -# @colo: VM is in the process of fault tolerance. (since 2.8)
> +# @colo: VM is in the process of fault tolerance, VM can not get into =
this
> +#        state unless colo capability is enabled for migration. (since=
 2.8)

This hunk is for MigrationStatus; can you also add similar wording for
the documentation of RunState?  Looking forward to v2.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--X5vndcjlVhmI5FqVUc8NxoNUrp3TA312K--

--Awcpk96UXenGf7gMXmLteXTSXOdATegC0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYGKZ+AAoJEKeha0olJ0Nq1ooH/3uSasM5EMDLKZGbRYfzV03W
Sszcqi5Hzqs7JKo27u2ElTKksOENzm3RYGmD2Fp64n+4mCMzcegYZHFKz4trAN/r
zsdDRrCwH+VSrnEkC0YexkAQlYimrgf5hwiHXc45ZzqAO+8SCFgcMYEkzIKM42F8
RFuQVHcGmyPr4YiPIyjjltUw7Z7mrGI7dsAbrEDhsx8X8gmbk2agRWQg2pKz56VF
rkMRZL4LQBKRCjUj+JbMuRi8ixkjBEUUqzQATVV3HvzD6qes/G7qOr1v2hoCO6is
zXDpAslaLDszShqxGiQugaXYOfCMb7H8VQ2JBxHGQKXr5CbPr8XVa0AwMr7ALNA=
=iMnY
-----END PGP SIGNATURE-----

--Awcpk96UXenGf7gMXmLteXTSXOdATegC0--

