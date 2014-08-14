Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XI2HI-0003Xk-CS
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 17:09:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1XI2HB-0003Ny-41
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 17:09:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1XI2H4-0000Lc-Tu
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 17:09:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1XI2Gr-0000I9-Ug; Thu, 14 Aug 2014 17:09:18 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7EL9BNR015414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Aug 2014 17:09:12 -0400
Received: from localhost (ovpn-116-68.ams2.redhat.com [10.36.116.68])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7EL96Po012265; Thu, 14 Aug 2014 17:09:07 -0400
Date: Thu, 14 Aug 2014 16:49:45 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Message-ID: <20140814164945.2a0290fb@redhat.com>
In-Reply-To: <53DE5538.1020701@gmail.com>
References: <53DE5538.1020701@gmail.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, agraf@suse.de,
	qemu-devel@nongnu.org, qiaonuohan@cn.fujitsu.com,
	pbonzini@redhat.com, lersek@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] dump.c: Fix memory leak issue in cleanup
 processing for dump_init()
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
X-List-Received-Date: Thu, 14 Aug 2014 21:09:43 -0000

On Sun, 03 Aug 2014 23:28:56 +0800
Chen Gang <gang.chen.5i5j@gmail.com> wrote:

> In dump_init(), when failure occurs, need notice about 'fd' and memory
> mapping. So call dump_cleanup() for it (need let all initializations at
> front).
> 
> Also simplify dump_cleanup(): remove redundant 'ret' and redundant 'fd'
> checking.
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

Applied to the qmp branch, thanks.

PS: I still find it hard to track the file-descriptor's life time. IMO,
    the best would be to always release it where it's allocated which is
    qmp_dump_guest_memory().

> ---
>  dump.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/dump.c b/dump.c
> index ce646bc..71d3e94 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -71,18 +71,14 @@ uint64_t cpu_to_dump64(DumpState *s, uint64_t val)
>  
>  static int dump_cleanup(DumpState *s)
>  {
> -    int ret = 0;
> -
>      guest_phys_blocks_free(&s->guest_phys_blocks);
>      memory_mapping_list_free(&s->list);
> -    if (s->fd != -1) {
> -        close(s->fd);
> -    }
> +    close(s->fd);
>      if (s->resume) {
>          vm_start();
>      }
>  
> -    return ret;
> +    return 0;
>  }
>  
>  static void dump_error(DumpState *s, const char *reason)
> @@ -1499,6 +1495,8 @@ static int dump_init(DumpState *s, int fd, bool has_format,
>      s->begin = begin;
>      s->length = length;
>  
> +    memory_mapping_list_init(&s->list);
> +
>      guest_phys_blocks_init(&s->guest_phys_blocks);
>      guest_phys_blocks_append(&s->guest_phys_blocks);
>  
> @@ -1526,7 +1524,6 @@ static int dump_init(DumpState *s, int fd, bool has_format,
>      }
>  
>      /* get memory mapping */
> -    memory_mapping_list_init(&s->list);
>      if (paging) {
>          qemu_get_guest_memory_mapping(&s->list, &s->guest_phys_blocks, &err);
>          if (err != NULL) {
> @@ -1622,12 +1619,7 @@ static int dump_init(DumpState *s, int fd, bool has_format,
>      return 0;
>  
>  cleanup:
> -    guest_phys_blocks_free(&s->guest_phys_blocks);
> -
> -    if (s->resume) {
> -        vm_start();
> -    }
> -
> +    dump_cleanup(s);
>      return -1;
>  }
>  


