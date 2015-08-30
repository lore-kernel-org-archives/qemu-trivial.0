Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZW4hy-0003fo-ST
	for mharc-qemu-trivial@gnu.org; Sun, 30 Aug 2015 11:39:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZW4hw-0003eJ-GX
	for qemu-trivial@nongnu.org; Sun, 30 Aug 2015 11:39:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZW4hv-0002D2-JT
	for qemu-trivial@nongnu.org; Sun, 30 Aug 2015 11:39:48 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:60855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZW4hq-0002Bi-I1; Sun, 30 Aug 2015 11:39:42 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2B68111822A6; Sun, 30 Aug 2015 17:39:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id lB4VVC_aFCjl; Sun, 30 Aug 2015 17:39:39 +0200 (CEST)
Received: from [192.168.178.24] (p54ACAA4C.dip0.t-ipconnect.de [84.172.170.76])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	1DDBD118188E; Sun, 30 Aug 2015 17:39:39 +0200 (CEST)
Message-ID: <55E323BA.8030402@weilnetz.de>
Date: Sun, 30 Aug 2015 17:39:38 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Samuel Thibault <samuel.thibault@gnu.org>
References: <20150830141909.GA13186@var.home> <20150830151213.GE3238@var.home>
In-Reply-To: <20150830151213.GE3238@var.home>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="S9vBuE1uvQT5TNfo0hMPkFEOkecCqHoxb"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] baum: Fix build with
	debugging enabled
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
X-List-Received-Date: Sun, 30 Aug 2015 15:39:49 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--S9vBuE1uvQT5TNfo0hMPkFEOkecCqHoxb
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Am 30.08.2015 um 17:12 schrieb Samuel Thibault:
> cur and buf are pointers, so the difference is a ptrdiff_t
>
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>
> diff --git a/backends/baum.c b/backends/baum.c
> index a69aaff..1f9288e 100644
> --- a/backends/baum.c
> +++ b/backends/baum.c
> @@ -303,7 +303,7 @@ static int baum_eat_packet(BaumDriverState *baum, c=
onst uint8_t *buf, int len)
>                  return 0;
>              cur++;
>          }
> -        DPRINTF("Dropped %d bytes!\n", cur - buf);
> +        DPRINTF("Dropped %td bytes!\n", cur - buf);
>      }
> =20
>  #define EAT(c) do {\
>

Please don't send patches as reply to previous e-mails
and use a subject which shows the patch revision (here
"[PATCH v2] baum: Fix build with debugging enabled")
for future patches.

Reviewed-by: Stefan Weil <sw@weilnetz.de>



--S9vBuE1uvQT5TNfo0hMPkFEOkecCqHoxb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJV4yO6AAoJEOCMIdVndFCtDxkP/0SiTqCRWA3qwV9ShwXOSDIx
4ZK3DfBiOnR5ysnlrHgIB3Gc6Ee52Dv0l1JHcivboO9rLpOPtdJup2+LpKwPzuaG
w3mcQRqlGBvEMiMuPmRVLRwnr2YlaPAhW9e0an1cGLYmn31bhVN2eK3BLvK8eWuR
ovScz1pX/tS/i0SpBNhfOxs4NDVlgFT2qFeOcqWcBefutpqcGPt4cInP29aezWsY
6zHYms+noX4ypyrzLGF4RpYYQ1T2bKStKIcMIfW1jz2WVFdeLhidGBu74vZJwNB3
klr7n3Ll3f372w2dXUcGuRtRmGkBeQxO9aDIEdw1ND1AedhGk4E1iZXkWesnY5Ph
gtXCQwa3aEMuD0ZxsCAwmpR5Dh54Awuttny8KfNySCRe7S/h+UasL2DDgWk9pWgJ
OPo6fhwgy3GVCT9mXM5QIwS8Hzi1cerd7NIdqff1uDznYt2/amlMs9u1Xg3eNWmO
WMbX2Rfzo/ILhXas5vCn3VASnAhYaiqhOYsAUPr8WzOEeWprqpf6BSevvZZd7lyV
gwH8JjY8kMPOUtutG4ctM/+xQ8oeuF0rVJXVYdKJWC6nwX/bB/JsbjKTAz0ctzob
6E5NDt/povDtYi8/gWsem0+wVaAk+k+Ku/4szjkAWVIxZeLr4F2VQxjF6KUbPz6h
4yGAu6Hi7nPoESSwUVtw
=fyok
-----END PGP SIGNATURE-----

--S9vBuE1uvQT5TNfo0hMPkFEOkecCqHoxb--

