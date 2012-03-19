Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9SAK-0007CU-9G
	for mharc-qemu-trivial@gnu.org; Sun, 18 Mar 2012 22:17:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dwg@au1.ibm.com>) id 1S9SAG-0007Bk-Oz
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 22:17:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dwg@au1.ibm.com>) id 1S9SAD-0006JK-K5
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 22:17:40 -0400
Received: from e23smtp05.au.ibm.com ([202.81.31.147]:47254)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dwg@au1.ibm.com>) id 1S9SAC-0006IH-Kg
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 22:17:37 -0400
Received: from /spool/local
	by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <dwg@au1.ibm.com>;
	Mon, 19 Mar 2012 02:13:11 +1000
Received: from d23relay03.au.ibm.com (202.81.31.245)
	by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 19 Mar 2012 02:13:09 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	q2J2HAtT1253434; Mon, 19 Mar 2012 13:17:13 +1100
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	q2J2HAfX021532; Mon, 19 Mar 2012 13:17:10 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.190.163.12])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	q2J2HARi021526; Mon, 19 Mar 2012 13:17:10 +1100
Received: by ozlabs.au.ibm.com (Postfix, from userid 1010)
	id 2023873A0A; Mon, 19 Mar 2012 13:17:10 +1100 (EST)
Date: Mon, 19 Mar 2012 13:17:06 +1100
From: David Gibson <dwg@au1.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20120319021706.GA32554@truffala.fritz.box>
Mail-Followup-To: "Michael S. Tsirkin" <mst@redhat.com>,
	aliguori@us.ibm.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Rusty Russell <rusty@rustcorp.com.au>
References: <1331859788-6522-1-git-send-email-david@gibson.dropbear.id.au>
	<20120318123840.GF29902@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120318123840.GF29902@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
x-cbid: 12031816-1396-0000-0000-000000D54067
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 202.81.31.147
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com,
	Rusty Russell <rusty@rustcorp.com.au>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Remove PCI class code from virtio
	balloon device
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
X-List-Received-Date: Mon, 19 Mar 2012 02:17:42 -0000

On Sun, Mar 18, 2012 at 02:38:42PM +0200, Michael S. Tsirkin wrote:
> On Fri, Mar 16, 2012 at 12:03:08PM +1100, David Gibson wrote:
> > Currently the virtio balloon device, when using the virtio-pci interface
> > advertises itself with PCI class code MEMORY_RAM.  This is wrong; the
> > balloon is vaguely related to memory, but is nothing like a PCI memory
> > device in the meaning of the class code, and this code is not required or
> > suggested by the virtio PCI specification.
> > 
> > Worse, this patch causes problems on the pseries machine, because the
> > firmware, seeing this class code, advertises the device as memory in the
> > device tree, and then a guest kernel bug causes it to see this "memory"
> > before the real system memory, leading to a crash in early boot.
> > 
> > This patch fixes the problem by removing the bogus PCI class code on the
> > balloon device.
> > 
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Rusty Russell <rusty@rustcorp.com.au>
> > 
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> 
> Well, this gives the class a legacy value 00,
> and the PCI spec says we should not use this:
> 
> D.1.
> Base Class 00h
> This base class is defined to provide backward compatibility for devices
> that were built
> before the Class Code field was defined. No new devices should use this
> value and existing
> devices should switch to a more appropriate value if possible.
> For class codes with this base class value, there are two defined values
> for the remaining
> fields as shown in the table below. All other values are reserved.
> Base Class
> 00h
> Sub-Class
> Interface
> 00h
> 01h
> VGA-compatible device
> 00h
> 00h
> All currently implemented devices
> except VGA-compatible devices
> 
> You probably want this instead:
> 
> #define PCI_CLASS_OTHERS		0xff

Ah, thanks.  I had mistakenly assumed that 0 meant "no class
specified".  I'll respin changing to PCI_CLASS_OTHERS.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson


