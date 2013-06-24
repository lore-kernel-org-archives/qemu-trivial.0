Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur6vB-0001sy-Vw
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 09:35:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur6v8-0001mu-IY
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 09:35:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur6v6-0000aV-VX
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 09:35:02 -0400
Received: from mail-yh0-x231.google.com ([2607:f8b0:4002:c01::231]:61068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur6v6-0000aJ-Q2
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 09:35:00 -0400
Received: by mail-yh0-f49.google.com with SMTP id v1so4956518yhn.36
	for <qemu-trivial@nongnu.org>; Mon, 24 Jun 2013 06:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:in-reply-to:references:user-agent:date
	:message-id:mime-version:content-type:x-gm-message-state;
	bh=rrM0xYel0M86hk1YAo8lNMq6p22PVgjKMBvHpQC5Or0=;
	b=l5Yd5GVqkjqexKET5BOy2nCBT5jxB5M/OUt7S9LrqHVHTsVvotCZ0lPh2u/oSJOYll
	JeEMl+sVfdtfLnn3tEJqVY62PP3PKova6kQSbBJRsPc7f5CP0yiLX8Hbz/xc5O35ZS6k
	iDTVHaIclX4Jx5a1WKm3ozMN3qxmQlc30f9IAS7gVIwrEiVywj+5J+zmJURnyEbU2c9U
	dyI1GfuJ0gINCq714z4FW/IpGUFyok+EhL4BXB4B+//N1Z3Ky879Y4dfH7C5xn8b1P0F
	U0Wzy4VOpM6fB2m5dfUsM6ysuhB1OaPAG+lwRVz/FDIHEYyOBbEJP+cM7+7apPrBN2dD
	RrYQ==
X-Received: by 10.236.25.36 with SMTP id y24mr12781128yhy.129.1372080900212;
	Mon, 24 Jun 2013 06:35:00 -0700 (PDT)
Received: from titi.smtp.gmail.com (cpe-70-112-157-87.austin.res.rr.com.
	[70.112.157.87])
	by mx.google.com with ESMTPSA id j5sm30444580yhk.20.2013.06.24.06.34.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 06:34:59 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: Gleb Natapov <gleb@redhat.com>
In-Reply-To: <20130624130642.GJ18508@redhat.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<1371747090.32709.61.camel@ul30vt.home>
	<51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
	<CA+aC4kvDQW=-V3-8y-0WQrn-SZh+4jcs+FWLfGa5+VdcE01rxg@mail.gmail.com>
	<20130624071338.GZ5832@redhat.com> <87sj07bsf3.fsf@codemonkey.ws>
	<20130624130642.GJ18508@redhat.com>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Mon, 24 Jun 2013 08:34:52 -0500
Message-ID: <87hagnhbsz.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Gm-Message-State: ALoCoQmObpA9Go6rWrUkuHI949bZXJcgkqPn9hFrMd9/eXDq6HWm3msVa3rfm/sAIOUu99OEdFZH
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c01::231
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
X-List-Received-Date: Mon, 24 Jun 2013 13:35:04 -0000

Gleb Natapov <gleb@redhat.com> writes:

> On Mon, Jun 24, 2013 at 07:32:32AM -0500, Anthony Liguori wrote:
>> Gleb Natapov <gleb@redhat.com> writes:
>> 
>> This should be a per-device mapping, yes.  But I'm not sure that VCPUs
>> should even see anything.  I don't think a VCPU can generate an MSI
>> interrupt by writing to this location.
>> 
> No, and lower 4k of this space is where APIC is mapped as seen from CPU.
>> Is there anything that prevents us from using IRQFDs corresponding to
>> the target of an MSI mapping and get rid of the MSI info in the kernel?
>> 
> Again, you assume that x86 has some pin that MSI triggers. This is not
> the case; address/data is minimum that is needed to inject interrupt
> there (or moving APIC into userspace, since this is where "translation"
> is happening).

An APIC message contains:

1) Destination Mode
2) Delivery mode
3) Level
4) Trigger mode
5) Vector
6) Destination

Which is more or less what the MSI addr/data pair encodes.

But we can certainly have a userspace interface to inject such a message
into the LAPICs.  In fact, this is more or less what KVM_SIGNAL_MSI is
doing except that it's called MSI and encodes things in an addr/pair.

Such an interface would also allow for a QEMU implementation of an IO
APIC while still having the in-kernel LAPIC.

It would also allow QEMU to do per-device MSI decoding.

Isn't this more or less what Avi's previous proposal was around changing
the APIC interfaces to userspace?

Regards,

Anthony Liguori

>
>> It seems like the only sane way to actually support (2) and (3).
>> 
>> Regards,
>> 
>> Anthony Liguori
>
> --
> 			Gleb.

