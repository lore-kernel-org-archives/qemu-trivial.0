Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rUOzE-0001C8-7U
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jan 2024 05:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rUOzC-0001BO-AY; Mon, 29 Jan 2024 05:35:31 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rUOz9-0004Wf-TU; Mon, 29 Jan 2024 05:35:30 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TNl3W6c2Bz6K92Z;
 Mon, 29 Jan 2024 18:32:07 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 82D491400D7;
 Mon, 29 Jan 2024 18:35:11 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 29 Jan
 2024 10:35:11 +0000
Date: Mon, 29 Jan 2024 10:35:10 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: Re: [PATCH 08/10] cxl: Clean up includes
Message-ID: <20240129103510.00002e80@Huawei.com>
In-Reply-To: <20240125163408.1595135-9-peter.maydell@linaro.org>
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
 <20240125163408.1595135-9-peter.maydell@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2024 10:35:31 -0000

On Thu, 25 Jan 2024 16:34:06 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> This commit was created with scripts/clean-includes.
> 
> All .c should include qemu/osdep.h first.  The script performs three
> related cleanups:
> 
> * Ensure .c files include qemu/osdep.h first.
> * Including it in a .h is redundant, since the .c  already includes
>   it.  Drop such inclusions.
> * Likewise, including headers qemu/osdep.h includes is redundant.
>   Drop these, too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/cxl/cxl-events.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/cxl/cxl-events.c b/hw/cxl/cxl-events.c
> index bee6dfaf148..affcf8a34dd 100644
> --- a/hw/cxl/cxl-events.c
> +++ b/hw/cxl/cxl-events.c
> @@ -7,11 +7,9 @@
>   * COPYING file in the top-level directory.
>   */
>  
> -#include <stdint.h>
> -
>  #include "qemu/osdep.h"
> +
>  #include "qemu/bswap.h"
> -#include "qemu/typedefs.h"
>  #include "qemu/error-report.h"
>  #include "hw/pci/msi.h"
>  #include "hw/pci/msix.h"


