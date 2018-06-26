Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXdXK-0005vI-9v
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 22:16:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fXdXI-0005tT-2q
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 22:16:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fXdXE-0001UQ-35
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 22:16:49 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:47933)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1fXdX3-0001Kr-0m; Mon, 25 Jun 2018 22:16:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 41F8mY6Qndz9s0W; Tue, 26 Jun 2018 12:16:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1529979389;
	bh=AC3CXbGfAaRAuxqI2QxRqgq6LlQvXBa8jZgbj1lIR9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhDPrepHY/c9vyA5zK1OtH8b4LCUMdt8ganxEUEW7eIZ0yPXmGHZbxAB7keOmEzoJ
	Y7Cr7IkT1RkO0ITeNHjHW94rklhBZ4ET6f317h4G6WGScBS3DBRKw36eKahftElk+q
	miKdIpUTdAnOaLve4fLPLzaXGjH7lxvd3QB4OF04=
Date: Tue, 26 Jun 2018 10:48:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>
Message-ID: <20180626004844.GG22971@umbus.fritz.box>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-42-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m0vRWufqUC70IDnR"
Content-Disposition: inline
In-Reply-To: <20180625124238.25339-42-f4bug@amsat.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [PATCH v5 41/46] hw/ppc: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Tue, 26 Jun 2018 02:16:53 -0000


--m0vRWufqUC70IDnR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 25, 2018 at 09:42:33AM -0300, Philippe Mathieu-Daud=E9 wrote:
> It eases code review, unit is explicit.
>=20
> Patch generated using:
>=20
>   $ git grep -n '[<>][<>]=3D ?[1-5]0'
>=20
> and modified manually.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/sam460ex.c       | 2 +-
>  target/ppc/mmu_helper.c | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index ffe561fbc1..c7c799b843 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -126,7 +126,7 @@ static void generate_eeprom_spd(uint8_t *eeprom, ram_=
addr_t ram_size)
>      int i;
> =20
>      /* work in terms of MB */
> -    ram_size >>=3D 20;
> +    ram_size /=3D MiB;
> =20
>      while ((ram_size >=3D 4) && (nbanks <=3D 2)) {
>          int sz_log2 =3D MIN(31 - clz32(ram_size), 14);
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 98ce17985b..e6739e6c24 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -17,6 +17,7 @@
>   * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "cpu.h"
>  #include "exec/helper-proto.h"
>  #include "sysemu/kvm.h"
> @@ -1090,11 +1091,10 @@ static void mmubooke_dump_mmu(FILE *f, fprintf_fu=
nction cpu_fprintf,
>          pa =3D entry->RPN & mask;
>          /* Extend the physical address to 36 bits */
>          pa |=3D (hwaddr)(entry->RPN & 0xF) << 32;
> -        size /=3D 1024;
> -        if (size >=3D 1024) {
> -            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "M", size /=
 1024);
> +        if (size >=3D 1 * MiB) {
> +            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "M", size /=
 MiB);
>          } else {
> -            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size);
> +            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size /=
 KiB);
>          }
>          cpu_fprintf(f, "0x%016" PRIx64 " 0x%016" PRIx64 " %s %-5u %08x %=
08x\n",
>                      (uint64_t)ea, (uint64_t)pa, size_buf, (uint32_t)entr=
y->PID,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--m0vRWufqUC70IDnR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlsxjWMACgkQbDjKyiDZ
s5IeHA//WKWRBI5sSa9Tj8RPBFwFiFxvYehmayuzOlfZ7ewZ8EG8mlXg3w52uboW
6t+JjNF8vIhmTm83/qTKJB9Fzn6bZalqDaa23OYlSOeDt9EhP2wAxocbfRvJt9KH
3bthUP1EWncRGYdpvMQqVJPdlyM9YPdRMHfWrzKWACGgWT+fzmNnzgmbS/DCNodC
Mwdnofs7fOYGR5guxFCgqpN8zGlikPg4s++NE1IeNq4KR+veUIqDZVHVM6i+33yW
NdEjv0VFXI0mEYCS3X5w1jv0T+yyaZ5L+Eog+Y+ppcTVmeV1ZSKQ+9FZORl56mLp
FmKmV7YDBQpc0a8rpUqRTr3NE9TO7qcRjyFfnV9b3BgN8WdQjEC+ShrJpO5sQWl0
UmIgyE0MdETpRTL9a7+ayhFjEXyNNENpVCS80Ud4d5x08IGeODVEM15HDzJcIk0l
dbtY3Bt8eJ+ffmcwPnMGlJ9eQrwAARnsVRMZU7Nh8mFnbsdthxdQiKNDEAe2u9WY
W2RHMippDQ1nRYQr5ukeDg8s9QnJzz0VhYsLzg1xogOifYufEZxQZWZ5c3qjYsfX
7WxJx/oGCIOl/U2GGkBUBAGMsf+r4kExazVqcSbBZcnjbEa98REC00ZyESou1ElI
kFSMXpvp075GgqHag1lNqE7Dvsanr9MxfqX9tH7X2JDA1li92oY=
=ldnl
-----END PGP SIGNATURE-----

--m0vRWufqUC70IDnR--

