Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur6A7-0000B4-KV
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 08:46:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Ur6A4-0008Ub-3F
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:46:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Ur6A2-0008Ad-Ct
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:46:24 -0400
Received: from cantor2.suse.de ([195.135.220.15]:47931 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1Ur61j-0005AD-Pd; Mon, 24 Jun 2013 08:37:48 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D6E06A341E;
	Mon, 24 Jun 2013 14:37:45 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <87sj07bsf3.fsf@codemonkey.ws>
Date: Mon, 24 Jun 2013 14:37:43 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <ADBE5BCC-80AD-49A4-9BC1-BDCEBFDBC206@suse.de>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<1371747090.32709.61.camel@ul30vt.home>
	<51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
	<CA+aC4kvDQW=-V3-8y-0WQrn-SZh+4jcs+FWLfGa5+VdcE01rxg@mail.gmail.com>
	<20130624071338.GZ5832@redhat.com> <87sj07bsf3.fsf@codemonkey.ws>
To: Anthony Liguori <anthony@codemonkey.ws>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Gleb Natapov <gleb@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
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
X-List-Received-Date: Mon, 24 Jun 2013 12:46:26 -0000


On 24.06.2013, at 14:32, Anthony Liguori wrote:

> Gleb Natapov <gleb@redhat.com> writes:
>=20
>> On Sun, Jun 23, 2013 at 10:06:05AM -0500, Anthony Liguori wrote:
>>> On Thu, Jun 20, 2013 at 11:46 PM, Alex Williamson
>>> <alex.williamson@redhat.com> wrote:
>>>> On Fri, 2013-06-21 at 12:49 +1000, Alexey Kardashevskiy wrote:
>>>>> On 06/21/2013 12:34 PM, Alex Williamson wrote:
>>>>>=20
>>>>>=20
>>>>> Do not follow you, sorry. For x86, is it that MSI routing table =
which is
>>>>> updated via KVM_SET_GSI_ROUTING in KVM? When there is no KVM, what =
piece of
>>>>> code responds on msi_notify() in qemu-x86 and does =
qemu_irq_pulse()?
>>>>=20
>>>> vfio_msi_interrupt->msi[x]_notify->stl_le_phys(msg.address, =
msg.data)
>>>>=20
>>>> This writes directly to the interrupt block on the vCPU.  With KVM, =
the
>>>> in-kernel APIC does the same write, where the pin to MSIMessage is =
setup
>>>> by kvm_irqchip_add_msi_route and the pin is pulled by an irqfd.
>>>=20
>>> What is this "interrupt block on the vCPU" you speak of?  I reviewed
>> FEE00000H address as seen from PCI bus is a special address range =
(see
>> 10.11.1 in SDM).
>=20
> Ack.
>=20
>> Any write by a PCI device to that address range is
>> interpreted as MSI. We do not model this correctly in QEMU yet since
>> all devices, including vcpus, see exactly same memory map.
>=20
> This should be a per-device mapping, yes.  But I'm not sure that VCPUs
> should even see anything.  I don't think a VCPU can generate an MSI
> interrupt by writing to this location.
>=20
>>> the SDM and see nothing in the APIC protocol or the brief =
description
>>> of MSI as a PCI concept that would indicate anything except that the
>>> PHB handles MSI writes and feeds them to the I/O APIC.
>>>=20
>> I/O APIC? Did you mean APIC, but even that will probably be =
incorrect.
>> I'd say it translates the data to APIC bus message. And with =
interrupt
>> remapping there is more magic happens between MSI and APIC bus.
>=20
> I think the wording in the SDM allows either.
>=20
>>> In fact, the wikipedia article on MSI has:
>>>=20
>>> "A common misconception with Message Signaled Interrupts is that =
they
>>> allow the device to send data to a processor as part of the =
interrupt.
>>> The data that is sent as part of the write is used by the chipset to
>>> determine which interrupt to trigger on which processor; it is not
>>> available for the device to communicate additional information to =
the
>>> interrupt handler."
>>>=20
>> Not sure who claimed otherwise.
>=20
> So to summarize:
>=20
> 1) MSI writes are intercepted by the PHB and generates an appropriate
>   IRQ.
>=20
> 2) The PHB has a tuple of (src device, address, data) plus whatever
>   information it maintains to do the translation.
>=20
> 3) On Power, we can have multiple PHBs.
>=20
> 4) The kernel interface assumes a single flat table mapping (address,
>   data) to interrupts.  We try to keep that table up-to-date in QEMU.
>=20
> 5) The reason the kernel has MSI info at all is to allow for IRQFDs to
>   generate MSI interrupts.
>=20
> Is there anything that prevents us from using IRQFDs corresponding to
> the target of an MSI mapping and get rid of the MSI info in the =
kernel?

What would that interface look like? An MSI does not arrive at an I/O =
APIC pin, so we can't use the existing "give me an irqfd for this pin" =
command.


Alex


