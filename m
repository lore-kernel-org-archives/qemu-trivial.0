Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1pyq-0004Xu-Q7
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 03:29:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1pyo-0004W6-J5
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 03:29:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1pyl-0008GW-Fv
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 03:29:02 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:62578)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1pyl-0008Dp-0a
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 03:28:59 -0400
Received: from 172.24.1.60 (EHLO SZXEML424-HUB.china.huawei.com)
	([172.24.1.60])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CKS22688; Wed, 02 Nov 2016 15:28:28 +0800 (CST)
Received: from [127.0.0.1] (10.177.24.212) by SZXEML424-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.235.1; Wed, 2 Nov 2016
	15:28:19 +0800
To: Eric Blake <eblake@redhat.com>
References: <1477979511-15460-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<29570f3d-1a97-8b5a-7b0d-628c61004cc0@redhat.com>
CC: <armbru@redhat.com>, <qemu-trivial@nongnu.org>
From: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Message-ID: <58199590.6080805@huawei.com>
Date: Wed, 2 Nov 2016 15:28:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <29570f3d-1a97-8b5a-7b0d-628c61004cc0@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-trivial] [PATCH] qapi-schema: clarify 'colo' state for
 MigrationStatus
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Nov 2016 07:29:03 -0000

On 2016/11/1 22:28, Eric Blake wrote:
> On 11/01/2016 12:51 AM, zhanghailiang wrote:
>> VM can not get into colo state unless users enable 'x-colo'
>> capability for migration, Here it is necessary to clarify
>> this.
>>
>> Suggested-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>>   qapi-schema.json | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/qapi-schema.json b/qapi-schema.json
>> index 8a7b527..d580169 100644
>> --- a/qapi-schema.json
>> +++ b/qapi-schema.json
>> @@ -462,7 +462,8 @@
>>   #
>>   # @failed: some error occurred during migration process.
>>   #
>> -# @colo: VM is in the process of fault tolerance. (since 2.8)
>> +# @colo: VM is in the process of fault tolerance, VM can not get into this
>> +#        state unless colo capability is enabled for migration. (since 2.8)
>
> This hunk is for MigrationStatus; can you also add similar wording for
> the documentation of RunState?  Looking forward to v2.
>

OK, no problem, will send v2.


