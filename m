Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvd0V-0007WT-Fp
	for mharc-qemu-trivial@gnu.org; Sat, 23 Sep 2017 01:29:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dvd0Q-0007P7-4N
	for qemu-trivial@nongnu.org; Sat, 23 Sep 2017 01:29:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dvd0M-0002F7-Sv
	for qemu-trivial@nongnu.org; Sat, 23 Sep 2017 01:29:34 -0400
Received: from ozlabs.org ([103.22.144.67]:60467)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1dvd0G-00029u-Ba; Sat, 23 Sep 2017 01:29:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3xzf6R6FVTz9t3w; Sat, 23 Sep 2017 15:29:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1506144559;
	bh=esW/+Pi5zbqQzWFAlHDFsKt+BkR37b7mI0KJap01vWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFulw7CbUHpxVvDgWi66V3Gybx2VHm4wldzgvCN5DyxY1Zx8pEw1i3ujxE1mosO9y
	b4/ryOLkM2fcrmgQauBeYL3fZkjv8ilkeXMuXwdL+JqHZeT3mJbjsZdxY8m80P5gRi
	YrpJykvcCc/mMK79Hv6bWfcDWytsoaW4UMdAbGjE=
Date: Sat, 23 Sep 2017 15:14:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	Alexander Graf <agraf@suse.de>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170923051403.GD4998@umbus.fritz.box>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-8-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FJ766Kk/2p6HVARF"
Content-Disposition: inline
In-Reply-To: <20170922160111.31885-8-f4bug@amsat.org>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH 30/34] hw/net/pcnet: use TYPE_PCI_PCNET
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
X-List-Received-Date: Sat, 23 Sep 2017 05:29:35 -0000


--FJ766Kk/2p6HVARF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2017 at 01:01:07PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

ppc portion

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/hw/net/pci.h | 1 +
>  hw/mips/mips_malta.c | 2 +-
>  hw/net/pcnet-pci.c   | 3 +--
>  hw/ppc/prep.c        | 3 ++-
>  4 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/hw/net/pci.h b/include/hw/net/pci.h
> index 92111f86f3..5ad5487a91 100644
> --- a/include/hw/net/pci.h
> +++ b/include/hw/net/pci.h
> @@ -15,6 +15,7 @@
> =20
>  #define TYPE_PCI_E1000      "e1000"
>  #define TYPE_PCI_E1000E     "e1000e"
> +#define TYPE_PCI_PCNET      "pcnet"
> =20
>  PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>                                 const char *default_model,
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index fb6a2f9363..921678fdb0 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -597,7 +597,7 @@ static void network_init(PCIBus *pci_bus)
>              /* The malta board has a PCNet card using PCI SLOT 11 */
>              default_devaddr =3D "0b";
> =20
> -        pci_nic_init_nofail(nd, pci_bus, "pcnet", default_devaddr);
> +        pci_nic_init_nofail(nd, pci_bus, TYPE_PCI_PCNET, default_devaddr=
);
>      }
>  }
> =20
> diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
> index 0acf8a4879..878e2c89c1 100644
> --- a/hw/net/pcnet-pci.c
> +++ b/hw/net/pcnet-pci.c
> @@ -29,6 +29,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "hw/pci/pci.h"
> +#include "hw/net/pci.h"
>  #include "net/net.h"
>  #include "hw/loader.h"
>  #include "qemu/timer.h"
> @@ -46,8 +47,6 @@
>  //#define PCNET_DEBUG_TMD
>  //#define PCNET_DEBUG_MATCH
> =20
> -#define TYPE_PCI_PCNET "pcnet"
> -
>  #define PCI_PCNET(obj) \
>       OBJECT_CHECK(PCIPCNetState, (obj), TYPE_PCI_PCNET)
> =20
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index fb330a1769..b2c7a62ebc 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -44,6 +44,7 @@
>  #include "hw/input/i8042.h"
>  #include "hw/isa/pc87312.h"
>  #include "hw/net/ne2000-isa.h"
> +#include "hw/net/pci.h"
>  #include "sysemu/block-backend.h"
>  #include "sysemu/arch_init.h"
>  #include "sysemu/kvm.h"
> @@ -800,7 +801,7 @@ static void ibm_40p_init(MachineState *machine)
>          pci_vga_init(pci_bus);
> =20
>          for (i =3D 0; i < nb_nics; i++) {
> -            pci_nic_init_nofail(&nd_table[i], pci_bus, "pcnet",
> +            pci_nic_init_nofail(&nd_table[i], pci_bus, TYPE_PCI_PCNET,
>                                  i =3D=3D 0 ? "3" : NULL);
>          }
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FJ766Kk/2p6HVARF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnF7ZsACgkQbDjKyiDZ
s5KjEg/+PDQr+QccK4hE+upZjmuJzkuQILaiTRxsukyodpODDlkBzPu+/he7kPU1
6InBbk7UJKI8MXOvp48j9JHwCLN0mhVYuNU+A+vb6EQvZgEAs1noQt80JPEjjeuI
xpZq5lqGQ5aXsRxhY6L/cW7xpGJmJQ+VyMAE58tjmUTcznASUgdD9YB1Xdg81daA
AwOkAvzWYal3ct4MDQ2vB6M/fS9wZtl6QXt8uovBH6xleVrGW0AtyWZo68mEE1+u
eGpfS76ZyR7I39H/5cBViz7jBwAtKPx06VzMayiz9/O8nmGcDWI/fN3dy0l8GEfU
MhK3fzwhgO8W6hTSr5F57ECpAUq2O/0M6zGbX+9IvK/6g9b1GsV8BcaD1AZsWV+x
HIHhv1GhIHszn4INizTML/Y2E6Q+qquYVceMHPUgXbgN9bGMxLuP9aEUJ7Wq1msU
uAPb1pQwQIPXnhh1U645JcH4NpnB5ADoJkq2kJeRSLzUetnSqG40HWjgwBVM4wm2
SvgCw+l0p8XRA9MnM1Fq3Bvu4AZeZKv2aCf+jSh9ko2PUStb8t2kzlctDLVEr7ak
bntLKlVqQaRpA6Lq+id0BIOR7ZLmBHhuVPhgS4fN7UOKksEoG+zDQQXG2HWffBsk
sn0tjeOCkZ+/o8tU3ZuG/TJa8wo6lkPgcMrWgrG+6juTRneOgF0=
=4mXj
-----END PGP SIGNATURE-----

--FJ766Kk/2p6HVARF--

