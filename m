Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwIg2-0000sa-8B
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 22:36:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gwIg0-0000qj-27
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 22:36:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gwIfz-0006SJ-44
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 22:36:04 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1gwIfy-0006M0-PG
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 22:36:02 -0500
Received: by mail-qk1-f194.google.com with SMTP id u188so1082379qkh.8
	for <qemu-trivial@nongnu.org>; Tue, 19 Feb 2019 19:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=KOE0QBL6au/XLMG31a3tRGlWyOVTr7SQL0WmdOaBusc=;
	b=uFfiJQo+I3/hMJ100hYni+tr91i3p4iNAKAKUO48LPhcKXXxwY2g6kLww7pt/aYGtK
	R6mSzFtkNg77wUIJac5/Y0F6Hp6dBCtHofhgqCJ9UkRurVPC9BzoI1B7bfoI4KI412lD
	hJbjiARG+oRHVTGBXSL3AqmR3nQh3UkSMMW+UmoJ6m9LU7j2AHosDMi677LUf5AdgoL7
	wnB6gU7vlvhA33qOJPyyZG3t6jFK1HPEUs1g/pEnMr6yIWRNK+sduB7jjpOJi5hESExv
	iflvCNTCq9ATU6reg83FppKYhGXywAmF0byjQBv10NfK/YhAoMPiIgAGO2oX+MGB0py4
	vchg==
X-Gm-Message-State: AHQUAuYQewlQVXYsVPbyN1vSBhkkcKOaMGVgDF6Z5PgPTDglcfdUQwAw
	bGomgb6G/lQrJJF/K7YBtsU1Bw==
X-Google-Smtp-Source: AHgI3Ib21fo6h3d7UdPMr93FC08uiADDyvUc8jmDaEzkJiOIBF4P/dFCO8oETT1LzihiZXt+IzaeQg==
X-Received: by 2002:a05:620a:12a5:: with SMTP id
	x5mr23485649qki.291.1550633748564; 
	Tue, 19 Feb 2019 19:35:48 -0800 (PST)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net.
	[173.76.246.42]) by smtp.gmail.com with ESMTPSA id
	d63sm14804836qka.22.2019.02.19.19.35.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 19:35:47 -0800 (PST)
Date: Tue, 19 Feb 2019 22:35:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	yang zhong <yang.zhong@intel.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20190219222058-mutt-send-email-mst@kernel.org>
References: <1550592459-7286-1-git-send-email-thuth@redhat.com>
	<a7eb2932-c72d-f9cf-c3c4-010f967ca743@redhat.com>
	<20190219152040-mutt-send-email-mst@kernel.org>
	<1590333482.2281318.1550618370282.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590333482.2281318.1550618370282.JavaMail.zimbra@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.194
Subject: Re: [Qemu-trivial] [PATCH] hw/pci/pci-stub: Add msi_enabled() and
 msi_notify() to the pci stubs
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2019 03:36:05 -0000

On Tue, Feb 19, 2019 at 06:19:30PM -0500, Paolo Bonzini wrote:
> 
> > > Makes sense, but it is also abstraction time. :)  What if instead there
> > > was a function
> > > 
> > > void msi_allocate_irqs(PCIDevice *pdev, int num, bool fallback_to_intx);
> > > 
> > > and then ich.c did
> > > 
> > >     irqs = msi_allocate_irqs(pdev, 1, true);
> > >     s->irq = irqs[0];
> > >     g_free(irqs);
> > > 
> > > ?  "if msi_enabled raise MSI else raise INTX" is really a common idiom.
> > > 
> > > Thanks,
> > > 
> > > Paolo
> > 
> > Maybe it is but the specific issue is not about fallback to INTX of PCI
> > (is the fallback broken for ahci? I don't know).
> 
> It works, the above is just a new abstraction.
> 
> > The trick is there's no pdev at all.
> 
> The trick :) is that in ich.c there is a pdev.  Right now we are assigning to
> s->irq either the INTX irq (if PCI) or a sysbus irq (if sysbus), but then
> we need to know about MSI with a wrapper around s->irq.

Oh you mean just for PCI.

> Instead, my suggestion is to put the wrapper in the PCI core as a qemu_irq
> callback---or perhaps in ich.c, but anyway ahci.c should not care that there
> could be a PCI AHCI device and it would have two different interrupt modes.

I like it very much that devices call pci_set_irq, I'd rather not
have callbacks.


I think the wrapper thay calls either pci_set_irq isn't a problem,
problem is MSI/X has multiple vectors, INTX doesn't.
So for many devices there's something extra that happens
just in one mode but not the other to deal with multiple vectors.

So I don't think it can be an abstraction that everyone
uses. But yes it can be a helper function.

In fact mptsas_update_interrupt seems not to be
PCI spec compliant: it sets both MSI and INTX.

CC original contributor with this question.



> In fact, doing this would also remove the need for s->container, I think.
> 
> Paolo

