Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWPrE-0000nd-Fh
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 09:42:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWMDy-0007A3-2x
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 05:49:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWMDu-0001HB-6J
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 05:49:46 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:5481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWM8z-00088o-53; Fri, 13 Mar 2015 05:44:37 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIL12271; Fri, 13 Mar 2015 17:44:08 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 13 Mar 2015 17:43:56 +0800
Message-ID: <5502B158.6060905@huawei.com>
Date: Fri, 13 Mar 2015 17:43:52 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	<qemu-devel@nongnu.org>
References: <1426225687-12104-1-git-send-email-zhaoshenglong@huawei.com>
	<87zj7h9u2o.fsf@linux.vnet.ibm.com>
In-Reply-To: <87zj7h9u2o.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
X-Mailman-Approved-At: Fri, 13 Mar 2015 09:42:30 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] hw/9pfs/virtio-9p-posix-acl: Fix
	out-of-bounds access
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
X-List-Received-Date: Fri, 13 Mar 2015 09:49:47 -0000

On 2015/3/13 16:31, Aneesh Kumar K.V wrote:
> Shannon Zhao <zhaoshenglong@huawei.com> writes:
> 
>> It's detected by coverity. Fix out-of-bounds access of the function mp_dacl_listxattr.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>  hw/9pfs/virtio-9p-posix-acl.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/9pfs/virtio-9p-posix-acl.c b/hw/9pfs/virtio-9p-posix-acl.c
>> index 803d9d9..09dad07 100644
>> --- a/hw/9pfs/virtio-9p-posix-acl.c
>> +++ b/hw/9pfs/virtio-9p-posix-acl.c
>> @@ -114,7 +114,7 @@ static ssize_t mp_dacl_listxattr(FsContext *ctx, const char *path,
>>      }
>>
>>      /* len includes the trailing NUL */
>> -    memcpy(value, ACL_ACCESS, len);
>> +    memcpy(value, ACL_DEFAULT, len);
>>      return 0;
>>  }
> 
> Applied.
> 
Thanks :-)

> Thanks
> -aneesh
> 
> 
> .
> 


