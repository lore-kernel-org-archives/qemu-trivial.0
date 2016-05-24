Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5Ehz-0003w4-N2
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 11:57:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b5Eht-0003nz-UY
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b5Ehs-0004DP-3U
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:57:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38066)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b5Ehl-0004CO-Bw; Tue, 24 May 2016 11:57:13 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1A227F0A6;
	Tue, 24 May 2016 15:57:12 +0000 (UTC)
Received: from [10.3.116.141] (ovpn-116-141.phx2.redhat.com [10.3.116.141])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4OFvCaY023620; Tue, 24 May 2016 11:57:12 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1464103684-27230-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <574479D8.10401@redhat.com>
Date: Tue, 24 May 2016 09:57:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1464103684-27230-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="vMEEjtnUbwvuoh2pHBRXmfoGkefl1U11M"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 24 May 2016 15:57:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw: Clean up includes
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
X-List-Received-Date: Tue, 24 May 2016 15:57:26 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vMEEjtnUbwvuoh2pHBRXmfoGkefl1U11M
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/24/2016 09:28 AM, Peter Maydell wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
>=20
> This commit was created with scripts/clean-includes.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/aspeed_vic.c   | 1 -
>  hw/timer/mc146818rtc.c | 1 -
>  include/exec/hwaddr.h  | 1 -
>  include/qemu/fifo32.h  | 1 -
>  4 files changed, 4 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--vMEEjtnUbwvuoh2pHBRXmfoGkefl1U11M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXRHnYAAoJEKeha0olJ0Nqd0IH/Rk4kf2dldsDmfO/zCeYAipd
ooIyVbAO0rJtXTz09wU3GUd42UzVvtZVdJLn5SbcZmAzz6GxQe0xMlE+14rrVyGM
muFxdc6WMtCliE5ZveTMgLyVRXOpfBiuTPAu2hNFMwpb98CuWoga6r1wu/hS7pCY
tudQU+zMSJSJXQ1MIY9TDR+PQDKlMvhE17bpAt8snVRrZ5ZXO/6P5UX+1U7TEtz7
5BUm/ke5vhBUebZwjDDnZyoP+9fhmJ60338x7smuFV682CKOxge7JAgn+Y3MpSiu
mHEsjW9J7u9knbpHOVCHN2bpdgoLHrIz0C8ZzpCh1+5qdupVByq6Md3drsqvf3M=
=Awhl
-----END PGP SIGNATURE-----

--vMEEjtnUbwvuoh2pHBRXmfoGkefl1U11M--

