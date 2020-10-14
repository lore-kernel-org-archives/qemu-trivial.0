Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSViR-00058n-Sq
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 21:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kSViP-000572-Oz; Tue, 13 Oct 2020 21:36:29 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:48758 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kSViO-0002z9-1S; Tue, 13 Oct 2020 21:36:29 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 70D1044DDD4061F96BB7;
 Wed, 14 Oct 2020 09:36:22 +0800 (CST)
Received: from [10.174.186.14] (10.174.186.14) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Wed, 14 Oct 2020 09:36:15 +0800
Subject: Re: [PATCH v2 1/8] migration: Do not use C99 // comments
To: Zheng Chuan <zhengchuan@huawei.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <quintela@redhat.com>, 
 <alex.chen@huawei.com>, <wanghao232@huawei.com>
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-2-git-send-email-yubihong@huawei.com>
 <20201013093905.GB2920@work-vm>
 <ae6666c0-e68e-3541-274e-de25d4bd3a22@huawei.com>
 <f764ce51-60ee-0b84-a357-fb2cffc9d197@huawei.com>
From: Bihong Yu <yubihong@huawei.com>
Message-ID: <09f83ad8-95b0-0d4b-0493-804b6c380d91@huawei.com>
Date: Wed, 14 Oct 2020 09:36:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f764ce51-60ee-0b84-a357-fb2cffc9d197@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.14]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 21:36:23
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
X-List-Received-Date: Wed, 14 Oct 2020 01:36:30 -0000

OK, I will modify it later.

On 2020/10/14 9:29, Zheng Chuan wrote:
> Also DEBUG_CACHE in migration/page_cache.c is need to rebase on trace_calls.
> 
> On 2020/10/13 21:20, Bihong Yu wrote:
>> Thank you for your review. OK, I will try to rewrite the DPRINTF to use trace_ instead.
>>
>> On 2020/10/13 17:39, Dr. David Alan Gilbert wrote:
>>> * Bihong Yu (yubihong@huawei.com) wrote:
>>>> Signed-off-by: Bihong Yu <yubihong@huawei.com>
>>>> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
>>>
>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>
>>> another task at some point would be to rewrite the DPRINTF's in
>>> migration/block.c to use trace_ instead.
>>>
>>>> ---
>>>>  migration/block.c | 2 +-
>>>>  migration/rdma.c  | 2 +-
>>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/migration/block.c b/migration/block.c
>>>> index 737b649..4b8576b 100644
>>>> --- a/migration/block.c
>>>> +++ b/migration/block.c
>>>> @@ -40,7 +40,7 @@
>>>>  #define MAX_IO_BUFFERS 512
>>>>  #define MAX_PARALLEL_IO 16
>>>>  
>>>> -//#define DEBUG_BLK_MIGRATION
>>>> +/* #define DEBUG_BLK_MIGRATION */
>>>>  
>>>>  #ifdef DEBUG_BLK_MIGRATION
>>>>  #define DPRINTF(fmt, ...) \
>>>> diff --git a/migration/rdma.c b/migration/rdma.c
>>>> index 0340841..0eb42b7 100644
>>>> --- a/migration/rdma.c
>>>> +++ b/migration/rdma.c
>>>> @@ -1288,7 +1288,7 @@ const char *print_wrid(int wrid)
>>>>   * workload information or LRU information is available, do not attempt to use
>>>>   * this feature except for basic testing.
>>>>   */
>>>> -//#define RDMA_UNREGISTRATION_EXAMPLE
>>>> +/* #define RDMA_UNREGISTRATION_EXAMPLE */
>>>>  
>>>>  /*
>>>>   * Perform a non-optimized memory unregistration after every transfer
>>>> -- 
>>>> 1.8.3.1
>>>>
>> .
>>
> 

