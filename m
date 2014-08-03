Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XDy9s-0007Y3-H0
	for mharc-qemu-trivial@gnu.org; Sun, 03 Aug 2014 11:57:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1XDy9k-0007NN-Jl
	for qemu-trivial@nongnu.org; Sun, 03 Aug 2014 11:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1XDy9e-0002BV-Dr
	for qemu-trivial@nongnu.org; Sun, 03 Aug 2014 11:57:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1XDy9R-0002Ay-M0; Sun, 03 Aug 2014 11:56:49 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s73FugjV018141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 3 Aug 2014 11:56:42 -0400
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s73FudPE007342; Sun, 3 Aug 2014 11:56:40 -0400
Message-ID: <53DE5BB7.10709@redhat.com>
Date: Sun, 03 Aug 2014 17:56:39 +0200
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, lcapitulino@redhat.com,
	qiaonuohan@cn.fujitsu.com, pbonzini@redhat.com, agraf@suse.de,
	Michael Tokarev <mjt@tls.msk.ru>
References: <53DE5538.1020701@gmail.com>
In-Reply-To: <53DE5538.1020701@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Sun, 03 Aug 2014 15:57:14 -0000

comments below

On 08/03/14 17:28, Chen Gang wrote:
> In dump_init(), when failure occurs, need notice about 'fd' and memory
> mapping. So call dump_cleanup() for it (need let all initializations at
> front).
> 
> Also simplify dump_cleanup(): remove redundant 'ret' and redundant 'fd'
> checking.
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  dump.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)

Please explain what is leaked and how.

The only possibility I can see (without digging very hard) is that
qemu_get_guest_memory_mapping() succeeds and lzo_init() fails (which
should never happen in practice).

Regarding s->fd itself, I'm beyond trying to understand its lifecycle.
Qemu uses a bad ownership model wherein functions, in case of an
internal error, release resources they got from their callers. I'm
unable to reason in such a model. The only function to close fd *ever*
should be qmp_dump_guest_memory() (and that one should close fd with a
direct close() call). Currently fd is basically a global variable,
because the entire dump function tree has access to it (and closes it if
there's an error).

Anyway I guess it's OK to call dump_cleanup() to close s->fd just in case.

If you have a Coverity report, please share it.

Then,

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

I agree with this change.

>      guest_phys_blocks_free(&s->guest_phys_blocks);
>      memory_mapping_list_free(&s->list);
> -    if (s->fd != -1) {
> -        close(s->fd);
> -    }
> +    close(s->fd);

I disagree. It clobbers errno if s->fd is -1. Even though we don't
particularly care about errno, it sort of disturbs be. Or can you prove
s->fd is never -1 here?

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
> 

This code is ripe for a generic lifecycle tracking overhaul, but since
my view of ownership tracking is marginal in the qemu developer
community, I'm not motivated.

NB: I'm not nacking your patch, just please explain it better.

Thanks
Laszlo

