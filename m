Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVETK-0005dl-GH
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 03:20:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVETH-0005Qi-5c
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:20:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVETG-0003j2-1z
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:20:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34331)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVETA-0003gn-RS; Tue, 10 Mar 2015 03:20:49 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3897A41302;
	Tue, 10 Mar 2015 10:20:48 +0300 (MSK)
Message-ID: <54FE9B50.3040504@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 10:20:48 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>, qemu-devel@nongnu.org
References: <1425966860-13605-1-git-send-email-mjt@msgid.tls.msk.ru>
	<54FE9A16.7000108@huawei.com>
In-Reply-To: <54FE9A16.7000108@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Tue, 10 Mar 2015 07:20:56 -0000

10.03.2015 10:15, Gonglei wrote:
> On 2015/3/10 13:54, Michael Tokarev wrote:
>> Don't compare syscall return with -1, use "<0" condition.
>> Don't introduce useless local variables when we already
>> have similar variable
>> Rename local variable to be consistent with other usages
>>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>>  hw/9pfs/virtio-9p-proxy.c | 12 +++++-------
>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
>> index 59c7445..a01804a 100644
>> --- a/hw/9pfs/virtio-9p-proxy.c
>> +++ b/hw/9pfs/virtio-9p-proxy.c
>> @@ -696,9 +696,9 @@ static ssize_t proxy_preadv(FsContext *ctx, V9fsFidOpenState *fs,
>>  #ifdef CONFIG_PREADV
>>      return preadv(fs->fd, iov, iovcnt, offset);
>>  #else
>> -    int err = lseek(fs->fd, offset, SEEK_SET);
>> -    if (err == -1) {
>> -        return err;
>> +    int ret = lseek(fs->fd, offset, SEEK_SET);
>> +    if (err < 0)
>> +        return ret;
> 
> The above code fragment is confused.

Sorry I don't understand, can you elaborate please?
Note I haven't changed much in there, just variable
rename and changed the condition within if: s/== -1/< 0/.

(BTW, a code fragment can't be confused, it might be
confusing I think, with a reader being confused.
A confused code is um.. something -- a code who doesn't
know what to do... ;)  Sorry can't resist ;)

Thanks,

/mjt

