Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROSsG-00073d-V6
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2011 06:32:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ROSsA-0006k1-Kh
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 06:32:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ROSs6-0003EC-NU
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 06:32:46 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:60890)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ROSrv-0003Bw-Nb; Thu, 10 Nov 2011 06:32:32 -0500
Received: by faap15 with SMTP id p15so3321474faa.4
	for <multiple recipients>; Thu, 10 Nov 2011 03:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nYC234sdnE0Luc02H1isfTFRy5JuTaAmRlNjcucpoBY=;
	b=Xae9wa4zA9CBI/vz0Pcv5cEEJe+HXtKw0vTH30PVRp9fpfFZEt+HFBLmvw1nomgz6t
	tLBOWTkvJIRlW+D/2K7h3htG1sykrB1CHohrv6rxmFU9+HcZWhyWcfk+JGK4wx9yGeWP
	I10csQGMaMDpcQf/89M8Wr2nT0UyGRxCYr6AA=
Received: by 10.223.61.131 with SMTP id t3mr11562380fah.26.1320924750608;
	Thu, 10 Nov 2011 03:32:30 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id k13sm1386001fah.0.2011.11.10.03.32.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 03:32:29 -0800 (PST)
Date: Thu, 10 Nov 2011 11:32:28 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
Message-ID: <20111110113228.GA12527@stefanha-thinkpad.localdomain>
References: <1320913402-8762-1-git-send-email-wdongxu@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320913402-8762-1-git-send-email-wdongxu@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] block:add coroutine_fn marker to
 coroutine functions
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
X-List-Received-Date: Thu, 10 Nov 2011 11:32:51 -0000

On Thu, Nov 10, 2011 at 04:23:22PM +0800, Dong Xu Wang wrote:
> From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> 
> Looks better when reviewing these source files.
> 
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> ---
>  block/qcow.c     |    4 ++--
>  block/qcow2.c    |    6 +++---
>  block/sheepdog.c |    4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>

Looks fine but please send all block patches through Kevin, who actively
maintains the block layer.

Stefan

