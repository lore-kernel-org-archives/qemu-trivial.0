Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1clCLu-0006Sx-Lc
	for mharc-qemu-trivial@gnu.org; Tue, 07 Mar 2017 05:28:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1clCLs-0006Rg-8s
	for qemu-trivial@nongnu.org; Tue, 07 Mar 2017 05:28:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1clCLr-0003uE-F2
	for qemu-trivial@nongnu.org; Tue, 07 Mar 2017 05:28:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37232)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1clCLl-0003qp-3L; Tue, 07 Mar 2017 05:28:13 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4B455455D;
	Tue,  7 Mar 2017 10:28:12 +0000 (UTC)
Received: from localhost (ovpn-8-32.pek2.redhat.com [10.72.8.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v27ASBRO031583; Tue, 7 Mar 2017 05:28:12 -0500
Date: Tue, 7 Mar 2017 18:28:09 +0800
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20170307102809.GA6623@lemon.lan>
References: <20170207132723.13934-1-famz@redhat.com>
	<20170207132723.13934-2-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170207132723.13934-2-famz@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 07 Mar 2017 10:28:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] virtio-blk: Remove
 useless condition around g_free()
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
X-List-Received-Date: Tue, 07 Mar 2017 10:28:21 -0000

On Tue, 02/07 21:27, Fam Zheng wrote:
> Laszlo spotted and studied this wasteful "if". He pointed out:
> 
> The original virtio_blk_free_request needed an "if" as it accesses one
> field, since 671ec3f05655 ("virtio-blk: Convert VirtIOBlockReq.elem to
> pointer", 2014-06-11); later on in f897bf751fbd ("virtio-blk: embed
> VirtQueueElement in VirtIOBlockReq", 2014-07-09) the field became
> embedded, so the "if" became unnecessary (at which point we were using
> g_slice_free(), but it is the same.
> 
> Now drop it.
> 
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  hw/block/virtio-blk.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 702eda8..2858c31 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -42,9 +42,7 @@ static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
>  
>  static void virtio_blk_free_request(VirtIOBlockReq *req)
>  {
> -    if (req) {
> -        g_free(req);
> -    }
> +    g_free(req);
>  }
>  
>  static void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
> -- 
> 2.9.3
> 
> 

Cc: qemu-trivial@nongnu.org

(Let's drop 2/2 and perhaps merge this via trivial)

Fam

