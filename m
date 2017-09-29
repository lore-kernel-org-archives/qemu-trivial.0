Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dxscj-0005bY-AA
	for mharc-qemu-trivial@gnu.org; Fri, 29 Sep 2017 06:34:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dxsch-0005a7-6o
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 06:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dxscg-000536-BJ
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 06:34:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45726)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dxscb-00051E-18; Fri, 29 Sep 2017 06:34:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BEF583F44;
	Fri, 29 Sep 2017 10:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5BEF583F44
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-120.pek2.redhat.com [10.72.12.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2D081816D;
	Fri, 29 Sep 2017 10:34:12 +0000 (UTC)
Date: Fri, 29 Sep 2017 18:34:11 +0800
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org
Message-ID: <20170929103411.GF26066@lemon.lan>
References: <20170920085952.3872-1-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170920085952.3872-1-famz@redhat.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 29 Sep 2017 10:34:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb: Use angle brackets for
 cacard include directive
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2017 10:34:24 -0000

On Wed, 09/20 16:59, Fam Zheng wrote:
> This is a library header, so angle brackets are more appropriate; also
> move the line to before QEMU headers, as is recommended in HACKING.
> 
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  hw/usb/ccid-card-passthru.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
> index 45d96b03c6..117711862e 100644
> --- a/hw/usb/ccid-card-passthru.c
> +++ b/hw/usb/ccid-card-passthru.c
> @@ -9,11 +9,11 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include <cacard/vscard_common.h>
>  #include "chardev/char-fe.h"
>  #include "qemu/error-report.h"
>  #include "qemu/sockets.h"
>  #include "ccid.h"
> -#include "cacard/vscard_common.h"
>  
>  #define DPRINTF(card, lvl, fmt, ...)                    \
>  do {                                                    \
> -- 
> 2.13.5
> 
> 

Cc: qemu-trivial@nongnu.org

