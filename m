Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur74Y-0004Sm-HO
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 09:44:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gleb@redhat.com>) id 1Ur6UA-0005wT-Sl
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 09:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gleb@redhat.com>) id 1Ur6U9-0008CC-66
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 09:07:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gleb@redhat.com>)
	id 1Ur6Tt-00088f-PP; Mon, 24 Jun 2013 09:06:53 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5OD6mo9021830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 09:06:48 -0400
Received: from dhcp-1-237.tlv.redhat.com (dhcp-4-26.tlv.redhat.com
	[10.35.4.26])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5OD6hZI030911; Mon, 24 Jun 2013 09:06:43 -0400
Received: by dhcp-1-237.tlv.redhat.com (Postfix, from userid 13519)
	id DAA8718D3DE; Mon, 24 Jun 2013 16:06:42 +0300 (IDT)
Date: Mon, 24 Jun 2013 16:06:42 +0300
From: Gleb Natapov <gleb@redhat.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Message-ID: <20130624130642.GJ18508@redhat.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<1371747090.32709.61.camel@ul30vt.home>
	<51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
	<CA+aC4kvDQW=-V3-8y-0WQrn-SZh+4jcs+FWLfGa5+VdcE01rxg@mail.gmail.com>
	<20130624071338.GZ5832@redhat.com> <87sj07bsf3.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sj07bsf3.fsf@codemonkey.ws>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 24 Jun 2013 09:44:44 -0400
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, Alexander Graf <agraf@suse.de>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Paul Mackerras <paulus@samba.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] RFC kvm irqfd: add directly
 mapped MSI IRQ support
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
X-List-Received-Date: Mon, 24 Jun 2013 13:07:12 -0000

On Mon, Jun 24, 2013 at 07:32:32AM -0500, Anthony Liguori wrote:
> Gleb Natapov <gleb@redhat.com> writes:
> 
> > On Sun, Jun 23, 2013 at 10:06:05AM -0500, Anthony Liguori wrote:
> >> On Thu, Jun 20, 2013 at 11:46 PM, Alex Williamson
> >> <alex.williamson@redhat.com> wrote:
> >> > On Fri, 2013-06-21 at 12:49 +1000, Alexey Kardashevskiy wrote:
> >> >> On 06/21/2013 12:34 PM, Alex Williamson wrote:
> >> >>
> >> >>
> >> >> Do not follow you, sorry. For x86, is it that MSI routing table which is
> >> >> updated via KVM_SET_GSI_ROUTING in KVM? When there is no KVM, what piece of
> >> >> code responds on msi_notify() in qemu-x86 and does qemu_irq_pulse()?
> >> >
> >> > vfio_msi_interrupt->msi[x]_notify->stl_le_phys(msg.address, msg.data)
> >> >
> >> > This writes directly to the interrupt block on the vCPU.  With KVM, the
> >> > in-kernel APIC does the same write, where the pin to MSIMessage is setup
> >> > by kvm_irqchip_add_msi_route and the pin is pulled by an irqfd.
> >> 
> >> What is this "interrupt block on the vCPU" you speak of?  I reviewed
> > FEE00000H address as seen from PCI bus is a special address range (see
> > 10.11.1 in SDM).
> 
> Ack.
> 
> > Any write by a PCI device to that address range is
> > interpreted as MSI. We do not model this correctly in QEMU yet since
> > all devices, including vcpus, see exactly same memory map.
> 
> This should be a per-device mapping, yes.  But I'm not sure that VCPUs
> should even see anything.  I don't think a VCPU can generate an MSI
> interrupt by writing to this location.
> 
No, and lower 4k of this space is where APIC is mapped as seen from CPU.

> >> the SDM and see nothing in the APIC protocol or the brief description
> >> of MSI as a PCI concept that would indicate anything except that the
> >> PHB handles MSI writes and feeds them to the I/O APIC.
> >> 
> > I/O APIC? Did you mean APIC, but even that will probably be incorrect.
> > I'd say it translates the data to APIC bus message. And with interrupt
> > remapping there is more magic happens between MSI and APIC bus.
> 
> I think the wording in the SDM allows either.
> 
SDM says nothing about it, but since we are guessing anyway my last guess
would be I/O APIC.  I/O APIC has well defined role: it detects level/edge
interrupts on an input pins and send preconfigured APIC message to APIC
bus if one is detected. In fact its even mapped at different address
0FEC00000H. Of course since I/O APIC and the logic that maps MSI writes
to APIC bus message are probably on the same chips anyway you can call
this logic a part of I/O APIC, but this is stretching it too much IMO :)

> >> In fact, the wikipedia article on MSI has:
> >> 
> >> "A common misconception with Message Signaled Interrupts is that they
> >> allow the device to send data to a processor as part of the interrupt.
> >> The data that is sent as part of the write is used by the chipset to
> >> determine which interrupt to trigger on which processor; it is not
> >> available for the device to communicate additional information to the
> >> interrupt handler."
> >> 
> > Not sure who claimed otherwise.
> 
> So to summarize:
> 
> 1) MSI writes are intercepted by the PHB and generates an appropriate
>    IRQ.
> 
> 2) The PHB has a tuple of (src device, address, data) plus whatever
>    information it maintains to do the translation.
> 
> 3) On Power, we can have multiple PHBs.
> 
Looks like that means we need to put more information into the kernel,
not less.

> 4) The kernel interface assumes a single flat table mapping (address,
>    data) to interrupts.  We try to keep that table up-to-date in QEMU.
> 
> 5) The reason the kernel has MSI info at all is to allow for IRQFDs to
>    generate MSI interrupts.
> 
> Is there anything that prevents us from using IRQFDs corresponding to
> the target of an MSI mapping and get rid of the MSI info in the kernel?
> 
Again, you assume that x86 has some pin that MSI triggers. This is not
the case; address/data is minimum that is needed to inject interrupt
there (or moving APIC into userspace, since this is where "translation"
is happening).

> It seems like the only sane way to actually support (2) and (3).
> 
> Regards,
> 
> Anthony Liguori

--
			Gleb.

