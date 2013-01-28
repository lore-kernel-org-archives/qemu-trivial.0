Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TzmND-000644-9k
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2013 05:55:35 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1TzmNA-0005vO-2l
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 05:55:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1TzmN8-0004c8-UG
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 05:55:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:2035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1TzmN0-0004Zg-An; Mon, 28 Jan 2013 05:55:22 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0SAtKNV005790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 28 Jan 2013 05:55:21 -0500
Received: from thinkpad.mammed.net (vpn-225-40.phx2.redhat.com [10.3.225.40])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id r0SAtJKe003001; Mon, 28 Jan 2013 05:55:19 -0500
Date: Mon, 28 Jan 2013 11:55:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20130128115518.75380001@thinkpad.mammed.net>
In-Reply-To: <79b3ee1c-5db5-47e7-a458-39e5c0698e3f@VA3EHSMHS027.ehs.local>
References: <cover.1359233188.git.peter.crosthwaite@xilinx.com>
	<79b3ee1c-5db5-47e7-a458-39e5c0698e3f@VA3EHSMHS027.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] qemu/log.h: Fix missing
	includes
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
X-List-Received-Date: Mon, 28 Jan 2013 10:55:33 -0000

On Sat, 26 Jan 2013 12:54:36 -0800
Peter Crosthwaite <peter.crosthwaite@xilinx.com> wrote:

> qemu/log.h needs a few bits and pieces from qemu-common to compile.
> Fixes the case where qemu/log.h is the first files included.
> 
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>  include/qemu/log.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index 58f69cb..0a1266d 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -2,6 +2,7 @@
>  #define QEMU_LOG_H
>  
>  #include <stdarg.h>
> +#include "qemu-common.h"
Could you try to avoid including it header, and instead of move whatever
definitions it depends on to their proper places?
Reasoning for not including it in other headers, that it often creates circular
header dependencies of header that includes it is included in another header.

>  #ifdef NEED_CPU_H
>  #include "disas/disas.h"
>  #endif
> -- 
> 1.7.12.1.396.g16eed7c
> 
> 
> 


-- 
Regards,
  Igor

