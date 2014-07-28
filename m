Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XBfyO-0000U3-5R
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jul 2014 04:07:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1XBfyJ-0000PO-3W
	for qemu-trivial@nongnu.org; Mon, 28 Jul 2014 04:07:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1XBfyE-0006bg-FM
	for qemu-trivial@nongnu.org; Mon, 28 Jul 2014 04:07:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1XBfy5-0006YW-DD; Mon, 28 Jul 2014 04:07:37 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s6S87Xjb017712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 28 Jul 2014 04:07:33 -0400
Received: from nial.usersys.redhat.com (dhcp-1-126.brq.redhat.com
	[10.34.1.126])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6S87W04015026; Mon, 28 Jul 2014 04:07:33 -0400
Date: Mon, 28 Jul 2014 10:07:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
Message-ID: <20140728100733.195b41a1@nial.usersys.redhat.com>
In-Reply-To: <1406531586-17653-1-git-send-email-chen.fan.fnst@cn.fujitsu.com>
References: <1406531586-17653-1-git-send-email-chen.fan.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-i386/cpu.c: Fix two
 error output indentation
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
X-List-Received-Date: Mon, 28 Jul 2014 08:07:55 -0000

On Mon, 28 Jul 2014 15:13:06 +0800
Chen Fan <chen.fan.fnst@cn.fujitsu.com> wrote:

> Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
> ---
>  target-i386/cpu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 6d008ab..217500c 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -1716,9 +1716,9 @@ static void x86_set_hv_spinlocks(Object *obj, Visitor *v, void *opaque,
>  
>      if (value < min || value > max) {
>          error_setg(errp, "Property %s.%s doesn't take value %" PRId64
> -                  " (minimum: %" PRId64 ", maximum: %" PRId64 ")",
> -                  object_get_typename(obj), name ? name : "null",
> -                  value, min, max);
> +                   " (minimum: %" PRId64 ", maximum: %" PRId64 ")",
> +                   object_get_typename(obj), name ? name : "null",
> +                   value, min, max);
>          return;
>      }
>      cpu->hyperv_spinlock_attempts = value;
> @@ -1808,8 +1808,8 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
>                  }
>                  if (numvalue < min) {
>                      error_report("hv-spinlocks value shall always be >= 0x%x"
> -                            ", fixup will be removed in future versions",
> -                            min);
> +                                 ", fixup will be removed in future versions",
> +                                 min);
>                      numvalue = min;
>                  }
>                  snprintf(num, sizeof(num), "%" PRId32, numvalue);

CCed qemu-trivial@nongnu.org

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

