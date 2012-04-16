Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SJiTg-0006De-NL
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2012 05:44:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1SJiTY-0006DH-L9
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 05:44:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1SJiTW-0002MD-PS
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 05:44:00 -0400
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:50150)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1SJiTW-0002Lt-HC
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 05:43:58 -0400
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanha@linux.vnet.ibm.com>;
	Mon, 16 Apr 2012 10:43:51 +0100
Received: from d06nrmr1407.portsmouth.uk.ibm.com (9.149.38.185)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 16 Apr 2012 10:43:39 +0100
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
	[9.149.37.250])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q3G9heHw2461774; Mon, 16 Apr 2012 10:43:41 +0100
Received: from d06av09.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q3G9hegS020067; Mon, 16 Apr 2012 03:43:40 -0600
Received: from localhost (dyn-9-174-219-44.manchester-maybrook.uk.ibm.com
	[9.174.219.44])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q3G9heRm020057; Mon, 16 Apr 2012 03:43:40 -0600
Date: Mon, 16 Apr 2012 10:43:40 +0100
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: Amos Kong <akong@redhat.com>
Message-ID: <20120416094340.GA5218@stefanha-thinkpad.localdomain>
References: <20120416073249.13295.65065.stgit@dhcp-8-167.nay.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120416073249.13295.65065.stgit@dhcp-8-167.nay.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
x-cbid: 12041609-8372-0000-0000-0000024713E0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 195.75.94.108
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] error.c: don't return value for void
	function
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
X-List-Received-Date: Mon, 16 Apr 2012 09:44:07 -0000

On Mon, Apr 16, 2012 at 03:32:49PM +0800, Amos Kong wrote:
> It is invalid to return a value from a function
> returning void.
> 
> Signed-off-by: Amos Kong <akong@redhat.com>
> ---
>  error.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan


