Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R39wb-0000gC-9d
	for mharc-qemu-trivial@gnu.org; Mon, 12 Sep 2011 13:05:17 -0400
Received: from eggs.gnu.org ([140.186.70.92]:35499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1R39wY-0000fr-DZ
	for qemu-trivial@nongnu.org; Mon, 12 Sep 2011 13:05:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1R39wW-0001AO-Tb
	for qemu-trivial@nongnu.org; Mon, 12 Sep 2011 13:05:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1R39wW-0001AD-Ff; Mon, 12 Sep 2011 13:05:12 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8CH5A8V007754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 12 Sep 2011 13:05:10 -0400
Received: from redhat.com (vpn-200-130.tlv.redhat.com [10.35.200.130])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id p8CH57ZE025800; Mon, 12 Sep 2011 13:05:08 -0400
Date: Mon, 12 Sep 2011 20:06:15 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20110912170614.GA15737@redhat.com>
References: <4E6E0681.6010803@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E6E0681.6010803@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] pci: Remove unused mem_base from PCIBus
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
X-List-Received-Date: Mon, 12 Sep 2011 17:05:15 -0000

On Mon, Sep 12, 2011 at 03:17:53PM +0200, Jan Kiszka wrote:
> Obsoleted by f64e02b6cc.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

thanks, applied

> ---
>  hw/pci_internals.h |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/hw/pci_internals.h b/hw/pci_internals.h
> index c7fd23d..10b4adf 100644
> --- a/hw/pci_internals.h
> +++ b/hw/pci_internals.h
> @@ -24,7 +24,6 @@ struct PCIBus {
>      void *irq_opaque;
>      PCIDevice *devices[PCI_SLOT_MAX * PCI_FUNC_MAX];
>      PCIDevice *parent_dev;
> -    target_phys_addr_t mem_base;
>      MemoryRegion *address_space_mem;
>      MemoryRegion *address_space_io;
>  
> -- 
> 1.7.3.4

