Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cJaQP-0005Q8-8T
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2016 01:30:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cJaQN-0005OX-Pl
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2016 01:30:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cJaQM-0006bf-UL
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2016 01:30:51 -0500
Received: from [59.151.112.132] (port=53982 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1cJaQH-0006YW-8E; Wed, 21 Dec 2016 01:30:45 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14127416"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Dec 2016 14:30:42 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 87D78467049D;
	Wed, 21 Dec 2016 14:30:41 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 21 Dec 2016 14:30:41 +0800
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
References: <1478094287-15009-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1478094287-15009-2-git-send-email-caoj.fnst@cn.fujitsu.com>
CC: <peter.maydell@linaro.org>, <thuth@redhat.com>, <armbru@redhat.com>,
	<mst@redhat.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <585A22A7.6000203@cn.fujitsu.com>
Date: Wed, 21 Dec 2016 14:35:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1478094287-15009-2-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 87D78467049D.A62B9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 1/2] util/mmap-alloc:
 check parameter before using
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
X-List-Received-Date: Wed, 21 Dec 2016 06:30:52 -0000

ping

On 11/02/2016 09:44 PM, Cao jin wrote:
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

-- 
Sincerely,
Cao jin



