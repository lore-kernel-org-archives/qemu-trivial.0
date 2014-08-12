Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHEEc-0007I0-4I
	for mharc-qemu-trivial@gnu.org; Tue, 12 Aug 2014 11:43:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1XHEET-00078h-TI
	for qemu-trivial@nongnu.org; Tue, 12 Aug 2014 11:43:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1XHEEN-0002qw-GS
	for qemu-trivial@nongnu.org; Tue, 12 Aug 2014 11:43:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1XHEEA-0002nv-HA; Tue, 12 Aug 2014 11:43:10 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7CFh4hJ022121
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 12 Aug 2014 11:43:04 -0400
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7CFh0W3003485; Tue, 12 Aug 2014 11:43:01 -0400
Message-ID: <53EA3604.5020402@redhat.com>
Date: Tue, 12 Aug 2014 17:43:00 +0200
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <53DE5538.1020701@gmail.com>
In-Reply-To: <53DE5538.1020701@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, agraf@suse.de, qiaonuohan@cn.fujitsu.com,
	pbonzini@redhat.com, lcapitulino@redhat.com
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
X-List-Received-Date: Tue, 12 Aug 2014 15:43:36 -0000

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
> 

The patch is not trivial at all, because the lifecycles of the affected
resources are not trivial.

The commit message is an abomination. If you want to contribute to open
source, please learn proper English, and make a *serious* effort to
document your changes. Don't expect earlier contributors to have any
working knowledge about a file they have *maybe* touched several months
ago. People have to swap out a whole load of crap from their minds, and
swap in the old crap, to understand your patch. Help them by writing
good commit messages.

That said, no matter how annoying this submission is, my conscience
didn't allow me to let it go ignored, so I spent the time and made an
effort to track the lifetimes of "s->fd" and "s->list" in, and around,
dump_init().

The patch seems correct. That's your only excuse for the loss of gray
matter I've suffered while parsing your commit message.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>


