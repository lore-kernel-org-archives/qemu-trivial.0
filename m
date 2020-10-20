Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUhfd-0001X3-Rv
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2020 22:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kUhfc-0001Ws-N9
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 22:46:40 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:53332 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kUhfZ-0004hW-Vx
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 22:46:40 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F3DF2AE0AEDF5D564540;
 Tue, 20 Oct 2020 10:46:20 +0800 (CST)
Received: from [10.174.186.238] (10.174.186.238) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 20 Oct 2020 10:46:10 +0800
Subject: Re: [PATCH V2 00/14] fix some comment spelling errors
To: zhaolichang <zhaolichang@huawei.com>
References: <20201009064449.2336-1-zhaolichang@huawei.com>
CC: <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, "Laurent
 Vivier" <laurent@vivier.eu>
From: Lichang Zhao <zhaolichang@huawei.com>
Message-ID: <a5a68476-0ed8-08f9-f993-464317d798bf@huawei.com>
Date: Tue, 20 Oct 2020 10:45:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201009064449.2336-1-zhaolichang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.238]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhaolichang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 22:24:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Oct 2020 02:46:40 -0000

On 2020/10/9 14:44, zhaolichang wrote:
> I found that there are many spelling errors in the comments of qemu/target/.
> 
> I used spellcheck to check the spelling errors and found some errors in the folder.
> 
> 
> 
> The checkpatch.pl file in the Linux kernel can check spelling errors in patches.
> 
> I'm trying to add this function to the checkpatch.pl in qemu,
> 
> so that no similar spelling errors will occur in the feture.
> 
> It's not done yet and I will commit the patch when it's done.
> 
> 
> 
> v1 -> v2:
> 
>   add reviewed-by for patch
> 
> 
> 
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>
> 

ping
This series of patches have been reviewed. Can you help me to pull them?

