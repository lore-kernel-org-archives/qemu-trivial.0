Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SLCYD-00080Q-3T
	for mharc-qemu-trivial@gnu.org; Fri, 20 Apr 2012 08:02:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1SLCY4-0007vk-NP
	for qemu-trivial@nongnu.org; Fri, 20 Apr 2012 08:02:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1SLCXz-0000O4-U8
	for qemu-trivial@nongnu.org; Fri, 20 Apr 2012 08:02:48 -0400
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:42761)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1SLCXz-0000Gl-MB
	for qemu-trivial@nongnu.org; Fri, 20 Apr 2012 08:02:43 -0400
Received: from /spool/local
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanha@linux.vnet.ibm.com>;
	Fri, 20 Apr 2012 13:02:32 +0100
Received: from d06nrmr1806.portsmouth.uk.ibm.com (9.149.39.193)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 20 Apr 2012 13:02:29 +0100
Received: from d06av10.portsmouth.uk.ibm.com (d06av10.portsmouth.uk.ibm.com
	[9.149.37.251])
	by d06nrmr1806.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q3KC2Sa92441218; Fri, 20 Apr 2012 13:02:28 +0100
Received: from d06av10.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q3KC0dnE022366; Fri, 20 Apr 2012 08:00:39 -0400
Received: from localhost (dyn-9-174-218-67.manchester-maybrook.uk.ibm.com
	[9.174.218.67])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q3KC0cM2022353; Fri, 20 Apr 2012 08:00:38 -0400
Date: Fri, 20 Apr 2012 13:02:27 +0100
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20120420120227.GA12878@stefanha-thinkpad.localdomain>
References: <1334682459-27835-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<20120419154916.GD10190@illuin>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20120419154916.GD10190@illuin>
User-Agent: Mutt/1.5.21 (2010-09-15)
x-cbid: 12042012-5024-0000-0000-000002514D56
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 195.75.94.107
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, afaerber@suse.de,
	lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] qemu-ga: generate missing stubs for
	fsfreeze
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
X-List-Received-Date: Fri, 20 Apr 2012 12:02:54 -0000

On Thu, Apr 19, 2012 at 10:49:16AM -0500, Michael Roth wrote:
> On Tue, Apr 17, 2012 at 12:07:38PM -0500, Michael Roth wrote:
> > When linux-specific commands (including guest-fsfreeze-*) were consolidated
> > under defined(__linux__), we forgot to account for the case where
> > defined(__linux__) && !defined(FIFREEZE). As a result stubs are no longer
> > being generated on linux hosts that don't have FIFREEZE support. Fix
> > this.
> > 
> > Tested-by: Andreas Färber <afaerber@suse.de>
> > Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> 
> Hi Stefan,
> 
> Please ignore these for trivial, gonna submit a qemu-ga pull for these since
> a build fix is involved.

Sure.

Stefan


