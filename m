Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wpz0I-0005NP-OL
	for mharc-qemu-trivial@gnu.org; Thu, 29 May 2014 08:00:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Wpz0C-0005Cg-Og
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 08:00:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Wpz07-0003s9-SF
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 08:00:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1Wpyzt-0003fa-ES; Thu, 29 May 2014 07:59:49 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4TBxhtd023539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 29 May 2014 07:59:44 -0400
Received: from redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s4TBxfYt016837; Thu, 29 May 2014 07:59:42 -0400
Date: Thu, 29 May 2014 15:00:11 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140529120011.GF30210@redhat.com>
References: <1401361309-25921-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401361309-25921-1-git-send-email-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/i386/pc.c: Remove unused parallel_io
 and parallel_irq variables
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
X-List-Received-Date: Thu, 29 May 2014 12:00:13 -0000

On Thu, May 29, 2014 at 12:01:49PM +0100, Peter Maydell wrote:
> The variables parallel_io and parallel_irq are unused; delete them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Thanks, applied.


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/i386/pc.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index e6369d5..32d1632 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -922,9 +922,6 @@ static const int ne2000_io[NE2000_NB_MAX] = { 0x300, 0x320, 0x340, 0x360,
>                                                0x280, 0x380 };
>  static const int ne2000_irq[NE2000_NB_MAX] = { 9, 10, 11, 3, 4, 5 };
>  
> -static const int parallel_io[MAX_PARALLEL_PORTS] = { 0x378, 0x278, 0x3bc };
> -static const int parallel_irq[MAX_PARALLEL_PORTS] = { 7, 7, 7 };
> -
>  void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
>  {
>      static int nb_ne2k = 0;
> -- 
> 1.9.2

