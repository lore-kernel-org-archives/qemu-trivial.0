Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJBH2-0000hg-RO
	for mharc-qemu-trivial@gnu.org; Sun, 17 Aug 2014 20:58:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJBGw-0000XY-If
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:58:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJBGr-0003Nm-Cx
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:58:06 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:28877)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJBGg-0003I7-ME; Sun, 17 Aug 2014 20:57:51 -0400
Received: from 172.24.2.119 (EHLO szxeml410-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAK62948; Mon, 18 Aug 2014 08:56:10 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml410-hub.china.huawei.com
	(10.82.67.137) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 18 Aug 2014 08:55:59 +0800
Message-ID: <53F14F1B.2020905@huawei.com>
Date: Mon, 18 Aug 2014 08:55:55 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-11-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814103622.GI31346@redhat.com>
In-Reply-To: <20140814103622.GI31346@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 10/10] block/vvfat: fix setbuf stream
 parameter may be NULL
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
X-List-Received-Date: Mon, 18 Aug 2014 00:58:11 -0000

On 2014/8/14 18:36, Michael S. Tsirkin wrote:
> On Thu, Aug 14, 2014 at 03:29:21PM +0800, zhanghailiang wrote:
>> From: Li Liu<john.liuli@huawei.com>
>>
>> fopen() may return NULL which will cause setbuf() segmentfault
>>
>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>> Signed-off-by: Li Liu<john.liuli@huawei.com>
>> ---
>>   block/vvfat.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/vvfat.c b/block/vvfat.c
>> index 70176b1..6889ea9 100644
>> --- a/block/vvfat.c
>> +++ b/block/vvfat.c
>> @@ -1084,7 +1084,10 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
>>
>>   DLOG(if (stderr == NULL) {
>>       stderr = fopen("vvfat.log", "a");
>> -    setbuf(stderr, NULL);
>> +
>> +    if (stderr) {
>> +        setbuf(stderr, NULL);
>> +    }
>>   })
>>
>>       opts = qemu_opts_create(&runtime_opts, NULL, 0,&error_abort);
>
> I would say assert on failure here.
> If one is trying to debug, seeing no output will just confuse
> matters more.
>

OK, i will change it to use assert here, thanks.


