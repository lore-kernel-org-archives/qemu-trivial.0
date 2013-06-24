Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur70r-00089Z-SG
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 09:40:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Ur70l-0007yM-7V
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 09:40:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Ur70c-0002sD-5G
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 09:40:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30723)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1Ur70P-0002o6-L6; Mon, 24 Jun 2013 09:40:29 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5ODePLo028383
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 09:40:26 -0400
Received: from redhat.com (vpn1-6-64.ams2.redhat.com [10.36.6.64])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id r5ODeLDJ007839; Mon, 24 Jun 2013 09:40:22 -0400
Date: Mon, 24 Jun 2013 16:41:11 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Message-ID: <20130624134111.GA1109@redhat.com>
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
Cc: Gleb Natapov <gleb@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
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
X-List-Received-Date: Mon, 24 Jun 2013 13:40:56 -0000

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
> But we can certainly have a userspace interface to inject such a message
> into the LAPICs.  In fact, this is more or less what KVM_SIGNAL_MSI is
> doing except that it's called MSI and encodes things in an addr/pair.
> 
> Such an interface would also allow for a QEMU implementation of an IO
> APIC while still having the in-kernel LAPIC.
> 
> It would also allow QEMU to do per-device MSI decoding.
> 
> Isn't this more or less what Avi's previous proposal was around changing
> the APIC interfaces to userspace?
> 
> Regards,
> 
> Anthony Liguori

While that's not very elegant, I think we can use the existing
interface for this: just encode things in a fake
"msi message" in the format that kernel expects.

> >
> >> It seems like the only sane way to actually support (2) and (3).
> >> 
> >> Regards,
> >> 
> >> Anthony Liguori
> >
> > --
> > 			Gleb.

