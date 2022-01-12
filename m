Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7SeX-0008PQ-Il
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jan 2022 20:42:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n7SeU-0008Ns-Q5; Tue, 11 Jan 2022 20:42:14 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n7SeR-0005zE-Da; Tue, 11 Jan 2022 20:42:14 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JYVbX0LwNz8wDl;
 Wed, 12 Jan 2022 09:39:20 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 09:42:01 +0800
Subject: Re: [PATCH] qdev-core.h: Fix wrongly named reference to TYPE_SPLIT_IRQ
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>
References: <20220111172655.3546766-1-peter.maydell@linaro.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <f5f2bce4-5572-ad6d-c36e-b79406e5d9ca@huawei.com>
Date: Wed, 12 Jan 2022 09:42:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220111172655.3546766-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 12 Jan 2022 01:42:15 -0000


On 2022/1/12 1:26, Peter Maydell wrote:
> Fix a comment in qdev-core.h where we incorrectly referred
> to TYPE_IRQ_SPLIT when we meant TYPE_SPLIT_IRQ.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/qdev-core.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index d19c9417520..92c3d652086 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -493,7 +493,7 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
>    * qemu_irqs at once, or to connect multiple outbound GPIOs to the
>    * same qemu_irq. (Warning: there is no assertion or other guard to
>    * catch this error: the model will just not do the right thing.)
> - * Instead, for fan-out you can use the TYPE_IRQ_SPLIT device: connect
> + * Instead, for fan-out you can use the TYPE_SPLIT_IRQ device: connect
>    * a device's outbound GPIO to the splitter's input, and connect each
>    * of the splitter's outputs to a different device.  For fan-in you
>    * can use the TYPE_OR_IRQ device, which is a model of a logical OR
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

