Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fDBAQ-0006bk-9q
	for mharc-qemu-trivial@gnu.org; Mon, 30 Apr 2018 11:56:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fDBAN-0006ZO-Ru
	for qemu-trivial@nongnu.org; Mon, 30 Apr 2018 11:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fDBAN-0001BS-1p
	for qemu-trivial@nongnu.org; Mon, 30 Apr 2018 11:56:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56594 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fDBAI-00017r-Ko; Mon, 30 Apr 2018 11:56:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 977444270959;
	Mon, 30 Apr 2018 15:56:28 +0000 (UTC)
Received: from redhat.com (ovpn-125-58.rdu2.redhat.com [10.10.125.58])
	by smtp.corp.redhat.com (Postfix) with SMTP id D4E72202327B;
	Mon, 30 Apr 2018 15:56:24 +0000 (UTC)
Date: Mon, 30 Apr 2018 18:56:24 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Message-ID: <20180430185609-mutt-send-email-mst@kernel.org>
References: <1525073539-27991-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525073539-27991-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 30 Apr 2018 15:56:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 30 Apr 2018 15:56:28 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] trivial: Do not include pci.h if it is
 not necessary
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
X-List-Received-Date: Mon, 30 Apr 2018 15:56:40 -0000

On Mon, Apr 30, 2018 at 09:32:19AM +0200, Thomas Huth wrote:
> There is no need to include pci.h in these files.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  include/hw/ppc/ppc4xx.h            | 2 --
>  include/hw/virtio/virtio-balloon.h | 1 -
>  include/hw/virtio/virtio-gpu.h     | 1 -
>  3 files changed, 4 deletions(-)
> 
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index cb0bb55..3a2a04c 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -25,8 +25,6 @@
>  #ifndef PPC4XX_H
>  #define PPC4XX_H
>  
> -#include "hw/pci/pci.h"
> -
>  /* PowerPC 4xx core initialization */
>  PowerPCCPU *ppc4xx_init(const char *cpu_model,
>                          clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
> diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
> index 1ea13bd..e0df352 100644
> --- a/include/hw/virtio/virtio-balloon.h
> +++ b/include/hw/virtio/virtio-balloon.h
> @@ -17,7 +17,6 @@
>  
>  #include "standard-headers/linux/virtio_balloon.h"
>  #include "hw/virtio/virtio.h"
> -#include "hw/pci/pci.h"
>  
>  #define TYPE_VIRTIO_BALLOON "virtio-balloon-device"
>  #define VIRTIO_BALLOON(obj) \
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index 22ac3c2..79bb3fb 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -18,7 +18,6 @@
>  #include "ui/qemu-pixman.h"
>  #include "ui/console.h"
>  #include "hw/virtio/virtio.h"
> -#include "hw/pci/pci.h"
>  #include "qemu/log.h"
>  
>  #include "standard-headers/linux/virtio_gpu.h"
> -- 
> 1.8.3.1

