Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UX52s-0001FT-0v
	for mharc-qemu-trivial@gnu.org; Tue, 30 Apr 2013 03:32:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UX52p-0001FN-2C
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 03:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UX52m-0003z9-PE
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 03:32:11 -0400
Received: from mail-ee0-f52.google.com ([74.125.83.52]:37916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UX52m-0003yZ-GV; Tue, 30 Apr 2013 03:32:08 -0400
Received: by mail-ee0-f52.google.com with SMTP id d41so85136eek.11
	for <multiple recipients>; Tue, 30 Apr 2013 00:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=rdwbgVrR6EflmiMkjwSUTUmwi1PKsdYK5rJOvn9/PSM=;
	b=SzNm5NUAL+1ZeWD2M3yHaLehLtq4JJA+fkmbk1Uz1HYswclET9+SA6eVkqVJfUwJgq
	JIMqBbgJPOF9FX/X+x0ZLDRw1viyxyoJ/AlSw208YO7uhKHG9jURu6CPibZRfrw+jRgF
	ZBEX9wQRmS6/8dtKsPTOB1K6E3+r9IBrbsBUdUpn5mXt/O46i2jvsrtg/irOlGlrx8eb
	MjI7LcaX9YrsjmBYPds2rYb/DMrTSn9vNupgFB11FdOo1lkpWTKCkugjc5nUU4oZJjjE
	QNpWTTjvffOlQ2uNOdqhQPlZeFvZ6ShRICIE6tqoEEsbgVz6tA8vDobQOUiq7NAJIwm0
	Tzmw==
X-Received: by 10.14.202.201 with SMTP id d49mr13522118eeo.1.1367307127630;
	Tue, 30 Apr 2013 00:32:07 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-176-20.ip50.fastwebnet.it.
	[93.34.176.20]) by mx.google.com with ESMTPSA id
	cb50sm36881821eeb.14.2013.04.30.00.32.05 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 00:32:06 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <517F7368.8010908@redhat.com>
Date: Tue, 30 Apr 2013 09:31:52 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1367288751-25163-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1367288751-25163-1-git-send-email-aik@ozlabs.ru>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.52
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH v2] memory: give name every AddressSpace
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
X-List-Received-Date: Tue, 30 Apr 2013 07:32:13 -0000

Il 30/04/2013 04:25, Alexey Kardashevskiy ha scritto:
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
> v2:
> * removed "const" from AddressSpace::name
> * removed redundand check for name!=NULL from mtree_info
> 
> ---
>  exec.c                |    6 ++----
>  hw/pci/pci.c          |    3 ++-
>  hw/ppc/spapr_vio.c    |    2 +-
>  include/exec/memory.h |    5 +++--
>  memory.c              |   10 ++++------
>  5 files changed, 12 insertions(+), 14 deletions(-)
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
> index 99d51b7..907118e 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -177,7 +177,7 @@ struct MemoryRegionPortio {
>   */
>  struct AddressSpace {
>      /* All fields are private. */
> -    const char *name;
> +    char *name;
>      MemoryRegion *root;
>      struct FlatView *current_map;
>      int ioeventfd_nb;
> @@ -839,8 +839,9 @@ void mtree_info(fprintf_function mon_printf, void *f);
>   *
>   * @as: an uninitialized #AddressSpace
>   * @root: a #MemoryRegion that routes addesses for the address space
> + * @name: an address space name
>   */
> -void address_space_init(AddressSpace *as, MemoryRegion *root);
> +void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name);
>  
>  
>  /**
> diff --git a/memory.c b/memory.c
> index cee3e59..b4117a8 100644
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
> +    g_free(as->name);
>      g_free(as->current_map);
>      g_free(as->ioeventfds);
>  }
> @@ -1749,9 +1750,6 @@ void mtree_info(fprintf_function mon_printf, void *f)
>      QTAILQ_INIT(&ml_head);
>  
>      QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> -        if (!as->name) {
> -            continue;
> -        }
>          mon_printf(f, "%s\n", as->name);
>          mtree_print_mr(mon_printf, f, as->root, 0, 0, &ml_head);
>      }
> 

Applied to iommu branch, thanks.

Paolo

