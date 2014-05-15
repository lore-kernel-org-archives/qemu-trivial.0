Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WkpMa-00024H-C2
	for mharc-qemu-trivial@gnu.org; Thu, 15 May 2014 02:41:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WkpMU-0001wm-BN
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 02:41:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WkpMP-0005wN-C8
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 02:41:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:4210)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1WkpMC-0005rx-H6; Thu, 15 May 2014 02:41:32 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4F6fJ9f025030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 15 May 2014 02:41:19 -0400
Received: from redhat.com (ovpn-116-58.ams2.redhat.com [10.36.116.58])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id s4F6fFxT032100; Thu, 15 May 2014 02:41:16 -0400
Date: Thu, 15 May 2014 09:40:10 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20140515064010.GD14456@redhat.com>
References: <20140514200030.E7E842F456@mono.eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140514200030.E7E842F456@mono.eik.bme.hu>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v3] serial-pci: Set prog interface field
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
X-List-Received-Date: Thu, 15 May 2014 06:41:55 -0000

On Thu, Feb 27, 2014 at 02:05:05AM +0100, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---


This looks sane, a minor comment below (hopefully last).
Thanks!

>  v2: resubmission after pc-2.1 is added with the multiport case
>  v3: added compatibility check to avoid changing earlier than pc-2.1
> 
>  hw/char/serial-pci.c | 11 +++++++++++
>  include/hw/i386/pc.h | 15 +++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
> index 991c99f..ae57098 100644
> --- a/hw/char/serial-pci.c
> +++ b/hw/char/serial-pci.c
> @@ -34,6 +34,7 @@
>  typedef struct PCISerialState {
>      PCIDevice dev;
>      SerialState state;
> +    uint8_t compat;
>  } PCISerialState;
>  
>  typedef struct PCIMultiSerialState {
> @@ -44,6 +45,7 @@ typedef struct PCIMultiSerialState {
>      SerialState  state[PCI_SERIAL_MAX_PORTS];
>      uint32_t     level[PCI_SERIAL_MAX_PORTS];
>      qemu_irq     *irqs;
> +    uint8_t      compat;
>  } PCIMultiSerialState;
>  
>  static int serial_pci_init(PCIDevice *dev)

This name isn't very informative.
I think this should be a prog_if property
defaulting to 0x2 and over-written for old machine types,
Devices don't care why their prog_if is changed,
it's the machine type that cares about compatibility.

See
	commit aa93200b88fb1071eaf21bf766711762ed4630e2
	Author: Gabriel L. Somlo <gsomlo@gmail.com>
	Date:   Mon May 5 10:52:51 2014 -0400

	    apic: use emulated lapic version 0x14 on pc machines >= 2.1
as an example.


Alternatively, create a bit property legacy_prog_if
and change field name to compat_flags, have property
set flags here.

See
	commit 2af234e61d59f39ae16ba882271e7c4fef2c41c1
	Author: Michael S. Tsirkin <mst@redhat.com>
	Date:   Thu Feb 14 19:11:27 2013 +0200

	    e1000: unbreak the guest network migration to 1.3
for an example.

I think the 1st option is better but second one would be
more or less ok.

> @@ -60,6 +62,9 @@ static int serial_pci_init(PCIDevice *dev)
>          return -1;
>      }
>  
> +    if (!pci->compat) {
> +        pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
> +    }
>      pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
>      s->irq = pci_allocate_irq(&pci->dev);
>  
> @@ -101,6 +106,9 @@ static int multi_serial_pci_init(PCIDevice *dev)
>      assert(pci->ports > 0);
>      assert(pci->ports <= PCI_SERIAL_MAX_PORTS);
>  
> +    if (!pci->compat) {
> +        pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
> +    }
>      pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
>      memory_region_init(&pci->iobar, OBJECT(pci), "multiserial", 8 * pci->ports);
>      pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &pci->iobar);
> @@ -177,12 +185,14 @@ static const VMStateDescription vmstate_pci_multi_serial = {
>  
>  static Property serial_pci_properties[] = {
>      DEFINE_PROP_CHR("chardev",  PCISerialState, state.chr),
> +    DEFINE_PROP_UINT8("compat",  PCISerialState, compat, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
>  static Property multi_2x_serial_pci_properties[] = {
>      DEFINE_PROP_CHR("chardev1",  PCIMultiSerialState, state[0].chr),
>      DEFINE_PROP_CHR("chardev2",  PCIMultiSerialState, state[1].chr),
> +    DEFINE_PROP_UINT8("compat",  PCIMultiSerialState, compat, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -191,6 +201,7 @@ static Property multi_4x_serial_pci_properties[] = {
>      DEFINE_PROP_CHR("chardev2",  PCIMultiSerialState, state[1].chr),
>      DEFINE_PROP_CHR("chardev3",  PCIMultiSerialState, state[2].chr),
>      DEFINE_PROP_CHR("chardev4",  PCIMultiSerialState, state[3].chr),
> +    DEFINE_PROP_UINT8("compat",  PCIMultiSerialState, compat, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 32a7687..8fb8046 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -271,6 +271,21 @@ bool e820_get_entry(int, uint32_t, uint64_t *, uint64_t *);
>              .driver   = "apic",\
>              .property = "version",\
>              .value    = stringify(0x11),\
> +        },\
> +        {\
> +            .driver   = "pci-serial",\
> +            .property = "compat",\
> +            .value    = stringify(1),\
> +        },\
> +        {\
> +            .driver   = "pci-serial-2x",\
> +            .property = "compat",\
> +            .value    = stringify(1),\
> +        },\
> +        {\
> +            .driver   = "pci-serial-4x",\
> +            .property = "compat",\
> +            .value    = stringify(1),\
>          }
>  
>  #define PC_COMPAT_1_7 \
> -- 
> 1.8.1.5

