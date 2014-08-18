Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJLKn-0006q9-1I
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 07:42:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLKh-0006hE-0E
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:42:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLKc-0007rx-6l
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:42:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XJLKR-0007oT-AT; Mon, 18 Aug 2014 07:42:23 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7E2124380E;
	Mon, 18 Aug 2014 15:42:22 +0400 (MSK)
Message-ID: <53F1E69E.6030103@msgid.tls.msk.ru>
Date: Mon, 18 Aug 2014 15:42:22 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1408348831-10788-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<CAFEAcA8r51UaT4bety0h3tTjMmyvb2UwZj6scuTLZUBBYJkxVw@mail.gmail.com>
In-Reply-To: <CAFEAcA8r51UaT4bety0h3tTjMmyvb2UwZj6scuTLZUBBYJkxVw@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Li Liu <john.liuli@huawei.com>, Luonengjun <luonengjun@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>, peter.huangpeng@huawei.com,
	Stefan Hajnoczi <stefanha@redhat.com>
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
X-List-Received-Date: Mon, 18 Aug 2014 11:42:44 -0000

18.08.2014 12:06, Peter Maydell wrote:
> On 18 August 2014 09:00, zhanghailiang <zhang.zhanghailiang@huawei.com> wrote:
>> From: Li Liu <john.liuli@huawei.com>
>>
>> fopen() may return NULL which will cause setbuf() segmentfault
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> Signed-off-by: Li Liu <john.liuli@huawei.com>
>> ---
>>  block/vvfat.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/block/vvfat.c b/block/vvfat.c
>> index 70176b1..62023e1 100644
>> --- a/block/vvfat.c
>> +++ b/block/vvfat.c
>> @@ -1084,6 +1084,7 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
>>
>>  DLOG(if (stderr == NULL) {
>>      stderr = fopen("vvfat.log", "a");
>> +    assert(stderr);
>>      setbuf(stderr, NULL);
>>  })
> 
> An assertion is no better than a segfault.
> 
> Better I think would be to just remove this whole lump of code
> entirely. Lots of other files do debug printing to stderr without
> attempting to open a file if stderr happens to be NULL, why
> should vvfat.c be special?

Indeed.  I've applied a patch which just removes these 6 lines of code
(and sent it to the list too, for review).

Thanks,

/mjt

