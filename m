Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buDIy-0004wI-KF
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 02:46:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1buDIw-0004uN-Gt
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 02:46:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1buDIu-0001Xu-Lj
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 02:46:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1buDIi-0001Ok-Gh; Wed, 12 Oct 2016 02:46:04 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id ADE634168E;
	Wed, 12 Oct 2016 09:45:50 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 4F0209B2;
	Wed, 12 Oct 2016 09:45:50 +0300 (MSK)
To: Gonglei <arei.gonglei@huawei.com>, qemu-devel@nongnu.org
References: <1476237901-85376-1-git-send-email-arei.gonglei@huawei.com>
Cc: qemu-trivial@nongnu.org, herongguang.he@huawei.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <14f4caf5-3884-bd5a-0f91-b206d578aa76@msgid.tls.msk.ru>
Date: Wed, 12 Oct 2016 09:45:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476237901-85376-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] mmap-alloc: check before use for ptr
 pointer
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
X-List-Received-Date: Wed, 12 Oct 2016 06:46:19 -0000

12.10.2016 05:05, Gonglei wrote:
> If ptr mmap failed, we don't need to do a superfluous
> calculation for offset variable by ptr (MAP_FAILED).

What's the point?  There's no problem in extra calculation
if mmap failed, yes, but do we really care?  As of it is now,
it is more compact and readable, and works.  I think.

Thanks,

/mjt

> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  util/mmap-alloc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 5a85aa3..577862b 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -61,13 +61,15 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
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
> +    offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
> +
>      /* Make sure align is a power of 2 */
>      assert(!(align & (align - 1)));
>      /* Always align to host page size */
>


