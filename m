Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVEaK-0000H5-Mp
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 03:28:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YVEaI-0000Fj-7i
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:28:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YVEaE-0006iQ-5x
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:28:10 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:31681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YVEaC-0006hw-Ew; Tue, 10 Mar 2015 03:28:06 -0400
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCX42745; Tue, 10 Mar 2015 15:28:00 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 10 Mar 2015 15:27:58 +0800
Message-ID: <54FE9CEC.9060704@huawei.com>
Date: Tue, 10 Mar 2015 15:27:40 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1425966860-13605-1-git-send-email-mjt@msgid.tls.msk.ru>
	<54FE9A16.7000108@huawei.com> <54FE9B50.3040504@msgid.tls.msk.ru>
In-Reply-To: <54FE9B50.3040504@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.54FE9D01.0031, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c019d04ab648d3a9fabdbeb5660cbb4b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] 9pfs-proxy: tiny cleanups
 in proxy_pwritev and proxy_preadv
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
X-List-Received-Date: Tue, 10 Mar 2015 07:28:11 -0000

On 2015/3/10 15:20, Michael Tokarev wrote:
> 10.03.2015 10:15, Gonglei wrote:
>> On 2015/3/10 13:54, Michael Tokarev wrote:
>>> Don't compare syscall return with -1, use "<0" condition.
>>> Don't introduce useless local variables when we already
>>> have similar variable
>>> Rename local variable to be consistent with other usages
>>>
>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>> ---
>>>  hw/9pfs/virtio-9p-proxy.c | 12 +++++-------
>>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
>>> index 59c7445..a01804a 100644
>>> --- a/hw/9pfs/virtio-9p-proxy.c
>>> +++ b/hw/9pfs/virtio-9p-proxy.c
>>> @@ -696,9 +696,9 @@ static ssize_t proxy_preadv(FsContext *ctx, V9fsFidOpenState *fs,
>>>  #ifdef CONFIG_PREADV
>>>      return preadv(fs->fd, iov, iovcnt, offset);
>>>  #else
>>> -    int err = lseek(fs->fd, offset, SEEK_SET);
>>> -    if (err == -1) {
>>> -        return err;
>>> +    int ret = lseek(fs->fd, offset, SEEK_SET);
>>> +    if (err < 0)
>>> +        return ret;
>>
>> The above code fragment is confused.
> 
> Sorry I don't understand, can you elaborate please?
> Note I haven't changed much in there, just variable
> rename and changed the condition within if: s/== -1/< 0/.
> 
You use 'ret' instead of 'err', but remain using 'if (err < 0)',
and missing '{' at the end of if statement.

hw/9pfs/virtio-9p-proxy.c: In function ‘proxy_preadv’:
hw/9pfs/virtio-9p-proxy.c:700: error: ‘err’ undeclared (first use in this function)
hw/9pfs/virtio-9p-proxy.c:700: error: (Each undeclared identifier is reported only once
hw/9pfs/virtio-9p-proxy.c:700: error: for each function it appears in.)
hw/9pfs/virtio-9p-proxy.c:702: warning: control reaches end of non-void function
hw/9pfs/virtio-9p-proxy.c: At top level:
hw/9pfs/virtio-9p-proxy.c:702: error: expected identifier or ‘(’ before ‘else’
hw/9pfs/virtio-9p-proxy.c:706: error: expected identifier or ‘(’ before ‘}’ token
make: *** [hw/9pfs/virtio-9p-proxy.o] Error 1

Regards,
-Gonglei
> (BTW, a code fragment can't be confused, it might be
> confusing I think, with a reader being confused.
> A confused code is um.. something -- a code who doesn't
> know what to do... ;)  Sorry can't resist ;)
> 
> Thanks,
> 
> /mjt
> 



