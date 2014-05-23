Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wnw8f-0003pW-4C
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 16:32:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wnw8X-0003hR-Sj
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:32:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wnw8S-0006y0-Qm
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:32:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51162)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wnw8I-0006wa-En; Fri, 23 May 2014 16:32:02 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C100D42B94;
	Sat, 24 May 2014 00:32:01 +0400 (MSK)
Message-ID: <537FB041.1070400@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 00:32:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Jules Wang <junqing.wang@cs2c.com.cn>, qemu-devel@nongnu.org
References: <1400816645-16005-1-git-send-email-junqing.wang@cs2c.com.cn>
In-Reply-To: <1400816645-16005-1-git-send-email-junqing.wang@cs2c.com.cn>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] dma-helpers: avoid calling
 dma_bdrv_unmap() twice
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
X-List-Received-Date: Fri, 23 May 2014 20:32:23 -0000

23.05.2014 07:44, Jules Wang wrote:
> Calling dma_bdrv_unmap() twice is not necessary and may cause
> potential problems if some code changes.
> 
> Signed-off-by: Jules Wang <junqing.wang@cs2c.com.cn>
> ---
>  dma-helpers.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/dma-helpers.c b/dma-helpers.c
> index 5f421e9..53cbe92 100644
> --- a/dma-helpers.c
> +++ b/dma-helpers.c
> @@ -143,12 +143,12 @@ static void dma_bdrv_cb(void *opaque, int ret)
>  
>      dbs->acb = NULL;
>      dbs->sector_num += dbs->iov.size / 512;
> -    dma_bdrv_unmap(dbs);
>  
>      if (dbs->sg_cur_index == dbs->sg->nsg || ret < 0) {
>          dma_complete(dbs, ret);
>          return;
>      }
> +    dma_bdrv_unmap(dbs);
>  
>      while (dbs->sg_cur_index < dbs->sg->nsg) {
>          cur_addr = dbs->sg->sg[dbs->sg_cur_index].base + dbs->sg_cur_byte;

Applied to -trivial!

Maybe not-so-trivial, as I had to look at dma_complete() (who calls
dma_bdrv_unmap() ofcourse) to understand what's going on :)

Thank you!

/mjt

