Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcnFk-0002pO-Uw
	for mharc-qemu-trivial@gnu.org; Fri, 10 Oct 2014 23:21:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XcnFf-0002hh-3W
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 23:21:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XcnFa-0005II-AX
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 23:21:51 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:38367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XcnFP-0005GU-Ta; Fri, 10 Oct 2014 23:21:36 -0400
Received: from 172.24.2.119 (EHLO szxeml448-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCS32347; Sat, 11 Oct 2014 11:21:25 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml448-hub.china.huawei.com
	(10.82.67.191) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 11 Oct 2014 11:21:14 +0800
Message-ID: <5438A223.2040402@huawei.com>
Date: Sat, 11 Oct 2014 11:21:07 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1412996048-6384-1-git-send-email-arei.gonglei@huawei.com>
	<54389FB1.8040207@huawei.com>
In-Reply-To: <54389FB1.8040207@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] oslib-posix: change free to
	g_free
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
X-List-Received-Date: Sat, 11 Oct 2014 03:21:56 -0000

On 2014/10/11 11:10, Zhanghailiang wrote:

> On 2014/10/11 10:54, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> The caller of qemu_vfree() maybe not check whether parameter
>> ptr pointer is NULL or not, such as vpc_open().
>> Using g_free() is more safe.
>>
> 
> It seems that free(NULL) is harmless.
> 

Actually, I had noted that C standard says it is a no-operation.
But that doesn't mean that every C-library handles it like that.
Some people saw crashes for free(NULL), so it's best to avoid
calling the free in the first place (caller) or using  g_free() in qemu_vfree().

Best regards,
-Gonglei

>  From section 7.20.3.2/2 of the C99 standard:
> The free function causes the space pointed to by ptr to be deallocated, that is,
> made available for further allocation. If ptr is a null pointer, no action occurs.
> 
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>   util/oslib-posix.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
>> index 016a047..ca435d0 100644
>> --- a/util/oslib-posix.c
>> +++ b/util/oslib-posix.c
>> @@ -153,7 +153,7 @@ void *qemu_anon_ram_alloc(size_t size)
>>   void qemu_vfree(void *ptr)
>>   {
>>       trace_qemu_vfree(ptr);
>> -    free(ptr);
>> +    g_free(ptr);
>>   }
>>
>>   void qemu_anon_ram_free(void *ptr, size_t size)
>>
> 
> 




