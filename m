Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uqrxt-0007jn-0y
	for mharc-qemu-trivial@gnu.org; Sun, 23 Jun 2013 17:36:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benh@kernel.crashing.org>) id 1Uqrxp-0007j8-39
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 17:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benh@kernel.crashing.org>) id 1Uqrxn-0004Zo-AJ
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 17:36:49 -0400
Received: from gate.crashing.org ([63.228.1.57]:58756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benh@kernel.crashing.org>)
	id 1Uqrxn-0004Za-1H; Sun, 23 Jun 2013 17:36:47 -0400
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id r5NLaT8e014256;
	Sun, 23 Jun 2013 16:36:30 -0500
Message-ID: <1372023385.3944.108.camel@pasglop>
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Mon, 24 Jun 2013 07:36:25 +1000
In-Reply-To: <20130623140736.GB20842@redhat.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<874ncshh67.fsf@codemonkey.ws> <51C39578.6020204@ozlabs.ru>
	<20130623140736.GB20842@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 63.228.1.57
Cc: Anthony Liguori <aliguori@us.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
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
X-List-Received-Date: Sun, 23 Jun 2013 21:36:51 -0000

On Sun, 2013-06-23 at 17:07 +0300, Michael S. Tsirkin wrote:
> Yes I think that's fine really.
> 
> Basically devices all speak MSIMessage as they should -
> this is what the PCI spec says.        
> On all normal systems guests also speak MSIMessage so
> the API which uses these makes sense for kvm.
> Except, ppc architecture in its wisdom decided to hide this
> in firmware.  QEMU does not have firmware so the translation
> has to be maintained in QEMU powerpc code.

It is still not enough. There is nothing that says that an MSI
address/message is unique. On pseries (among others I'm sure), this is a
per-host-bridge concept since the MSIs are decoded by the PHB and turned
into standard fabric interrupts there.

So at least the bus needs to be passed as well.

Cheers,
Ben.


