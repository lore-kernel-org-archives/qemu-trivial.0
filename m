Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHv8L-0005lZ-6m
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 09:32:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>) id 1XHv8C-0005Y7-IO
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 09:31:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>) id 1XHv87-0001j8-Nt
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 09:31:52 -0400
Received: from afflict.kos.to ([92.243.29.197]:56942)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>)
	id 1XHv7w-0001h4-9n; Thu, 14 Aug 2014 09:31:36 -0400
Received: by afflict.kos.to (Postfix, from userid 1000)
	id D31332651C; Thu, 14 Aug 2014 15:31:35 +0200 (CEST)
Date: Thu, 14 Aug 2014 16:31:35 +0300
From: Riku Voipio <riku.voipio@iki.fi>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140814133135.GB30317@afflict.kos.to>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-8-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408001361-13580-8-git-send-email-zhang.zhanghailiang@huawei.com>
X-message-flag: Warning: message not sent with a DRM-Certified client
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 92.243.29.197
Cc: kwolf@redhat.com, lkurusa@redhat.com, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, stefanha@redhat.com,
	luonengjun@huawei.com, pbonzini@redhat.com,
	lcapitulino@redhat.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6 07/10] linux-user: check
 return value of malloc()
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
X-List-Received-Date: Thu, 14 Aug 2014 13:31:59 -0000

On Thu, Aug 14, 2014 at 03:29:18PM +0800, zhanghailiang wrote:
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Acked-by: Riku Voipio <riku.voipio@linaro.org>

Applied to linux-user as Michael seemed wary of passing these via
trivial.

Riku

>---
>  linux-user/syscall.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a50229d..8e5ccf1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2870,6 +2870,10 @@ static inline abi_long do_msgsnd(int msqid, abi_long msgp,
>      if (!lock_user_struct(VERIFY_READ, target_mb, msgp, 0))
>          return -TARGET_EFAULT;
>      host_mb = malloc(msgsz+sizeof(long));
> +    if (!host_mb) {
> +        unlock_user_struct(target_mb, msgp, 0);
> +        return -TARGET_ENOMEM;
> +    }
>      host_mb->mtype = (abi_long) tswapal(target_mb->mtype);
>      memcpy(host_mb->mtext, target_mb->mtext, msgsz);
>      ret = get_errno(msgsnd(msqid, host_mb, msgsz, msgflg));
> -- 
> 1.7.12.4
> 
> 

