Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S6RlT-0002wR-QQ
	for mharc-qemu-trivial@gnu.org; Sat, 10 Mar 2012 14:15:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S6RlQ-0002lD-C4
	for qemu-trivial@nongnu.org; Sat, 10 Mar 2012 14:15:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S6RlO-000117-9E
	for qemu-trivial@nongnu.org; Sat, 10 Mar 2012 14:15:35 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:57084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1S6Rl1-0000yE-PW; Sat, 10 Mar 2012 14:15:12 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A0B7C72800A0; Sat, 10 Mar 2012 20:15:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id z90TKI54gKcg; Sat, 10 Mar 2012 20:15:08 +0100 (CET)
Received: from flocke.weilnetz.de (p5086F01F.dip.t-dialin.net [80.134.240.31])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	92F1B728009F; Sat, 10 Mar 2012 20:15:08 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1S6Rky-0001iu-1i; Sat, 10 Mar 2012 20:15:08 +0100
Message-ID: <4F5BA83B.1010403@weilnetz.de>
Date: Sat, 10 Mar 2012 20:15:07 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120207 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <1328473147-22124-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1328473147-22124-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Add missing const attributes for
	MemoryRegionOps
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
X-List-Received-Date: Sat, 10 Mar 2012 19:15:38 -0000

Am 05.02.2012 21:19, schrieb Stefan Weil:
> Most MemoryRegionOps already had the const attribute.
> This patch adds it to the remaining ones.
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   hw/cuda.c          |    2 +-
>   hw/ide/ahci.c      |    4 ++--
>   hw/ide/cmd646.c    |    6 +++---
>   hw/ide/macio.c     |    2 +-
>   hw/ide/piix.c      |    2 +-
>   hw/ide/via.c       |    2 +-
>   hw/mipsnet.c       |    2 +-
>   hw/opencores_eth.c |    4 ++--
>   hw/spapr_pci.c     |    2 +-
>   9 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/hw/cuda.c b/hw/cuda.c
> index 4077436..233ab66 100644
> --- a/hw/cuda.c
> +++ b/hw/cuda.c
> @@ -634,7 +634,7 @@ static uint32_t cuda_readl (void *opaque, target_phys_addr_t addr)
>       return 0;
>   }
>
> -static MemoryRegionOps cuda_ops = {
> +static const MemoryRegionOps cuda_ops = {
>       .old_mmio = {
>           .write = {
>               cuda_writeb,
> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index 630d572..cc54590 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -365,7 +365,7 @@ static void ahci_mem_write(void *opaque, target_phys_addr_t addr,
>
>   }
>
> -static MemoryRegionOps ahci_mem_ops = {
> +static const MemoryRegionOps ahci_mem_ops = {
>       .read = ahci_mem_read,
>       .write = ahci_mem_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
> @@ -401,7 +401,7 @@ static void ahci_idp_write(void *opaque, target_phys_addr_t addr,
>       }
>   }
>
> -static MemoryRegionOps ahci_idp_ops = {
> +static const MemoryRegionOps ahci_idp_ops = {
>       .read = ahci_idp_read,
>       .write = ahci_idp_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index d78ed69..0aac94a 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -65,7 +65,7 @@ static void cmd646_cmd_write(void *opaque, target_phys_addr_t addr,
>       ide_cmd_write(cmd646bar->bus, addr + 2, data);
>   }
>
> -static MemoryRegionOps cmd646_cmd_ops = {
> +static const MemoryRegionOps cmd646_cmd_ops = {
>       .read = cmd646_cmd_read,
>       .write = cmd646_cmd_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
> @@ -104,7 +104,7 @@ static void cmd646_data_write(void *opaque, target_phys_addr_t addr,
>       }
>   }
>
> -static MemoryRegionOps cmd646_data_ops = {
> +static const MemoryRegionOps cmd646_data_ops = {
>       .read = cmd646_data_read,
>       .write = cmd646_data_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
> @@ -193,7 +193,7 @@ static void bmdma_write(void *opaque, target_phys_addr_t addr,
>       }
>   }
>
> -static MemoryRegionOps cmd646_bmdma_ops = {
> +static const MemoryRegionOps cmd646_bmdma_ops = {
>       .read = bmdma_read,
>       .write = bmdma_write,
>   };
> diff --git a/hw/ide/macio.c b/hw/ide/macio.c
> index a827d81..2c4027d 100644
> --- a/hw/ide/macio.c
> +++ b/hw/ide/macio.c
> @@ -291,7 +291,7 @@ static uint32_t pmac_ide_readl (void *opaque,target_phys_addr_t addr)
>       return retval;
>   }
>
> -static MemoryRegionOps pmac_ide_ops = {
> +static const MemoryRegionOps pmac_ide_ops = {
>       .old_mmio = {
>           .write = {
>               pmac_ide_writeb,
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index a472bff..c524f55 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -79,7 +79,7 @@ static void bmdma_write(void *opaque, target_phys_addr_t addr,
>       }
>   }
>
> -static MemoryRegionOps piix_bmdma_ops = {
> +static const MemoryRegionOps piix_bmdma_ops = {
>       .read = bmdma_read,
>       .write = bmdma_write,
>   };
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 2771f0c..ad6f302 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -82,7 +82,7 @@ static void bmdma_write(void *opaque, target_phys_addr_t addr,
>       }
>   }
>
> -static MemoryRegionOps via_bmdma_ops = {
> +static const MemoryRegionOps via_bmdma_ops = {
>       .read = bmdma_read,
>       .write = bmdma_write,
>   };
> diff --git a/hw/mipsnet.c b/hw/mipsnet.c
> index a0e6c9f..1b49a79 100644
> --- a/hw/mipsnet.c
> +++ b/hw/mipsnet.c
> @@ -224,7 +224,7 @@ static NetClientInfo net_mipsnet_info = {
>       .cleanup = mipsnet_cleanup,
>   };
>
> -static MemoryRegionOps mipsnet_ioport_ops = {
> +static const MemoryRegionOps mipsnet_ioport_ops = {
>       .read = mipsnet_ioport_read,
>       .write = mipsnet_ioport_write,
>       .impl.min_access_size = 1,
> diff --git a/hw/opencores_eth.c b/hw/opencores_eth.c
> index 09f2757..6f3f5fc 100644
> --- a/hw/opencores_eth.c
> +++ b/hw/opencores_eth.c
> @@ -692,12 +692,12 @@ static void open_eth_desc_write(void *opaque,
>   }
>
>
> -static MemoryRegionOps open_eth_reg_ops = {
> +static const MemoryRegionOps open_eth_reg_ops = {
>       .read = open_eth_reg_read,
>       .write = open_eth_reg_write,
>   };
>
> -static MemoryRegionOps open_eth_desc_ops = {
> +static const MemoryRegionOps open_eth_desc_ops = {
>       .read = open_eth_desc_read,
>       .write = open_eth_desc_write,
>   };
> diff --git a/hw/spapr_pci.c b/hw/spapr_pci.c
> index ed2e4b3..3c08d57 100644
> --- a/hw/spapr_pci.c
> +++ b/hw/spapr_pci.c
> @@ -281,7 +281,7 @@ static void spapr_io_write(void *opaque, target_phys_addr_t addr,
>       assert(0);
>   }
>
> -static MemoryRegionOps spapr_io_ops = {
> +static const MemoryRegionOps spapr_io_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .read = spapr_io_read,
>       .write = spapr_io_write
>    


Ping. Could someone please commit this patch to QEMU master?
More than one month should be enough time for a review.

Thanks,
Stefan Weil


