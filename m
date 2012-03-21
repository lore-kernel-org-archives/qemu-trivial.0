Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SALXQ-0003NY-3x
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 09:25:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1SALXI-0002yL-EG
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 09:25:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1SALXC-0002eO-BF
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 09:25:08 -0400
Received: from ozlabs.org ([203.10.76.45]:44470)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1SALX1-0002ZY-QN; Wed, 21 Mar 2012 09:24:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 0E770B6F98; Thu, 22 Mar 2012 00:24:47 +1100 (EST)
Date: Thu, 22 Mar 2012 00:24:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20120321132442.GF15997@truffala.fritz.box>
Mail-Followup-To: Stefan Hajnoczi <stefanha@gmail.com>,
	anthony@codemonkey.ws, qemu-trivial@nongnu.org,
	Rusty Russell <rusty@rustcorp.com.au>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <1332133163-7890-1-git-send-email-david@gibson.dropbear.id.au>
	<20120319113310.GD30033@stefanha-thinkpad.localdomain>
	<20120320004206.GB22089@truffala.fritz.box>
	<CAJSP0QU4azkZic4GM++uXtj91b_vdXT=TETXTr1AD0qXxii28A@mail.gmail.com>
	<20120320101947.GA19542@truffala.fritz.box>
	<20120321112615.GA15090@stefanha-thinkpad.localdomain>
	<CAJSP0QW6VkyRvB0e7UGXmUC=qMgunib10Y4EApisFd5cpS-5pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QW6VkyRvB0e7UGXmUC=qMgunib10Y4EApisFd5cpS-5pA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org, Rusty Russell <rusty@rustcorp.com.au>,
	qemu-devel@nongnu.org, anthony@codemonkey.ws,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove PCI class code from
 virtio balloon device
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
X-List-Received-Date: Wed, 21 Mar 2012 13:25:14 -0000

On Wed, Mar 21, 2012 at 11:28:47AM +0000, Stefan Hajnoczi wrote:
> Hi,
> It seems your Mail-Followup-To: header causes my client to drop you
> from the To: list.

Not mine, it's added by the list AFAICT.  And it's frickin' annoying.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

