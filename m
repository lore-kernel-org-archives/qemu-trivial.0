Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mz7tb-0007b9-MJ
	for mharc-qemu-trivial@gnu.org; Sun, 19 Dec 2021 20:55:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mz7ta-0007ar-GC; Sun, 19 Dec 2021 20:55:22 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mz7tW-0003qG-Ju; Sun, 19 Dec 2021 20:55:22 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JHN225nkszbjVg;
 Mon, 20 Dec 2021 09:54:50 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 09:55:12 +0800
Subject: Re: [PATCH v2 3/5] hw/qdev: Correct qdev_connect_gpio_out_named()
 documentation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
CC: Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, <qemu-trivial@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20211218130437.1516929-1-f4bug@amsat.org>
 <20211218130437.1516929-4-f4bug@amsat.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <35788c38-37cd-4773-831d-aaaf5eb50bff@huawei.com>
Date: Mon, 20 Dec 2021 09:55:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211218130437.1516929-4-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.563,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 20 Dec 2021 01:55:22 -0000


On 2021/12/18 21:04, Philippe Mathieu-Daudé wrote:
> qdev_connect_gpio_out_named() is described as qdev_connect_gpio_out(),
> and referring to itself in an endless loop, which is confusing. Fix.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/qdev-core.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
Looks good,
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index dcf20c69b89..424c48daf6e 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -504,7 +504,8 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
>   void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
>   
>   /**
> - * qdev_connect_gpio_out: Connect one of a device's anonymous output GPIO lines
> + * qdev_connect_gpio_out_named: Connect one of a device's named output
> + *                              GPIO lines
>    * @dev: Device whose GPIO to connect
>    * @name: Name of the output GPIO array
>    * @n: Number of the anonymous output GPIO line (which must be in range)
> @@ -526,7 +527,7 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
>    * qemu_irqs at once, or to connect multiple outbound GPIOs to the
>    * same qemu_irq; see qdev_connect_gpio_out() for details.
>    *
> - * For named output GPIO lines, use qdev_connect_gpio_out_named().
> + * For anonymous output GPIO lines, use qdev_connect_gpio_out().
>    */
>   void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
>                                    qemu_irq pin);


