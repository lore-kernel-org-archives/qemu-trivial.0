Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UlDVn-0006OD-Gr
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jun 2013 03:24:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UlDVk-0006If-2j
	for qemu-trivial@nongnu.org; Sat, 08 Jun 2013 03:24:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UlDVj-0006UB-9S
	for qemu-trivial@nongnu.org; Sat, 08 Jun 2013 03:24:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38093)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UlDVf-0006SC-9C; Sat, 08 Jun 2013 03:24:23 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7142940CF3;
	Sat,  8 Jun 2013 11:24:21 +0400 (MSK)
Message-ID: <51B2DC25.2030506@msgid.tls.msk.ru>
Date: Sat, 08 Jun 2013 11:24:21 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1370491146-10778-1-git-send-email-aik@ozlabs.ru>
	<1370491146-10778-3-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1370491146-10778-3-git-send-email-aik@ozlabs.ru>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Sat, 08 Jun 2013 07:24:29 -0000

06.06.2013 07:59, Alexey Kardashevskiy wrote:
> From: Scott Wood <scottwood@freescale.com>
> 
> The common KVM code insists on calling kvm_arch_init_irq_routing()
> as soon as it sees kernel header support for it (regardless of whether
> QEMU supports it).  Provide a dummy function to satisfy this.
> 
> Unlike x86, PPC does not have one default irqchip, so there's no common
> code that we'd stick here.  Even if you ignore the routes themselves,
> which even on x86 are not set up in this function, the initial XICS
> kernel implementation will not support IRQ routing, so it's best to
> leave even the general feature flags up to the specific irqchip code.

As Scott Wood already pointed out, this should come in before the
actual header update, which is no problem.  We'll have to deal
with a new warning (-Wmissing-prototypes) which can be dealt with
by wrapping this function into #ifdef KVM_CAP_IRQ_ROUTING .. #endif
(I can add this).

But how about other architectures?  Before, this function were only
defined for x86, now it is defined for two arches - x86 and ppc.
Aren't other arches need this as well?

Thanks,

/mjt


