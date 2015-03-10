Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVEPB-0002x5-AD
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 03:16:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YVEP8-0002tW-IQ
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:16:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YVEP3-0001pQ-Jd
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:16:38 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:16096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YVEP2-0001oS-Cx; Tue, 10 Mar 2015 03:16:33 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIH33260; Tue, 10 Mar 2015 15:16:25 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 10 Mar 2015 15:15:57 +0800
Message-ID: <54FE9A16.7000108@huawei.com>
Date: Tue, 10 Mar 2015 15:15:34 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1425966860-13605-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1425966860-13605-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] 9pfs-proxy: tiny cleanups
 in proxy_pwritev and proxy_preadv
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
X-List-Received-Date: Tue, 10 Mar 2015 07:16:39 -0000

On 2015/3/10 13:54, Michael Tokarev wrote:
> Don't compare syscall return with -1, use "<0" condition.
> Don't introduce useless local variables when we already
> have similar variable
> Rename local variable to be consistent with other usages
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/9pfs/virtio-9p-proxy.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
> index 59c7445..a01804a 100644
> --- a/hw/9pfs/virtio-9p-proxy.c
> +++ b/hw/9pfs/virtio-9p-proxy.c
> @@ -696,9 +696,9 @@ static ssize_t proxy_preadv(FsContext *ctx, V9fsFidOpenState *fs,
>  #ifdef CONFIG_PREADV
>      return preadv(fs->fd, iov, iovcnt, offset);
>  #else
> -    int err = lseek(fs->fd, offset, SEEK_SET);
> -    if (err == -1) {
> -        return err;
> +    int ret = lseek(fs->fd, offset, SEEK_SET);
> +    if (err < 0)
> +        return ret;

The above code fragment is confused.

Regards,
-Gonglei
>      } else {
>          return readv(fs->fd, iov, iovcnt);
>      }
> @@ -714,10 +714,8 @@ static ssize_t proxy_pwritev(FsContext *ctx, V9fsFidOpenState *fs,
>  #ifdef CONFIG_PREADV
>      ret = pwritev(fs->fd, iov, iovcnt, offset);
>  #else
> -    int err = lseek(fs->fd, offset, SEEK_SET);
> -    if (err == -1) {
> -        return err;
> -    } else {
> +    ret = lseek(fs->fd, offset, SEEK_SET);
> +    if (ret >= 0) {
>          ret = writev(fs->fd, iov, iovcnt);
>      }
>  #endif
> 



