Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwT9-0005st-CQ
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:59:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwT6-0005pY-Ul
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:59:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwT2-0007dz-Tw
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:59:24 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:34187)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YxwT2-0007cY-2L; Thu, 28 May 2015 07:59:20 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGR92338; Thu, 28 May 2015 19:58:53 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 28 May 2015 19:58:50 +0800
Message-ID: <556702F8.50009@huawei.com>
Date: Thu, 28 May 2015 19:58:48 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>
	<1432811625-13392-3-git-send-email-zhaoshenglong@huawei.com>
	<55670122.50101@msgid.tls.msk.ru>
In-Reply-To: <55670122.50101@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.556702FD.01D5, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8d0fb6e640cf509e9a62d1f6991c0970
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 2/4] hw/alpha/dp264.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 11:59:26 -0000



On 2015/5/28 19:50, Michael Tokarev wrote:
> 28.05.2015 14:13, Shannon Zhao пишет:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> valgrind complains about:
>> ==7055== 58 bytes in 1 blocks are definitely lost in loss record 1,471 of 2,192
>> ==7055==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
>> ==7055==    by 0x24410F: malloc_and_trace (vl.c:2556)
>> ==7055==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
>> ==7055==    by 0x64DEFD7: g_strndup (in /usr/lib64/libglib-2.0.so.0.3600.3)
>> ==7055==    by 0x650181A: g_vasprintf (in /usr/lib64/libglib-2.0.so.0.3600.3)
>> ==7055==    by 0x64DF0CC: g_strdup_vprintf (in /usr/lib64/libglib-2.0.so.0.3600.3)
>> ==7055==    by 0x64DF188: g_strdup_printf (in /usr/lib64/libglib-2.0.so.0.3600.3)
>> ==7055==    by 0x242F81: qemu_find_file (vl.c:2121)
>> ==7055==    by 0x217A32: clipper_init (dp264.c:105)
>> ==7055==    by 0x2484DA: main (vl.c:4249)
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>  hw/alpha/dp264.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
>> index 9fe7e8b..0c5395f 100644
>> --- a/hw/alpha/dp264.c
>> +++ b/hw/alpha/dp264.c
>> @@ -56,6 +56,7 @@ static void clipper_init(MachineState *machine)
>>      qemu_irq rtc_irq;
>>      long size, i;
>>      const char *palcode_filename;
>> +    char *filename;
>>      uint64_t palcode_entry, palcode_low, palcode_high;
>>      uint64_t kernel_entry, kernel_low, kernel_high;
>>  
>> @@ -102,18 +103,20 @@ static void clipper_init(MachineState *machine)
>>         but one explicitly written for the emulation, we might as
>>         well load it directly from and ELF image.  */
>>      palcode_filename = (bios_name ? bios_name : "palcode-clipper");
>> -    palcode_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, palcode_filename);
>> -    if (palcode_filename == NULL) {
>> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, palcode_filename);
>> +    if (filename == NULL) {
>>          hw_error("no palcode provided\n");
>>          exit(1);
>>      }
>> -    size = load_elf(palcode_filename, cpu_alpha_superpage_to_phys,
>> +    size = load_elf(filename, cpu_alpha_superpage_to_phys,
>>                      NULL, &palcode_entry, &palcode_low, &palcode_high,
>>                      0, EM_ALPHA, 0);
>>      if (size < 0) {
>> -        hw_error("could not load palcode '%s'\n", palcode_filename);
>> +        hw_error("could not load palcode '%s'\n", filename);
>> +        g_free(filename);
> 
> In a previous patch you _removed_ g_free() before exit(), here' you're
> adding one.  I don't think there's any need to free things before exit(),
> but at least we should be consistent, maybe at least within one series :)
> 
>>          exit(1);
>>      }
>> +    g_free(filename);
> 
> How about this:
> 
> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
> index 9fe7e8b..f86e7bb 100644
> --- a/hw/alpha/dp264.c
> +++ b/hw/alpha/dp264.c
> @@ -55,7 +55,7 @@ static void clipper_init(MachineState *machine)
>      ISABus *isa_bus;
>      qemu_irq rtc_irq;
>      long size, i;
> -    const char *palcode_filename;
> +    char *palcode_filename;
>      uint64_t palcode_entry, palcode_low, palcode_high;
>      uint64_t kernel_entry, kernel_low, kernel_high;
> 
> @@ -101,8 +101,8 @@ static void clipper_init(MachineState *machine)
>      /* Load PALcode.  Given that this is not "real" cpu palcode,
>         but one explicitly written for the emulation, we might as
>         well load it directly from and ELF image.  */
> -    palcode_filename = (bios_name ? bios_name : "palcode-clipper");
> -    palcode_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, palcode_filename);
> +    palcode_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
> +                                bios_name ? bios_name : "palcode-clipper");
>      if (palcode_filename == NULL) {
>          hw_error("no palcode provided\n");
>          exit(1);
> @@ -114,6 +114,7 @@ static void clipper_init(MachineState *machine)
>          hw_error("could not load palcode '%s'\n", palcode_filename);
>          exit(1);
>      }
> +    g_free(palcode_filename);
> 
>      /* Start all cpus at the PALcode RESET entry point.  */
>      for (i = 0; i < smp_cpus; ++i) {
> 
> 
> I'm not saying it is better, it is just that we don't really
> need the original basename of the file and hence don't need
> second variable.
> 
Yes, I've thought about this way but it's gone.

> If you like it I'd apply it, of I'll apply your version
> (without g_free() before exit).
> 
I'm good with your version.

Thanks,
-- 
Shannon


