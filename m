Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZsmK-0002Kz-5Q
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 04:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZsmI-0002J0-61; Tue, 03 Nov 2020 04:38:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZsmG-0000hE-3K; Tue, 03 Nov 2020 04:38:57 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQPqW6RtDzLsV4;
 Tue,  3 Nov 2020 17:38:47 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 17:38:43 +0800
Message-ID: <5FA12523.5000603@huawei.com>
Date: Tue, 3 Nov 2020 17:38:43 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>
CC: <mreitz@redhat.com>, <qemu-block@nongnu.org>, QEMU
 <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 <zhang.zhanghailiang@huawei.com>
Subject: Re: [PATCH] block/vvfat: Fix bad printf format specifiers
References: <5F9FF319.7060108@huawei.com>
 <20201103093007.GB5509@merkur.fritz.box>
In-Reply-To: <20201103093007.GB5509@merkur.fritz.box>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:52:53
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 03 Nov 2020 09:38:58 -0000

On 2020/11/3 17:30, Kevin Wolf wrote:
> Am 02.11.2020 um 12:52 hat AlexChen geschrieben:
>> We should use printf format specifier "%u" instead of "%d" for
>> argument of type "unsigned int".
>> In addition, fix two error format problems found by checkpatch.pl:
>> ERROR: space required after that ',' (ctx:VxV)
>> +        fprintf(stderr,"%s attributes=0x%02x begin=%u size=%d\n",
>>                        ^
>> ERROR: line over 90 characters
>> +        fprintf(stderr, "%d, %s (%u, %d)\n", i, commit->path ? commit->path : "(null)", commit->param.rename.cluster, commit->action);
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>> ---
>>  block/vvfat.c | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/block/vvfat.c b/block/vvfat.c
>> index 5abb90e7c7..cc2ec9af21 100644
>> --- a/block/vvfat.c
>> +++ b/block/vvfat.c
>> @@ -1437,7 +1437,7 @@ static void print_direntry(const direntry_t* direntry)
>>          for(i=0;i<11;i++)
>>              ADD_CHAR(direntry->name[i]);
>>          buffer[j] = 0;
>> -        fprintf(stderr,"%s attributes=0x%02x begin=%d size=%d\n",
>> +        fprintf(stderr, "%s attributes=0x%02x begin=%u size=%d\n",
>>                  buffer,
>>                  direntry->attributes,
>>                  begin_of_direntry(direntry),le32_to_cpu(direntry->size));
> 
> direntry->size is unsigned, too, so if we want to fix this, I think we
> should fix both specifiers.
> 
> The rest of the patch looks good.
> 

Thanks for your review, I will fix it in my patch V2.

Thanks,
Alex


