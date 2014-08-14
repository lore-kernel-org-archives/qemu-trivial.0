Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHs2O-0004rM-0D
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 06:13:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHs2G-0004i1-6X
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:13:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHs2B-0002fY-Bx
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:13:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XHs21-0002a0-G5; Thu, 14 Aug 2014 06:13:17 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7EACHhc002019
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Aug 2014 06:12:18 -0400
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s7EACCkC029268; Thu, 14 Aug 2014 06:12:13 -0400
Date: Thu, 14 Aug 2014 12:12:50 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140814101250.GA31346@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-5-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408001361-13580-5-git-send-email-zhang.zhanghailiang@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 04/10] ivshmem: check the value
	returned by fstat()
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
X-List-Received-Date: Thu, 14 Aug 2014 10:13:38 -0000

On Thu, Aug 14, 2014 at 03:29:15PM +0800, zhanghailiang wrote:
> The function fstat() may fail, so check its return value.
> 
> Acked-by: Levente Kurusa <lkurusa@redhat.com>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/misc/ivshmem.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index 768e528..2be4b86 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -324,7 +324,11 @@ static int check_shm_size(IVShmemState *s, int fd) {
>  
>      struct stat buf;
>  
> -    fstat(fd, &buf);
> +    if (fstat(fd, &buf) < 0) {
> +        fprintf(stderr, "ivshmem: exiting: fstat on fd %d failed: %s\n",
> +                fd, strerror(errno));
> +        return -1;
> +    }
>  
>      if (s->ivshmem_size > buf.st_size) {
>          fprintf(stderr,
> -- 
> 1.7.12.4
> 

