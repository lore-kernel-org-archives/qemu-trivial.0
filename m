Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXlit-0005fC-Ej
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 03:15:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YXliq-0005ee-Tb
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 03:15:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YXlim-0003B5-Lg
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 03:15:28 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:24342)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YXlil-00034p-BI; Tue, 17 Mar 2015 03:15:24 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKW95231; Tue, 17 Mar 2015 15:15:17 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 17 Mar 2015 15:15:13 +0800
Message-ID: <5507D480.1000505@huawei.com>
Date: Tue, 17 Mar 2015 15:15:12 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <qemu-devel@nongnu.org>
References: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, "Edgar E.
	Iglesias" <edgar.iglesias@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [Qemu-trivial] [PATCH v2] microblaze: fix memory leak
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
X-List-Received-Date: Tue, 17 Mar 2015 07:15:29 -0000

On 2015/3/5 11:05, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> When not assign a -dtb argument, the variable dtb_filename
> storage returned from qemu_find_file(), which should be freed
> after use. Alternatively we define a local variable filename,
> with 'char *' type, free after use.
> 
> Cc: Michael Tokarev <mjt@tls.msk.ru>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
> v2: fix a complier error.
> ---
>  hw/microblaze/boot.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 

Ping...

> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index a2843cd..352ccb1 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -113,15 +113,15 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>      const char *kernel_filename;
>      const char *kernel_cmdline;
>      const char *dtb_arg;
> +    char *filename = NULL;
>  
>      machine_opts = qemu_get_machine_opts();
>      kernel_filename = qemu_opt_get(machine_opts, "kernel");
>      kernel_cmdline = qemu_opt_get(machine_opts, "append");
>      dtb_arg = qemu_opt_get(machine_opts, "dtb");
> -    if (dtb_arg) { /* Preference a -dtb argument */
> -        dtb_filename = dtb_arg;
> -    } else { /* default to pcbios dtb as passed by machine_init */
> -        dtb_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
> +    /* default to pcbios dtb as passed by machine_init */
> +    if (!dtb_arg) {
> +        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
>      }
>  
>      boot_info.machine_cpu_reset = machine_cpu_reset;
> @@ -203,7 +203,8 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>                              boot_info.initrd_start,
>                              boot_info.initrd_end,
>                              kernel_cmdline,
> -                            dtb_filename);
> +                            /* Preference a -dtb argument */
> +                            dtb_arg ? dtb_arg : filename);
>      }
> -
> +    g_free(filename);
>  }
> 



