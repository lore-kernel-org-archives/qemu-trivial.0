Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur5az-0000ey-4J
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 08:10:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Ur5au-0000Vm-Uk
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:10:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Ur5ar-0003qd-Qs
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 08:10:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1Ur5af-0003fn-Je; Mon, 24 Jun 2013 08:09:49 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5OC9aOG021384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 08:09:36 -0400
Received: from redhat.com (vpn1-5-150.ams2.redhat.com [10.36.5.150])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id r5OC9USO004612; Mon, 24 Jun 2013 08:09:31 -0400
Date: Mon, 24 Jun 2013 15:10:20 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-ID: <20130624121020.GA32114@redhat.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<874ncshh67.fsf@codemonkey.ws> <51C39578.6020204@ozlabs.ru>
	<20130623140736.GB20842@redhat.com>
	<1372023385.3944.108.camel@pasglop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1372023385.3944.108.camel@pasglop>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 24 Jun 2013 12:10:08 -0000

On Mon, Jun 24, 2013 at 07:36:25AM +1000, Benjamin Herrenschmidt wrote:
> On Sun, 2013-06-23 at 17:07 +0300, Michael S. Tsirkin wrote:
> > Yes I think that's fine really.
> > 
> > Basically devices all speak MSIMessage as they should -
> > this is what the PCI spec says.        
> > On all normal systems guests also speak MSIMessage so
> > the API which uses these makes sense for kvm.
> > Except, ppc architecture in its wisdom decided to hide this
> > in firmware.  QEMU does not have firmware so the translation
> > has to be maintained in QEMU powerpc code.
> 
> It is still not enough. There is nothing that says that an MSI
> address/message is unique. On pseries (among others I'm sure), this is a
> per-host-bridge concept since the MSIs are decoded by the PHB and turned
> into standard fabric interrupts there.
> 
> So at least the bus needs to be passed as well.
> 
> Cheers,
> Ben.

If passing bus (or dma context, etc)
turns out to actually be helpful, why not.

-- 
MST

