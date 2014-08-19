Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJcux-00021V-RD
	for mharc-qemu-trivial@gnu.org; Tue, 19 Aug 2014 02:29:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJcur-0001tb-A0
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 02:29:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJcum-0007tc-9E
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 02:29:09 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:1297)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJcuk-0007r2-BL; Tue, 19 Aug 2014 02:29:04 -0400
Received: from 172.24.2.119 (EHLO szxeml403-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BYJ00144; Tue, 19 Aug 2014 14:28:40 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml403-hub.china.huawei.com
	(10.82.67.35) with Microsoft SMTP Server id 14.3.158.1; Tue, 19 Aug 2014
	14:28:34 +0800
Message-ID: <53F2EE8E.9080600@huawei.com>
Date: Tue, 19 Aug 2014 14:28:30 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1408348831-10788-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<CAFEAcA8r51UaT4bety0h3tTjMmyvb2UwZj6scuTLZUBBYJkxVw@mail.gmail.com>
	<53F1E69E.6030103@msgid.tls.msk.ru>
In-Reply-To: <53F1E69E.6030103@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Li Liu <john.liuli@huawei.com>,
	Luonengjun <luonengjun@huawei.com>, peter.huangpeng@huawei.com, QEMU
	Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v7] block/vvfat: assert
 return value of fopen which may fail
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
X-List-Received-Date: Tue, 19 Aug 2014 06:29:14 -0000

On 2014/8/18 19:42, Michael Tokarev wrote:
> 18.08.2014 12:06, Peter Maydell wrote:
>> On 18 August 2014 09:00, zhanghailiang<zhang.zhanghailiang@huawei.com>  wrote:
>>> From: Li Liu<john.liuli@huawei.com>
>>>
>>> fopen() may return NULL which will cause setbuf() segmentfault
>>>
>>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>>> Signed-off-by: Li Liu<john.liuli@huawei.com>
>>> ---
>>>   block/vvfat.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/block/vvfat.c b/block/vvfat.c
>>> index 70176b1..62023e1 100644
>>> --- a/block/vvfat.c
>>> +++ b/block/vvfat.c
>>> @@ -1084,6 +1084,7 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
>>>
>>>   DLOG(if (stderr == NULL) {
>>>       stderr = fopen("vvfat.log", "a");
>>> +    assert(stderr);
>>>       setbuf(stderr, NULL);
>>>   })
>>
>> An assertion is no better than a segfault.
>>
>> Better I think would be to just remove this whole lump of code
>> entirely. Lots of other files do debug printing to stderr without
>> attempting to open a file if stderr happens to be NULL, why
>> should vvfat.c be special?
>
> Indeed.  I've applied a patch which just removes these 6 lines of code
> (and sent it to the list too, for review).
>
> Thanks,
>
> /mjt
>
> .
>
OK, thanks.:)


