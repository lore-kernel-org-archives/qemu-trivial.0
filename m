Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UrA6n-0006U8-Nz
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 12:59:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gleb@redhat.com>) id 1UrA6k-0006NR-1a
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 12:59:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gleb@redhat.com>) id 1Ur9wy-0006GT-6I
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 12:49:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59627)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gleb@redhat.com>)
	id 1Ur9wb-00068f-6q; Mon, 24 Jun 2013 12:48:45 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5OGmfRj005150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 12:48:41 -0400
Received: from dhcp-1-237.tlv.redhat.com (dhcp-4-26.tlv.redhat.com
	[10.35.4.26])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5OGmeYG020479; Mon, 24 Jun 2013 12:48:40 -0400
Received: by dhcp-1-237.tlv.redhat.com (Postfix, from userid 13519)
	id 2F38518D3DE; Mon, 24 Jun 2013 19:48:39 +0300 (IDT)
Date: Mon, 24 Jun 2013 19:48:39 +0300
From: Gleb Natapov <gleb@redhat.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Message-ID: <20130624164839.GB8351@redhat.com>
References: <1371789981.30572.114.camel@ul30vt.home>
	<CA+aC4kvDQW=-V3-8y-0WQrn-SZh+4jcs+FWLfGa5+VdcE01rxg@mail.gmail.com>
	<20130624071338.GZ5832@redhat.com> <87sj07bsf3.fsf@codemonkey.ws>
	<20130624130642.GJ18508@redhat.com> <87hagnhbsz.fsf@codemonkey.ws>
	<20130624134111.GA1109@redhat.com> <87zjufy40q.fsf@codemonkey.ws>
	<92A47132-AAC5-4F7C-ACF7-2E817C70EDEF@suse.de>
	<878v1za67e.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878v1za67e.fsf@codemonkey.ws>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
	qemu-devel <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, qemu-trivial@nongnu.org,
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
X-List-Received-Date: Mon, 24 Jun 2013 16:59:15 -0000

On Mon, Jun 24, 2013 at 10:17:41AM -0500, Anthony Liguori wrote:
> Alexander Graf <agraf@suse.de> writes:
> 
> > On 24.06.2013, at 16:31, Anthony Liguori wrote:
> >
> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
> >> 
> >>> On Mon, Jun 24, 2013 at 08:34:52AM -0500, Anthony Liguori wrote:
> >>>> Gleb Natapov <gleb@redhat.com> writes:
> >>>> 
> >>>> Isn't this more or less what Avi's previous proposal was around changing
> >>>> the APIC interfaces to userspace?
> >>>> 
> >>>> Regards,
> >>>> 
> >>>> Anthony Liguori
> >>> 
> >>> While that's not very elegant, I think we can use the existing
> >>> interface for this: just encode things in a fake
> >>> "msi message" in the format that kernel expects.
> >> 
> >> This is, in fact, exactly what we do today.  The MSI interfaces aren't
> >> for MSI.  They are for sending messages to the APIC bus.  What we should
> >> do is:
> >> 
> >> #define KVM_SIGNAL_LAPIC	KVM_SIGNAL_MSI
> >> #define KVM_IRQ_ROUTING_LAPIC	KVM_IRQ_ROUTING_MSI
> >> 
> >> And switch to using the new #defines in QEMU.  That would make it more
> >> obvious where we need to refactor things.  We currently hard code
> >> routing via a local APIC with MSI.  We need to change this into a bus
> >> specific function that can choose the right interface.
> >> 
> >> I think Power is fine with just doing all routing through the irqchip
> >> interface.  We may need other routing interfaces for other architectures
> >> though.
> >
> > I'm not quite sure what problem exactly you're trying to solve
> > here. The main user of MSI injects through irqfd are in the kernel and
> > definitely want a fast path to inject those without any involvement of
> > QEMU at all.
> 
> Internally the communication between the IO APIC and LAPICs uses a
> protocol that does not map to a simple "pin numbering".
> 
> Because we implement the IO APIC in the kernel, the kernel interface can
> be pin numbering more or less.
> 
> But MSI bypasses the IO APIC (potentially at least) which means that we
> need a userspace interface for sending APIC messages.
> 
> Unfortunately, when this was added to support MSI, this was called "MSI"
> but it is most certainly not.
Why not? MSI is when a PIC device writes something somewhere. This is
what interface provides. Interpretation of MSI data/address as APIC
message is x86 specific and shouldn't even be compiled by other arches.

> 
> In the very least, you also need the bus state + the source device to do
> proper MSI translation.  We get around this by assigning global MSI
> addresses and only having a single PHB.
> 
It looks to me that you are arguing that each architecture needs to have
its own logic to deliver MSI interrupt and for some arches current
interface does not provide enough data. I am not arguing with that.

> If you make those assumptions, then the APIC protocol looks a lot like
> an MSI address/data pair.
> 

--
			Gleb.

