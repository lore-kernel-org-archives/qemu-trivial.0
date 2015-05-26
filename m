Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yx3cM-0005KC-2N
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 21:25:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yx3cK-0005Go-1B
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 21:25:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yx3cJ-0004Li-1g
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 21:25:15 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:8324)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yx3cC-00048g-KS; Mon, 25 May 2015 21:25:09 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGN86157; Tue, 26 May 2015 09:24:55 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 26 May 2015 09:24:48 +0800
Message-ID: <5563CB5C.2000603@huawei.com>
Date: Tue, 26 May 2015 09:24:44 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
References: <1432543077-12656-1-git-send-email-zhaoshenglong@huawei.com>
	<1432543077-12656-3-git-send-email-zhaoshenglong@huawei.com>
	<55631FAB.4010906@redhat.com>
In-Reply-To: <55631FAB.4010906@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.5563CB67.00E9, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 32e8d737a896a7295b92c8e341339465
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 2/3] hw/ide/pci: Fix memory leak
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
X-List-Received-Date: Tue, 26 May 2015 01:25:17 -0000


On 2015/5/25 21:12, Paolo Bonzini wrote:
> 
> 
> On 25/05/2015 10:37, Shannon Zhao wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> valgrind complains about:
>> ==16447== 16 bytes in 2 blocks are definitely lost in loss record 1,304 of 3,310
>> ==16447==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
>> ==16447==    by 0x2E4FD7: malloc_and_trace (vl.c:2546)
>> ==16447==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
>> ==16447==    by 0x36FB47: qemu_extend_irqs (irq.c:55)
>> ==16447==    by 0x36FBD3: qemu_allocate_irqs (irq.c:64)
>> ==16447==    by 0x3B4B44: bmdma_init (pci.c:464)
>> ==16447==    by 0x3B547B: pci_piix_init_ports (piix.c:144)
>> ==16447==    by 0x3B55D2: pci_piix_ide_realize (piix.c:164)
>> ==16447==    by 0x3EAEC6: pci_qdev_realize (pci.c:1790)
>> ==16447==    by 0x36C685: device_set_realized (qdev.c:1058)
>> ==16447==    by 0x47179E: property_set_bool (object.c:1514)
>> ==16447==    by 0x470098: object_property_set (object.c:837)
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>  hw/ide/pci.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
>> index 1b3d1c1..c5c4441 100644
>> --- a/hw/ide/pci.c
>> +++ b/hw/ide/pci.c
>> @@ -464,6 +464,7 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
>>      irq = qemu_allocate_irqs(bmdma_irq, bm, 1);
>>      bus->irq = *irq;
>>      bm->pci_dev = d;
>> +    g_free(irq);
>>  }
> 
> You can use qemu_allocate_irq here:
> 
>    bus->irq = qemu_allocate_irq(bmdma_irq, bm, 0);
> 

Ok, I see. Will replace it. Thanks.

> Paolo
> 
>>  static const TypeInfo pci_ide_type_info = {
>>
> 
> 

-- 
Shannon


