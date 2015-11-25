Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a1ObF-0001gx-Uy
	for mharc-qemu-trivial@gnu.org; Tue, 24 Nov 2015 20:10:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1a1ObD-0001eu-Gc
	for qemu-trivial@nongnu.org; Tue, 24 Nov 2015 20:10:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1a1ObC-0002W5-Kq
	for qemu-trivial@nongnu.org; Tue, 24 Nov 2015 20:10:19 -0500
Received: from [59.151.112.132] (port=8250 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1a1Ob6-0002KL-Pn; Tue, 24 Nov 2015 20:10:13 -0500
X-IronPort-AV: E=Sophos;i="5.20,242,1444665600"; 
   d="scan'208";a="811650"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.6])
	by heian.cn.fujitsu.com with ESMTP; 25 Nov 2015 09:09:46 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 5495A408E030;
	Wed, 25 Nov 2015 09:08:35 +0800 (CST)
Received: from [10.167.226.96] (10.167.226.96) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 25 Nov 2015 09:09:21 +0800
To: <marcel@redhat.com>, <qemu-devel@nongnu.org>
References: <1448284752-18538-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<5654ACD7.9090303@gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56550A85.1090103@cn.fujitsu.com>
Date: Wed, 25 Nov 2015 09:10:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <5654ACD7.9090303@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.96]
X-yoursite-MailScanner-Information: Please contact the ISP for more information
X-yoursite-MailScanner-ID: 5495A408E030.A4A3F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] PCI Trivial: remove superfluous code
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
X-List-Received-Date: Wed, 25 Nov 2015 01:10:20 -0000



On 11/25/2015 02:30 AM, Marcel Apfelbaum wrote:
> On 11/23/2015 03:19 PM, Cao jin wrote:
>> remove superfluous code in do_pci_register_device(). See its caller:
>> pci_qdev_realize()
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   hw/pci/pci.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 168b9cc..4d16da0 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -878,7 +878,6 @@ static PCIDevice *do_pci_register_device(PCIDevice
>> *pci_dev, PCIBus *bus,
>>          return NULL;
>>       }
>>
>> -    pci_dev->devfn = devfn;
>
> Hi, can you please explain why this line is not needed?
> As far as I see if do_pci_register_device is called with devfn -1 (auto
> assign),
> the devfn will be computed by this function and then passed to pci_dev.
>

uh..sorry, my mistake. You remind me... I miss the "auto assign" 
condition. Please forget this patch...

> Am I missing anything?
>
> Thanks,
> Marcel
>
>
>>       dma_as = pci_device_iommu_address_space(pci_dev);
>>
>>       memory_region_init_alias(&pci_dev->bus_master_enable_region,
>>
>
>

-- 
Yours Sincerely,

Cao Jin

-- 
This message has been scanned for viruses and
dangerous content by Fujitsu, and is believed to be clean.


