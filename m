Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V0GEG-0005b8-W7
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2013 15:20:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V0GEE-0005Xb-G1
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 15:20:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V0GEC-0006da-SD
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 15:20:34 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1V0G5J-0001iu-DJ; Fri, 19 Jul 2013 15:11:21 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1BD4072809FD; Fri, 19 Jul 2013 21:11:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ya4XV5Ld6bL3; Fri, 19 Jul 2013 21:11:07 +0200 (CEST)
Received: from [192.168.178.35] (p54AD9437.dip0.t-ipconnect.de [84.173.148.55])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	C25AD72809FC; Fri, 19 Jul 2013 21:11:06 +0200 (CEST)
Message-ID: <51E98F49.7010300@weilnetz.de>
Date: Fri, 19 Jul 2013 21:11:05 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1371377676-18809-1-git-send-email-sw@weilnetz.de>
	<87fvvubt9s.fsf@in.ibm.com>
In-Reply-To: <87fvvubt9s.fsf@in.ibm.com>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Anthony Liguori <aliguori@us.ibm.com>, "M. Mohan Kumar" <mohan@in.ibm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/9pfs: Fix potential
 memory leak and avoid reuse of freed memory
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
X-List-Received-Date: Fri, 19 Jul 2013 19:20:35 -0000

Am 04.07.2013 10:53, schrieb M. Mohan Kumar:
> Stefan Weil <sw@weilnetz.de> writes:
>
>> The leak was reported by cppcheck.
>>
>> Function proxy_init also calls g_free for ctx->fs_root.
>> Avoid reuse of this memory by setting ctx->fs_root to NULL.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: M. Mohan Kumar <mohan@in.ibm.com>
>> ---
>>
>> Hi,
>>
>> I'm not sure whether ctx->fs_root should also be freed in the error case.
>> Please feel free to modify my patch if needed.
>>
>> Regards
>> Stefan Weil
>>
>>  hw/9pfs/virtio-9p-proxy.c |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
>> index 8ba2959..5f44bb7 100644
>> --- a/hw/9pfs/virtio-9p-proxy.c
>> +++ b/hw/9pfs/virtio-9p-proxy.c
>> @@ -1153,10 +1153,12 @@ static int proxy_init(FsContext *ctx)
>>          sock_id = atoi(ctx->fs_root);
>>          if (sock_id < 0) {
>>              fprintf(stderr, "socket descriptor not initialized\n");
>> +            g_free(proxy);
>>              return -1;
>>          }
>>      }
>>      g_free(ctx->fs_root);
>> +    ctx->fs_root = NULL;
>>
>>      proxy->in_iovec.iov_base  = g_malloc(PROXY_MAX_IO_SZ + PROXY_HDR_SZ);
>>      proxy->in_iovec.iov_len   = PROXY_MAX_IO_SZ + PROXY_HDR_SZ;
>> -- 
>> 1.7.10.4


Please add this patch to the qemu-trivial queue:
http://patchwork.ozlabs.org/patch/251666/

Thanks,
Stefan


