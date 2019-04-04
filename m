Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC0h9-0000f2-8B
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2019 07:38:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hC0h6-0000dY-6U
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 07:38:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hC0h5-0005xV-1A
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 07:38:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hC0h2-0005gg-8g; Thu, 04 Apr 2019 07:38:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CBC0307EAB6;
	Thu,  4 Apr 2019 11:38:03 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AB9284D95;
	Thu,  4 Apr 2019 11:37:59 +0000 (UTC)
Date: Thu, 4 Apr 2019 13:37:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	like.xu@intel.com, qemu-devel@nongnu.org, Paolo Bonzini
	<pbonzini@redhat.com>
Message-ID: <20190404133755.02e3683c@redhat.com>
In-Reply-To: <1553849325-44201-2-git-send-email-like.xu@linux.intel.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-2-git-send-email-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 04 Apr 2019 11:38:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/9] cpu/topology: add
 struct CpuTopology to MachineState
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
X-List-Received-Date: Thu, 04 Apr 2019 11:38:09 -0000

On Fri, 29 Mar 2019 16:48:37 +0800
Like Xu <like.xu@linux.intel.com> wrote:

> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> ---
>  include/hw/arm/virt.h   | 2 +-
>  include/hw/boards.h     | 8 ++++++++
>  include/sysemu/sysemu.h | 2 +-
>  vl.c                    | 7 ++++++-
>  4 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 507517c..724da0c 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -123,7 +123,7 @@ typedef struct {
>      struct arm_boot_info bootinfo;
>      MemMapEntry *memmap;
>      const int *irqmap;
> -    int smp_cpus;
> +    unsigned int smp_cpus;
As Alex pointed out it's unrelated cleanup
(with other similar hunks in this patch),
it's better to split it out into separate patch

>      void *fdt;
>      int fdt_size;
>      uint32_t clock_phandle;
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index e231860..cbde276 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -231,6 +231,13 @@ typedef struct DeviceMemoryState {
>      MemoryRegion mr;
>  } DeviceMemoryState;
>  
> +typedef struct CpuTopology {
> +    unsigned int smp_cpus;
> +    unsigned int smp_cores;
> +    unsigned int smp_threads;
> +    unsigned int max_cpus;
> +} CpuTopology;
> +
>  /**
>   * MachineState:
>   */
> @@ -273,6 +280,7 @@ struct MachineState {
>      const char *cpu_type;
>      AccelState *accelerator;
>      CPUArchIdList *possible_cpus;
> +    CpuTopology topo;
maybe s/topo/smp/ and drop smp_ prefix inside CpuTopology structure

>      struct NVDIMMState *nvdimms_state;
>  };
>  
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 6065d9e..c0d7d7c 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -100,7 +100,7 @@ extern const char *keyboard_layout;
>  extern int win2k_install_hack;
>  extern int alt_grab;
>  extern int ctrl_grab;
> -extern int smp_cpus;
> +extern unsigned int smp_cpus;
>  extern unsigned int max_cpus;
>  extern int cursor_hide;
>  extern int graphic_rotate;
> diff --git a/vl.c b/vl.c
> index d61d560..9089253 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -162,7 +162,7 @@ static Chardev **serial_hds;
>  Chardev *parallel_hds[MAX_PARALLEL_PORTS];
>  int win2k_install_hack = 0;
>  int singlestep = 0;
> -int smp_cpus;
> +unsigned int smp_cpus;
>  unsigned int max_cpus;
>  int smp_cores = 1;
>  int smp_threads = 1;
> @@ -4116,6 +4116,11 @@ int main(int argc, char **argv, char **envp)
>  
>      smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
>  
> +    current_machine->topo.smp_cpus = smp_cpus;
> +    current_machine->topo.max_cpus = max_cpus;
> +    current_machine->topo.smp_cores = smp_cores;
> +    current_machine->topo.smp_threads = smp_threads;
> +
>      /* sanity-check smp_cpus and max_cpus against machine_class */
>      if (smp_cpus < machine_class->min_cpus) {
>          error_report("Invalid SMP CPUs %d. The min CPUs "


