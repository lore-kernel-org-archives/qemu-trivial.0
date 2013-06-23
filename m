Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UqloL-0004m7-Mj
	for mharc-qemu-trivial@gnu.org; Sun, 23 Jun 2013 11:02:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UqloJ-0004ki-LX
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 11:02:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UqloG-0003a9-K8
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 11:02:35 -0400
Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d]:56144)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UqloG-0003Zr-FW
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 11:02:32 -0400
Received: by mail-ob0-f173.google.com with SMTP id wc20so10181611obb.32
	for <qemu-trivial@nongnu.org>; Sun, 23 Jun 2013 08:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=CiiwRTo/r4v0D5m5uN7XU3qHxgwoTNDtLC6X+3kLVfY=;
	b=Eyc4T646Xe3BzmWum5mApCmMPEu6SwFom+5qW3lu+hAtlxzwWmiPMnrovXJOyfwD/a
	qE0NsNownmI84HCNLzL1aiTwqeiYqBcjaOhfjxX52aRh91KzBcEUUvWVdJZJ4TW+IdDo
	8GF+lKCBYv8BgjYfuMwP6FPppO/dYgkVUBT8DTyZiI+4kfXUFxGd/FOcqFLqH3C9PAd0
	C9EBNUoCo8JVU7njx17oetj0Lxa2/EszMgVptTQSCOr09vl+LRxPpiWRdaQeWy1aTc0N
	U5h82IDG0WiVGMSSHmycorc1/SJKT5rFd+2yy4jlQSE+7X3DF8ElMLCRAPMMKP39LCDK
	vELQ==
MIME-Version: 1.0
X-Received: by 10.60.55.164 with SMTP id t4mr9764063oep.50.1371999751347; Sun,
	23 Jun 2013 08:02:31 -0700 (PDT)
Received: by 10.60.135.225 with HTTP; Sun, 23 Jun 2013 08:02:31 -0700 (PDT)
In-Reply-To: <20130623140736.GB20842@redhat.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<874ncshh67.fsf@codemonkey.ws> <51C39578.6020204@ozlabs.ru>
	<20130623140736.GB20842@redhat.com>
Date: Sun, 23 Jun 2013 10:02:31 -0500
Message-ID: <CA+aC4ksTsWTH23F2jXYPXGk4Ya7JD1a7Q8p7xD65vOiD57Z=qQ@mail.gmail.com>
From: Anthony Liguori <anthony@codemonkey.ws>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQltG9vb3f4xKHauwH4mFj7xhPKBgb/OVjt1u6jrSlTyqFgp2MJNoSeKl4gWkOFUwTjjaZcy
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::22d
Cc: Anthony Liguori <aliguori@us.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
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
X-List-Received-Date: Sun, 23 Jun 2013 15:02:36 -0000

On Sun, Jun 23, 2013 at 9:07 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Fri, Jun 21, 2013 at 09:51:20AM +1000, Alexey Kardashevskiy wrote:
>> And kvm_irqchip_add_msi_route does not have any link to a device or a bus
>> so I'll have to walk through all PHBs in system and see if PHB's MSI window
>> is the one from MSIMessage and convert MSIMessage to virq. Pretty easy and
>> quick but still dirty hack, would it be better?
>
> Yes I think that's fine really.
>
> Basically devices all speak MSIMessage as they should -
> this is what the PCI spec says.
> On all normal systems guests also speak MSIMessage so
> the API which uses these makes sense for kvm.

There is no difference between Power and x86 in how they handle MSI.
MSI is not a concept in the APIC or processor.  MSI interrupts are
handled by the PHB and delivered through the I/O APIC using the
information in the address/data.

I've always assumed that the kernel knows about MSI just because PCI
passthrough needs it for whatever reason.  It's not part of the APIC
complex and it is weird to have MSI decoding information in the
kernel.

> Except, ppc architecture in its wisdom decided to hide this
> in firmware.  QEMU does not have firmware so the translation
> has to be maintained in QEMU powerpc code.

To be clear: instead of writing to an address with a load/store, Power
has a hypercall to do this.  The hypercall is hidden behind a firmware
abstract layer (RTAS) but it's still just a hypercall.

It uses a hypercall simply because Power was designed to not require
MMIO trapping.  It's much like Xen PV in that regard.

It doesn't make a lot of sense to have Power do MSI decoding in
userspace while x86 does it in the kernel.  I assume the kernel
doesn't have enough information to do the translation on Power?

Regards,

Anthony Liguori

> --
> MST
>

