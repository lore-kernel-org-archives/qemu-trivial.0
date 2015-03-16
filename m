Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXMUh-0004wk-BC
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 00:19:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YXMUf-0004tv-5R
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 00:19:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YXMUb-0001Eo-6i
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 00:19:09 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:7974)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YXMUa-0001EL-D2; Mon, 16 Mar 2015 00:19:05 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKV39114; Mon, 16 Mar 2015 12:18:45 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 16 Mar 2015 12:18:37 +0800
Message-ID: <5506599B.8070608@huawei.com>
Date: Mon, 16 Mar 2015 12:18:35 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, <qemu-devel@nongnu.org>
References: <1426326735-11448-1-git-send-email-zhaoshenglong@huawei.com>
	<5506316D.2050001@huawei.com>
In-Reply-To: <5506316D.2050001@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	sw@weilnetz.de, mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] qga/commands-posix: Fix resource leak
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
X-List-Received-Date: Mon, 16 Mar 2015 04:19:10 -0000

On 2015/3/16 9:27, zhanghailiang wrote:
> On 2015/3/14 17:52, Shannon Zhao wrote:
>> It's detected by coverity. Close the dirfd.
>>
> 
> Reviewed-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> 

Hi zhanghailiang,

Thanks for your review.

Shannon

>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>      v1->v2: close after use [Stefan Weil]
>> ---
>>   qga/commands-posix.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index d5bb5cb..ba8de62 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -2283,6 +2283,7 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
>>
>>       buf = g_malloc0(20);
>>       ga_read_sysfs_file(dirfd, "block_size_bytes", buf, 20, &local_err);
>> +    close(dirfd);
>>       if (local_err) {
>>           g_free(buf);
>>           error_propagate(errp, local_err);
>>
> 
> 
> 
> .
> 


