Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvd2e-0000pi-8q
	for mharc-qemu-trivial@gnu.org; Sat, 23 Sep 2017 01:31:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dvd2X-0000j7-SZ
	for qemu-trivial@nongnu.org; Sat, 23 Sep 2017 01:31:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dvd2V-0003ff-UN
	for qemu-trivial@nongnu.org; Sat, 23 Sep 2017 01:31:44 -0400
Received: from ozlabs.org ([103.22.144.67]:50411)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1dvd2O-0003Yp-8J; Sat, 23 Sep 2017 01:31:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3xzf920w07z9t6K; Sat, 23 Sep 2017 15:31:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1506144694;
	bh=6Fx55GnfoSv1AAyZSUireV5VKv7+k6C/Qf7TFwB1Vj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KibyXawU3sfq/N36WPEJxtatQ9Vei8I7gLyYKnNMuRzFxn9VvCz/LKgcnbulGOD2k
	VgSaaWps68E7gTm9fnOUGb8pVAgAgCL7cOW7jx0izvLTD8C2F2AtsjrcztuzeCSZIp
	9xTAI1Cxynm+kDGaGLJzsqLtP3ezs7RlQ3SRLSVg=
Date: Sat, 23 Sep 2017 15:31:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170923053127.GA12504@umbus>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-7-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20170922154014.29350-7-f4bug@amsat.org>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH 06/34] ppc: remove duplicated includes
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
X-List-Received-Date: Sat, 23 Sep 2017 05:31:49 -0000


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2017 at 12:39:46PM -0300, Philippe Mathieu-Daud=E9 wrote:
> applied using ./scripts/clean-includes
>=20
> not needed since 7ebaf795560
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_hcall.c | 1 -
>  target/ppc/kvm.c     | 3 ---
>  2 files changed, 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 57bb411394..2aeee28fe6 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -13,7 +13,6 @@
>  #include "trace.h"
>  #include "kvm_ppc.h"
>  #include "hw/ppc/spapr_ovec.h"
> -#include "qemu/error-report.h"
>  #include "mmu-book3s-v3.h"
> =20
>  struct SPRSyncState {
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 1deaf106d2..c9105af393 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -47,9 +47,6 @@
>  #include "sysemu/hostmem.h"
>  #include "qemu/cutils.h"
>  #include "qemu/mmap-alloc.h"
> -#if defined(TARGET_PPC64)
> -#include "hw/ppc/spapr_cpu_core.h"
> -#endif
>  #include "elf.h"
>  #include "sysemu/kvm_int.h"
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnF8a8ACgkQbDjKyiDZ
s5KCqBAAiSKO4TjrW2Ipp83di9lFF0sBcVMp9Vu/YP2YtT8JOEe2xVyGSLft74Hw
Kc6mVgNg0xrLX1LjaK2yp4+FPgU1p+z9VAs+uPrZQarV19+lPWHRoskmGzCS9kFq
2WyRjkGimZMwDITQ72wjoufuFd5IkTWtM3D2H2XOs1uGEmlGqz9NLcThyqzbAsv5
gAB13mHLcfyGbgot2ZwYoSN146UtzMC5xLLa7VH6iXdXVIttvr6RkQ2n6Ht0dE9t
gj82BQxcq0MyE5+prhkXS/kBuz3D6M5Q0SXcD9zfuI6CCDwEpVeI6qxwbrGetpoi
h6o80R0r4ymiAE4ot4Gdy9Nxf/O6SoLDN6PGM1+ZBeyby80oaqFK/BtWbpyasmf2
uJ0EHwgRMnxoFIZ+yXKkuc6mbS5gLYJ7MBU0cxB9J116Jhf5IU2+jm4uZohtWuZM
LreTDT/6fQT9HnQytzGxo7E80yKUP6OSuWi39kuTKeAUqsF/WhqEcXh5mdXVPicp
6fSup7ww9iT6Y0do95vkF54s5O/fEd4EiR8mKwcrM+B23aXInTX76/w2cNiEQQA3
ansoSTzljRaoV4+pgx/Pk5yxBbBpDjuzkIzv++U5VqFNRXaj4bUL5YqoGDVvFtDK
Jt9Lrv/W/HgRf25cU54bVUL3PW+nra9TWAOONmJWD/+gWjejZUo=
=iCzI
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--

