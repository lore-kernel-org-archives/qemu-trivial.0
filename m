Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur7rN-0001mz-8Z
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 10:35:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Ur7rG-0001ZW-4T
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 10:35:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Ur7rD-0006Ii-KA
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 10:35:06 -0400
Received: from cantor2.suse.de ([195.135.220.15]:53465 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1Ur7qy-00064v-AX; Mon, 24 Jun 2013 10:34:48 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 7E8EEA5211;
	Mon, 24 Jun 2013 16:34:46 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <87zjufy40q.fsf@codemonkey.ws>
Date: Mon, 24 Jun 2013 16:34:45 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <92A47132-AAC5-4F7C-ACF7-2E817C70EDEF@suse.de>
References: <1371747090.32709.61.camel@ul30vt.home>
	<51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
	<CA+aC4kvDQW=-V3-8y-0WQrn-SZh+4jcs+FWLfGa5+VdcE01rxg@mail.gmail.com>
	<20130624071338.GZ5832@redhat.com> <87sj07bsf3.fsf@codemonkey.ws>
	<20130624130642.GJ18508@redhat.com> <87hagnhbsz.fsf@codemonkey.ws>
	<20130624134111.GA1109@redhat.com> <87zjufy40q.fsf@codemonkey.ws>
To: Anthony Liguori <anthony@codemonkey.ws>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Gleb Natapov <gleb@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
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
X-List-Received-Date: Mon, 24 Jun 2013 14:35:11 -0000


On 24.06.2013, at 16:31, Anthony Liguori wrote:

> "Michael S. Tsirkin" <mst@redhat.com> writes:
>=20
>> On Mon, Jun 24, 2013 at 08:34:52AM -0500, Anthony Liguori wrote:
>>> Gleb Natapov <gleb@redhat.com> writes:
>>>=20
>>> Isn't this more or less what Avi's previous proposal was around =
changing
>>> the APIC interfaces to userspace?
>>>=20
>>> Regards,
>>>=20
>>> Anthony Liguori
>>=20
>> While that's not very elegant, I think we can use the existing
>> interface for this: just encode things in a fake
>> "msi message" in the format that kernel expects.
>=20
> This is, in fact, exactly what we do today.  The MSI interfaces aren't
> for MSI.  They are for sending messages to the APIC bus.  What we =
should
> do is:
>=20
> #define KVM_SIGNAL_LAPIC	KVM_SIGNAL_MSI
> #define KVM_IRQ_ROUTING_LAPIC	KVM_IRQ_ROUTING_MSI
>=20
> And switch to using the new #defines in QEMU.  That would make it more
> obvious where we need to refactor things.  We currently hard code
> routing via a local APIC with MSI.  We need to change this into a bus
> specific function that can choose the right interface.
>=20
> I think Power is fine with just doing all routing through the irqchip
> interface.  We may need other routing interfaces for other =
architectures
> though.

I'm not quite sure what problem exactly you're trying to solve here. The =
main user of MSI injects through irqfd are in the kernel and definitely =
want a fast path to inject those without any involvement of QEMU at all.


Alex


