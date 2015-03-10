Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVNsu-00005z-Gt
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 13:24:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YVNss-00005Z-Gt
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 13:23:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YVNsp-0001ey-B8
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 13:23:58 -0400
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:49208)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YVNso-0001e7-MY
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 13:23:55 -0400
Received: from /spool/local
	by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Tue, 10 Mar 2015 22:53:50 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
	by e28smtp01.in.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 10 Mar 2015 22:53:48 +0530
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id BD36B1258044;
	Tue, 10 Mar 2015 22:55:14 +0530 (IST)
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t2AHNlPg50462812; Tue, 10 Mar 2015 22:53:47 +0530
Received: from d28av01.in.ibm.com (localhost [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t2AHNljT009482; Tue, 10 Mar 2015 22:53:47 +0530
Received: from skywalker.linux.vnet.ibm.com ([9.79.191.119])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2AHNld2009425
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 10 Mar 2015 22:53:47 +0530
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
In-Reply-To: <1425966860-13605-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1425966860-13605-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Notmuch/0.19+30~gd241a48 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-pc-linux-gnu)
Date: Tue, 10 Mar 2015 22:53:46 +0530
Message-ID: <87mw3krckd.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031017-4790-0000-0000-000006FB3E15
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 122.248.162.1
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [Qemu-trivial] [PATCH] 9pfs-proxy: tiny cleanups in
	proxy_pwritev and proxy_preadv
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
X-List-Received-Date: Tue, 10 Mar 2015 17:23:59 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

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
>      } else {
>          return readv(fs->fd, iov, iovcnt);
>      }

I am not sure this is needed, whether to use int err or int ret as the
variable name is simply a matter of preference for the author. Also did
you compile test the above ? (note: int ret followed by a check with
variable name 'err').


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

-aneesh


