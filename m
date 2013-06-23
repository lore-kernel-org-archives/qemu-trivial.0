Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uqkwl-0004m5-Pi
	for mharc-qemu-trivial@gnu.org; Sun, 23 Jun 2013 10:07:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Uqkwi-0004fP-Ee
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 10:07:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Uqkwg-000396-45
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 10:07:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26092)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1UqkwV-000373-NO; Sun, 23 Jun 2013 10:06:59 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5NE6qaM029544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 23 Jun 2013 10:06:52 -0400
Received: from redhat.com (vpn1-5-5.ams2.redhat.com [10.36.5.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id r5NE6kNV031574; Sun, 23 Jun 2013 10:06:48 -0400
Date: Sun, 23 Jun 2013 17:07:36 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20130623140736.GB20842@redhat.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<874ncshh67.fsf@codemonkey.ws> <51C39578.6020204@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51C39578.6020204@ozlabs.ru>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
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
X-List-Received-Date: Sun, 23 Jun 2013 14:07:14 -0000

On Fri, Jun 21, 2013 at 09:51:20AM +1000, Alexey Kardashevskiy wrote:
> And kvm_irqchip_add_msi_route does not have any link to a device or a bus
> so I'll have to walk through all PHBs in system and see if PHB's MSI window
> is the one from MSIMessage and convert MSIMessage to virq. Pretty easy and
> quick but still dirty hack, would it be better?

Yes I think that's fine really.

Basically devices all speak MSIMessage as they should -
this is what the PCI spec says.        
On all normal systems guests also speak MSIMessage so
the API which uses these makes sense for kvm.
Except, ppc architecture in its wisdom decided to hide this
in firmware.  QEMU does not have firmware so the translation
has to be maintained in QEMU powerpc code.

-- 
MST

