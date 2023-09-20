Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qipK8-0004s8-HM
	for mharc-qemu-trivial@gnu.org; Wed, 20 Sep 2023 01:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qipJw-0004ou-1K; Wed, 20 Sep 2023 01:00:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qipJt-00062W-LX; Wed, 20 Sep 2023 01:00:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 403A9236C8;
 Wed, 20 Sep 2023 08:00:29 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 245F4293D4;
 Wed, 20 Sep 2023 08:00:10 +0300 (MSK)
Message-ID: <b14670cf-2926-a1e0-33a6-861730ef0467@tls.msk.ru>
Date: Wed, 20 Sep 2023 08:00:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 0/3] hw/cxl: Misc small fixes
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: linuxarm@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Warner Losh <imp@bsdimp.com>
References: <20230919101927.1470-1-Jonathan.Cameron@huawei.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230919101927.1470-1-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -83
X-Spam_score: -8.4
X-Spam_bar: --------
X-Spam_report: (-8.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 20 Sep 2023 05:00:27 -0000

19.09.2023 13:19, Jonathan Cameron via wrote:
> v2:
>   - Tag collection.
>   - Patch 2 discussion on appropriate license concluded that this should
>     have originally only been accepted on GPL-v2 and later. However, I've
>     left it as GPL-v2-only as that is what was used for other CXL files and
>     for the license to be usefully relaxed we need to do them all - which
>     is a job for another day.
>   - Added SPDX
>   - Added similar header to cxl_type3_stubs.c
>   
> Misc set of trivial fixes.  No conflicts with other sets outstanding
> so can go with main CXL patches or perhaps via the trivial tree.

Appied to my trivial-patches tree.  Thank you!

/mjt

