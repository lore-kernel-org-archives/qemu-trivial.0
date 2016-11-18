Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c7ewR-0007rH-9d
	for mharc-qemu-trivial@gnu.org; Fri, 18 Nov 2016 03:54:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1c7ewL-0007mT-Oc
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2016 03:54:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1c7ewK-0003HM-Qu
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2016 03:54:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35050)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1c7ewC-00039C-Hn; Fri, 18 Nov 2016 03:54:24 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 496FF6333C;
	Fri, 18 Nov 2016 08:54:23 +0000 (UTC)
Received: from [10.36.112.21] (ovpn-112-21.ams2.redhat.com [10.36.112.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAI8sL3G017457; Fri, 18 Nov 2016 03:54:21 -0500
To: Anand J <anand.indukala@gmail.com>, qemu-devel@nongnu.org
References: <1479431012-19914-1-git-send-email-anand.indukala@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <82c4c500-8914-f2d5-eb57-6a77235ba144@redhat.com>
Date: Fri, 18 Nov 2016 09:54:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479431012-19914-1-git-send-email-anand.indukala@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 18 Nov 2016 08:54:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ppc: add appropriate
 warning message for qemu_find_file() NULL return
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
X-List-Received-Date: Fri, 18 Nov 2016 08:54:37 -0000



On 18/11/2016 02:03, Anand J wrote:
> Add check for qemu_find_file() NULL return and throw a warning message
> can provide better visibility to the upcoming error message if any.

You should cc: email address given by ./scripts/get_maintainer.pl

> Signed-off-by: Anand J <anand.indukala@gmail.com>
> ---
>  hw/ppc/e500.c         | 3 +++
>  hw/ppc/mac_newworld.c | 3 +++
>  hw/ppc/mac_oldworld.c | 3 +++
>  hw/ppc/pnv.c          | 3 +++
>  4 files changed, 12 insertions(+)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index cf8b122..1fec0f4 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -1014,6 +1014,9 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
>          }
>      }
>      filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> +    if (!filename) {
> +        fprintf(stderr, "WARNING: failed to find %s\n", bios_name);
> +    }
>  
>      bios_size = load_elf(filename, NULL, NULL, &bios_entry, &loadaddr, NULL,
>                           1, PPC_ELF_MACHINE, 0, 0);
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 7d25106..da54436 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -217,6 +217,9 @@ static void ppc_core99_init(MachineState *machine)
>      if (bios_name == NULL)
>          bios_name = PROM_FILENAME;
>      filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> +    if (!filename) {
> +        fprintf(stderr, "WARNING: failed to find %s\n", bios_name);
> +    }

The upcoming error message also displays bios_name.

>      memory_region_set_readonly(bios, true);
>      memory_region_add_subregion(get_system_memory(), PROM_ADDR, bios);
>  
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 4479487..b9bca61 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -145,6 +145,9 @@ static void ppc_heathrow_init(MachineState *machine)
>      if (bios_name == NULL)
>          bios_name = PROM_FILENAME;
>      filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> +    if (!filename) {
> +        fprintf(stderr, "WARNING: failed to find %s\n", bios_name);
> +    }

The upcoming error message also displays bios_name.

>      memory_region_set_readonly(bios, true);
>      memory_region_add_subregion(sysmem, PROM_ADDR, bios);
>  
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 9df7b25..282a0d0 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -378,6 +378,9 @@ static void ppc_powernv_init(MachineState *machine)
>      }
>  
>      fw_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> +    if (!fw_filename) {
> +        fprintf(stderr, "WARNING: failed to find %s\n", bios_name);
> +    }

>      fw_size = load_image_targphys(fw_filename, FW_LOAD_ADDR, FW_MAX_SIZE);
>      if (fw_size < 0) {
> 

I think you should exit() as for fw_size < 0, as it will display then a
NULL string, or replace fw_filename by bios_name in the following message.

Thanks,
Laurent

