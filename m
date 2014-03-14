Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOW9z-0007Pd-V0
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 13:44:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WOW9t-0007Hd-Lv
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 13:44:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WOW9p-0007Ab-8w
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 13:44:37 -0400
Received: from jedlik.phy.bme.hu ([152.66.102.83]:59150)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>)
	id 1WOW9g-000776-55; Fri, 14 Mar 2014 13:44:24 -0400
Received: by jedlik.phy.bme.hu (Postfix, from userid 501)
	id 0814560092; Fri, 14 Mar 2014 18:44:14 +0100 (CET)
Date: Fri, 14 Mar 2014 18:44:14 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@jedlik.phy.bme.hu
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <53232C8C.3070403@msgid.tls.msk.ru>
Message-ID: <alpine.LMD.2.02.1403141834500.15847@jedlik.phy.bme.hu>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>
	<alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
	<53232C8C.3070403@msgid.tls.msk.ru>
User-Agent: Alpine 2.02 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 152.66.102.83
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] serial-pci: Set prog
 interface field of pci config to 16550 compatible
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
X-List-Received-Date: Fri, 14 Mar 2014 17:44:42 -0000

On Fri, 14 Mar 2014, Michael Tokarev wrote:
> 10.03.2014 22:40, BALATON Zoltan wrote:
>> Ping!
>> http://patchwork.ozlabs.org/patch/324674/
>>
>> On Thu, 27 Feb 2014, BALATON Zoltan wrote:
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>> hw/char/serial-pci.c | 1 +
>>> 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
>>> index 991c99f..e662b77 100644
>>> --- a/hw/char/serial-pci.c
>>> +++ b/hw/char/serial-pci.c
>>> @@ -60,6 +60,7 @@ static int serial_pci_init(PCIDevice *dev)
>>>         return -1;
>>>     }
>>>
>>> +    pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
>>>     pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
>>>     s->irq = pci_allocate_irq(&pci->dev);
>
> Hm. While this is an one-liner indeed, I'm not sure it's the right
> value.  From my pci.ids:
>
> C 07  Communication controller
>        00  Serial controller
>                00  8250
>                01  16450
>                02  16550
>                03  16650
>                04  16750
>                05  16850
>                06  16950
>
> so it seems correct thing to do.
>
> What about multi_serial_pci_init() -- should it too set prog-if
> like this?

I'm not completely sure what the correct value should be for 
multi_serial_pci_init so I've left that alone. There's also 07 02 00 that 
means multiport serial controller that might apply for that case. For the 
simple case I've sent the patch for I had a client expecting this value so 
I think it is correct for that at least but I don't know about the 
multiport case.

Regards,
BALATON Zoltan

