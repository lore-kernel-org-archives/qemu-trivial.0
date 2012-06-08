Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Scw23-0000un-Ee
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2012 06:03:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1Scw1w-0000bw-GR
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2012 06:03:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1Scw1n-0007vy-1J
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2012 06:02:56 -0400
Received: from e06smtp16.uk.ibm.com ([195.75.94.112]:41325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1Scw1m-0007vW-P9
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2012 06:02:46 -0400
Received: from /spool/local
	by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanha@linux.vnet.ibm.com>;
	Fri, 8 Jun 2012 11:02:43 +0100
Received: from d06nrmr1806.portsmouth.uk.ibm.com (9.149.39.193)
	by e06smtp16.uk.ibm.com (192.168.101.146) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 8 Jun 2012 11:02:41 +0100
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1806.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q58A2f2m2031716; Fri, 8 Jun 2012 11:02:41 +0100
Received: from d06av03.portsmouth.uk.ibm.com (localhost.localdomain
	[127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q58A2Vb7029593; Fri, 8 Jun 2012 04:02:31 -0600
Received: from localhost (stefanha-thinkpad.manchester-maybrook.uk.ibm.com
	[9.174.219.145])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q58A2VQ4029567; Fri, 8 Jun 2012 04:02:31 -0600
Date: Fri, 8 Jun 2012 11:02:30 +0100
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: Harsh Prateek Bora <harsh@linux.vnet.ibm.com>
Message-ID: <20120608100230.GA26420@stefanha-thinkpad.localdomain>
References: <1339105843-30064-1-git-send-email-harsh@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1339105843-30064-1-git-send-email-harsh@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
x-cbid: 12060810-3548-0000-0000-00000229D1B3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 195.75.94.112
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	aneesh.kumar@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [PATCH 0/2] Configure and build fix for VirtFS
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
X-List-Received-Date: Fri, 08 Jun 2012 10:03:02 -0000

On Fri, Jun 08, 2012 at 03:20:41AM +0530, Harsh Prateek Bora wrote:
> Minor fixes:
> ============
> 
> 1) glib2 deprecated g_atomic_int_exchange_and_add in favour of g_atomic_int_add
>    since ver 2.30 and therefore build breaks with newer glib2 library.
> 2) Configure needs to report appropriate error on missing libraries for VirtFS.
> 
> Harsh Prateek Bora (2):
>   trace/simple.c: fix deprecated glib2 interface
>   configure: report appropriate error on missing library
> 
>  configure      |    3 ++-
>  trace/simple.c |    5 ++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> -- 
> 1.7.10.2
> 

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan


