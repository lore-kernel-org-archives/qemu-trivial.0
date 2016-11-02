Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c22LV-0005gf-Cb
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 16:41:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c22LT-0005fY-Pz
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 16:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c22LT-0002OC-2F
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 16:41:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43220)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c22LN-0002Hc-DZ; Wed, 02 Nov 2016 16:41:09 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86390C04B930;
	Wed,  2 Nov 2016 20:41:07 +0000 (UTC)
Received: from [10.36.116.29] (ovpn-116-29.ams2.redhat.com [10.36.116.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA2Kf4Kk009727
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 2 Nov 2016 16:41:05 -0400
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1478094287-15009-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1478094287-15009-2-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: peter.maydell@linaro.org, eblake@redhat.com, armbru@redhat.com,
	mst@redhat.com
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bff05b37-3d13-3951-1227-332c46ebf5ac@redhat.com>
Date: Wed, 2 Nov 2016 21:41:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478094287-15009-2-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 02 Nov 2016 20:41:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v4 1/2] util/mmap-alloc: check parameter
 before using
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
X-List-Received-Date: Wed, 02 Nov 2016 20:41:16 -0000

On 02.11.2016 14:44, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  util/mmap-alloc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 5a85aa3..d713a72 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -12,6 +12,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/mmap-alloc.h"
> +#include "qemu/host-utils.h"
>  
>  #define HUGETLBFS_MAGIC       0x958458f6
>  
> @@ -61,18 +62,18 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
>  #else
>      void *ptr = mmap(0, total, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
>  #endif
> -    size_t offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
> +    size_t offset;
>      void *ptr1;
>  
>      if (ptr == MAP_FAILED) {
>          return MAP_FAILED;
>      }
>  
> -    /* Make sure align is a power of 2 */
> -    assert(!(align & (align - 1)));
> +    assert(is_power_of_2(align));
>      /* Always align to host page size */
>      assert(align >= getpagesize());
>  
> +    offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
>      ptr1 = mmap(ptr + offset, size, PROT_READ | PROT_WRITE,
>                  MAP_FIXED |
>                  (fd == -1 ? MAP_ANONYMOUS : 0) |
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


