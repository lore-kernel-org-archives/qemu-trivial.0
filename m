Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmCQ5-0004Ih-Ts
	for mharc-qemu-trivial@gnu.org; Tue, 11 Apr 2023 07:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pmCQ3-0004Go-Gg; Tue, 11 Apr 2023 07:44:15 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pmCPy-0006Xv-5s; Tue, 11 Apr 2023 07:44:15 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PwkSx0hw1z6J6ld;
 Tue, 11 Apr 2023 19:41:37 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Apr
 2023 12:43:55 +0100
Date: Tue, 11 Apr 2023 12:43:54 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Stefan Weil <sw@weilnetz.de>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-8.0] docs/cxl: Fix sentence
Message-ID: <20230411124354.00006663@Huawei.com>
In-Reply-To: <20230409201828.1159568-1-sw@weilnetz.de>
References: <20230409201828.1159568-1-sw@weilnetz.de>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 11:44:16 -0000

On Sun, 9 Apr 2023 22:18:28 +0200
Stefan Weil <sw@weilnetz.de> wrote:

> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
> 
> If my change is okay I suggest to apply the patch for 8.0
> because it fixes documentation.
> 
> Regards,
> Stefan W.
> 
>  docs/system/devices/cxl.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
> index f25783a4ec..4c38223069 100644
> --- a/docs/system/devices/cxl.rst
> +++ b/docs/system/devices/cxl.rst
> @@ -111,7 +111,7 @@ Interfaces provided include:
>  
>  CXL Root Ports (CXL RP)
>  ~~~~~~~~~~~~~~~~~~~~~~~
> -A CXL Root Port servers te same purpose as a PCIe Root Port.
> +A CXL Root Port serves the same purpose as a PCIe Root Port.
>  There are a number of CXL specific Designated Vendor Specific
>  Extended Capabilities (DVSEC) in PCIe Configuration Space
>  and associated component register access via PCI bars.


