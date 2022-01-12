Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7Siv-0004es-0C
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jan 2022 20:46:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n7Sit-0004cf-OH; Tue, 11 Jan 2022 20:46:47 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n7Sir-0006a1-Ld; Tue, 11 Jan 2022 20:46:47 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JYVlH0L6jzbjpH;
 Wed, 12 Jan 2022 09:46:03 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 09:46:42 +0800
Subject: Re: [PATCH] tests: Fix typo in check-help output
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>
References: <20220111175528.22294-1-f4bug@amsat.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <1fef44a0-a54d-3c18-ee3c-7a63e86cc38a@huawei.com>
Date: Wed, 12 Jan 2022 09:46:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220111175528.22294-1-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
X-List-Received-Date: Wed, 12 Jan 2022 01:46:48 -0000


On 2022/1/12 1:55, Philippe Mathieu-Daudé wrote:
> Fix typo in 'make check-help' output.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 4c564cf7899..3aba6224009 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -23,7 +23,7 @@ endif
>   	@echo " $(MAKE) check-clean          Clean the tests and related data"
>   	@echo
>   	@echo "The following are useful for CI builds"
> -	@echo " $(MAKE) check-build          Build most test binaris"
> +	@echo " $(MAKE) check-build          Build most test binaries"
>   	@echo " $(MAKE) get-vm-images        Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
>   	@echo
>   	@echo
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

