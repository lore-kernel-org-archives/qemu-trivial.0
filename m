Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN6kH-0007qq-5d
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 16:24:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WN57r-00014t-Bp
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 14:40:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>) id 1WN57m-0002XV-Lx
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 14:40:35 -0400
Received: from jedlik.phy.bme.hu ([152.66.102.83]:58355)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@jedlik.phy.bme.hu>)
	id 1WN57c-0002W5-HB; Mon, 10 Mar 2014 14:40:20 -0400
Received: by jedlik.phy.bme.hu (Postfix, from userid 501)
	id E6F4E60092; Mon, 10 Mar 2014 19:40:18 +0100 (CET)
Date: Mon, 10 Mar 2014 19:40:18 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@jedlik.phy.bme.hu
To: qemu-devel@nongnu.org
In-Reply-To: <20140227011300.8CD451983B@mono.eik.bme.hu>
Message-ID: <alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>
User-Agent: Alpine 2.02 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 152.66.102.83
X-Mailman-Approved-At: Mon, 10 Mar 2014 16:24:18 -0400
Cc: qemu-trivial@nongnu.org
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
X-List-Received-Date: Mon, 10 Mar 2014 18:40:39 -0000

Ping!
http://patchwork.ozlabs.org/patch/324674/

On Thu, 27 Feb 2014, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> hw/char/serial-pci.c | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
> index 991c99f..e662b77 100644
> --- a/hw/char/serial-pci.c
> +++ b/hw/char/serial-pci.c
> @@ -60,6 +60,7 @@ static int serial_pci_init(PCIDevice *dev)
>         return -1;
>     }
>
> +    pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
>     pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
>     s->irq = pci_allocate_irq(&pci->dev);
>
> -- 
> 1.8.1.5

