Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWiAV-0004Sl-B2
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 05:15:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWiAO-0004Sa-E1
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 05:15:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWiAK-0007NX-8P
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 05:15:32 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:26788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWiAJ-00076R-FU; Sat, 14 Mar 2015 05:15:28 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BDC01944; Sat, 14 Mar 2015 17:14:46 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 14 Mar 2015 17:14:34 +0800
Message-ID: <5503FBF7.3090404@huawei.com>
Date: Sat, 14 Mar 2015 17:14:31 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, <qemu-devel@nongnu.org>
References: <1426303825-9040-1-git-send-email-zhaoshenglong@huawei.com>
	<5503DB1F.8080305@weilnetz.de>
In-Reply-To: <5503DB1F.8080305@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A0C0203.5503FC06.022A, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7a705873c94672b8101ca320a8273d7c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com,
	zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga/commands-posix: Fix
	resource leak
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Mar 2015 09:15:37 -0000

On 2015/3/14 14:54, Stefan Weil wrote:
> Am 14.03.2015 um 04:30 schrieb Shannon Zhao:
>> It's detected by coverity. Close the dirfd.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>   qga/commands-posix.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index d5bb5cb..cbf1c80 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -2285,6 +2285,7 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
>>       ga_read_sysfs_file(dirfd, "block_size_bytes", buf, 20, &local_err);
> 
> Why not closing it here? It's no longer needed.
> 

Ok， will fix this.

Thanks,
Shannon
>>       if (local_err) {
>>           g_free(buf);
>> +        close(dirfd);
>>           error_propagate(errp, local_err);
>>           return NULL;
>>       }
>> @@ -2293,6 +2294,7 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
>>       info->size = strtol(buf, NULL, 16); /* the unit is bytes */
>>         g_free(buf);
>> +    close(dirfd);
>>         return info;
>>   }
> 
> 
> .
> 


