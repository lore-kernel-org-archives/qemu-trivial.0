Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur9kj-0005nD-5j
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 12:36:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gleb@redhat.com>) id 1Ur9kb-0005aY-FY
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 12:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gleb@redhat.com>) id 1Ur9kW-0007J8-FF
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 12:36:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gleb@redhat.com>)
	id 1Ur9kC-00078G-5U; Mon, 24 Jun 2013 12:35:56 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5OGZqLR020227
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 12:35:52 -0400
Received: from dhcp-1-237.tlv.redhat.com (dhcp-4-26.tlv.redhat.com
	[10.35.4.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5OGZofq031503; Mon, 24 Jun 2013 12:35:50 -0400
Received: by dhcp-1-237.tlv.redhat.com (Postfix, from userid 13519)
	id A7E3118D3DE; Mon, 24 Jun 2013 19:35:49 +0300 (IDT)
Date: Mon, 24 Jun 2013 19:35:49 +0300
From: Gleb Natapov <gleb@redhat.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Message-ID: <20130624163549.GA8351@redhat.com>
References: <1371747090.32709.61.camel@ul30vt.home>
	<51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
	<CA+aC4kvDQW=-V3-8y-0WQrn-SZh+4jcs+FWLfGa5+VdcE01rxg@mail.gmail.com>
	<20130624071338.GZ5832@redhat.com> <87sj07bsf3.fsf@codemonkey.ws>
	<20130624130642.GJ18508@redhat.com> <87hagnhbsz.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87hagnhbsz.fsf@codemonkey.ws>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 24 Jun 2013 16:36:27 -0000

On Mon, Jun 24, 2013 at 08:34:52AM -0500, Anthony Liguori wrote:
> Gleb Natapov <gleb@redhat.com> writes:
> 
> > On Mon, Jun 24, 2013 at 07:32:32AM -0500, Anthony Liguori wrote:
> >> Gleb Natapov <gleb@redhat.com> writes:
> >> 
> >> This should be a per-device mapping, yes.  But I'm not sure that VCPUs
> >> should even see anything.  I don't think a VCPU can generate an MSI
> >> interrupt by writing to this location.
> >> 
> > No, and lower 4k of this space is where APIC is mapped as seen from CPU.
> >> Is there anything that prevents us from using IRQFDs corresponding to
> >> the target of an MSI mapping and get rid of the MSI info in the kernel?
> >> 
> > Again, you assume that x86 has some pin that MSI triggers. This is not
> > the case; address/data is minimum that is needed to inject interrupt
> > there (or moving APIC into userspace, since this is where "translation"
> > is happening).
> 
> An APIC message contains:
> 
> 1) Destination Mode
> 2) Delivery mode
> 3) Level
> 4) Trigger mode
> 5) Vector
> 6) Destination
> 
> Which is more or less what the MSI addr/data pair encodes.
> 
Not if interrupt remapping is in use.

> But we can certainly have a userspace interface to inject such a message
> into the LAPICs.  In fact, this is more or less what KVM_SIGNAL_MSI is
> doing except that it's called MSI and encodes things in an addr/pair.
> 
Good that it does that otherwise it would have been broken after
interrupt remapping implementation.

> Such an interface would also allow for a QEMU implementation of an IO
> APIC while still having the in-kernel LAPIC.
> 
Yes.

> It would also allow QEMU to do per-device MSI decoding.
> 
Why can't it be done now with existing interfaces?

> Isn't this more or less what Avi's previous proposal was around changing
> the APIC interfaces to userspace?
> 
Avi actually was against adding KVM_SIGNAL_MSI initially since it
duplicated the functionality we already had. Don't remember how Jan
managed to persuade him in the end :)

--
			Gleb.

