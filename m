Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHsP5-0008CI-I0
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 06:37:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHsOz-00086c-Md
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:37:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHsOu-0001iN-TD
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:37:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XHsOi-0001fl-0j; Thu, 14 Aug 2014 06:36:47 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7EAZn2k015490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Aug 2014 06:35:49 -0400
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s7EAZinG011667; Thu, 14 Aug 2014 06:35:45 -0400
Date: Thu, 14 Aug 2014 12:36:22 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140814103622.GI31346@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-11-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408001361-13580-11-git-send-email-zhang.zhanghailiang@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 10/10] block/vvfat: fix setbuf stream
 parameter may be NULL
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
X-List-Received-Date: Thu, 14 Aug 2014 10:37:06 -0000

On Thu, Aug 14, 2014 at 03:29:21PM +0800, zhanghailiang wrote:
> From: Li Liu <john.liuli@huawei.com>
> 
> fopen() may return NULL which will cause setbuf() segmentfault
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Signed-off-by: Li Liu <john.liuli@huawei.com>
> ---
>  block/vvfat.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/block/vvfat.c b/block/vvfat.c
> index 70176b1..6889ea9 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -1084,7 +1084,10 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
>  
>  DLOG(if (stderr == NULL) {
>      stderr = fopen("vvfat.log", "a");
> -    setbuf(stderr, NULL);
> +
> +    if (stderr) {
> +        setbuf(stderr, NULL);
> +    }
>  })
>  
>      opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);

I would say assert on failure here.
If one is trying to debug, seeing no output will just confuse
matters more.

> -- 
> 1.7.12.4
> 

