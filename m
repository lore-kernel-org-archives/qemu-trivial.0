Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOUro-00083R-QU
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 12:21:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOUrj-0007tW-9g
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:21:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOUre-0001sl-Tu
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:21:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35263)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOUrV-0001pv-P9; Fri, 14 Mar 2014 12:21:33 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 65E4D41C8B;
	Fri, 14 Mar 2014 20:21:32 +0400 (MSK)
Message-ID: <53232C8C.3070403@msgid.tls.msk.ru>
Date: Fri, 14 Mar 2014 20:21:32 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>
	<alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
In-Reply-To: <alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Fri, 14 Mar 2014 16:21:51 -0000

10.03.2014 22:40, BALATON Zoltan wrote:
> Ping!
> http://patchwork.ozlabs.org/patch/324674/
> 
> On Thu, 27 Feb 2014, BALATON Zoltan wrote:
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>> hw/char/serial-pci.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
>> index 991c99f..e662b77 100644
>> --- a/hw/char/serial-pci.c
>> +++ b/hw/char/serial-pci.c
>> @@ -60,6 +60,7 @@ static int serial_pci_init(PCIDevice *dev)
>>         return -1;
>>     }
>>
>> +    pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
>>     pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
>>     s->irq = pci_allocate_irq(&pci->dev);

Hm. While this is an one-liner indeed, I'm not sure it's the right
value.  From my pci.ids:

C 07  Communication controller
        00  Serial controller
                00  8250
                01  16450
                02  16550
                03  16650
                04  16750
                05  16850
                06  16950

so it seems correct thing to do.

What about multi_serial_pci_init() -- should it too set prog-if
like this?

Thanks,

/mjt

