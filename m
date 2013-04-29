Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UWjGT-0005LX-AG
	for mharc-qemu-trivial@gnu.org; Mon, 29 Apr 2013 04:16:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UWjGP-0005L8-3P
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 04:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UWjGN-0008PR-2N
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 04:16:44 -0400
Received: from mail-bk0-x235.google.com ([2a00:1450:4008:c01::235]:61130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UWjGM-0008PE-Ob; Mon, 29 Apr 2013 04:16:42 -0400
Received: by mail-bk0-f53.google.com with SMTP id jg9so2507630bkc.40
	for <multiple recipients>; Mon, 29 Apr 2013 01:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=hb5pxmLlNDJYanmAD8Xs606gpRWo5T3cviW0eXddbK0=;
	b=oOHhHV8VoVgwnmR5m6+yQnKqBcktc6+mumrMW41DNmyIyHG8hCGxS+pCWyow7HC26Z
	XbR53kwaaLS5XuIIMzW+XfpWKUU6F8WqlR2qitfT9vq0f6MwXFZL/QS0SwYd4O1yWaV9
	rqFFcDYht44LjZ2wzPrAD+sSCz0diHRZsmKHqoFpXxU+5tnInLmYr+CWOu67zrxDk8TW
	pyd4jVTtCjnhxURelqVrUNXSvwlf8+x4hpqH0wJ6+KjBaghoZZPMb0p5eUGpY7PciOBb
	uChXWaNPAxYd9jcjFNbu6p5JbOMIATJNP1M+f8HdOZK5AjAPjlSrxbAYNaR3hbrilKYn
	ouSg==
X-Received: by 10.204.171.136 with SMTP id h8mr20934052bkz.18.1367223401837;
	Mon, 29 Apr 2013 01:16:41 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-176-20.ip50.fastwebnet.it.
	[93.34.176.20])
	by mx.google.com with ESMTPSA id b21sm6329970bkw.12.2013.04.29.01.16.39
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 01:16:40 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <517E2C5C.8000700@redhat.com>
Date: Mon, 29 Apr 2013 10:16:28 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <517BC1F2.70405@redhat.com>
	<1367201460-28594-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1367201460-28594-1-git-send-email-aik@ozlabs.ru>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::235
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] memory: give name every AddressSpace
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
X-List-Received-Date: Mon, 29 Apr 2013 08:16:47 -0000

Il 29/04/2013 04:11, Alexey Kardashevskiy ha scritto:
> The "info mtree" command in QEMU console prints only "memory" and "I/O"
> address spaces while there are actually a lot more other AddressSpace
> structs created by PCI and VIO devices. Those devices do not normally
> have names and therefore not present in "info qtree" output.
> 
> The patch fixes this.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> 
> 
> The number of AddressSpace structs is constantly growing (even without IOMMU)
> and it is getting harder to trace them so this is why I came up with this patch.
> Or there is a reason to hide those AddressSpace structs which I do not see,
> is not it?
> 
> 
> ---
>  exec.c                |    6 ++----
>  hw/pci/pci.c          |    3 ++-
>  hw/ppc/spapr_vio.c    |    2 +-
>  include/exec/memory.h |    2 +-
>  memory.c              |    7 ++++---
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index 180a345..0091272 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -1839,13 +1839,11 @@ static void memory_map_init(void)
>  {
>      system_memory = g_malloc(sizeof(*system_memory));
>      memory_region_init(system_memory, "system", INT64_MAX);
> -    address_space_init(&address_space_memory, system_memory);
> -    address_space_memory.name = "memory";
> +    address_space_init(&address_space_memory, system_memory, "memory");
>  
>      system_io = g_malloc(sizeof(*system_io));
>      memory_region_init(system_io, "io", 65536);
> -    address_space_init(&address_space_io, system_io);
> -    address_space_io.name = "I/O";
> +    address_space_init(&address_space_io, system_io, "I/O");
>  
>      memory_listener_register(&core_memory_listener, &address_space_memory);
>      memory_listener_register(&io_memory_listener, &address_space_io);
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index fe146dc..0a1acd6 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -823,7 +823,8 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
>      memory_region_init_alias(&pci_dev->bus_master_enable_region, "bus master",
>                               pci_dev->iommu, 0, memory_region_size(pci_dev->iommu));
>      memory_region_set_enabled(&pci_dev->bus_master_enable_region, false);
> -    address_space_init(&pci_dev->bus_master_as, &pci_dev->bus_master_enable_region);
> +    address_space_init(&pci_dev->bus_master_as, &pci_dev->bus_master_enable_region,
> +                       name);
>  
>      pci_dev->devfn = devfn;
>      pstrcpy(pci_dev->name, sizeof(pci_dev->name), name);
> diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
> index fbcbd6f..fadde20 100644
> --- a/hw/ppc/spapr_vio.c
> +++ b/hw/ppc/spapr_vio.c
> @@ -449,7 +449,7 @@ static int spapr_vio_busdev_init(DeviceState *qdev)
>      if (pc->rtce_window_size) {
>          uint32_t liobn = SPAPR_VIO_BASE_LIOBN | dev->reg;
>          dev->tcet = spapr_tce_new_table(liobn, pc->rtce_window_size);
> -        address_space_init(&dev->as, spapr_tce_get_iommu(dev->tcet));
> +        address_space_init(&dev->as, spapr_tce_get_iommu(dev->tcet), qdev->id);
>      }
>  
>      return pc->init(dev);
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 99d51b7..b4f1182 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -840,7 +840,7 @@ void mtree_info(fprintf_function mon_printf, void *f);
>   * @as: an uninitialized #AddressSpace
>   * @root: a #MemoryRegion that routes addesses for the address space
>   */
> -void address_space_init(AddressSpace *as, MemoryRegion *root);
> +void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name);
>  
>  

Please update the doc comment.

>  /**
> diff --git a/memory.c b/memory.c
> index cee3e59..b50f5e6 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1002,7 +1002,7 @@ void memory_region_init_iommu(MemoryRegion *mr,
>      mr->terminates = true;  /* then re-forwards */
>      mr->destructor = memory_region_destructor_iommu;
>      mr->iommu_target_as = g_new(AddressSpace, 1);
> -    address_space_init(mr->iommu_target_as, target);
> +    address_space_init(mr->iommu_target_as, target, name);
>  }
>  
>  static uint64_t invalid_read(void *opaque, hwaddr addr,
> @@ -1599,7 +1599,7 @@ void memory_listener_unregister(MemoryListener *listener)
>      QTAILQ_REMOVE(&memory_listeners, listener, link);
>  }
>  
> -void address_space_init(AddressSpace *as, MemoryRegion *root)
> +void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
>  {
>      memory_region_transaction_begin();
>      as->root = root;
> @@ -1608,7 +1608,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root)
>      as->ioeventfd_nb = 0;
>      as->ioeventfds = NULL;
>      QTAILQ_INSERT_TAIL(&address_spaces, as, address_spaces_link);
> -    as->name = NULL;
> +    as->name = g_strdup(name?name:"anonymous");
>      address_space_init_dispatch(as);
>      memory_region_update_pending |= root->enabled;
>      memory_region_transaction_commit();
> @@ -1623,6 +1623,7 @@ void address_space_destroy(AddressSpace *as)
>      QTAILQ_REMOVE(&address_spaces, as, address_spaces_link);
>      address_space_destroy_dispatch(as);
>      flatview_destroy(as->current_map);
> +    g_free((void *)as->name);

No cast here.

Paolo

>      g_free(as->current_map);
>      g_free(as->ioeventfds);
>  }
> 


