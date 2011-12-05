Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXgPp-0005rR-Lw
	for mharc-qemu-trivial@gnu.org; Mon, 05 Dec 2011 16:49:37 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RXgPl-0005eA-Ve
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 16:49:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RXgPk-0003IJ-O8
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 16:49:33 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RXgPg-0003HC-Ia; Mon, 05 Dec 2011 16:49:28 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	188A0728188C; Mon,  5 Dec 2011 22:49:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id fzLIU6hGFZZq; Mon,  5 Dec 2011 22:48:48 +0100 (CET)
Received: from flocke.weilnetz.de (p5086EF76.dip.t-dialin.net [80.134.239.118])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	420DE7281889; Mon,  5 Dec 2011 22:48:48 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1RXgOr-0004E6-Sf; Mon, 05 Dec 2011 22:48:37 +0100
Message-ID: <4EDD3C35.4060509@weilnetz.de>
Date: Mon, 05 Dec 2011 22:48:37 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Ademar de Souza Reis Jr <areis@redhat.com>
References: <1323114854-28049-1-git-send-email-areis@redhat.com>
In-Reply-To: <1323114854-28049-1-git-send-email-areis@redhat.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] memory: minor documentation
	fixes/enhancements
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
X-List-Received-Date: Mon, 05 Dec 2011 21:49:35 -0000

Am 05.12.2011 20:54, schrieb Ademar de Souza Reis Jr:
> Fix typos and minor documentation errors in both memory.h and
> docs/memory.txt.
>
> Also add missing documentation formatting tags to transaction
> functions.
>
> Signed-off-by: Ademar de Souza Reis Jr<areis@redhat.com>
> ---
>   docs/memory.txt |    6 +++---
>   memory.h        |   38 ++++++++++++++++++++++----------------
>   2 files changed, 25 insertions(+), 19 deletions(-)
>
> diff --git a/docs/memory.txt b/docs/memory.txt
> index 3fc1683..5bbee8e 100644
> --- a/docs/memory.txt
> +++ b/docs/memory.txt
> @@ -7,7 +7,7 @@ machine.  It attempts to allow modelling of:
>    - ordinary RAM
>    - memory-mapped I/O (MMIO)
>    - memory controllers that can dynamically reroute physical memory regions
> -  to different destinations
> +   to different destinations
>
>   The memory model provides support for
>
> @@ -121,7 +121,7 @@ pci (0-2^32-1)
>
>   ram: ram@0x00000000-0xffffffff
>
> -The is a (simplified) PC memory map. The 4GB RAM block is mapped into the
> +This is a (simplified) PC memory map. The 4GB RAM block is mapped into the
>   system address space via two aliases: "lomem" is a 1:1 mapping of the first
>   3.5GB; "himem" maps the last 0.5GB at address 4GB.  This leaves 0.5GB for the
>   so-called PCI hole, that allows a 32-bit PCI bus to exist in a system with
> @@ -164,7 +164,7 @@ various constraints can be supplied to control how these callbacks are called:
>    - .impl.min_access_size, .impl.max_access_size define the access sizes
>      (in bytes) supported by the *implementation*; other access sizes will be
>      emulated using the ones available.  For example a 4-byte write will be
> -   emulated using four 1-byte write, if .impl.max_access_size = 1.
> +   emulated using four 1-byte writes, if .impl.max_access_size = 1.
>    - .impl.valid specifies that the *implementation* only supports unaligned
>      accesses; unaligned accesses will be emulated by two aligned accesses.
>    - .old_portio and .old_mmio can be used to ease porting from code using
> diff --git a/memory.h b/memory.h
> index 53bf261..beae127 100644
> --- a/memory.h
> +++ b/memory.h
> @@ -149,7 +149,7 @@ struct MemoryRegionPortio {
>   /**
>    * memory_region_init: Initialize a memory region
>    *
> - * The region typically acts as a container for other memory regions.  Us
> + * The region typically acts as a container for other memory regions.  Use
>    * memory_region_add_subregion() to add subregions.
>    *
>    * @mr: the #MemoryRegion to be initialized
> @@ -162,7 +162,7 @@ void memory_region_init(MemoryRegion *mr,
>   /**
>    * memory_region_init_io: Initialize an I/O memory region.
>    *
> - * Accesses into the region will be cause the callbacks in @ops to be called.
> + * Accesses into the region will cause the callbacks in @ops to be called.
>    * if @size is nonzero, subregions will be clipped to @size.
>    *
>    * @mr: the #MemoryRegion to be initialized.
> @@ -180,7 +180,7 @@ void memory_region_init_io(MemoryRegion *mr,
>
>   /**
>    * memory_region_init_ram:  Initialize RAM memory region.  Accesses into the
> - *                          region will be modify memory directly.
> + *                          region will modify memory directly.
>    *
>    * @mr: the #MemoryRegion to be initialized.
>    * @dev: a device associated with the region; may be %NULL.
> @@ -196,7 +196,7 @@ void memory_region_init_ram(MemoryRegion *mr,
>
>   /**
>    * memory_region_init_ram:  Initialize RAM memory region from a user-provided.
> - *                          pointer.  Accesses into the region will be modify
> + *                          pointer.  Accesses into the region will modify
>    *                          memory directly.
>    *
>    * @mr: the #MemoryRegion to be initialized.
> @@ -250,7 +250,7 @@ void memory_region_init_rom_device(MemoryRegion *mr,
>                                      uint64_t size);
>
>   /**
> - * memory_region_destroy: Destroy a memory region and relaim all resources.
> + * memory_region_destroy: Destroy a memory region and reclaim all resources.
>    *
>    * @mr: the region to be destroyed.  May not currently be a subregion
>    *      (see memory_region_add_subregion()) or referenced in an alias
> @@ -417,7 +417,7 @@ void memory_region_clear_coalescing(MemoryRegion *mr);
>    *
>    * Marks a word in an IO region (initialized with memory_region_init_io())
>    * as a trigger for an eventfd event.  The I/O callback will not be called.
> - * The caller must be prepared to handle failure (hat is, take the required
> + * The caller must be prepared to handle failure (that is, take the required
>    * action if the callback _is_ called).
>    *
>    * @mr: the memory region being updated.
> @@ -435,10 +435,10 @@ void memory_region_add_eventfd(MemoryRegion *mr,
>                                  int fd);
>
>   /**
> - * memory_region_del_eventfd: Cancel and eventfd.
> + * memory_region_del_eventfd: Cancel an eventfd.
>    *
> - * Cancels an eventfd trigger request by a previous memory_region_add_eventfd()
> - * call.
> + * Cancels an eventfd trigger requested by a previous
> + * memory_region_add_eventfd() call.
>    *
>    * @mr: the memory region being updated.
>    * @addr: the address within @mr that is to be monitored
> @@ -454,9 +454,9 @@ void memory_region_del_eventfd(MemoryRegion *mr,
>                                  uint64_t data,
>                                  int fd);
>   /**
> - * memory_region_add_subregion: Add a sub-region to a container.
> + * memory_region_add_subregion: Add a subregion to a container.
>    *
> - * Adds a sub-region at @offset.  The sub-region may not overlap with other
> + * Adds a subregion at @offset.  The subregion may not overlap with other
>    * subregions (except for those explicitly marked as overlapping).  A region
>    * may only be added once as a subregion (unless removed with
>    * memory_region_del_subregion()); use memory_region_init_alias() if you
> @@ -471,9 +471,9 @@ void memory_region_add_subregion(MemoryRegion *mr,
>                                    target_phys_addr_t offset,
>                                    MemoryRegion *subregion);
>   /**
> - * memory_region_add_subregion: Add a sub-region to a container, with overlap.
> + * memory_region_add_subregion: Add a subregion to a container, with overlap.
>    *
> - * Adds a sub-region at @offset.  The sub-region may overlap with other
> + * Adds a subregion at @offset.  The subregion may overlap with other
>    * subregions.  Conflicts are resolved by having a higher @priority hide a
>    * lower @priority. Subregions without priority are taken as @priority 0.
>    * A region may only be added once as a subregion (unless removed with
> @@ -501,11 +501,17 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>   void memory_region_del_subregion(MemoryRegion *mr,
>                                    MemoryRegion *subregion);
>
> -/* Start a transaction; changes will be accumulated and made visible only
> - * when the transaction ends.
> +/**
> + * memory_region_transaction_begin: Start a transaction.
> + *
> + * During a transaction, changes will be accumulated and made visible
> + * only when the transaction ends (is commited).
>    */
>   void memory_region_transaction_begin(void);
> -/* Commit a transaction and make changes visible to the guest.
> +
> +/**
> + * memory_region_transaction_commit: Commit a transaction and make changes
> + *                                   visible to the guest.
>    */
>   void memory_region_transaction_commit(void);
>    

Looks good. It does not change code and can be committed via qemu-trivial.

Reviewed-by: Stefan Weil <sw@weilnetz.de>


