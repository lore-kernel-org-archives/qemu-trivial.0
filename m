Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0N7F-0008Fc-9G
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 03:32:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1e0N79-0008B2-OZ
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 03:32:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1e0N76-0005LB-Ji
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 03:32:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41872)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1e0N76-0005IM-DE
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 03:32:04 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8949325BB8;
	Fri,  6 Oct 2017 07:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8949325BB8
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.122] (ovpn-116-122.ams2.redhat.com [10.36.116.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D79555DD69;
	Fri,  6 Oct 2017 07:32:01 +0000 (UTC)
To: Marco A L Barbosa <malbarbo@gmail.com>, qemu-trivial@nongnu.org
References: <20171005135530.837-1-malbarbo@gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <498b5456-1a96-fbd9-6202-0a1301e3a8c5@redhat.com>
Date: Fri, 6 Oct 2017 09:32:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171005135530.837-1-malbarbo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 06 Oct 2017 07:32:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Add some random ioctls
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
X-List-Received-Date: Fri, 06 Oct 2017 07:32:12 -0000

On 05/10/2017 15:55, Marco A L Barbosa wrote:
> Signed-off-by: Marco A L Barbosa <malbarbo@gmail.com>
> ---
>  linux-user/ioctls.h       | 5 +++++
>  linux-user/syscall.c      | 1 +
>  linux-user/syscall_defs.h | 7 +++++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index e6997ff230..35cad6f944 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -173,6 +173,11 @@
>    IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))
>    IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec)))
>  
> +  IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))
> +  IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(TYPE_INT))
> +  IOCTL(RNDZAPENTCNT, 0, TYPE_NULL)
> +  IOCTL(RNDCLEARPOOL, 0, TYPE_NULL)
> +
>    IOCTL(CDROMPAUSE, 0, TYPE_NULL)
>    IOCTL(CDROMSTART, 0, TYPE_NULL)
>    IOCTL(CDROMSTOP, 0, TYPE_NULL)
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9b6364a266..d4c21a557c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -59,6 +59,7 @@ int __clone2(int (*fn)(void *), void *child_stack_base,
>  #include <linux/icmp.h>
>  #include <linux/icmpv6.h>
>  #include <linux/errqueue.h>
> +#include <linux/random.h>
>  #include "qemu-common.h"
>  #ifdef CONFIG_TIMERFD
>  #include <sys/timerfd.h>
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 40c5027e93..b3d55e35ac 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -1060,6 +1060,13 @@ struct target_pollfd {
>  
>  #define TARGET_SIOCGIWNAME     0x8B01          /* get name == wireless protocol */
>  
> +/* From <linux/random.h> */
> +
> +#define TARGET_RNDGETENTCNT    TARGET_IOR('R', 0x00, int)
> +#define TARGET_RNDADDTOENTCNT  TARGET_IOW('R', 0x01, int)
> +#define TARGET_RNDZAPENTCNT    TARGET_IO('R', 0x04)
> +#define TARGET_RNDCLEARPOOL    TARGET_IO('R', 0x06)
> +
>  /* From <linux/fs.h> */
>  
>  #define TARGET_BLKROSET   TARGET_IO(0x12,93) /* set device read-only (0 = read-write) */
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

Please, add a tag version and include history when you resend a series.

Read https://wiki.qemu.org/Contribute/SubmitAPatch

Thanks,
Laurent

