Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c13gr-0005C7-PT
	for mharc-qemu-trivial@gnu.org; Sun, 30 Oct 2016 23:55:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c13gp-0005AW-3a
	for qemu-trivial@nongnu.org; Sun, 30 Oct 2016 23:55:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c13go-0006Ad-78
	for qemu-trivial@nongnu.org; Sun, 30 Oct 2016 23:55:15 -0400
Received: from [59.151.112.132] (port=34155 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1c13gi-00065d-B0; Sun, 30 Oct 2016 23:55:08 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12496367"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2016 11:55:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0E7D243972A2;
	Mon, 31 Oct 2016 11:54:59 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 31 Oct 2016 11:55:01 +0800
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>,
	<qemu-trivial@nongnu.org>
References: <1477644996-23990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<92415a45-66a7-c080-2c3c-8f5f67204bd0@msgid.tls.msk.ru>
CC: <peter.maydell@linaro.org>, <thuth@redhat.com>, <eblake@redhat.com>,
	<armbru@redhat.com>, <mst@redhat.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5816C121.4060407@cn.fujitsu.com>
Date: Mon, 31 Oct 2016 11:57:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <92415a45-66a7-c080-2c3c-8f5f67204bd0@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1251"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 0E7D243972A2.AE3E4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH v3] util/mmap-alloc: check parameter
 before using
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
X-List-Received-Date: Mon, 31 Oct 2016 03:55:16 -0000



On 10/28/2016 10:22 PM, Michael Tokarev wrote:
> 28.10.2016 11:56, Cao jin wrote:
>> Also refactor a little bit for readability
>
> See comments below...
>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   util/mmap-alloc.c | 17 ++++++++---------
>>   1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
>> index 5a85aa3..2f55f5e 100644
>> --- a/util/mmap-alloc.c
>> +++ b/util/mmap-alloc.c
>> @@ -12,6 +12,7 @@
>>
>>   #include "qemu/osdep.h"
>>   #include "qemu/mmap-alloc.h"
>> +#include "qemu/host-utils.h"
>>
>>   #define HUGETLBFS_MAGIC       0x958458f6
>>
>> @@ -61,18 +62,18 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
>>   #else
>>       void *ptr = mmap(0, total, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
>>   #endif
>> -    size_t offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
>> +    size_t offset;
>>       void *ptr1;
>>
>>       if (ptr == MAP_FAILED) {
>>           return MAP_FAILED;
>>       }
>>
>> -    /* Make sure align is a power of 2 */
>> -    assert(!(align & (align - 1)));
>> +    assert(is_power_of_2(align));
>>       /* Always align to host page size */
>>       assert(align >= getpagesize());
>>
>> +    offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
>>       ptr1 = mmap(ptr + offset, size, PROT_READ | PROT_WRITE,
>>                   MAP_FIXED |
>>                   (fd == -1 ? MAP_ANONYMOUS : 0) |
>> @@ -83,22 +84,20 @@ void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
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
>
> Why did you change ptr to ptr1 here and above?

Because, I think there always is: ptr + offset == ptr1

>
> On linux, mmap(2) manpage says that address serves as hint, and the
> system create the mapping at a nearby page boundary.  Generally, this
> address is just a hint.  So I'm not really sure if this code is actually
> right.. :)
>

Yes, but the 2nd mmap used MAP_FIXED, which the manpage says:

/Don't interpret addr as a hint: place the mapping at exactly that/ 
/address. addr must be a multiple of the page size/
/If the specified address cannot be used, mmap() will fail/

> At the very least, your commit comment is a bit misleading, as it says
> about readability, but it also MAY change semantics.
>

I don't think so, one just need dig a little deeper:)

> Maybe just move BOTH "ptr+=, total-=" parts down the line and keep
> using ptr instead of ptr1?
>
> It'd be very good, in my opinion, to document how this whole thing
> is supposed to work :)
>

the change is just some simple arithmetic operation, I think it is 
little difficult for me to find a decent description.

Hope this could also got other maintainer's help, review, or ack

> Thanks,
>
> /mjt
>
>
> .
>

-- 
Yours Sincerely,

Cao jin



