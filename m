Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XopWa-0006mb-Ur
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 03:13:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XopWT-0006mF-9s
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 03:13:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XopWG-000673-BE
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 03:12:57 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:10292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XopWF-0005FB-KW; Thu, 13 Nov 2014 03:12:44 -0500
Received: from 172.24.2.119 (EHLO szxeml456-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXB01795; Thu, 13 Nov 2014 16:10:25 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml456-hub.china.huawei.com
	(10.82.67.199) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 13 Nov 2014 16:10:17 +0800
Message-ID: <5464675F.8070906@huawei.com>
Date: Thu, 13 Nov 2014 16:10:07 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1415847577-5820-1-git-send-email-arei.gonglei@huawei.com>
	<1415847577-5820-3-git-send-email-arei.gonglei@huawei.com>
	<871tp7o7fo.fsf@blackfin.pond.sub.org>
In-Reply-To: <871tp7o7fo.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.54646773.0001, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d5f055e77591434f25ff55d8fb7da6c8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] acpi-build: Make
 DPRINTF working for acpi-build
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
X-List-Received-Date: Thu, 13 Nov 2014 08:13:04 -0000

On 2014/11/13 16:01, Markus Armbruster wrote:

> <arei.gonglei@huawei.com> writes:
> 
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  hw/i386/acpi-build.c | 18 ++++++++++++------
>>  1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 4ab44bf..8cec9aa 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -67,6 +67,14 @@
>>  
>>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>>  
>> +/* #define DEBUG_ACPI_BUILD */
>> +#ifdef DEBUG_ACPI_BUILD
>> +#define ACPI_BUILD_DPRINTF(fmt, ...)        \
>> +    do {printf("ACPI_BUILD: " fmt, ## __VA_ARGS__); } while (0)
>> +#else
>> +#define ACPI_BUILD_DPRINTF(fmt, ...)
>> +#endif
>> +
>>  typedef struct AcpiCpuInfo {
>>      DECLARE_BITMAP(found_cpus, ACPI_CPU_HOTPLUG_ID_LIMIT);
>>  } AcpiCpuInfo;
>> @@ -245,8 +253,6 @@ static void acpi_get_pci_info(PcPciInfo *info)
>>  #define ACPI_BUILD_APPNAME6 "BOCHS "
>>  #define ACPI_BUILD_APPNAME4 "BXPC"
>>  
>> -#define ACPI_BUILD_DPRINTF(level, fmt, ...) do {} while (0)
>> -
>>  #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
>>  #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
>>  #define ACPI_BUILD_TPMLOG_FILE "etc/tpm/log"
> 
> Have you considered replacing ACPI_BUILD_DPRINTF() by tracepoints?
> 
> [...]

Not yet. I just think the change is simpler at this time ;)

Maybe we can improve the file's log by tracing framework.

Best regards,
-Gonglei


