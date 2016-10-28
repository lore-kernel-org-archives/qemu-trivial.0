Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c083m-0008LP-DE
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 10:23:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c083i-0008Ig-HW
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 10:23:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c083c-0005qR-Oy
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 10:23:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c083Y-0005pd-0X; Fri, 28 Oct 2016 10:22:52 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BAC2B43714;
	Fri, 28 Oct 2016 17:22:51 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id A84B2B49;
	Fri, 28 Oct 2016 17:22:50 +0300 (MSK)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1477644996-23990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: peter.maydell@linaro.org, thuth@redhat.com, eblake@redhat.com,
	armbru@redhat.com, mst@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
X-Enigmail-Draft-Status: N1110
Message-ID: <92415a45-66a7-c080-2c3c-8f5f67204bd0@msgid.tls.msk.ru>
Date: Fri, 28 Oct 2016 17:22:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477644996-23990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v3] util/mmap-alloc: check parameter
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
X-List-Received-Date: Fri, 28 Oct 2016 14:23:05 -0000

28.10.2016 11:56, Cao jin wrote:
> Also refactor a little bit for readability

See comments below...

> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  util/mmap-alloc.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 5a85aa3..2f55f5e 100644
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
> @@ -83,22 +84,20 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
>          return MAP_FAILED;
>      }
>  
> -    ptr += offset;
> -    total -= offset;
> -
>      if (offset > 0) {
> -        munmap(ptr - offset, offset);
> +        munmap(ptr, offset);
>      }
>  
>      /*
>       * Leave a single PROT_NONE page allocated after the RAM block, to serve as
>       * a guard page guarding against potential buffer overflows.
>       */
> +    total -= offset;
>      if (total > size + getpagesize()) {
> -        munmap(ptr + size + getpagesize(), total - size - getpagesize());
> +        munmap(ptr1 + size + getpagesize(), total - size - getpagesize());
>      }
>  
> -    return ptr;
> +    return ptr1;

Why did you change ptr to ptr1 here and above?

On linux, mmap(2) manpage says that address serves as hint, and the
system create the mapping at a nearby page boundary.  Generally, this
address is just a hint.  So I'm not really sure if this code is actually
right.. :)

At the very least, your commit comment is a bit misleading, as it says
about readability, but it also MAY change semantics.

Maybe just move BOTH "ptr+=, total-=" parts down the line and keep
using ptr instead of ptr1?

It'd be very good, in my opinion, to document how this whole thing
is supposed to work :)

Thanks,

/mjt

