Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwEg3-0004X3-TQ
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 18:19:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gwEg2-0004WA-6q
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 18:19:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gwEft-0002p3-IZ
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 18:19:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54426)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1gwEfl-0002mY-3M; Tue, 19 Feb 2019 18:19:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2127C821C3;
	Tue, 19 Feb 2019 23:19:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D979C5D6AA;
	Tue, 19 Feb 2019 23:19:30 +0000 (UTC)
Received: from zmail18.collab.prod.int.phx2.redhat.com
	(zmail18.collab.prod.int.phx2.redhat.com [10.5.83.21])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C0B5181A000;
	Tue, 19 Feb 2019 23:19:30 +0000 (UTC)
Date: Tue, 19 Feb 2019 18:19:30 -0500 (EST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org, yang zhong <yang.zhong@intel.com>
Message-ID: <1590333482.2281318.1550618370282.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190219152040-mutt-send-email-mst@kernel.org>
References: <1550592459-7286-1-git-send-email-thuth@redhat.com>
	<a7eb2932-c72d-f9cf-c3c4-010f967ca743@redhat.com>
	<20190219152040-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [93.56.166.5, 10.4.196.6, 10.5.101.130, 10.4.195.6]
Thread-Topic: hw/pci/pci-stub: Add msi_enabled() and msi_notify() to the pci
	stubs
Thread-Index: ElSzIYlDwW1SDslcZRNJBK2K9PWgqA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 19 Feb 2019 23:19:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 19 Feb 2019 23:19:51 -0000


> > Makes sense, but it is also abstraction time. :)  What if instead there
> > was a function
> > 
> > void msi_allocate_irqs(PCIDevice *pdev, int num, bool fallback_to_intx);
> > 
> > and then ich.c did
> > 
> >     irqs = msi_allocate_irqs(pdev, 1, true);
> >     s->irq = irqs[0];
> >     g_free(irqs);
> > 
> > ?  "if msi_enabled raise MSI else raise INTX" is really a common idiom.
> > 
> > Thanks,
> > 
> > Paolo
> 
> Maybe it is but the specific issue is not about fallback to INTX of PCI
> (is the fallback broken for ahci? I don't know).

It works, the above is just a new abstraction.

> The trick is there's no pdev at all.

The trick :) is that in ich.c there is a pdev.  Right now we are assigning to
s->irq either the INTX irq (if PCI) or a sysbus irq (if sysbus), but then
we need to know about MSI with a wrapper around s->irq.

Instead, my suggestion is to put the wrapper in the PCI core as a qemu_irq
callback---or perhaps in ich.c, but anyway ahci.c should not care that there
could be a PCI AHCI device and it would have two different interrupt modes.
In fact, doing this would also remove the need for s->container, I think.

Paolo

