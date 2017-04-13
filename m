Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cyl0C-00073K-AP
	for mharc-qemu-trivial@gnu.org; Thu, 13 Apr 2017 16:06:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cyl0A-00073C-4B
	for qemu-trivial@nongnu.org; Thu, 13 Apr 2017 16:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cyl07-0000dx-Bu
	for qemu-trivial@nongnu.org; Thu, 13 Apr 2017 16:05:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51850)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1cyl07-0000d9-2n
	for qemu-trivial@nongnu.org; Thu, 13 Apr 2017 16:05:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0577693C0;
	Thu, 13 Apr 2017 20:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F0577693C0
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com F0577693C0
Received: from localhost (ovpn-116-34.gru2.redhat.com [10.97.116.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A06DF60A99;
	Thu, 13 Apr 2017 20:05:50 +0000 (UTC)
Date: Thu, 13 Apr 2017 17:05:49 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Ishani Chugh <chugh.ishani@research.iiit.ac.in>
Cc: qemu-trivial@nongnu.org, rth@twiddle.net, agraf@suse.de,
	david@gibson.dropbear.id.au, marex@denx.de, crwulff@gmail.com,
	kbastian@mail.uni-paderborn.de, edgar.iglesias@gmail.com
Message-ID: <20170413200549.GA4376@thinpad.lan.raisama.net>
References: <1492100079-4110-1-git-send-email-chugh.ishani@research.iiit.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1492100079-4110-1-git-send-email-chugh.ishani@research.iiit.ac.in>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 13 Apr 2017 20:05:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Remove reduntant qemu: from error
 functions
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
X-List-Received-Date: Thu, 13 Apr 2017 20:05:59 -0000

On Thu, Apr 13, 2017 at 09:44:39PM +0530, Ishani Chugh wrote:
> This patch removes redundant "qemu:" from error functions. The link to the bitesized task is:
> http://wiki.qemu-project.org/Contribute/BiteSizedTasks#Error_checking
> 
> Signed-off-by: Ishani Chugh <chugh.ishani@research.iiit.ac.in>

Thanks!

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

> ---
>  hw/microblaze/boot.c           | 2 +-
>  hw/nios2/boot.c                | 2 +-
>  hw/ppc/pnv.c                   | 2 +-
>  hw/s390x/sclp.c                | 4 ++--
>  hw/tricore/tricore_testboard.c | 2 +-
>  numa.c                         | 4 ++--
>  6 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index 1834d22..457a08a 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -189,7 +189,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>                                                    ram_size - initrd_offset);
>              }
>              if (initrd_size < 0) {
> -                error_report("qemu: could not load initrd '%s'",
> +                error_report("could not load initrd '%s'",
>                               initrd_filename);
>                  exit(EXIT_FAILURE);
>              }
> diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
> index e0a9aff..2b31f5b 100644
> --- a/hw/nios2/boot.c
> +++ b/hw/nios2/boot.c
> @@ -197,7 +197,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
>                                                    ram_size - initrd_offset);
>              }
>              if (initrd_size < 0) {
> -                error_report("qemu: could not load initrd '%s'",
> +                error_report("could not load initrd '%s'",
>                               initrd_filename);
>                  exit(EXIT_FAILURE);
>              }
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 3fa722a..3a21da0 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -420,7 +420,7 @@ static void ppc_powernv_init(MachineState *machine)
>      /* Create the processor chips */
>      chip_typename = g_strdup_printf(TYPE_PNV_CHIP "-%s", machine->cpu_model);
>      if (!object_class_by_name(chip_typename)) {
> -        error_report("qemu: invalid CPU model '%s' for %s machine",
> +        error_report("invalid CPU model '%s' for %s machine",
>                       machine->cpu_model, MACHINE_GET_CLASS(machine)->name);
>          exit(1);
>      }
> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> index e741da1..6996088 100644
> --- a/hw/s390x/sclp.c
> +++ b/hw/s390x/sclp.c
> @@ -496,10 +496,10 @@ static void sclp_realize(DeviceState *dev, Error **errp)
>  
>      ret = s390_set_memory_limit(machine->maxram_size, &hw_limit);
>      if (ret == -E2BIG) {
> -        error_setg(&err, "qemu: host supports a maximum of %" PRIu64 " GB",
> +        error_setg(&err, "host supports a maximum of %" PRIu64 " GB",
>                     hw_limit >> 30);
>      } else if (ret) {
> -        error_setg(&err, "qemu: setting the guest size failed");
> +        error_setg(&err, "setting the guest size failed");
>      }
>  
>  out:
> diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
> index 19dd587..8910bf0 100644
> --- a/hw/tricore/tricore_testboard.c
> +++ b/hw/tricore/tricore_testboard.c
> @@ -50,7 +50,7 @@ static void tricore_load_kernel(CPUTriCoreState *env)
>                             NULL, 0,
>                             EM_TRICORE, 1, 0);
>      if (kernel_size <= 0) {
> -        error_report("qemu: no kernel file '%s'",
> +        error_report("no kernel file '%s'",
>                  tricoretb_binfo.kernel_filename);
>          exit(1);
>      }
> diff --git a/numa.c b/numa.c
> index 6fc2393..39b743b 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -174,7 +174,7 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
>      }
>  
>      if (node->has_mem && node->has_memdev) {
> -        error_setg(errp, "qemu: cannot specify both mem= and memdev=");
> +        error_setg(errp, "cannot specify both mem= and memdev=");
>          return;
>      }
>  
> @@ -182,7 +182,7 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
>          have_memdevs = node->has_memdev;
>      }
>      if (node->has_memdev != have_memdevs) {
> -        error_setg(errp, "qemu: memdev option must be specified for either "
> +        error_setg(errp, "memdev option must be specified for either "
>                     "all or no nodes");
>          return;
>      }
> -- 
> 2.7.4
> 

-- 
Eduardo

