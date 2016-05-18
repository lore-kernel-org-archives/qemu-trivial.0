Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30VP-000867-Vs
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:23:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1b30VN-000846-O3
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:23:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1b30VM-0005JU-Js
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:23:13 -0400
Received: from [59.151.112.132] (port=43431 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1b30VE-0005E2-Jd; Wed, 18 May 2016 08:23:04 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6668418"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 May 2016 20:23:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1BCFB418A723;
	Wed, 18 May 2016 20:22:57 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 18 May 2016 20:22:56 +0800
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial
	<qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1458888577-12477-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<56F5041C.2060307@redhat.com> <5733DEDF.90606@cn.fujitsu.com>
	<573BC79F.4070602@cn.fujitsu.com> <573C5D39.10404@cn.fujitsu.com>
	<8c278e28-6afe-b02e-5a92-2c05ddf2f532@redhat.com>
CC: <mst@redhat.com>, <qemu-devel@nongnu.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <573C5FB4.7050608@cn.fujitsu.com>
Date: Wed, 18 May 2016 20:27:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <8c278e28-6afe-b02e-5a92-2c05ddf2f532@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 1BCFB418A723.A9743
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH] pci_register_bar: cleanup
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
X-List-Received-Date: Wed, 18 May 2016 12:23:14 -0000

Ok, I see. Thanks Paolo

Cao.

On 05/18/2016 08:17 PM, Paolo Bonzini wrote:
> On 18/05/2016 14:16, Cao jin wrote:
>> I guess maybe this one is more suitable for trivial.
>
> No, it's not trivial.  I guess it missed soft freeze.  Michael Tsirkin
> will pick it up.
>
> Thanks,
>
> Paolo
>
>>>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>>>>> index e67664d..f0f41dc 100644
>>>>>> --- a/hw/pci/pci.c
>>>>>> +++ b/hw/pci/pci.c
>>>>>> @@ -974,7 +974,7 @@ void pci_register_bar(PCIDevice *pci_dev, int region_num,
>>>>>>                          uint8_t type, MemoryRegion *memory)
>>>>>>    {
>>>>>>        PCIIORegion *r;
>>>>>> -    uint32_t addr;
>>>>>> +    uint32_t addr; /* offset in pci config space */
>>>>>>        uint64_t wmask;
>>>>>>        pcibus_t size = memory_region_size(memory);
>>>>>>
>>>>>> @@ -990,15 +990,20 @@ void pci_register_bar(PCIDevice *pci_dev, int
>>>>>> region_num,
>>>>>>        r->addr = PCI_BAR_UNMAPPED;
>>>>>>        r->size = size;
>>>>>>        r->type = type;
>>>>>> -    r->memory = NULL;
>>>>>> +    r->memory = memory;
>>>>>> +    r->address_space = type & PCI_BASE_ADDRESS_SPACE_IO
>>>>>> +                        ? pci_dev->bus->address_space_io
>>>>>> +                        : pci_dev->bus->address_space_mem;
>>>>>>
>>>>>>        wmask = ~(size - 1);
>>>>>> -    addr = pci_bar(pci_dev, region_num);
>>>>>>        if (region_num == PCI_ROM_SLOT) {
>>>>>>            /* ROM enable bit is writable */
>>>>>>            wmask |= PCI_ROM_ADDRESS_ENABLE;
>>>>>>        }
>>>>>> +
>>>>>> +    addr = pci_bar(pci_dev, region_num);
>>>>>>        pci_set_long(pci_dev->config + addr, type);
>>>>>> +
>>>>>>        if (!(r->type & PCI_BASE_ADDRESS_SPACE_IO) &&
>>>>>>            r->type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
>>>>>>            pci_set_quad(pci_dev->wmask + addr, wmask);
>>>>>> @@ -1007,11 +1012,6 @@ void pci_register_bar(PCIDevice *pci_dev, int
>>>>>> region_num,
>>>>>>            pci_set_long(pci_dev->wmask + addr, wmask & 0xffffffff);
>>>>>>            pci_set_long(pci_dev->cmask + addr, 0xffffffff);
>>>>>>        }
>>>>>> -    pci_dev->io_regions[region_num].memory = memory;
>>>>>> -    pci_dev->io_regions[region_num].address_space
>>>>>> -        = type & PCI_BASE_ADDRESS_SPACE_IO
>>>>>> -        ? pci_dev->bus->address_space_io
>>>>>> -        : pci_dev->bus->address_space_mem;
>>>>>>    }
>>>>>>
>>>>>>    static void pci_update_vga(PCIDevice *pci_dev)
>>>>>>
>>>>>
>>>>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>
>
> .
>

-- 
Yours Sincerely,

Cao jin



