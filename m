Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QnsuS-0001ae-8g
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2011 09:51:56 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1QnsuP-0001Q4-ER
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 09:51:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1QnsuO-0006X8-75
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 09:51:53 -0400
Received: from ozlabs.org ([203.10.76.45]:50170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1QnsuH-0006Vi-Cv; Mon, 01 Aug 2011 09:51:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id B620AB7090; Mon,  1 Aug 2011 23:51:43 +1000 (EST)
Date: Mon, 1 Aug 2011 23:33:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20110801133337.GD28437@yookeroo.fritz.box>
Mail-Followup-To: "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1312181462-29889-1-git-send-email-david@gibson.dropbear.id.au>
	<20110801101038.GE5439@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110801101038.GE5439@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Correctly assign PCI domain numbers
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
X-List-Received-Date: Mon, 01 Aug 2011 13:51:54 -0000

On Mon, Aug 01, 2011 at 01:10:38PM +0300, Michael S. Tsirkin wrote:
> On Mon, Aug 01, 2011 at 04:51:02PM +1000, David Gibson wrote:
> > qemu already almost supports PCI domains; that is, several entirely
> > independent PCI host bridges on the same machine.  However, a bug in
> > pci_bus_new_inplace() means that every host bridge gets assigned domain
> > number zero and so can't be properly distinguished.  This patch fixes the
> > bug, giving each new host bridge a new domain number.
> > 
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> 
> OK, but I'd like to see the whole picture.
> How does the guest detect multiple domains,
> and how does it access them?

For the pseries machine, which is what I'm concerned with, each host
bridge is advertised through the device tree passed to the guest.
That gives the necessary handles and addresses for accesing config
space and memory and IO windows for each host bridge.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

