Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpuRi-0007VY-2t
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 02:03:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1UpuRd-0007OU-Tt
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 02:03:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1UpuRd-0001bf-1X
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 02:03:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16766)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>)
	id 1UpuRY-0001UA-7A; Fri, 21 Jun 2013 02:03:32 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5L63LGU009752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Jun 2013 02:03:21 -0400
Received: from [10.3.113.96] (ovpn-113-96.phx2.redhat.com [10.3.113.96])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5L63IhW019672; Fri, 21 Jun 2013 02:03:18 -0400
Message-ID: <1371794598.30572.122.camel@ul30vt.home>
From: Alex Williamson <alex.williamson@redhat.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Fri, 21 Jun 2013 00:03:18 -0600
In-Reply-To: <1371791533.3944.50.camel@pasglop>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<1371747090.32709.61.camel@ul30vt.home> <51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
	<1371791533.3944.50.camel@pasglop>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Anthony Liguori <aliguori@us.ibm.com>, "Michael S .
	Tsirkin" <mst@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Paul Mackerras <paulus@samba.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] RFC kvm irqfd: add directly mapped MSI
	IRQ support
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
X-List-Received-Date: Fri, 21 Jun 2013 06:03:39 -0000

On Fri, 2013-06-21 at 15:12 +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2013-06-20 at 22:46 -0600, Alex Williamson wrote:
> > Maybe you could add a device parameter to kvm_irqchip_add_msi_route so
> > that it can be implemented on POWER without this pci_bus_map_msi
> > interface that seems very unique to POWER.  Thanks,
> 
> You mean unique to all non-x86 ? :-)
> 
> I believe almost everybody eventually turn MSIs into "normal"
> interrupts...
> 
> Most often than not, the logic to do so is in the PCI Host Bridge.
> 
> The whole concept of passing the message address/data accross the
> user/kernel interface is an x86 crackpotery but as is the entire
> remapping/routing layer so ... :-)

Regardless, this is exactly what kvm_irqchip_add_msi_route does.  It
says, here's an MSIMessage, give me an IRQ that sends that.  In the x86
case, that means pick a free IRQ and program it to send that MSIMessage
when we hit the irqfd.  In the case of POWER it means lookup which IRQ
gets fired by that MSIMessage and return it.  In a non-accelerated QEMU
case I'd think msi_notify() would write the MSIMessage to this IRQ
remapper device and let it toggle the next qemu_irq down the line.  If
we ever add an IOMMU based IRQ remapper to the x86 model, we'd need
something similar.  Thanks,

Alex


