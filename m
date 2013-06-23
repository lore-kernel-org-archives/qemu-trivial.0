Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UqsIZ-0005C4-CM
	for mharc-qemu-trivial@gnu.org; Sun, 23 Jun 2013 17:58:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UqsIW-00059p-EL
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 17:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UqsIV-0002cP-5T
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 17:58:12 -0400
Received: from mail-oa0-x229.google.com ([2607:f8b0:4003:c02::229]:52642)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UqsIV-0002cA-18
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 17:58:11 -0400
Received: by mail-oa0-f41.google.com with SMTP id n10so11402890oag.0
	for <qemu-trivial@nongnu.org>; Sun, 23 Jun 2013 14:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=Qc/AMQMLxz/mroHPCJsER/1PcYA5IWeoRlIWa/SOlug=;
	b=YdTQ8GIvOp1ccdM6VVj54Xz8M6jIhi/yiQg6dexnr6ZDfdE1e8fEPvl+8Zy+V65Pmo
	emX8h6WwnTHEaqBx88Ly6nL0r4J+u4O6da0Y4Preq7m0EIyS8jS1KWSU4ew7B3l/ZgHI
	o60HCZPa7y9RaVjQ/bF65GSXHNitDkrgT5CIuUoKlJscPn043nHV9GMkxQRF3ylOlUcw
	S+RML35uo1tQGKmnf8qCL6le35e9x8rxOKYAendBoCuFLnh9z25KwJ7+ja+D8WDkn08i
	4XzmieS6ZZ6YSz3hO3Z889qalUq2a8oDtLuh8PkUIMmKJ/K8vW94D4y5uU3RifxgfqcK
	lXbg==
MIME-Version: 1.0
X-Received: by 10.60.50.195 with SMTP id e3mr461771oeo.86.1372024690230; Sun,
	23 Jun 2013 14:58:10 -0700 (PDT)
Received: by 10.60.135.225 with HTTP; Sun, 23 Jun 2013 14:58:10 -0700 (PDT)
In-Reply-To: <1372023554.3944.111.camel@pasglop>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<874ncshh67.fsf@codemonkey.ws> <51C39578.6020204@ozlabs.ru>
	<20130623140736.GB20842@redhat.com>
	<CA+aC4ksTsWTH23F2jXYPXGk4Ya7JD1a7Q8p7xD65vOiD57Z=qQ@mail.gmail.com>
	<1372023554.3944.111.camel@pasglop>
Date: Sun, 23 Jun 2013 16:58:10 -0500
Message-ID: <CA+aC4kt9GqL9JGE7z5e0d0pDROqPBBMqzo00Yv58oxR_=Lf48Q@mail.gmail.com>
From: Anthony Liguori <anthony@codemonkey.ws>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQlBzEHorVoF4LhtUtHqmZkUKGsP1krgOv2X5vMVaCBvO7qewaAeSSeY7VDu+x5WP+9p+C87
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::229
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel <qemu-devel@nongnu.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Paul Mackerras <paulus@samba.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-ppc] [Qemu-devel] [PATCH] RFC kvm irqfd:
 add directly mapped MSI IRQ support
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
X-List-Received-Date: Sun, 23 Jun 2013 21:58:14 -0000

On Sun, Jun 23, 2013 at 4:39 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Sun, 2013-06-23 at 10:02 -0500, Anthony Liguori wrote:
>> It doesn't make a lot of sense to have Power do MSI decoding in
>> userspace while x86 does it in the kernel.  I assume the kernel
>> doesn't have enough information to do the translation on Power?
>
> Well, it would need the host bridge which it doesn't have and it
> would need a concept of mapping that to interrupt numbers which
> we don't want in the kernel.
>
> We can keep the kernel side a LOT simpler (completely avoiding
> the whole route bloatware) by sticking to our "simple" direct map kernel
> stuff and doing the mapping from address/data to interrupts in qemu, so
> we'll stick to that.

Yeah, but none of this is Power specific...  so we can do the same for x86, no?

I'm still trying to wrap my head around why we need MSI knowledge at
all in the kernel for x86.  I presume it's to fast-path irqfd when
doing vhost?

Regards,

Anthony Liguori

>
> Cheers,
> Ben.
>
>

