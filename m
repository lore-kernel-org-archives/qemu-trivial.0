Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqEda-00053K-0f
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 00:14:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XqEdT-0004kh-5n
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 00:14:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XqEdO-0007iK-BZ
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 00:13:59 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:34514)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XqEdA-0007gK-Gd; Mon, 17 Nov 2014 00:13:41 -0500
Received: from 172.24.2.119 (EHLO szxeml411-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CEN71818; Mon, 17 Nov 2014 13:13:33 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml411-hub.china.huawei.com
	(10.82.67.138) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 17 Nov 2014 13:13:23 +0800
Message-ID: <546983F3.9010707@huawei.com>
Date: Mon, 17 Nov 2014 13:13:23 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-trivial@nongnu.org>
References: <1415929163-12184-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<5465C130.1090401@redhat.com>
In-Reply-To: <5465C130.1090401@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] l2tpv3: fix possible double free
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
X-List-Received-Date: Mon, 17 Nov 2014 05:14:04 -0000

On 2014/11/14 16:45, Paolo Bonzini wrote:
>
>
> On 14/11/2014 02:39, zhanghailiang wrote:
>> freeaddrinfo(result) does not assign result = NULL, after frees it.
>> There will be a double free when it goes error case.
>> It is reported by covertiy.
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>>   net/l2tpv3.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
>> index 528d95b..f9e0c98 100644
>> --- a/net/l2tpv3.c
>> +++ b/net/l2tpv3.c
>> @@ -661,6 +661,7 @@ int net_init_l2tpv3(const NetClientOptions *opts,
>>           fd = -errno;
>>           error_report("l2tpv3_open : socket creation failed, errno = %d", -fd);
>>           freeaddrinfo(result);
>> +        result = NULL;
>
> You can just remove the call to freeaddrinfo().  I made the change and
> applied the patch.
>

This is a better choice ;) Thanks.

>>           goto outerr;
>>       }
>>       if (bind(fd, (struct sockaddr *) result->ai_addr, result->ai_addrlen)) {
>>
>
>



