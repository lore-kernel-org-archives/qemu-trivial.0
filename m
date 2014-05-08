Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WiSXx-0000Nn-Un
	for mharc-qemu-trivial@gnu.org; Thu, 08 May 2014 13:55:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WiSXq-0000Bn-Tj
	for qemu-trivial@nongnu.org; Thu, 08 May 2014 13:55:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WiSXk-0004Pv-Pn
	for qemu-trivial@nongnu.org; Thu, 08 May 2014 13:55:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53173)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WiSXX-00044O-EZ; Thu, 08 May 2014 13:55:27 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1B89D40C23;
	Thu,  8 May 2014 21:55:26 +0400 (MSK)
Message-ID: <536BC50D.4000409@msgid.tls.msk.ru>
Date: Thu, 08 May 2014 21:55:25 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20140507100818.C714A196A9@mono.eik.bme.hu>
In-Reply-To: <20140507100818.C714A196A9@mono.eik.bme.hu>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
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
X-List-Received-Date: Thu, 08 May 2014 17:55:53 -0000

27.02.2014 05:05, BALATON Zoltan wrote:

Shoudl we actually make it machine-specific, to keep even prog-if value
of these things the same as before for older machine types?  I dunno.
mst says we should, I think this is not a very important property to keep.

Thanks,

/mjt

>  v2: resubmission after pc-2.1 is added with the multiport case
> 
>  hw/char/serial-pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
> index 991c99f..f3f5e07 100644
> --- a/hw/char/serial-pci.c
> +++ b/hw/char/serial-pci.c
> @@ -60,6 +60,7 @@ static int serial_pci_init(PCIDevice *dev)
>          return -1;
>      }
>  
> +    pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
>      pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
>      s->irq = pci_allocate_irq(&pci->dev);
>  
> @@ -101,6 +102,7 @@ static int multi_serial_pci_init(PCIDevice *dev)
>      assert(pci->ports > 0);
>      assert(pci->ports <= PCI_SERIAL_MAX_PORTS);
>  
> +    pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
>      pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
>      memory_region_init(&pci->iobar, OBJECT(pci), "multiserial", 8 * pci->ports);
>      pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &pci->iobar);
> 


