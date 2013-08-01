Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4oQi-0005HG-D5
	for mharc-qemu-trivial@gnu.org; Thu, 01 Aug 2013 04:40:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1V4oQa-0005EK-FJ
	for qemu-trivial@nongnu.org; Thu, 01 Aug 2013 04:40:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1V4oQT-0001JA-LN
	for qemu-trivial@nongnu.org; Thu, 01 Aug 2013 04:40:08 -0400
Received: from mx4-phx2.redhat.com ([209.132.183.25]:51175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1V4oQT-0001IX-EN; Thu, 01 Aug 2013 04:40:01 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id r718dwlT025475;
	Thu, 1 Aug 2013 04:39:58 -0400
Date: Thu, 1 Aug 2013 04:39:58 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <1891063913.8014575.1375346398856.JavaMail.root@redhat.com>
In-Reply-To: <20130801075529.GA3177@redhat.com>
References: <20130801075529.GA3177@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.5.82.11]
X-Mailer: Zimbra 8.0.3_GA_5664 (ZimbraWebClient - SAF5 (Mac)/8.0.3_GA_5664)
Thread-Topic: memory.c: drop kvm.h dependency
Thread-Index: LZDCCyecOP4ZmaOW508YGX2RVdB1Jw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Avi Kivity <avi.kivity@gmail.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] memory.c: drop kvm.h dependency
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
X-List-Received-Date: Thu, 01 Aug 2013 08:40:14 -0000

> memory.c does not use any kvm specific interfaces,
> don't include kvm.h
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

and adding qemu-trivial.

Paolo

> ---
>  memory.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/memory.c b/memory.c
> index 01846c9..6b5c420 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -18,7 +18,6 @@
>  #include "exec/ioport.h"
>  #include "qemu/bitops.h"
>  #include "qom/object.h"
> -#include "sysemu/kvm.h"
>  #include <assert.h>
>  
>  #include "exec/memory-internal.h"
> --
> MST
> 

