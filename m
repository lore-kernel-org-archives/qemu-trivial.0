Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uq1bx-0000F0-L1
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 09:42:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benh@kernel.crashing.org>) id 1Upte8-00074h-Ek
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 01:12:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benh@kernel.crashing.org>) id 1Upte7-0003Kw-C6
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 01:12:28 -0400
Received: from gate.crashing.org ([63.228.1.57]:54451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benh@kernel.crashing.org>)
	id 1Upte7-0003Kp-3i; Fri, 21 Jun 2013 01:12:27 -0400
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id r5L5CDWd011435;
	Fri, 21 Jun 2013 00:12:15 -0500
Message-ID: <1371791533.3944.50.camel@pasglop>
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Alex Williamson <alex.williamson@redhat.com>
Date: Fri, 21 Jun 2013 15:12:13 +1000
In-Reply-To: <1371789981.30572.114.camel@ul30vt.home>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<1371747090.32709.61.camel@ul30vt.home> <51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 63.228.1.57
X-Mailman-Approved-At: Fri, 21 Jun 2013 09:42:44 -0400
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
X-List-Received-Date: Fri, 21 Jun 2013 05:12:29 -0000

On Thu, 2013-06-20 at 22:46 -0600, Alex Williamson wrote:
> Maybe you could add a device parameter to kvm_irqchip_add_msi_route so
> that it can be implemented on POWER without this pci_bus_map_msi
> interface that seems very unique to POWER.  Thanks,

You mean unique to all non-x86 ? :-)

I believe almost everybody eventually turn MSIs into "normal"
interrupts...

Most often than not, the logic to do so is in the PCI Host Bridge.

The whole concept of passing the message address/data accross the
user/kernel interface is an x86 crackpotery but as is the entire
remapping/routing layer so ... :-)

Ben.
 


