Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwVxa-0001T7-LU
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 12:10:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dwVxY-0001RC-AY
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 12:10:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dwVxW-0003eX-Ti
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 12:10:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51732)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dwVxP-0003Y9-Lr; Mon, 25 Sep 2017 12:10:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA043129865;
	Mon, 25 Sep 2017 16:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AA043129865
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.124.97] (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24F456F439;
	Mon, 25 Sep 2017 16:10:06 +0000 (UTC)
To: Daniel Loffgren <daniel@loffgren.org>, qemu-devel@nongnu.org
References: <5DAE0523-80F8-4F68-93CB-0571C0C62B20@loffgren.org>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <759768e1-9acb-c14b-7136-743cba166ef0@redhat.com>
Date: Mon, 25 Sep 2017 11:10:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <5DAE0523-80F8-4F68-93CB-0571C0C62B20@loffgren.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="HnrK0Jq9WXGxGU4G71aMBsKaH9idn1heh"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 25 Sep 2017 16:10:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] thunk.h uses
 TARGET_ABI_BITS without including abitypes.h
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
X-List-Received-Date: Mon, 25 Sep 2017 16:10:17 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HnrK0Jq9WXGxGU4G71aMBsKaH9idn1heh
Content-Type: multipart/mixed; boundary="vf38KLjR508GTHh8lQ2eipsMAU8C9J0lQ";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Daniel Loffgren <daniel@loffgren.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <759768e1-9acb-c14b-7136-743cba166ef0@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 2/2] thunk.h uses TARGET_ABI_BITS without
 including abitypes.h
References: <5DAE0523-80F8-4F68-93CB-0571C0C62B20@loffgren.org>
In-Reply-To: <5DAE0523-80F8-4F68-93CB-0571C0C62B20@loffgren.org>

--vf38KLjR508GTHh8lQ2eipsMAU8C9J0lQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/24/2017 08:02 PM, Daniel Loffgren wrote:
>=20
> Signed-off-by: Daniel Loffgren <daniel@loffgren.org>
> ---
>  include/exec/user/thunk.h | 1 +
>  1 file changed, 1 insertion(+)

meta-comment: your patch is titled 2/2, but was sent as its own
top-level thread (it is missing In-Reply-To: and References: headers).
When sending 2 patches as a series, it is important to include a 0/2
cover letter, and to properly thread things so that both 1/2 and 2/2 are
in-reply-to the 0/2 cover letter.  'git send-email' is probably the
easiest way to get this to work.  More patch submission hints at:

https://wiki.qemu.org/Contribute/SubmitAPatch

>=20
> diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h
> index f19ef4b230..12b5449d8c 100644
> --- a/include/exec/user/thunk.h
> +++ b/include/exec/user/thunk.h
> @@ -19,6 +19,7 @@
>  #ifndef THUNK_H
>  #define THUNK_H
> =20
> +#include "abitypes.h"
>  #include "cpu.h"
> =20
>  /* types enums definitions */
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--vf38KLjR508GTHh8lQ2eipsMAU8C9J0lQ--

--HnrK0Jq9WXGxGU4G71aMBsKaH9idn1heh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlnJKl0ACgkQp6FrSiUn
Q2rrGwgAj31yX/3yjvXmms6OP+Bj+LASQpfjsh6Lwr/70AY2T4cuhPk18gO/HhmC
0ANYDicLd1emZzqyrjApNsl12QBx5UEShC3Ak6nSz2mx/sgOrdPjANErbiIluKIN
anirSW/cVq1O6zVJCfHd1WxVVwrz3kgzbWvBPbXLTh8ivAQCKvMJYDEGzPXE52NW
MNs3K3deWdNCvd7UCBIh+48kVRJtEpWaovdz0q2ispF6OHRiMIM5yE7CMT70zKub
zR1J8Oxsy7ZxEUU4ftKfioTZAU3vOXgzEwLbbw5dJoggDMAsS/mwvvwtWMqcKGOr
0WodizLeJ0pwIYiuqNvsbZPNB7iPkg==
=11HH
-----END PGP SIGNATURE-----

--HnrK0Jq9WXGxGU4G71aMBsKaH9idn1heh--

