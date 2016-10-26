Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bzJI6-00088e-7q
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2016 04:10:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bzJI3-00086Q-9f
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 04:10:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bzJI2-0000vP-DL
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 04:10:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57580)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1bzJHw-0000rz-Ld; Wed, 26 Oct 2016 04:10:20 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 019A9C03BD57;
	Wed, 26 Oct 2016 08:10:20 +0000 (UTC)
Received: from [10.36.116.28] (ovpn-116-28.ams2.redhat.com [10.36.116.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9Q8AGsX011042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 26 Oct 2016 04:10:18 -0400
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1477466334-4078-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: peter.maydell@linaro.org, gkurz@linux.vnet.ibm.com, armbru@redhat.com,
	mst@redhat.com
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b324af65-ea5e-e39b-75c2-0c54b941bce7@redhat.com>
Date: Wed, 26 Oct 2016 10:10:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477466334-4078-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 26 Oct 2016 08:10:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util/mmap-alloc: check
 parameter before using
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
X-List-Received-Date: Wed, 26 Oct 2016 08:10:28 -0000

On 26.10.2016 09:18, Cao jin wrote:
> Also refactor some code hunk for readability
> 
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  util/mmap-alloc.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 5a85aa3..92c123a 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -41,6 +41,11 @@ size_t qemu_fd_getpagesize(int fd)
>  
>  void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
>  {
> +    /* Make sure align is a power of 2 */
> +    assert(!(align & (align - 1)));
> +    /* Always align to host page size */
> +    assert(align >= getpagesize());

Now you've moved code before the declaration of the local variables.
That's also some kind of ugly (and might not work with older versions of
C compilers?)...

>      /*
>       * Note: this always allocates at least one extra page of virtual address
>       * space, even if size is already aligned.
> @@ -68,11 +73,6 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
>          return MAP_FAILED;
>      }
>  
> -    /* Make sure align is a power of 2 */
> -    assert(!(align & (align - 1)));
> -    /* Always align to host page size */
> -    assert(align >= getpagesize());

... so maybe simply move the setting of "offset" (which requires
"align") here right in front of the mmap() instead?

>      ptr1 = mmap(ptr + offset, size, PROT_READ | PROT_WRITE,
>                  MAP_FIXED |
>                  (fd == -1 ? MAP_ANONYMOUS : 0) |
> @@ -83,22 +83,20 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
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
>  }

 Thomas



