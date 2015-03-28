Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ybgdk-0006Fp-G6
	for mharc-qemu-trivial@gnu.org; Fri, 27 Mar 2015 22:38:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Ybgdh-0006CU-LB
	for qemu-trivial@nongnu.org; Fri, 27 Mar 2015 22:38:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Ybgdg-00054p-Qk
	for qemu-trivial@nongnu.org; Fri, 27 Mar 2015 22:38:21 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:43199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Ybgda-00053N-R1; Fri, 27 Mar 2015 22:38:15 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CLK17349; Sat, 28 Mar 2015 10:38:05 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Mar 2015 10:38:03 +0800
Message-ID: <55161404.4000404@huawei.com>
Date: Sat, 28 Mar 2015 10:37:56 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <qemu-devel@nongnu.org>
References: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>
	<5507D480.1000505@huawei.com>
In-Reply-To: <5507D480.1000505@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>
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
X-List-Received-Date: Sat, 28 Mar 2015 02:38:22 -0000

Hi,

   Ping again...  Can this patch be a raw stuff for rc2 ?

Regards,
Gonglei

On 2015/3/17 15:15, Gonglei wrote:
> On 2015/3/5 11:05, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> When not assign a -dtb argument, the variable dtb_filename
>> storage returned from qemu_find_file(), which should be freed
>> after use. Alternatively we define a local variable filename,
>> with 'char *' type, free after use.
>>
>> Cc: Michael Tokarev <mjt@tls.msk.ru>
>> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>> v2: fix a complier error.
>> ---
>>  hw/microblaze/boot.c | 13 +++++++------
>>  1 file changed, 7 insertions(+), 6 deletions(-)
>>
> 
> Ping...
> 
>> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
>> index a2843cd..352ccb1 100644
>> --- a/hw/microblaze/boot.c
>> +++ b/hw/microblaze/boot.c
>> @@ -113,15 +113,15 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>>      const char *kernel_filename;
>>      const char *kernel_cmdline;
>>      const char *dtb_arg;
>> +    char *filename = NULL;
>>  
>>      machine_opts = qemu_get_machine_opts();
>>      kernel_filename = qemu_opt_get(machine_opts, "kernel");
>>      kernel_cmdline = qemu_opt_get(machine_opts, "append");
>>      dtb_arg = qemu_opt_get(machine_opts, "dtb");
>> -    if (dtb_arg) { /* Preference a -dtb argument */
>> -        dtb_filename = dtb_arg;
>> -    } else { /* default to pcbios dtb as passed by machine_init */
>> -        dtb_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
>> +    /* default to pcbios dtb as passed by machine_init */
>> +    if (!dtb_arg) {
>> +        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
>>      }
>>  
>>      boot_info.machine_cpu_reset = machine_cpu_reset;
>> @@ -203,7 +203,8 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>>                              boot_info.initrd_start,
>>                              boot_info.initrd_end,
>>                              kernel_cmdline,
>> -                            dtb_filename);
>> +                            /* Preference a -dtb argument */
>> +                            dtb_arg ? dtb_arg : filename);
>>      }
>> -
>> +    g_free(filename);
>>  }
>>
> 



