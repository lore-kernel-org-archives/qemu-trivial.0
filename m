Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6k2k-0003ia-DS
	for mharc-qemu-trivial@gnu.org; Sun, 09 Jan 2022 21:04:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n6k2i-0003iI-Kk; Sun, 09 Jan 2022 21:04:16 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n6k2a-000284-N2; Sun, 09 Jan 2022 21:04:11 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JXHD52T5czbjBQ;
 Mon, 10 Jan 2022 10:03:17 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 10:03:54 +0800
Subject: Re: [PATCH] softmmu/device_tree: Silence compiler warning with
 --enable-sanitizers
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>, Alistair Francis
 <alistair.francis@wdc.com>
CC: Andrew Jones <drjones@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, <qemu-trivial@nongnu.org>
References: <20220107133844.145039-1-thuth@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <f0fe5c41-dd9e-ffed-bac4-fa634f633af1@huawei.com>
Date: Mon, 10 Jan 2022 10:03:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220107133844.145039-1-thuth@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 10 Jan 2022 02:04:17 -0000


On 2022/1/7 21:38, Thomas Huth wrote:
> If I configure my build with --enable-sanitizers, my GCC (v8.5.0)
> complains:
>
> .../softmmu/device_tree.c: In function ‘qemu_fdt_add_path’:
> .../softmmu/device_tree.c:560:18: error: ‘retval’ may be used uninitialized
>   in this function [-Werror=maybe-uninitialized]
>       int namelen, retval;
>                    ^~~~~~
>
> It's a false warning since the while loop is always executed at least
> once (p has to be non-NULL, otherwise the derefence in the if-statement
> earlier will crash). Thus let's switch to a do-while loop here instead
> to make the compiler happy in all cases.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   softmmu/device_tree.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3965c834ca..9e96f5ecd5 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -564,7 +564,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>           return -1;
>       }
>   
> -    while (p) {
> +    do {
>           name = p + 1;
>           p = strchr(name, '/');
>           namelen = p != NULL ? p - name : strlen(name);
> @@ -584,7 +584,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>           }
>   
>           parent = retval;
> -    }
> +    } while (p);
>   
>       return retval;
>   }


