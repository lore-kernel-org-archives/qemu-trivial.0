Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1a1w-00022B-Ah
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 10:27:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c1a1t-000203-Pm
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 10:27:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c1a1s-0001ED-Rh
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 10:27:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56288)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1c1a1o-0001CM-AE; Tue, 01 Nov 2016 10:27:04 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2651E3B716;
	Tue,  1 Nov 2016 14:27:03 +0000 (UTC)
Received: from [10.3.116.16] (ovpn-116-16.phx2.redhat.com [10.3.116.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA1ER2cw011328; Tue, 1 Nov 2016 10:27:02 -0400
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, quintela@redhat.com,
	amit.shah@redhat.com
References: <1477979405-16264-1-git-send-email-zhang.zhanghailiang@huawei.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, dgilbert@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <142defcb-88bd-727f-70e4-0c8ace3f2e76@redhat.com>
Date: Tue, 1 Nov 2016 09:27:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477979405-16264-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="JBpcODsgDtXecjSba0NhbvieTfvGg0cor"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 01 Nov 2016 14:27:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: fix missing
 assignment for has_x_checkpoint_delay
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
X-List-Received-Date: Tue, 01 Nov 2016 14:27:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JBpcODsgDtXecjSba0NhbvieTfvGg0cor
Content-Type: multipart/mixed; boundary="dpXgt4OQcChaO0XJqF3qqSvu1iaxjaUp6";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, quintela@redhat.com,
 amit.shah@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, dgilbert@redhat.com
Message-ID: <142defcb-88bd-727f-70e4-0c8ace3f2e76@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] migration: fix missing assignment for
 has_x_checkpoint_delay
References: <1477979405-16264-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1477979405-16264-1-git-send-email-zhang.zhanghailiang@huawei.com>

--dpXgt4OQcChaO0XJqF3qqSvu1iaxjaUp6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/01/2016 12:50 AM, zhanghailiang wrote:
> We forgot to assign true to params->has_x_checkpoint_delay parameter
> in qmp_query_migrate_parameters.
>=20
> Without this, qmp command 'query-migrate-parameters' doesn't show the
> default value for x-checkpoint-delay option.
> It doesn't influence output of hmp command 'info migrate_parameters'.

Well, only because the current code doesn't forcefully assign missing
optional parameters to any other value.  But HMP was relying on
unspecified behavior, that could have broken with any other qapi change.

I might word the commit message:

This also fixes the fact that HMP was relying on unspecified behavior by
reading x_checkpoint_delay without checking has_x_checkpoint_delay.

Up to the maintainer, though, since the patch itself is fine.

>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  hmp.c                 | 1 +
>  migration/migration.c | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--dpXgt4OQcChaO0XJqF3qqSvu1iaxjaUp6--

--JBpcODsgDtXecjSba0NhbvieTfvGg0cor
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYGKY1AAoJEKeha0olJ0NqxWEIAK2Z1i9oIMeucsYhvsrxd5Au
fMI353l+SlfHT0GPY3KIz3jm//vjoRCW72J18+hg68Py10nMyOUL6+jjpyR5Ns+S
4canx+xYfRANlWEvZ/k/z+WQ9BdNHFwqi7Xvos2HJvleF97RiIqImmgLtsL2PuPm
HGHA97OGHlYtqM7l6j/soq+Cl3p61tlLeAG4rAAk3RGtrwX2KmP2IsrA5oX8PiK2
YLIuDmUDxiwK3+GAc/hty3kLlFIIbRTHo9copsAVLCOLdFJPErE+h2NxqthSj47B
06ry0Q+JMBhLuqvitFaSPRBPrJ87XE2GbLCy7NVjMiRAPKTEvYGM1P7gWlrzLpw=
=gh0f
-----END PGP SIGNATURE-----

--JBpcODsgDtXecjSba0NhbvieTfvGg0cor--

