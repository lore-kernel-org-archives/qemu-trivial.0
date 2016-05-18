Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30Q5-0003K3-T5
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:17:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b30Q0-0003DT-2V
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:17:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b30Py-0004BG-Ur
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:17:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b30Pq-00044y-9o; Wed, 18 May 2016 08:17:30 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE0BAC05B1CE;
	Wed, 18 May 2016 12:17:29 +0000 (UTC)
Received: from [10.36.112.39] (ovpn-112-39.ams2.redhat.com [10.36.112.39])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4ICHMcG012493
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 May 2016 08:17:25 -0400
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>
References: <1458888577-12477-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<56F5041C.2060307@redhat.com> <5733DEDF.90606@cn.fujitsu.com>
	<573BC79F.4070602@cn.fujitsu.com> <573C5D39.10404@cn.fujitsu.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8c278e28-6afe-b02e-5a92-2c05ddf2f532@redhat.com>
Date: Wed, 18 May 2016 14:17:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <573C5D39.10404@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 18 May 2016 12:17:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Wed, 18 May 2016 12:17:44 -0000

On 18/05/2016 14:16, Cao jin wrote:
> I guess maybe this one is more suitable for trivial.

No, it's not trivial.  I guess it missed soft freeze.  Michael Tsirkin
will pick it up.

Thanks,

Paolo

>>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>>>> index e67664d..f0f41dc 100644
>>>>> --- a/hw/pci/pci.c
>>>>> +++ b/hw/pci/pci.c
>>>>> @@ -974,7 +974,7 @@ void pci_register_bar(PCIDevice *pci_dev, int region_num,
>>>>>                         uint8_t type, MemoryRegion *memory)
>>>>>   {
>>>>>       PCIIORegion *r;
>>>>> -    uint32_t addr;
>>>>> +    uint32_t addr; /* offset in pci config space */
>>>>>       uint64_t wmask;
>>>>>       pcibus_t size = memory_region_size(memory);
>>>>>
>>>>> @@ -990,15 +990,20 @@ void pci_register_bar(PCIDevice *pci_dev, int
>>>>> region_num,
>>>>>       r->addr = PCI_BAR_UNMAPPED;
>>>>>       r->size = size;
>>>>>       r->type = type;
>>>>> -    r->memory = NULL;
>>>>> +    r->memory = memory;
>>>>> +    r->address_space = type & PCI_BASE_ADDRESS_SPACE_IO
>>>>> +                        ? pci_dev->bus->address_space_io
>>>>> +                        : pci_dev->bus->address_space_mem;
>>>>>
>>>>>       wmask = ~(size - 1);
>>>>> -    addr = pci_bar(pci_dev, region_num);
>>>>>       if (region_num == PCI_ROM_SLOT) {
>>>>>           /* ROM enable bit is writable */
>>>>>           wmask |= PCI_ROM_ADDRESS_ENABLE;
>>>>>       }
>>>>> +
>>>>> +    addr = pci_bar(pci_dev, region_num);
>>>>>       pci_set_long(pci_dev->config + addr, type);
>>>>> +
>>>>>       if (!(r->type & PCI_BASE_ADDRESS_SPACE_IO) &&
>>>>>           r->type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
>>>>>           pci_set_quad(pci_dev->wmask + addr, wmask);
>>>>> @@ -1007,11 +1012,6 @@ void pci_register_bar(PCIDevice *pci_dev, int
>>>>> region_num,
>>>>>           pci_set_long(pci_dev->wmask + addr, wmask & 0xffffffff);
>>>>>           pci_set_long(pci_dev->cmask + addr, 0xffffffff);
>>>>>       }
>>>>> -    pci_dev->io_regions[region_num].memory = memory;
>>>>> -    pci_dev->io_regions[region_num].address_space
>>>>> -        = type & PCI_BASE_ADDRESS_SPACE_IO
>>>>> -        ? pci_dev->bus->address_space_io
>>>>> -        : pci_dev->bus->address_space_mem;
>>>>>   }
>>>>>
>>>>>   static void pci_update_vga(PCIDevice *pci_dev)
>>>>>
>>>>
>>>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

