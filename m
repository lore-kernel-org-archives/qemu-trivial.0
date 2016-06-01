Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b84ti-0000yY-74
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jun 2016 08:05:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1b82X7-0000Pw-Nt
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 05:33:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1b82X5-0004Dg-M8
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 05:33:48 -0400
Received: from mail.kernel.org ([198.145.29.136]:42127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>)
	id 1b82Wz-0004CS-W6; Wed, 01 Jun 2016 05:33:42 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id F24B520389;
	Wed,  1 Jun 2016 09:33:39 +0000 (UTC)
Received: from [10.0.0.5] (23.105.115.87.dyn.plus.net [87.115.105.23])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4530A20381;
	Wed,  1 Jun 2016 09:33:38 +0000 (UTC)
Date: Wed, 1 Jun 2016 10:33:33 +0100 (BST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Laurent Vivier <lvivier@redhat.com>
cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, 
	Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <1464712565-14857-8-git-send-email-lvivier@redhat.com>
Message-ID: <alpine.DEB.2.10.1606011033110.3896@sstabellini-ThinkPad-X260>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
	<1464712565-14857-8-git-send-email-lvivier@redhat.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.136
X-Mailman-Approved-At: Wed, 01 Jun 2016 08:05:16 -0400
Subject: Re: [Qemu-trivial] [PATCH 07/16] xen: Use DIV_ROUND_UP
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2016 09:33:50 -0000

On Tue, 31 May 2016, Laurent Vivier wrote:
> Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).
> 
> This patch is the result of coccinelle script
> scripts/coccinelle/round.cocci
> 
> CC: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  hw/display/xenfb.c | 4 ++--
>  xen-hvm.c          | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
> index 9866dfd..570b097 100644
> --- a/hw/display/xenfb.c
> +++ b/hw/display/xenfb.c
> @@ -472,9 +472,9 @@ static int xenfb_map_fb(struct XenFB *xenfb)
>          xenfb->pixels = NULL;
>      }
>  
> -    xenfb->fbpages = (xenfb->fb_len + (XC_PAGE_SIZE - 1)) / XC_PAGE_SIZE;
> +    xenfb->fbpages = DIV_ROUND_UP(xenfb->fb_len, XC_PAGE_SIZE);
>      n_fbdirs = xenfb->fbpages * mode / 8;
> -    n_fbdirs = (n_fbdirs + (XC_PAGE_SIZE - 1)) / XC_PAGE_SIZE;
> +    n_fbdirs = DIV_ROUND_UP(n_fbdirs, XC_PAGE_SIZE);
>  
>      pgmfns = g_malloc0(sizeof(xen_pfn_t) * n_fbdirs);
>      fbmfns = g_malloc0(sizeof(xen_pfn_t) * xenfb->fbpages);
> diff --git a/xen-hvm.c b/xen-hvm.c
> index 01ee25d..a0da8d7 100644
> --- a/xen-hvm.c
> +++ b/xen-hvm.c
> @@ -567,7 +567,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
>  {
>      hwaddr npages = size >> TARGET_PAGE_BITS;
>      const int width = sizeof(unsigned long) * 8;
> -    unsigned long bitmap[(npages + width - 1) / width];
> +    unsigned long bitmap[DIV_ROUND_UP(npages, width)];
>      int rc, i, j;
>      const XenPhysmap *physmap = NULL;
>  
> -- 
> 2.5.5
> 

