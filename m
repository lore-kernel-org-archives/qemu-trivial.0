Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WkMIH-00050B-D0
	for mharc-qemu-trivial@gnu.org; Tue, 13 May 2014 19:39:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WkMI9-0004pv-QH
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 19:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WkMI3-00029S-HA
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 19:39:25 -0400
Received: from jedlik.phy.bme.hu ([152.66.102.83]:57419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>)
	id 1WkMHr-00026M-1R; Tue, 13 May 2014 19:39:07 -0400
Received: by jedlik.phy.bme.hu (Postfix, from userid 501)
	id 5C3D560091; Wed, 14 May 2014 01:39:03 +0200 (CEST)
Date: Wed, 14 May 2014 01:39:03 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@jedlik.phy.bme.hu
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <536BC50D.4000409@msgid.tls.msk.ru>
Message-ID: <alpine.LMD.2.02.1405140137100.26415@jedlik.phy.bme.hu>
References: <20140507100818.C714A196A9@mono.eik.bme.hu>
	<536BC50D.4000409@msgid.tls.msk.ru>
User-Agent: Alpine 2.02 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 152.66.102.83
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] serial-pci: Set prog interface field
 of pci config to 16550 compatible
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
X-List-Received-Date: Tue, 13 May 2014 23:39:32 -0000

On Thu, 8 May 2014, Michael Tokarev wrote:
> 27.02.2014 05:05, BALATON Zoltan wrote:
>
> Shoudl we actually make it machine-specific, to keep even prog-if value
> of these things the same as before for older machine types?  I dunno.
> mst says we should, I think this is not a very important property to keep.

So what's the decision? Can it be taken as it is now or do you want any 
more changes? (If you want it version specific then please tell me how to 
do that or show me an example because I don't know how to do that.)

Regards,
BALATON Zoltan

>
> Thanks,
>
> /mjt
>
>>  v2: resubmission after pc-2.1 is added with the multiport case
>>
>>  hw/char/serial-pci.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
>> index 991c99f..f3f5e07 100644
>> --- a/hw/char/serial-pci.c
>> +++ b/hw/char/serial-pci.c
>> @@ -60,6 +60,7 @@ static int serial_pci_init(PCIDevice *dev)
>>          return -1;
>>      }
>>
>> +    pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
>>      pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
>>      s->irq = pci_allocate_irq(&pci->dev);
>>
>> @@ -101,6 +102,7 @@ static int multi_serial_pci_init(PCIDevice *dev)
>>      assert(pci->ports > 0);
>>      assert(pci->ports <= PCI_SERIAL_MAX_PORTS);
>>
>> +    pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
>>      pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
>>      memory_region_init(&pci->iobar, OBJECT(pci), "multiserial", 8 * pci->ports);
>>      pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &pci->iobar);
>>
>
>

