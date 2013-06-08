Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UlEaa-0003aO-Jl
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jun 2013 04:33:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UlEaX-0003Zn-5B
	for qemu-trivial@nongnu.org; Sat, 08 Jun 2013 04:33:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UlEaW-0007Hz-7B
	for qemu-trivial@nongnu.org; Sat, 08 Jun 2013 04:33:29 -0400
Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a]:54499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UlEaW-0007Hr-1j
	for qemu-trivial@nongnu.org; Sat, 08 Jun 2013 04:33:28 -0400
Received: by mail-pb0-f42.google.com with SMTP id un1so1399909pbc.15
	for <qemu-trivial@nongnu.org>; Sat, 08 Jun 2013 01:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=qoVdUbIrPDV8cLyxVRlNd82OOynDQk7xeVa0StbmJLo=;
	b=YiMFiDUOslf9qoZEvm1gKFC+76vdbQ7uEUnDR57Ja15DkHSSCvznPtAW0dDMy4ojai
	Tkx0RIRylQOlIETcMZFqrGV4rFHaBdr32uSmMM1+FfPISPs1Wl865JYGiN7Ct0+FJzm+
	jvZtgTjRWaeKr8/+xs6hx5B9OwsheZdtxqCY9YnAldF9LBss5aVR8TPx7Ou8aJJeGU4G
	mKIIETIKa08jCNsOfdX79B/X8/xR41ooXETMS8f3B5rbgYrbll+9i/RVHz80HePfSjcI
	G3e3WmzXed+RcZuNd/t+ajSv8PiYpXaKKLjh0km80E9RWyss/5r/93617H9BwfoyY6sS
	2T5g==
X-Received: by 10.68.247.101 with SMTP id yd5mr2170718pbc.57.1370680407227;
	Sat, 08 Jun 2013 01:33:27 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (60-242-102-4.tpgi.com.au. [60.242.102.4])
	by mx.google.com with ESMTPSA id tb7sm2332749pbc.14.2013.06.08.01.33.22
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 08 Jun 2013 01:33:26 -0700 (PDT)
Message-ID: <51B2EC50.6040604@ozlabs.ru>
Date: Sat, 08 Jun 2013 18:33:20 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1370491146-10778-1-git-send-email-aik@ozlabs.ru>
	<1370491146-10778-3-git-send-email-aik@ozlabs.ru>
	<51B2DC25.2030506@msgid.tls.msk.ru>
In-Reply-To: <51B2DC25.2030506@msgid.tls.msk.ru>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQmZKSu8tmxOn55kAwq71JOz2QjmdMHCEmkUUfFYXt3XVvKZglHm9Qz1VKzP2luHLRrcEMDS
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22a
Cc: qemu-trivial@nongnu.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, Scott Wood <scottwood@freescale.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH 2/2] KVM: PPC: Add dummy
	kvm_arch_init_irq_routing()
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
X-List-Received-Date: Sat, 08 Jun 2013 08:33:31 -0000

On 06/08/2013 05:24 PM, Michael Tokarev wrote:
> 06.06.2013 07:59, Alexey Kardashevskiy wrote:
>> From: Scott Wood <scottwood@freescale.com>
>>
>> The common KVM code insists on calling kvm_arch_init_irq_routing()
>> as soon as it sees kernel header support for it (regardless of whether
>> QEMU supports it).  Provide a dummy function to satisfy this.
>>
>> Unlike x86, PPC does not have one default irqchip, so there's no common
>> code that we'd stick here.  Even if you ignore the routes themselves,
>> which even on x86 are not set up in this function, the initial XICS
>> kernel implementation will not support IRQ routing, so it's best to
>> leave even the general feature flags up to the specific irqchip code.
> 
> As Scott Wood already pointed out, this should come in before the
> actual header update, which is no problem.  We'll have to deal
> with a new warning (-Wmissing-prototypes) which can be dealt with
> by wrapping this function into #ifdef KVM_CAP_IRQ_ROUTING .. #endif
> (I can add this).

Ah. I'll repost it early next week.

> 
> But how about other architectures?  Before, this function were only
> defined for x86, now it is defined for two arches - x86 and ppc.
> Aren't other arches need this as well?

Good point, will check (and fix if needed). Thanks!


-- 
Alexey

