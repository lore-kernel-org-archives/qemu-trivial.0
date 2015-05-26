Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yx9z0-0007ke-SM
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2015 04:13:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Yx9yy-0007gq-AH
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 04:13:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Yx9yu-0005xv-Mk
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 04:13:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Yx9yu-0005xh-GD; Tue, 26 May 2015 04:13:00 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4Q8CwRb020006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 26 May 2015 04:12:58 -0400
Received: from [10.36.112.62] (ovpn-112-62.ams2.redhat.com [10.36.112.62])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4Q8CoR3004847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 26 May 2015 04:12:55 -0400
Message-ID: <55642B01.3010305@redhat.com>
Date: Tue, 26 May 2015 10:12:49 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-devel@nongnu.org
References: <1432622302-6798-1-git-send-email-crosthwaite.peter@gmail.com>
In-Reply-To: <1432622302-6798-1-git-send-email-crosthwaite.peter@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] memory_mapping: Use qemu_common.h include
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
X-List-Received-Date: Tue, 26 May 2015 08:13:05 -0000



On 26/05/2015 08:38, Peter Crosthwaite wrote:
> Rather than an explicit inclusion of cpu.h. This maked it more
> consistent with other core code files, which either just rely on
> qemu-common.h inclusion or preceed cpu.h with qemu-common.h anyway.

I'd rather keep the cpu.h inclusion.  It would be nice to get rid of the
automagic inclusion of cpu.h from qemu-common.h.

Paolo

> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
> Picked up by my multi arch WIP where target-multi/cpu.h cant handle
> random core code inclusion without preceeded qemu-common.h. I guess
> this is the only one in tree?
> ---
>  memory_mapping.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/memory_mapping.c b/memory_mapping.c
> index 7b69801..7cf5548 100644
> --- a/memory_mapping.c
> +++ b/memory_mapping.c
> @@ -13,8 +13,7 @@
>  
>  #include <glib.h>
>  
> -#include "cpu.h"
> -#include "exec/cpu-all.h"
> +#include "qemu-common.h"
>  #include "sysemu/memory_mapping.h"
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
> -- 1.9.1

