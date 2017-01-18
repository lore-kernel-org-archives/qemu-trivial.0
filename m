Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTjOx-000606-NC
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jan 2017 01:07:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cTjOv-0005yu-Nm
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 01:07:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cTjOu-0002Np-Rc
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 01:07:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34332)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cTjOq-0002MX-Dr; Wed, 18 Jan 2017 01:07:12 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 635088E251;
	Wed, 18 Jan 2017 06:07:12 +0000 (UTC)
Received: from [10.36.116.60] (ovpn-116-60.ams2.redhat.com [10.36.116.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0I679Fl018302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 Jan 2017 01:07:10 -0500
To: Ziyue Yang <skiver.cloud.yzy@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1484709699-3455-1-git-send-email-skiver.cloud.yzy@gmail.com>
Cc: Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Ziyue Yang <yzylivezh@hotmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <66ed2121-c207-d2f4-2e05-b6474bfa6a49@redhat.com>
Date: Wed, 18 Jan 2017 07:07:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484709699-3455-1-git-send-email-skiver.cloud.yzy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 18 Jan 2017 06:07:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v4 1/2] gdbstub.c: fix GDB connection
 segfault caused by empty machines
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
X-List-Received-Date: Wed, 18 Jan 2017 06:07:18 -0000

On 18.01.2017 04:21, Ziyue Yang wrote:
> From: Ziyue Yang <yzylivezh@hotmail.com>
> 
> This patch is to fix the segmentation fault caused by attaching
> GDB to a QEMU instance initialized with "-M none" option.
> 
> The bug can be reproduced by
> 
>> ./qemu-system-x86_64 -M none -nographic -S -s
> 
> and attach a GDB to it by
> 
>> gdb -ex 'target remote :1234
> 
> The segmentation fault was originally caused by trying to read
> the information about CPU when communicating with GDB. However,
> it's impossible for any control flow to exist on an empty machine,
> nor can CPU's be hot plugged to an empty machine later by QOM
> commands. So I think simply disabling GDB connections on empty
> machines makes sense.
> 
> Also some updates from fprintf(stderr, ...) to error_report.

Seems like that last sentence is a left-over from your other patch and
should be removed from this patch description here.

> Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
> ---
>  gdbstub.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index de62d26..426d55e 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -18,6 +18,7 @@
>   */
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "qemu/error-report.h"
>  #include "qemu/cutils.h"
>  #include "cpu.h"
>  #ifdef CONFIG_USER_ONLY
> @@ -1731,6 +1732,12 @@ int gdbserver_start(const char *device)
>      CharDriverState *mon_chr;
>      ChardevCommon common = { 0 };
> 
> +    if (!first_cpu) {
> +        error_report("gdbstub: meaningless to attach gdb to a "
> +                     "machine without any CPU.");
> +        return -1;
> +    }
> +
>      if (!device)
>          return -1;
>      if (strcmp(device, "none") != 0) {
> --
> 2.7.4
> 

With the "fprintf" sentence removed:

Reviewed-by: Thomas Huth <thuth@redhat.com>


