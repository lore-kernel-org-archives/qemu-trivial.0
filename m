Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur7sy-0004Id-OP
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 10:36:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur7sw-0004IS-35
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 10:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur7sq-0007In-On
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 10:36:49 -0400
Received: from mail-yh0-x235.google.com ([2607:f8b0:4002:c01::235]:64418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ur7nM-0004l7-P3
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 10:31:04 -0400
Received: by mail-yh0-f53.google.com with SMTP id a41so4936824yho.40
	for <qemu-trivial@nongnu.org>; Mon, 24 Jun 2013 07:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:in-reply-to:references:user-agent:date
	:message-id:mime-version:content-type:x-gm-message-state;
	bh=QzhR05ZvrzxgN4dsJ1OXXD7+SjhiIvmPfpyrAq0/Auc=;
	b=iLAuBudKxX+O2u1tdD+bEERCyGwm4KQuy/H6VT1qSOJmA/ML7RryB7ONqwrvXHe/Ds
	P8jR31bsPKKEWZ/x0ht0uLwldDEcCI8DjS8IHq9TQC95Gv7IFcul3ra5Al0SUDJM5GpV
	ymCmzLo7Fdjnl8Rpu6GIt3QAyIEJBoONNaQAn3Kb5PNGAbc9EXwQJtSroTi7zE4MM7w2
	7i2Vt9BXwc8mltFXMj+blJ4OxSLwCL+jmgeHPcjbFk31t+hScc2JbJuT3TXpbZswtbX7
	Pp1wmQgOy54xj/ipQ77W66mQgkvxoGCdCCQIOpTy3H2kuGSvlj7vtPLXj9XAAfaOjmOk
	AO2Q==
X-Received: by 10.236.116.196 with SMTP id g44mr1435334yhh.243.1372084264084; 
	Mon, 24 Jun 2013 07:31:04 -0700 (PDT)
Received: from titi.smtp.gmail.com (cpe-70-112-157-87.austin.res.rr.com.
	[70.112.157.87]) by mx.google.com with ESMTPSA id
	d91sm30764656yhq.16.2013.06.24.07.31.02 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 07:31:03 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: "Michael S. Tsirkin" <mst@redhat.com>
In-Reply-To: <20130624134111.GA1109@redhat.com>
References: <1371747090.32709.61.camel@ul30vt.home>
	<51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
	<CA+aC4kvDQW=-V3-8y-0WQrn-SZh+4jcs+FWLfGa5+VdcE01rxg@mail.gmail.com>
	<20130624071338.GZ5832@redhat.com> <87sj07bsf3.fsf@codemonkey.ws>
	<20130624130642.GJ18508@redhat.com> <87hagnhbsz.fsf@codemonkey.ws>
	<20130624134111.GA1109@redhat.com>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Mon, 24 Jun 2013 09:31:01 -0500
Message-ID: <87zjufy40q.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Gm-Message-State: ALoCoQnt9nL86Du/FMD0ysPBEANIkWF99tk3yTtdjIQ/U0cpki5uFMXoT9/Ziyd2WpOdUHnczVPL
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c01::235
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
X-List-Received-Date: Mon, 24 Jun 2013 14:36:51 -0000

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Jun 24, 2013 at 08:34:52AM -0500, Anthony Liguori wrote:
>> Gleb Natapov <gleb@redhat.com> writes:
>> 
>> Isn't this more or less what Avi's previous proposal was around changing
>> the APIC interfaces to userspace?
>> 
>> Regards,
>> 
>> Anthony Liguori
>
> While that's not very elegant, I think we can use the existing
> interface for this: just encode things in a fake
> "msi message" in the format that kernel expects.

This is, in fact, exactly what we do today.  The MSI interfaces aren't
for MSI.  They are for sending messages to the APIC bus.  What we should
do is:

#define KVM_SIGNAL_LAPIC	KVM_SIGNAL_MSI
#define KVM_IRQ_ROUTING_LAPIC	KVM_IRQ_ROUTING_MSI

And switch to using the new #defines in QEMU.  That would make it more
obvious where we need to refactor things.  We currently hard code
routing via a local APIC with MSI.  We need to change this into a bus
specific function that can choose the right interface.

I think Power is fine with just doing all routing through the irqchip
interface.  We may need other routing interfaces for other architectures
though.

Regards,

Anthony Liguori

>
>> >
>> >> It seems like the only sane way to actually support (2) and (3).
>> >> 
>> >> Regards,
>> >> 
>> >> Anthony Liguori
>> >
>> > --
>> > 			Gleb.

