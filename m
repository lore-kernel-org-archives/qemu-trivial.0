Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fkAKw-0003Pk-Pi
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jul 2018 11:43:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>) id 1fkAKr-0003Nh-BG
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2018 11:43:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>) id 1fkAKq-0007uz-Du
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2018 11:43:49 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:46189)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>)
	id 1fkAKi-0007nn-F1; Mon, 30 Jul 2018 11:43:41 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.15]) by
	rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id
	2eec5b5f32169cb-8e9e0; Mon, 30 Jul 2018 23:43:21 +0800 (CST)
X-RM-TRANSID: 2eec5b5f32169cb-8e9e0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost (unknown[112.25.65.41])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id
	2ee85b5f3218021-215ba; Mon, 30 Jul 2018 23:43:21 +0800 (CST)
X-RM-TRANSID: 2ee85b5f3218021-215ba
Date: Mon, 30 Jul 2018 23:43:23 +0800
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: stefanha@redhat.com, mst@redhat.com, kwolf@redhat.com,
	mreitz@redhat.com, mjt@tls.msk.ru, laurent@vivier.eu
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20180730154323.GA6933@byw>
Reply-To: baiyaowei@cmss.chinamobile.com
References: <1532755124-23795-1-git-send-email-baiyaowei@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532755124-23795-1-git-send-email-baiyaowei@cmss.chinamobile.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.81
Subject: Re: [Qemu-trivial] [PATCH] virtio-blk: fix comment for
 virtio_blk_rw_complete
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
X-List-Received-Date: Mon, 30 Jul 2018 15:43:53 -0000

Oh, sorry, this patch should go into trivial mail list.

On Sat, Jul 28, 2018 at 01:18:44PM +0800, Yaowei Bai wrote:
> Here should be submit_requests, there is no submit_merged_requests
> function.
> 
> Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
> ---
>  hw/block/virtio-blk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 50b5c86..91cbede 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -97,8 +97,8 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
>  
>          if (req->qiov.nalloc != -1) {
>              /* If nalloc is != 1 req->qiov is a local copy of the original
> -             * external iovec. It was allocated in submit_merged_requests
> -             * to be able to merge requests. */
> +             * external iovec. It was allocated in submit_requests to be
> +             * able to merge requests. */
>              qemu_iovec_destroy(&req->qiov);
>          }
>  
> -- 
> 1.8.3.1
> 



