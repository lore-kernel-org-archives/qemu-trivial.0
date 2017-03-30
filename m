Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ctcdy-00078N-2H
	for mharc-qemu-trivial@gnu.org; Thu, 30 Mar 2017 12:09:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ctcds-00074Y-Gl
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 12:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ctcdr-0004O1-8h
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 12:09:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48944)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ctcdo-0004K8-I4; Thu, 30 Mar 2017 12:09:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 998FC4E4D8;
	Thu, 30 Mar 2017 16:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 998FC4E4D8
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 998FC4E4D8
Received: from [10.10.122.200] (ovpn-122-200.rdu2.redhat.com [10.10.122.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3E72182D3;
	Thu, 30 Mar 2017 16:09:37 +0000 (UTC)
To: Ed Maste <emaste@freebsd.org>, qemu-devel@nongnu.org
References: <20170330232236.8272-1-emaste@freebsd.org>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <c81096d0-9f81-a299-eb51-976917a5251f@redhat.com>
Date: Thu, 30 Mar 2017 11:09:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170330232236.8272-1-emaste@freebsd.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="meL790Db5xB9a2ah0JXALKrp39p87kh03"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 30 Mar 2017 16:09:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ipmi: use parens to avoid
 unexpected macro var evaluation
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
X-List-Received-Date: Thu, 30 Mar 2017 16:09:49 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--meL790Db5xB9a2ah0JXALKrp39p87kh03
Content-Type: multipart/mixed; boundary="36qwF6SNmwKjbeJi0dAihxh6OqWvIDLgi";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Ed Maste <emaste@freebsd.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <c81096d0-9f81-a299-eb51-976917a5251f@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] ipmi: use parens to avoid unexpected macro
 var evaluation
References: <20170330232236.8272-1-emaste@freebsd.org>
In-Reply-To: <20170330232236.8272-1-emaste@freebsd.org>

--36qwF6SNmwKjbeJi0dAihxh6OqWvIDLgi
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/30/2017 06:22 PM, Ed Maste wrote:
> Found via Clang warning: logical not is only applied to the left hand
> side of this bitwise operator [-Wlogical-not-parentheses]
>=20
>                               !IPMI_BT_GET_HBUSY(ib->control_reg));
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You just re-found bug 1651167 reported in December:
https://lists.gnu.org/archive/html/qemu-devel/2016-12/msg02704.html

>=20
> expanded from macro 'IPMI_BT_SET_HBUSY'
>                                        (((v & 1) << IPMI_BT_HBUSY_BIT))=
)
>                                           ^ ~
>=20
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  hw/ipmi/isa_ipmi_bt.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
> index 1c69cb33f8..c1dea503a2 100644
> --- a/hw/ipmi/isa_ipmi_bt.c
> +++ b/hw/ipmi/isa_ipmi_bt.c
> @@ -40,37 +40,37 @@
>  #define IPMI_BT_CLR_WR_MASK        (1 << IPMI_BT_CLR_WR_BIT)
>  #define IPMI_BT_GET_CLR_WR(d)      (((d) >> IPMI_BT_CLR_WR_BIT) & 0x1)=

>  #define IPMI_BT_SET_CLR_WR(d, v)   (d) =3D (((d) & ~IPMI_BT_CLR_WR_MAS=
K) | \
> -                                       (((v & 1) << IPMI_BT_CLR_WR_BIT=
)))
> +                                       ((((v) & 1) << IPMI_BT_CLR_WR_B=
IT)))

and still overparenthesized.  My proposal back then was:
https://lists.gnu.org/archive/html/qemu-devel/2016-12/msg03095.html

> Better would be:
>=20
> ((d) =3D (((d) & ~IPMI_BD_CLR_WR_MASK) | \
>         (((v) & 1) << IPMI_BT_CLR_WR_BIT)))

So why didn't we ever take v3 of the patch back then?
https://lists.gnu.org/archive/html/qemu-devel/2016-12/msg03196.html

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--36qwF6SNmwKjbeJi0dAihxh6OqWvIDLgi--

--meL790Db5xB9a2ah0JXALKrp39p87kh03
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY3S3BAAoJEKeha0olJ0NqcNYH/219WGSgvfaHK6bdR1QGciwi
yJ0Fp66YnIGiCH4QUuuA16Ng0vifvAPihRoGNFwRKH9tK7L7mTFIKfdZhCrJ5QI/
gUg+Eiyci7Wx/Y2Ah2/0wFQ8pjALME6QiPy0m/UH6H9UE7fbDqjkW2qorc/dwq1/
OMwY3Trid0YOyH4y84uFjoYNVzJ1jl7K3tsYZeFAP+wv9u7a0mdB+jXK7nEmvSgJ
BXV0dQnrbNcu8FkiOhaab6JgwZT0OWMeBo5/HOFJhClpugi/MeTxOn9e25TdU4Aq
8SVaJZt/D+jaGN4gFmvV4f9QGV3Si59XJH0GX5OUfMxAL7Pfxc2EFzpFitlavXE=
=6LzB
-----END PGP SIGNATURE-----

--meL790Db5xB9a2ah0JXALKrp39p87kh03--

