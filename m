Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7H2V-0006d2-Fd
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 01:46:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Z7H2T-0006bA-Nw
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 01:46:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Z7H2Q-0005du-H7
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 01:46:29 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:55221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Z7H2P-0005da-Mz
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 01:46:26 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CPV80384; Tue, 23 Jun 2015 13:46:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 23 Jun 2015 13:46:09 +0800
Message-ID: <5588F2A0.8040001@huawei.com>
Date: Tue, 23 Jun 2015 13:46:08 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Scott Feldman <sfeldma@gmail.com>
References: <1435023111-8780-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<CAE4R7bCCSh6dd_t42rzSiYs_+nEc8FreT2ij1F0iRGem+TjWow@mail.gmail.com>
In-Reply-To: <CAE4R7bCCSh6dd_t42rzSiYs_+nEc8FreT2ij1F0iRGem+TjWow@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?SmnFmcOt?= =?UTF-8?B?IFDDrXJrbw==?= <jiri@resnulli.us>,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] rocker: Fix memory leak reported by
	coverity
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
X-List-Received-Date: Tue, 23 Jun 2015 05:46:30 -0000

On 2015/6/23 13:23, Scott Feldman wrote:
> On Mon, Jun 22, 2015 at 6:31 PM, zhanghailiang
> <zhang.zhanghailiang@huawei.com> wrote:
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>>   hw/net/rocker/rocker.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
>> index 4d25842..d06116e 100644
>> --- a/hw/net/rocker/rocker.c
>> +++ b/hw/net/rocker/rocker.c
>> @@ -103,6 +103,7 @@ RockerSwitch *qmp_query_rocker(const char *name, Error **errp)
>>       if (!r) {
>>           error_set(errp, ERROR_CLASS_GENERIC_ERROR,
>>                     "rocker %s not found", name);
>> +        g_free(rocker);
>>           return NULL;
>>       }
>
> I'll post a patch to fix this one this way, to report alloc failure:
>

Yes, this is another way to fix this problem~

> --- a/hw/net/rocker/rocker.c
> +++ b/hw/net/rocker/rocker.c
> @@ -96,7 +96,7 @@ World *rocker_get_world(Rocker *r, enum
> rocker_world_type type)
>
>   RockerSwitch *qmp_query_rocker(const char *name, Error **errp)
>   {
> -    RockerSwitch *rocker = g_malloc0(sizeof(*rocker));
> +    RockerSwitch *rocker;
>       Rocker *r;
>
>       r = rocker_find(name);
> @@ -106,6 +106,12 @@ RockerSwitch *qmp_query_rocker(const char *name,
> Error **errp)
>           return NULL;
>       }
>
> +    rocker = g_malloc0(sizeof(*rocker));

It's unnecessary to check the return value of 'g_malloc0', because it only
return NULL when the size is 0, obviously, here it is not zero.(sizeof(*rocker)).

> +    if (!rocker) {
> +        error_set(errp, ERROR_CLASS_GENERIC_ERROR, "out-of-memory");
> +        return NULL;
> +    }
> +
>
>



