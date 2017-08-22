Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1djxp5-0002Wo-8n
	for mharc-qemu-trivial@gnu.org; Mon, 21 Aug 2017 21:17:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1djxp2-0002V4-H4
	for qemu-trivial@nongnu.org; Mon, 21 Aug 2017 21:17:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1djxp1-0000LK-J1
	for qemu-trivial@nongnu.org; Mon, 21 Aug 2017 21:17:36 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:62964
	helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>)
	id 1djxox-0000J5-Gz; Mon, 21 Aug 2017 21:17:31 -0400
X-IronPort-AV: E=Sophos;i="5.41,410,1498492800"; d="scan'208";a="24311814"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Aug 2017 09:17:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8277747243AB;
	Tue, 22 Aug 2017 09:17:24 +0800 (CST)
Received: from [10.167.226.56] (10.167.226.56) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 22 Aug 2017 09:17:21 +0800
CC: <zhangchen.fnst@cn.fujitsu.com>, <qemu-devel@nongnu.org>,
	<lizhijian@cn.fujitsu.com>, <mjt@tls.msk.ru>
To: Eduardo Otubo <otubo@redhat.com>, <qemu-trivial@nongnu.org>
References: <20170821155005.16885-1-otubo@redhat.com>
From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Message-ID: <45e8e004-5a55-07a3-190b-c01106af5de4@cn.fujitsu.com>
Date: Tue, 22 Aug 2017 09:19:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170821155005.16885-1-otubo@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.167.226.56]
X-yoursite-MailScanner-ID: 8277747243AB.A6CA9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhangchen.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 183.91.158.132
Subject: Re: [Qemu-trivial] [PATCH] filter-mirror: segfault when specifying
 non existent device
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
X-List-Received-Date: Tue, 22 Aug 2017 01:17:37 -0000



On 08/21/2017 11:50 PM, Eduardo Otubo wrote:
> When using filter-mirror like the example below where the interface
> 'ndev0' does not exist on the host, QEMU crashes into segmentation
> fault.
>
>   $ qemu-system-x86_64 -S -machine pc -netdev user,id=ndev0 -object filter-mirror,id=test-object,netdev=ndev0
>
> This happens because the function filter_mirror_setup() does not checks
> if the device actually exists and still keep on processing calling
> qemu_chr_find(). This patch fixes this issue.
>
> Signed-off-by: Eduardo Otubo <otubo@redhat.com>

Looks good for me.

Reviewed-by: Zhang Chen<zhangchen.fnst@cn.fujitsu.com>

Thanks
Zhang Chen

> ---
>   net/filter-mirror.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> index 90e2c92337..e18a4b16a0 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -213,14 +213,22 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
>       MirrorState *s = FILTER_MIRROR(nf);
>       Chardev *chr;
>   
> +    if (s->outdev == NULL) {
> +        goto err;
> +    }
> +
>       chr = qemu_chr_find(s->outdev);
> +
>       if (chr == NULL) {
> -        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
> -                  "Device '%s' not found", s->outdev);
> -        return;
> +        goto err;
>       }
>   
>       qemu_chr_fe_init(&s->chr_out, chr, errp);
> +
> +err:
> +    error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "Device '%s' not found",
> +              nf->netdev_id);
> +    return;
>   }
>   
>   static void redirector_rs_finalize(SocketReadState *rs)

-- 
Thanks
Zhang Chen




