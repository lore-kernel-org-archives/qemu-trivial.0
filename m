Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aICy2-0004wJ-Bc
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jan 2016 05:11:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aICxz-0004ro-RZ
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 05:11:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aICxy-0006t1-Ue
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 05:11:19 -0500
Received: from [59.151.112.132] (port=3995 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aICxu-0006gm-D6; Sun, 10 Jan 2016 05:11:14 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2418859"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jan 2016 18:11:01 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id F0FD5409257D;
	Sun, 10 Jan 2016 18:10:51 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Sun, 10 Jan 2016 18:10:51 +0800
References: <1450428935-18329-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<87si2zex1v.fsf@blackfin.pond.sub.org>
To: Michael Tokarev <mjt@tls.msk.ru>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56922EED.90102@cn.fujitsu.com>
Date: Sun, 10 Jan 2016 18:14:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87si2zex1v.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: F0FD5409257D.A64E1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Convert to realize()
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
X-List-Received-Date: Sun, 10 Jan 2016 10:11:21 -0000

Hi mjt,
     seems the patch is still pending in qemu-trivial, and besides, I 
have several others also pending in there，may I know how are they going?

On 12/18/2015 08:55 PM, Markus Armbruster wrote:
> Copying qemu-trivial.
>
> Cao jin <caoj.fnst@cn.fujitsu.com> writes:
>
>> for educational PCI device
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   hw/misc/edu.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/misc/edu.c b/hw/misc/edu.c
>> index fe50b42..43d5b18 100644
>> --- a/hw/misc/edu.c
>> +++ b/hw/misc/edu.c
>> @@ -327,7 +327,7 @@ static void *edu_fact_thread(void *opaque)
>>       return NULL;
>>   }
>>
>> -static int pci_edu_init(PCIDevice *pdev)
>> +static void pci_edu_realize(PCIDevice *pdev, Error **errp)
>>   {
>>       EduState *edu = DO_UPCAST(EduState, pdev, pdev);
>>       uint8_t *pci_conf = pdev->config;
>> @@ -344,8 +344,6 @@ static int pci_edu_init(PCIDevice *pdev)
>>       memory_region_init_io(&edu->mmio, OBJECT(edu), &edu_mmio_ops, edu,
>>                       "edu-mmio", 1 << 20);
>>       pci_register_bar(pdev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &edu->mmio);
>> -
>> -    return 0;
>>   }
>>
>>   static void pci_edu_uninit(PCIDevice *pdev)
>> @@ -385,7 +383,7 @@ static void edu_class_init(ObjectClass *class, void *data)
>>   {
>>       PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
>>
>> -    k->init = pci_edu_init;
>> +    k->realize = pci_edu_realize;
>>       k->exit = pci_edu_uninit;
>>       k->vendor_id = PCI_VENDOR_ID_QEMU;
>>       k->device_id = 0x11e8;
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
>
> .
>

-- 
Yours Sincerely,

Cao jin



