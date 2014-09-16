Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XToqY-0007qj-My
	for mharc-qemu-trivial@gnu.org; Tue, 16 Sep 2014 05:14:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1XToqS-0007nt-3B
	for qemu-trivial@nongnu.org; Tue, 16 Sep 2014 05:14:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1XToqN-00073Q-6o
	for qemu-trivial@nongnu.org; Tue, 16 Sep 2014 05:14:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1XToqM-00072v-Vk; Tue, 16 Sep 2014 05:14:39 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8G9D1WP026227
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 16 Sep 2014 05:13:01 -0400
Received: from nial.usersys.redhat.com (dhcp-1-126.brq.redhat.com
	[10.34.1.126])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8G9Cwe2006632; Tue, 16 Sep 2014 05:12:59 -0400
Date: Tue, 16 Sep 2014 11:12:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140916111258.7f842ab8@nial.usersys.redhat.com>
In-Reply-To: <1410853532-9956-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1410853532-9956-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl: Print maxmem in hex
 format for error message
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
X-List-Received-Date: Tue, 16 Sep 2014 09:14:49 -0000

On Tue, 16 Sep 2014 15:45:32 +0800
zhanghailiang <zhang.zhanghailiang@huawei.com> wrote:

> In error message, maxmem is printed in Dec but ram_size in Hex.
> It is better to print them in same format.
> Also use error_report instead of fprintf.
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  v2:
> - Remove redundant "qemu:" in error message, for error_report already prepend
>   a variation of "qemu" (comment of Eric Blake)
> ---
>  vl.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index 5db0d08..71a831b 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3358,34 +3358,34 @@ int main(int argc, char **argv, char **envp)
>  
>                      sz = qemu_opt_get_size(opts, "maxmem", 0);
>                      if (sz < ram_size) {
> -                        fprintf(stderr, "qemu: invalid -m option value: maxmem "
> -                                "(%" PRIu64 ") <= initial memory ("
> -                                RAM_ADDR_FMT ")\n", sz, ram_size);
> +                        error_report("invalid -m option value: maxmem "
> +                                "(0x%" PRIx64 ") <= initial memory (0x"
> +                                RAM_ADDR_FMT ")", sz, ram_size);
>                          exit(EXIT_FAILURE);
>                      }
>  
>                      slots = qemu_opt_get_number(opts, "slots", 0);
>                      if ((sz > ram_size) && !slots) {
> -                        fprintf(stderr, "qemu: invalid -m option value: maxmem "
> -                                "(%" PRIu64 ") more than initial memory ("
> +                        error_report("invalid -m option value: maxmem "
> +                                "(0x%" PRIx64 ") more than initial memory (0x"
>                                  RAM_ADDR_FMT ") but no hotplug slots where "
> -                                "specified\n", sz, ram_size);
> +                                "specified", sz, ram_size);
>                          exit(EXIT_FAILURE);
>                      }
>  
>                      if ((sz <= ram_size) && slots) {
> -                        fprintf(stderr, "qemu: invalid -m option value:  %"
> +                        error_report("invalid -m option value:  %"
>                                  PRIu64 " hotplug slots where specified but "
> -                                "maxmem (%" PRIu64 ") <= initial memory ("
> -                                RAM_ADDR_FMT ")\n", slots, sz, ram_size);
> +                                "maxmem (0x%" PRIx64 ") <= initial memory (0x"
> +                                RAM_ADDR_FMT ")", slots, sz, ram_size);
>                          exit(EXIT_FAILURE);
>                      }
>                      maxram_size = sz;
>                      ram_slots = slots;
>                  } else if ((!maxmem_str && slots_str) ||
>                             (maxmem_str && !slots_str)) {
> -                    fprintf(stderr, "qemu: invalid -m option value: missing "
> -                            "'%s' option\n", slots_str ? "maxmem" : "slots");
> +                     error_report("invalid -m option value: missing "
indent error

> +                            "'%s' option", slots_str ? "maxmem" : "slots");
>                      exit(EXIT_FAILURE);
>                  }
>                  break;

with above fixed,

Reviewed-By: Igor Mammedov <imammedo@redhat.com>

