Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjnKq-0006Z8-Bd
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 06:52:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjnKk-0006Sz-2C
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 06:52:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjnKf-0007Oq-9z
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 06:52:02 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:32800)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XjnKd-0007H0-K3; Thu, 30 Oct 2014 06:51:57 -0400
Received: from 172.24.2.119 (EHLO szxeml409-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWI91009; Thu, 30 Oct 2014 18:51:41 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml409-hub.china.huawei.com
	(10.82.67.136) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 30 Oct 2014 18:51:34 +0800
Message-ID: <54521836.3070701@huawei.com>
Date: Thu, 30 Oct 2014 18:51:34 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1414579937-1064-1-git-send-email-arei.gonglei@huawei.com>
	<5451F0CC.3030100@msgid.tls.msk.ru>
In-Reply-To: <5451F0CC.3030100@msgid.tls.msk.ru>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A02020A.5452183D.00FC, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: bf5fa6d0987d6398441e4c6dffcdd5c4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"mst@redhat.com" <mst@redhat.com>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"aneesh.kumar@linux.vnet.ibm.com" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] virtio-9p-proxy: Fix sockfd leak and
 modify the check logic
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
X-List-Received-Date: Thu, 30 Oct 2014 10:52:07 -0000

On 2014/10/30 16:03, Michael Tokarev wrote:

> 29.10.2014 13:52, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> If connect() return false, the sockfd will leak,
>> meanwhile proxy_init() can't check the return value
>> of connect_namedsocket(), maybe cause unpredictable
>> results.
>>
>> Let's move the sock_id check logic out, which can
>> check both if and else statements.
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  hw/9pfs/virtio-9p-proxy.c | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
>> index b57966d..1c3aa5f 100644
>> --- a/hw/9pfs/virtio-9p-proxy.c
>> +++ b/hw/9pfs/virtio-9p-proxy.c
>> @@ -1112,6 +1112,7 @@ static int connect_namedsocket(const char *path)
>>      size = strlen(helper.sun_path) + sizeof(helper.sun_family);
>>      if (connect(sockfd, (struct sockaddr *)&helper, size) < 0) {
>>          fprintf(stderr, "socket error\n");
>> +        close(sockfd);
>>          return -1;
>>      }
>>  
>> @@ -1152,11 +1153,12 @@ static int proxy_init(FsContext *ctx)
>>          sock_id = connect_namedsocket(ctx->fs_root);
>>      } else {
>>          sock_id = atoi(ctx->fs_root);
>> -        if (sock_id < 0) {
>> -            fprintf(stderr, "socket descriptor not initialized\n");
>> -            g_free(proxy);
>> -            return -1;
>> -        }
>> +    }
>> +
>> +    if (sock_id < 0) {
>> +        fprintf(stderr, "socket descriptor not initialized\n");
>> +        g_free(proxy);
>> +        return -1;
>>      }
>>      g_free(ctx->fs_root);
>>      ctx->fs_root = NULL;
> 
> 
> Um. I'm applying 2 patches instead of this one.  First:
> 
> 

Ok, Thanks for your work.

Best regards,
-Gonglei

> 
> virtio-9p-proxy: Fix sockfd leak
> 
> If connect() in connect_namedsocket() return false, the sockfd will leak.
> Plug it.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> 
> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
> index b57966d..e6bbb06 100644
> --- a/hw/9pfs/virtio-9p-proxy.c
> +++ b/hw/9pfs/virtio-9p-proxy.c
> @@ -1112,6 +1112,7 @@ static int connect_namedsocket(const char *path)
>      size = strlen(helper.sun_path) + sizeof(helper.sun_family);
>      if (connect(sockfd, (struct sockaddr *)&helper, size) < 0) {
>          fprintf(stderr, "socket error\n");
> +        close(sockfd);
>          return -1;
>      }
> 
> 
> 
> And second.  Note the slight change in logic and error messages
> compared with your version - there's no need to print error
> message twice if connect_namedsocket() returned -1 (it already
> printed error message).
> 
> virtio-9p-proxy: fix error return in proxy_init()
> 
> proxy_init() does not check the return value of connect_namedsocket(),
> fix this by rearranging code a little bit.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
> index e6bbb06..2ec211b 100644
> --- a/hw/9pfs/virtio-9p-proxy.c
> +++ b/hw/9pfs/virtio-9p-proxy.c
> @@ -1155,10 +1155,12 @@ static int proxy_init(FsContext *ctx)
>          sock_id = atoi(ctx->fs_root);
>          if (sock_id < 0) {
>              fprintf(stderr, "socket descriptor not initialized\n");
> -            g_free(proxy);
> -            return -1;
>          }
>      }
> +    if (sock_id < 0) {
> +        g_free(proxy);
> +        return -1;
> +    }
>      g_free(ctx->fs_root);
>      ctx->fs_root = NULL;
> 
> 
> And I'll immediately send another followup patch to improve
> error messages in connect_namedsocket(), -- these are awful.
> 
> /mjt




