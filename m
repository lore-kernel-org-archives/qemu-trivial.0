Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QnsuZ-00021u-Ba
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2011 09:52:03 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1QnsuT-0001eI-3t
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 09:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1QnsuO-0006XE-Vu
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 09:51:57 -0400
Received: from ozlabs.org ([203.10.76.45]:59314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1QnsuH-0006Vf-Cy; Mon, 01 Aug 2011 09:51:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id B3C8FB7091; Mon,  1 Aug 2011 23:51:43 +1000 (EST)
Date: Mon, 1 Aug 2011 23:32:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Isaku Yamahata <yamahata@valinux.co.jp>
Message-ID: <20110801133205.GC28437@yookeroo.fritz.box>
Mail-Followup-To: Isaku Yamahata <yamahata@valinux.co.jp>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mst@redhat.com
References: <1312181462-29889-1-git-send-email-david@gibson.dropbear.id.au>
	<20110801083106.GH31494@valinux.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110801083106.GH31494@valinux.co.jp>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Correctly assign PCI domain
	numbers
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
X-List-Received-Date: Mon, 01 Aug 2011 13:52:01 -0000

On Mon, Aug 01, 2011 at 05:31:06PM +0900, Isaku Yamahata wrote:
> [Added mst to Cc.]
> 
> In order to use multi PCI domain, several areas need to be addressed
> in addition to this patch. For example, bios, acpi dsdt.

For x86, yes.  For powerpc, which is what I'm working on, no.

> Do you have any plan for addressing those area?

No.  AFAICT this won't make anything less working than it is now, and
is sufficient to be useful for the pseries machine.

> What's your motivation for multi pci domain?

Multiple PCI host bridges is typical on IBM pSeries (powerpc)
machines.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

