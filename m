Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1zQg-0000zK-S8
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 13:34:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1c1zQe-0000ww-GD
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 13:34:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1c1zQd-0000wD-HR
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 13:34:24 -0400
Received: from mail.kernel.org ([198.145.29.136]:46912)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1c1zQW-0000qP-In; Wed, 02 Nov 2016 13:34:16 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 6CFE32041A;
	Wed,  2 Nov 2016 17:34:14 +0000 (UTC)
Received: from [10.1.10.56] (96-82-76-110-static.hfc.comcastbusiness.net
	[96.82.76.110])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 193A12038A;
	Wed,  2 Nov 2016 17:34:13 +0000 (UTC)
Date: Wed, 2 Nov 2016 10:34:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Thomas Huth <thuth@redhat.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, qemu-trivial@nongnu.org, 
	xen-devel@lists.xensource.com, olaf@aepfle.de, xuquan8@huawei.com, 
	emilcondrea@gmail.com
In-Reply-To: <1478081958-5803-1-git-send-email-thuth@redhat.com>
Message-ID: <alpine.DEB.2.10.1611021022470.19454@sstabellini-ThinkPad-X260>
References: <1478081958-5803-1-git-send-email-thuth@redhat.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.136
Subject: Re: [Qemu-trivial] [PATCH] hw/xen/xen_pvdev: Include qemu/log.h for
 qemu_log_vprintf()
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
X-List-Received-Date: Wed, 02 Nov 2016 17:34:25 -0000

On Wed, 2 Nov 2016, Thomas Huth wrote:
> Olaf Hering reported a build failure due to an undefined reference
> to 'qemu_log_vprintf'. Explicitely including qemu/log.h seems to
> fix the issue.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

The fix makes sense:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

However I was unable to reproduce the build failure, so I would like a
confirmation from Olaf that the fix is working.


>  hw/xen/xen_pvdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
> index 405e154..5212bc6 100644
> --- a/hw/xen/xen_pvdev.c
> +++ b/hw/xen/xen_pvdev.c
> @@ -18,7 +18,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> -
> +#include "qemu/log.h"
>  #include "hw/xen/xen_backend.h"
>  #include "hw/xen/xen_pvdev.h"
>  
> -- 
> 1.8.3.1
> 

