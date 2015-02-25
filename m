Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQfBb-0006No-0b
	for mharc-qemu-trivial@gnu.org; Wed, 25 Feb 2015 11:51:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1YQfBW-0006EL-0F
	for qemu-trivial@nongnu.org; Wed, 25 Feb 2015 11:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1YQfBV-0000ii-6j
	for qemu-trivial@nongnu.org; Wed, 25 Feb 2015 11:51:41 -0500
Received: from smtp.citrix.com ([66.165.176.89]:9874)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>)
	id 1YQfBP-0000gz-3Q; Wed, 25 Feb 2015 11:51:35 -0500
X-IronPort-AV: E=Sophos;i="5.09,646,1418083200"; d="scan'208";a="236297897"
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.78) with Microsoft SMTP Server id 14.3.210.2;
	Wed, 25 Feb 2015 11:48:29 -0500
Received: from kaball.uk.xensource.com ([10.80.2.59])	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<stefano.stabellini@eu.citrix.com>)	id 1YQf8O-00080c-Ks;
	Wed, 25 Feb 2015 16:48:28 +0000
Date: Wed, 25 Feb 2015 16:47:42 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball.uk.xensource.com
To: Thomas Huth <thuth@linux.vnet.ibm.com>
In-Reply-To: <1424365943-27563-6-git-send-email-thuth@linux.vnet.ibm.com>
Message-ID: <alpine.DEB.2.02.1502251647260.23507@kaball.uk.xensource.com>
References: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1424365943-27563-6-git-send-email-thuth@linux.vnet.ibm.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-DLP: MIA2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [PATCH 5/5] xen: Remove xen_cmos_set_s3_resume()
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
X-List-Received-Date: Wed, 25 Feb 2015 16:51:46 -0000

On Thu, 19 Feb 2015, Thomas Huth wrote:
> The function is not used anymore, and thus can be deleted.
> 
> Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> Cc: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>



>  include/hw/xen/xen.h |    1 -
>  xen-hvm-stub.c       |    4 ----
>  2 files changed, 0 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index b0ed04c..4356af4 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -32,7 +32,6 @@ int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
>  void xen_piix3_set_irq(void *opaque, int irq_num, int level);
>  void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
>  void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
> -void xen_cmos_set_s3_resume(void *opaque, int irq, int level);
>  
>  qemu_irq *xen_interrupt_controller_init(void);
>  
> diff --git a/xen-hvm-stub.c b/xen-hvm-stub.c
> index 2d98696..46867d8 100644
> --- a/xen-hvm-stub.c
> +++ b/xen-hvm-stub.c
> @@ -30,10 +30,6 @@ void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
>  {
>  }
>  
> -void xen_cmos_set_s3_resume(void *opaque, int irq, int level)
> -{
> -}
> -
>  void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr)
>  {
>  }
> -- 
> 1.7.1
> 

