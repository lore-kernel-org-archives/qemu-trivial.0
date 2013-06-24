Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur8Wd-0002kd-EL
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 11:17:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur8Wa-0002el-BW
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 11:17:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur8WW-0005qV-K5
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 11:17:48 -0400
Received: from mail-gh0-x22d.google.com ([2607:f8b0:4002:c05::22d]:65199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur8WW-0005qI-H6
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 11:17:44 -0400
Received: by mail-gh0-f173.google.com with SMTP id g16so3492598ghb.32
	for <qemu-trivial@nongnu.org>; Mon, 24 Jun 2013 08:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:in-reply-to:references:user-agent:date
	:message-id:mime-version:content-type:x-gm-message-state;
	bh=TTs3OtzNpjK9z0JVcHxU/aD/X6zmsdnDPpojFgUbM7c=;
	b=oOVZgz9eGhg/aqt9SKQ+OlHfy3k/DMpvjaTZ0hB9cGXp4er7g5x6oMGysfiKWXry/j
	lag1glRJ0atG7ApMcJ08YrxX+DFzAbvNGWoMIm7PwDZfqfBgYRIUcHvhXgyTqGbmXnQz
	cQ33fGZquaA1DZ21ZX8G9/dLuI1N3HBrVAeloXyY9+Om2h4S+xv0zech/4kI/OpA+SiP
	7BZJXhc7wwmqVWBetwIyprpbi1F5x9KKJgxk/kap4LzzUHD+hM1HH67Kh7H3JpNYA9T6
	8k2XRHqtXybnhO/G0lH///3QjZ0RjGQET5FK+ulPCGJULOKAeIbj/Q0/3mwhfg1Qo1Tm
	zh6A==
X-Received: by 10.236.203.232 with SMTP id f68mr12982285yho.191.1372087063801; 
	Mon, 24 Jun 2013 08:17:43 -0700 (PDT)
Received: from titi.smtp.gmail.com (cpe-70-112-157-87.austin.res.rr.com.
	[70.112.157.87])
	by mx.google.com with ESMTPSA id o32sm31098173yhi.5.2013.06.24.08.17.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 08:17:43 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: Alexander Graf <agraf@suse.de>
In-Reply-To: <92A47132-AAC5-4F7C-ACF7-2E817C70EDEF@suse.de>
References: <1371747090.32709.61.camel@ul30vt.home>
	<51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
	<CA+aC4kvDQW=-V3-8y-0WQrn-SZh+4jcs+FWLfGa5+VdcE01rxg@mail.gmail.com>
	<20130624071338.GZ5832@redhat.com> <87sj07bsf3.fsf@codemonkey.ws>
	<20130624130642.GJ18508@redhat.com> <87hagnhbsz.fsf@codemonkey.ws>
	<20130624134111.GA1109@redhat.com> <87zjufy40q.fsf@codemonkey.ws>
	<92A47132-AAC5-4F7C-ACF7-2E817C70EDEF@suse.de>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Mon, 24 Jun 2013 10:17:41 -0500
Message-ID: <878v1za67e.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Gm-Message-State: ALoCoQlsf6z3F9xW7gfowA5w+LWkNkilpnJCOn/LDjXEYdUVLGhAIoDv+bF19hUSYQ+1pQ2L5+iR
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c05::22d
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
X-List-Received-Date: Mon, 24 Jun 2013 15:17:49 -0000

Alexander Graf <agraf@suse.de> writes:

> On 24.06.2013, at 16:31, Anthony Liguori wrote:
>
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>> 
>>> On Mon, Jun 24, 2013 at 08:34:52AM -0500, Anthony Liguori wrote:
>>>> Gleb Natapov <gleb@redhat.com> writes:
>>>> 
>>>> Isn't this more or less what Avi's previous proposal was around changing
>>>> the APIC interfaces to userspace?
>>>> 
>>>> Regards,
>>>> 
>>>> Anthony Liguori
>>> 
>>> While that's not very elegant, I think we can use the existing
>>> interface for this: just encode things in a fake
>>> "msi message" in the format that kernel expects.
>> 
>> This is, in fact, exactly what we do today.  The MSI interfaces aren't
>> for MSI.  They are for sending messages to the APIC bus.  What we should
>> do is:
>> 
>> #define KVM_SIGNAL_LAPIC	KVM_SIGNAL_MSI
>> #define KVM_IRQ_ROUTING_LAPIC	KVM_IRQ_ROUTING_MSI
>> 
>> And switch to using the new #defines in QEMU.  That would make it more
>> obvious where we need to refactor things.  We currently hard code
>> routing via a local APIC with MSI.  We need to change this into a bus
>> specific function that can choose the right interface.
>> 
>> I think Power is fine with just doing all routing through the irqchip
>> interface.  We may need other routing interfaces for other architectures
>> though.
>
> I'm not quite sure what problem exactly you're trying to solve
> here. The main user of MSI injects through irqfd are in the kernel and
> definitely want a fast path to inject those without any involvement of
> QEMU at all.

Internally the communication between the IO APIC and LAPICs uses a
protocol that does not map to a simple "pin numbering".

Because we implement the IO APIC in the kernel, the kernel interface can
be pin numbering more or less.

But MSI bypasses the IO APIC (potentially at least) which means that we
need a userspace interface for sending APIC messages.

Unfortunately, when this was added to support MSI, this was called "MSI"
but it is most certainly not.

In the very least, you also need the bus state + the source device to do
proper MSI translation.  We get around this by assigning global MSI
addresses and only having a single PHB.

If you make those assumptions, then the APIC protocol looks a lot like
an MSI address/data pair.

Regards,

Anthony Liguori

>
>
> Alex

