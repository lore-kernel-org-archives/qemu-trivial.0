Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7hDX-0002y9-Ml
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 05:43:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Z7hDV-0002vc-7m
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 05:43:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Z7hDU-0005sf-CD
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 05:43:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1Z7hDM-0005rF-AP; Wed, 24 Jun 2015 05:43:28 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 29029B8BC4;
	Wed, 24 Jun 2015 09:43:27 +0000 (UTC)
Received: from localhost (dhcp-14-104.nay.redhat.com [10.66.14.104])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5O9hPXs004367; Wed, 24 Jun 2015 05:43:25 -0400
Date: Wed, 24 Jun 2015 17:43:24 +0800
From: Fam Zheng <famz@redhat.com>
To: arei.gonglei@huawei.com
Message-ID: <20150624094324.GD22582@ad.nay.redhat.com>
References: <1435138164-11728-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435138164-11728-1-git-send-email-arei.gonglei@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com, qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virito-blk: drop duplicate
	check
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
X-List-Received-Date: Wed, 24 Jun 2015 09:43:38 -0000

On Wed, 06/24 17:29, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> in_num = req->elem.in_num, and req->elem.in_num is
> checked in line 489, so the check about in_num variable
> is superflous, let's drop it.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>

Reviewed-by: Fam Zheng <famz@redhat.com>

> ---
>  hw/block/virtio-blk.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index cd539aa..cce552a 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -499,8 +499,7 @@ void virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
>  
>      iov_discard_front(&iov, &out_num, sizeof(req->out));
>  
> -    if (in_num < 1 ||
> -        in_iov[in_num - 1].iov_len < sizeof(struct virtio_blk_inhdr)) {
> +    if (in_iov[in_num - 1].iov_len < sizeof(struct virtio_blk_inhdr)) {
>          error_report("virtio-blk request inhdr too short");
>          exit(1);
>      }
> -- 
> 1.7.12.4
> 
> 
> 

