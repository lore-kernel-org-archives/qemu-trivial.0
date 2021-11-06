Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjBU2-0006UF-IF
	for mharc-qemu-trivial@gnu.org; Fri, 05 Nov 2021 22:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mjBTz-0006Ts-Pi; Fri, 05 Nov 2021 22:31:03 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mjBTw-0003a0-Qh; Fri, 05 Nov 2021 22:31:03 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HmLpG2rRLzcb4L;
 Sat,  6 Nov 2021 10:25:58 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 10:30:44 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 10:30:44 +0800
Subject: Re: [PATCH] docs/about/deprecated: Remove empty 'related binaries'
 section
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
CC: <libvir-list@redhat.com>, Eric Blake <eblake@redhat.com>,
 <qemu-trivial@nongnu.org>, John Snow <jsnow@redhat.com>
References: <20211105142656.145791-1-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <323d1348-5d6a-df3b-d880-d585337a6375@huawei.com>
Date: Sat, 6 Nov 2021 10:30:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211105142656.145791-1-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 06 Nov 2021 02:31:05 -0000


On 2021/11/5 22:26, Philippe Mathieu-Daudé wrote:
> Commit 497a30dbb06 ("qemu-img: Require -F with -b backing image")
> removed the content of the "Related binaries" section but forgot
> to remove the section title. Since it is now empty, remove it too.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   docs/about/deprecated.rst | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 56f9ad15ab5..5e514fb443d 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -370,9 +370,6 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>   (the ISA has never been upstreamed to a compiler toolchain). Therefore
>   this CPU is also deprecated.
>   
> -Related binaries
> -----------------
> -
>   Backwards compatibility
>   -----------------------
>   
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>


