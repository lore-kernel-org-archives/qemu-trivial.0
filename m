Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXRRU-0007sl-8C
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 05:36:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YXRRR-0007pu-8N
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 05:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YXRRO-0002Y7-2F
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 05:36:09 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:15741)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YXRRN-0002Xj-8y; Mon, 16 Mar 2015 05:36:05 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIN73273; Mon, 16 Mar 2015 17:30:36 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 16 Mar 2015 17:30:27 +0800
Message-ID: <5506A2B0.3030208@huawei.com>
Date: Mon, 16 Mar 2015 17:30:24 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	<qemu-devel@nongnu.org>
References: <1426244956-5316-1-git-send-email-zhaoshenglong@huawei.com>
	<87egopmkzo.fsf@linux.vnet.ibm.com>
In-Reply-To: <87egopmkzo.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] hw/9pfs/virtio-9p-proxy: Fix possible
	overflow
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
X-List-Received-Date: Mon, 16 Mar 2015 09:36:10 -0000

On 2015/3/16 15:58, Aneesh Kumar K.V wrote:
> Shannon Zhao <zhaoshenglong@huawei.com> writes:
> 
>> It's detected by coverity. As max of sockaddr_un.sun_path is
>> sizeof(helper.sun_path), should check the length of source
>> and use strncpy instead of strcpy.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>  hw/9pfs/virtio-9p-proxy.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
>> index 59c7445..fb1ab7b 100644
>> --- a/hw/9pfs/virtio-9p-proxy.c
>> +++ b/hw/9pfs/virtio-9p-proxy.c
>> @@ -1102,12 +1102,13 @@ static int connect_namedsocket(const char *path)
>>      int sockfd, size;
>>      struct sockaddr_un helper;
>>  
>> +    g_assert(strlen(path) < sizeof(helper.sun_path));
> 
> Since we are doing this from within Qemu, I did the below and folded
> that into other sockadd_un.sun_path size checking patch.
> 
> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
> index 6bb191ee6ab8..71b6198bbd22 100644
> --- a/hw/9pfs/virtio-9p-proxy.c
> +++ b/hw/9pfs/virtio-9p-proxy.c
> @@ -1100,6 +1100,10 @@ static int connect_namedsocket(const char *path)
>      int sockfd, size;
>      struct sockaddr_un helper;
>  
> +    if (strlen(path) >= sizeof(helper.sun_path)) {
> +        fprintf(stderr, "Socket name too large\n");
> +        return -1;
> +    }
>      sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
>      if (sockfd < 0) {
>          fprintf(stderr, "failed to create socket: %s\n", strerror(errno));
> 
> 
> Let me know if that is ok for you.
> 

That's OK. :-)

-- 
Thanks,
Shannon

>>      sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
>>      if (sockfd < 0) {
>>          fprintf(stderr, "failed to create socket: %s\n", strerror(errno));
>>          return -1;
>>      }
>> -    strcpy(helper.sun_path, path);
>> +    strncpy(helper.sun_path, path, sizeof(helper.sun_path));
>>      helper.sun_family = AF_UNIX;
>>      size = strlen(helper.sun_path) + sizeof(helper.sun_family);
>>      if (connect(sockfd, (struct sockaddr *)&helper, size) < 0) {
>> -- 
>> 1.8.3.1
> 
> 
> .
> 





