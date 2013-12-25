Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VvqAs-00082O-AQ
	for mharc-qemu-trivial@gnu.org; Wed, 25 Dec 2013 10:15:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1VvqAm-0007pr-2A
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 10:15:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1VvqAg-0001S5-VR
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 10:14:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:3578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1VvqAW-0001RE-UN; Wed, 25 Dec 2013 10:14:45 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBPFEhEo011440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 25 Dec 2013 10:14:43 -0500
Received: from redhat.com (vpn1-7-131.ams2.redhat.com [10.36.7.131])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id rBPFEeSn026063; Wed, 25 Dec 2013 10:14:41 -0500
Date: Wed, 25 Dec 2013 17:18:34 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20131225151834.GA20075@redhat.com>
References: <1387723882-30633-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1387723882-30633-1-git-send-email-sw@weilnetz.de>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] virtio: Fix return value for dummy
 function vhost_net_virtqueue_pending
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
X-List-Received-Date: Wed, 25 Dec 2013 15:15:05 -0000

On Sun, Dec 22, 2013 at 03:51:22PM +0100, Stefan Weil wrote:
> cgcc complains that -ENOSYS is not a good value for 'bool'.
> 
> A dummy virtio will never have pending queue entries, so let us return
> false.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Applied, thanks.

> ---
> 
> Could we also use g_assert_not_reached or hw_error in those dummy functions?
> 
> Regards
> Stefan

I'd go for g_assert_not_reached normally - it's an internal
bug if this is called since init stub fails.
Or leave it as is - it's an unusual configuration.

>  hw/net/vhost_net.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 006576d..854997d 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -321,7 +321,7 @@ void vhost_net_ack_features(struct vhost_net *net, unsigned features)
>  
>  bool vhost_net_virtqueue_pending(VHostNetState *net, int idx)
>  {
> -    return -ENOSYS;
> +    return false;
>  }
>  
>  void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
> -- 
> 1.7.10.4

