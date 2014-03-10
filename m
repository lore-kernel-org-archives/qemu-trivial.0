Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN6kG-0007p5-Qr
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 16:24:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WN56E-0007VL-4E
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 14:38:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WN569-00025J-MT
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 14:38:54 -0400
Received: from jedlik.phy.bme.hu ([152.66.102.83]:58353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>)
	id 1WN55x-0001vD-Vn; Mon, 10 Mar 2014 14:38:38 -0400
Received: by jedlik.phy.bme.hu (Postfix, from userid 501)
	id 2DE6A60092; Mon, 10 Mar 2014 19:38:29 +0100 (CET)
Date: Mon, 10 Mar 2014 19:38:29 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@jedlik.phy.bme.hu
To: qemu-devel@nongnu.org
In-Reply-To: <20140228104440.17ABD2F358@mono.eik.bme.hu>
Message-ID: <alpine.LMD.2.02.1403101936430.485@jedlik.phy.bme.hu>
References: <20140228104440.17ABD2F358@mono.eik.bme.hu>
User-Agent: Alpine 2.02 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 152.66.102.83
X-Mailman-Approved-At: Mon, 10 Mar 2014 16:24:18 -0400
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@amazon.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] q35: Correct typo BRDIGE
	-> BRIDGE
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
X-List-Received-Date: Mon, 10 Mar 2014 18:38:58 -0000

Ping!
Also here: http://patchwork.ozlabs.org/patch/325129/

On Fri, 28 Feb 2014, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>
> v2: Sorry, I was too fast to send it. Found two more places to change.
>
> hw/pci-host/q35.c         | 10 +++++-----
> include/hw/i386/ich9.h    |  2 +-
> include/hw/pci-host/q35.h | 24 ++++++++++++------------
> 3 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 4bc2e01..8b8cc4e 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -272,7 +272,7 @@ static void mch_update_smram(MCHPCIState *mch)
>     PCIDevice *pd = PCI_DEVICE(mch);
>
>     memory_region_transaction_begin();
> -    smram_update(&mch->smram_region, pd->config[MCH_HOST_BRDIGE_SMRAM],
> +    smram_update(&mch->smram_region, pd->config[MCH_HOST_BRIDGE_SMRAM],
>                     mch->smm_enabled);
>     memory_region_transaction_commit();
> }
> @@ -283,7 +283,7 @@ static void mch_set_smm(int smm, void *arg)
>     PCIDevice *pd = PCI_DEVICE(mch);
>
>     memory_region_transaction_begin();
> -    smram_set_smm(&mch->smm_enabled, smm, pd->config[MCH_HOST_BRDIGE_SMRAM],
> +    smram_set_smm(&mch->smm_enabled, smm, pd->config[MCH_HOST_BRIDGE_SMRAM],
>                     &mch->smram_region);
>     memory_region_transaction_commit();
> }
> @@ -306,8 +306,8 @@ static void mch_write_config(PCIDevice *d,
>         mch_update_pciexbar(mch);
>     }
>
> -    if (ranges_overlap(address, len, MCH_HOST_BRDIGE_SMRAM,
> -                       MCH_HOST_BRDIGE_SMRAM_SIZE)) {
> +    if (ranges_overlap(address, len, MCH_HOST_BRIDGE_SMRAM,
> +                       MCH_HOST_BRIDGE_SMRAM_SIZE)) {
>         mch_update_smram(mch);
>     }
> }
> @@ -347,7 +347,7 @@ static void mch_reset(DeviceState *qdev)
>     pci_set_quad(d->config + MCH_HOST_BRIDGE_PCIEXBAR,
>                  MCH_HOST_BRIDGE_PCIEXBAR_DEFAULT);
>
> -    d->config[MCH_HOST_BRDIGE_SMRAM] = MCH_HOST_BRIDGE_SMRAM_DEFAULT;
> +    d->config[MCH_HOST_BRIDGE_SMRAM] = MCH_HOST_BRIDGE_SMRAM_DEFAULT;
>
>     mch_update(mch);
> }
> diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
> index 9e4a0e4..e191435 100644
> --- a/include/hw/i386/ich9.h
> +++ b/include/hw/i386/ich9.h
> @@ -102,7 +102,7 @@ Object *ich9_lpc_find(void);
> #define ICH9_USB_UHCI1_DEV                      29
> #define ICH9_USB_UHCI1_FUNC                     0
>
> -/* D30:F0 DMI-to-PCI brdige */
> +/* D30:F0 DMI-to-PCI bridge */
> #define ICH9_D2P_BRIDGE                         "ICH9 D2P BRIDGE"
> #define ICH9_D2P_BRIDGE_SAVEVM_VERSION          0
>
> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
> index d0355b7..d9ee978 100644
> --- a/include/hw/pci-host/q35.h
> +++ b/include/hw/pci-host/q35.h
> @@ -125,8 +125,8 @@ typedef struct Q35PCIHost {
> #define MCH_HOST_BRIDGE_PAM_RE                 ((uint8_t)0x1)
> #define MCH_HOST_BRIDGE_PAM_MASK               ((uint8_t)0x3)
>
> -#define MCH_HOST_BRDIGE_SMRAM                  0x9d
> -#define MCH_HOST_BRDIGE_SMRAM_SIZE             1
> +#define MCH_HOST_BRIDGE_SMRAM                  0x9d
> +#define MCH_HOST_BRIDGE_SMRAM_SIZE             1
> #define MCH_HOST_BRIDGE_SMRAM_DEFAULT          ((uint8_t)0x2)
> #define MCH_HOST_BRIDGE_SMRAM_D_OPEN           ((uint8_t)(1 << 6))
> #define MCH_HOST_BRIDGE_SMRAM_D_CLS            ((uint8_t)(1 << 5))
> @@ -140,16 +140,16 @@ typedef struct Q35PCIHost {
> #define MCH_HOST_BRIDGE_UPPER_SYSTEM_BIOS_END  0x100000
>
> #define MCH_HOST_BRIDGE_ESMRAMC                0x9e
> -#define MCH_HOST_BRDIGE_ESMRAMC_H_SMRAME       ((uint8_t)(1 << 6))
> -#define MCH_HOST_BRDIGE_ESMRAMC_E_SMERR        ((uint8_t)(1 << 5))
> -#define MCH_HOST_BRDIGE_ESMRAMC_SM_CACHE       ((uint8_t)(1 << 4))
> -#define MCH_HOST_BRDIGE_ESMRAMC_SM_L1          ((uint8_t)(1 << 3))
> -#define MCH_HOST_BRDIGE_ESMRAMC_SM_L2          ((uint8_t)(1 << 2))
> -#define MCH_HOST_BRDIGE_ESMRAMC_TSEG_SZ_MASK   ((uint8_t)(0x3 << 1))
> -#define MCH_HOST_BRDIGE_ESMRAMC_TSEG_SZ_1MB    ((uint8_t)(0x0 << 1))
> -#define MCH_HOST_BRDIGE_ESMRAMC_TSEG_SZ_2MB    ((uint8_t)(0x1 << 1))
> -#define MCH_HOST_BRDIGE_ESMRAMC_TSEG_SZ_8MB    ((uint8_t)(0x2 << 1))
> -#define MCH_HOST_BRDIGE_ESMRAMC_T_EN           ((uint8_t)1)
> +#define MCH_HOST_BRIDGE_ESMRAMC_H_SMRAME       ((uint8_t)(1 << 6))
> +#define MCH_HOST_BRIDGE_ESMRAMC_E_SMERR        ((uint8_t)(1 << 5))
> +#define MCH_HOST_BRIDGE_ESMRAMC_SM_CACHE       ((uint8_t)(1 << 4))
> +#define MCH_HOST_BRIDGE_ESMRAMC_SM_L1          ((uint8_t)(1 << 3))
> +#define MCH_HOST_BRIDGE_ESMRAMC_SM_L2          ((uint8_t)(1 << 2))
> +#define MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_MASK   ((uint8_t)(0x3 << 1))
> +#define MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_1MB    ((uint8_t)(0x0 << 1))
> +#define MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_2MB    ((uint8_t)(0x1 << 1))
> +#define MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_8MB    ((uint8_t)(0x2 << 1))
> +#define MCH_HOST_BRIDGE_ESMRAMC_T_EN           ((uint8_t)1)
>
> /* D1:F0 PCIE* port*/
> #define MCH_PCIE_DEV                           1
> -- 
> 1.8.1.5
>
>
>

