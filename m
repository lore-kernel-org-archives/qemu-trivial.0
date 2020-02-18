Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j40YL-0005UY-R3
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 05:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1j40YJ-0005UI-Kj
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:56:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1j40YI-0001Kh-3a
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:56:31 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45683
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1j40YH-0001Je-VS
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582023389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7AcpjIQ4pDW1sZUuaTAPb1emcrjEToud4U8eecjban0=;
 b=X3wCJ7fOyPgiP61P9MLwuGQ8owq8kwLRfr/ATKpgrmlG2BrMqw8q3SUIS19ABey3ET0Zbd
 2taKOLzr8xHeMRiIJwtPNvNeVbU1U/lxin5fUfWDvDhUiOLOXW1Bw0fwyOTquiL+vdbU2J
 Jqeg7GGoK9802Zv4xyALvR/8k4qcd8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-QraJwdcuN--ERTVEBDDYEg-1; Tue, 18 Feb 2020 05:56:24 -0500
X-MC-Unique: QraJwdcuN--ERTVEBDDYEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5C6E801E5C;
 Tue, 18 Feb 2020 10:56:23 +0000 (UTC)
Received: from localhost (unknown [10.36.118.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8E575C1B2;
 Tue, 18 Feb 2020 10:56:19 +0000 (UTC)
Date: Tue, 18 Feb 2020 10:56:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/net/rocker: Report unimplemented feature with
 qemu_log_mask(UNIMP)
Message-ID: <20200218105618.GD786556@stefanha-x1.localdomain>
References: <20200217101637.27558-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200217101637.27558-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Feb 2020 10:56:32 -0000

--48TaNjbzBVislYPb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 11:16:37AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Fix warnings reported by Clang static code analyzer:
>=20
>     CC      hw/net/rocker/rocker.o
>   hw/net/rocker/rocker.c:213:9: warning: Value stored to 'tx_tso_mss' is =
never read
>           tx_tso_mss =3D rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_TSO_MSS])=
;
>           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   hw/net/rocker/rocker.c:217:9: warning: Value stored to 'tx_tso_hdr_len'=
 is never read
>           tx_tso_hdr_len =3D rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_TSO_H=
DR_LEN]);
>           ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>   hw/net/rocker/rocker.c:255:9: warning: Value stored to 'tx_l3_csum_off'=
 is never read
>           tx_l3_csum_off +=3D tx_tso_mss =3D tx_tso_hdr_len =3D 0;
>           ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Fixes: dc488f888
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/net/rocker/rocker.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5LwtIACgkQnKSrs4Gr
c8gHMwf9HO+0vNBixiIuX3+LXl/msHa7IP8K7GJH3aBJpZzYP2JS2SCHni9l54Eq
oJAyO0ieWq47oouB4dVmw5dOafqjVvTQeDSKzRhAMrDOUf4bafKrhHPx64e+H7xz
wEPJeH+/2rY/rQfNdFFvMyyWHdQQhMwJNv2r3su2DxvSVFWj4NiA37q4dP8k6QDW
WA9sKkVwAAR0cqjq4xkIXC3qkN4cyNxb8kMADGyCO2zSsqhSXfZROS6hWKaUE9YH
G5eh9LtsF/R1A9soBgHMa8kE1wv9I7zBZKNezmePi38jtQqsmm6/OMwCkXmn5oyO
pJwQsJHoUuVjJxyuDYPjC3Fd+AFtHg==
=wbm4
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--


