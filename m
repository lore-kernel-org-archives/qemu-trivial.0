Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bzLBw-00053N-Cq
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2016 06:12:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bzLBr-00050o-R2
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 06:12:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bzLBq-0003dr-Rx
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 06:12:11 -0400
Received: from [59.151.112.132] (port=61391 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bzLBl-0003bm-PG; Wed, 26 Oct 2016 06:12:06 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12339389"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Oct 2016 18:12:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 134AA466F74A;
	Wed, 26 Oct 2016 18:11:57 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 26 Oct 2016 18:11:56 +0800
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>,
	<qemu-trivial@nongnu.org>
References: <1477466334-4078-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<b324af65-ea5e-e39b-75c2-0c54b941bce7@redhat.com>
CC: <peter.maydell@linaro.org>, <armbru@redhat.com>, <mst@redhat.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <581081EE.5070106@cn.fujitsu.com>
Date: Wed, 26 Oct 2016 18:14:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <b324af65-ea5e-e39b-75c2-0c54b941bce7@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 134AA466F74A.AE21E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util/mmap-alloc: check
 parameter before using
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Oct 2016 10:12:15 -0000



On 10/26/2016 04:10 PM, Thomas Huth wrote:
> On 26.10.2016 09:18, Cao jin wrote:
>> Also refactor some code hunk for readability
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   util/mmap-alloc.c | 20 +++++++++-----------
>>   1 file changed, 9 insertions(+), 11 deletions(-)
>>
>> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
>> index 5a85aa3..92c123a 100644
>> --- a/util/mmap-alloc.c
>> +++ b/util/mmap-alloc.c
>> @@ -41,6 +41,11 @@ size_t qemu_fd_getpagesize(int fd)
>>
>>   void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
>>   {
>> +    /* Make sure align is a power of 2 */
>> +    assert(!(align & (align - 1)));
>> +    /* Always align to host page size */
>> +    assert(align >= getpagesize());
>
> Now you've moved code before the declaration of the local variables.
> That's also some kind of ugly (and might not work with older versions of
> C compilers?)...
>

Yes, I think it is ugly too, my personal taste is declaration should 
exist at the head of the function body, then parameters' check, then 
assignment to the variables in separate lines, but for this patch, I 
think that won't be liked by maintainers:)

>>       /*
>>        * Note: this always allocates at least one extra page of virtual address
>>        * space, even if size is already aligned.
>> @@ -68,11 +73,6 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
>>           return MAP_FAILED;
>>       }
>>
>> -    /* Make sure align is a power of 2 */
>> -    assert(!(align & (align - 1)));
>> -    /* Always align to host page size */
>> -    assert(align >= getpagesize());
>
> ... so maybe simply move the setting of "offset" (which requires
> "align") here right in front of the mmap() instead?

A better choice to me:) Thanks

Cao jin

>
>>       ptr1 = mmap(ptr + offset, size, PROT_READ | PROT_WRITE,
>>                   MAP_FIXED |
>>                   (fd == -1 ? MAP_ANONYMOUS : 0) |
>> @@ -83,22 +83,20 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
>>           return MAP_FAILED;
>>       }
>>
>> -    ptr += offset;
>> -    total -= offset;
>> -
>>       if (offset > 0) {
>> -        munmap(ptr - offset, offset);
>> +        munmap(ptr, offset);
>>       }
>>
>>       /*
>>        * Leave a single PROT_NONE page allocated after the RAM block, to serve as
>>        * a guard page guarding against potential buffer overflows.
>>        */
>> +    total -= offset;
>>       if (total > size + getpagesize()) {
>> -        munmap(ptr + size + getpagesize(), total - size - getpagesize());
>> +        munmap(ptr1 + size + getpagesize(), total - size - getpagesize());
>>       }
>>
>> -    return ptr;
>> +    return ptr1;
>>   }
>
>   Thomas
>
>
>
>
> .
>




