Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur5wx-00049B-R7
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 08:32:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur5wu-000452-3d
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:32:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur5ws-0003DP-NU
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:32:48 -0400
Received: from mail-gh0-x22c.google.com ([2607:f8b0:4002:c05::22c]:52120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur5ws-0003DD-Iz
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:32:46 -0400
Received: by mail-gh0-f172.google.com with SMTP id r18so3423183ghr.17
	for <qemu-trivial@nongnu.org>; Mon, 24 Jun 2013 05:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:in-reply-to:references:user-agent:date
	:message-id:mime-version:content-type:x-gm-message-state;
	bh=yOvmsxLWa622vY3wvSs8kw0B5czsTRhO/ALQiUxOnM4=;
	b=kL05PIV6fNfMJRMngw36P2yoMBMNdOVzNkT1MGtGJx95aTVmkUKd7kooja0sC+E34A
	I2AGWPVXYWem+/zi+0z5NkWJp9DD9ChDYbNXSvstjUStj+RoSrFFN3rPieWRc++rZnia
	KjI76nx6Wv8IBx1r6zmULkl7VxZFyhBG4+OevAdtn82FS7Ue57zGyMvk3xwv6S5JlsKz
	Xy/9kv5A8Yo1ZzlRq6sq+Jkf4//O7sn9f4n/DcbvdPxpiFk9GhEbJjNGYzkpIu14Izdb
	z1RwLD7n2j3YqaDB0ZPCqesrhc5B2Alcb23BUNEl1c3NXVLZk/5VfJcHrycSsZcwiMyo
	QBEg==
X-Received: by 10.236.19.164 with SMTP id n24mr12730839yhn.92.1372077166181;
	Mon, 24 Jun 2013 05:32:46 -0700 (PDT)
Received: from titi.smtp.gmail.com (cpe-70-112-157-87.austin.res.rr.com.
	[70.112.157.87]) by mx.google.com with ESMTPSA id
	x52sm30121497yhh.18.2013.06.24.05.32.43 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 05:32:45 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: Gleb Natapov <gleb@redhat.com>
In-Reply-To: <20130624071338.GZ5832@redhat.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<1371747090.32709.61.camel@ul30vt.home>
	<51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
	<CA+aC4kvDQW=-V3-8y-0WQrn-SZh+4jcs+FWLfGa5+VdcE01rxg@mail.gmail.com>
	<20130624071338.GZ5832@redhat.com>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Mon, 24 Jun 2013 07:32:32 -0500
Message-ID: <87sj07bsf3.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Gm-Message-State: ALoCoQkMSFLfHSP78W10DeUU79ssurDDv05IOlqU4zEVxNgPXePNfQGcqlhgI41muhnLIaJ3rg8T
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c05::22c
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
X-List-Received-Date: Mon, 24 Jun 2013 12:32:51 -0000

Gleb Natapov <gleb@redhat.com> writes:

> On Sun, Jun 23, 2013 at 10:06:05AM -0500, Anthony Liguori wrote:
>> On Thu, Jun 20, 2013 at 11:46 PM, Alex Williamson
>> <alex.williamson@redhat.com> wrote:
>> > On Fri, 2013-06-21 at 12:49 +1000, Alexey Kardashevskiy wrote:
>> >> On 06/21/2013 12:34 PM, Alex Williamson wrote:
>> >>
>> >>
>> >> Do not follow you, sorry. For x86, is it that MSI routing table which is
>> >> updated via KVM_SET_GSI_ROUTING in KVM? When there is no KVM, what piece of
>> >> code responds on msi_notify() in qemu-x86 and does qemu_irq_pulse()?
>> >
>> > vfio_msi_interrupt->msi[x]_notify->stl_le_phys(msg.address, msg.data)
>> >
>> > This writes directly to the interrupt block on the vCPU.  With KVM, the
>> > in-kernel APIC does the same write, where the pin to MSIMessage is setup
>> > by kvm_irqchip_add_msi_route and the pin is pulled by an irqfd.
>> 
>> What is this "interrupt block on the vCPU" you speak of?  I reviewed
> FEE00000H address as seen from PCI bus is a special address range (see
> 10.11.1 in SDM).

Ack.

> Any write by a PCI device to that address range is
> interpreted as MSI. We do not model this correctly in QEMU yet since
> all devices, including vcpus, see exactly same memory map.

This should be a per-device mapping, yes.  But I'm not sure that VCPUs
should even see anything.  I don't think a VCPU can generate an MSI
interrupt by writing to this location.

>> the SDM and see nothing in the APIC protocol or the brief description
>> of MSI as a PCI concept that would indicate anything except that the
>> PHB handles MSI writes and feeds them to the I/O APIC.
>> 
> I/O APIC? Did you mean APIC, but even that will probably be incorrect.
> I'd say it translates the data to APIC bus message. And with interrupt
> remapping there is more magic happens between MSI and APIC bus.

I think the wording in the SDM allows either.

>> In fact, the wikipedia article on MSI has:
>> 
>> "A common misconception with Message Signaled Interrupts is that they
>> allow the device to send data to a processor as part of the interrupt.
>> The data that is sent as part of the write is used by the chipset to
>> determine which interrupt to trigger on which processor; it is not
>> available for the device to communicate additional information to the
>> interrupt handler."
>> 
> Not sure who claimed otherwise.

So to summarize:

1) MSI writes are intercepted by the PHB and generates an appropriate
   IRQ.

2) The PHB has a tuple of (src device, address, data) plus whatever
   information it maintains to do the translation.

3) On Power, we can have multiple PHBs.

4) The kernel interface assumes a single flat table mapping (address,
   data) to interrupts.  We try to keep that table up-to-date in QEMU.

5) The reason the kernel has MSI info at all is to allow for IRQFDs to
   generate MSI interrupts.

Is there anything that prevents us from using IRQFDs corresponding to
the target of an MSI mapping and get rid of the MSI info in the kernel?

It seems like the only sane way to actually support (2) and (3).

Regards,

Anthony Liguori


