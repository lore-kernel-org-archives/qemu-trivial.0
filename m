Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c175u-0005HQ-4I
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2016 03:33:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c175o-0005Dw-2q
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2016 03:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c175k-00076j-05
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2016 03:33:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59398)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c175b-00075X-Fn; Mon, 31 Oct 2016 03:33:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF1F4883A4;
	Mon, 31 Oct 2016 07:33:01 +0000 (UTC)
Received: from [10.36.116.20] (ovpn-116-20.ams2.redhat.com [10.36.116.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9V7Wv8m021301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 31 Oct 2016 03:32:58 -0400
To: Cao jin <caoj.fnst@cn.fujitsu.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1477644996-23990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<92415a45-66a7-c080-2c3c-8f5f67204bd0@msgid.tls.msk.ru>
	<5816C121.4060407@cn.fujitsu.com>
Cc: peter.maydell@linaro.org, eblake@redhat.com, armbru@redhat.com,
	mst@redhat.com
From: Thomas Huth <thuth@redhat.com>
Message-ID: <12cb403c-4679-3e85-c41c-22fb06a0f27e@redhat.com>
Date: Mon, 31 Oct 2016 08:32:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5816C121.4060407@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 31 Oct 2016 07:33:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 31 Oct 2016 07:33:20 -0000

On 31.10.2016 04:57, Cao jin wrote:
> 
> 
> On 10/28/2016 10:22 PM, Michael Tokarev wrote:
>> 28.10.2016 11:56, Cao jin wrote:
>>> Also refactor a little bit for readability
>>
>> See comments below...
>>
>>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>>> ---
>>>   util/mmap-alloc.c | 17 ++++++++---------
>>>   1 file changed, 8 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
>>> index 5a85aa3..2f55f5e 100644
>>> --- a/util/mmap-alloc.c
>>> +++ b/util/mmap-alloc.c
>>> @@ -12,6 +12,7 @@
>>>
>>>   #include "qemu/osdep.h"
>>>   #include "qemu/mmap-alloc.h"
>>> +#include "qemu/host-utils.h"
>>>
>>>   #define HUGETLBFS_MAGIC       0x958458f6
>>>
>>> @@ -61,18 +62,18 @@ void *qemu_ram_mmap(int fd, size_t size, size_t
>>> align, bool shared)
>>>   #else
>>>       void *ptr = mmap(0, total, PROT_NONE, MAP_ANONYMOUS |
>>> MAP_PRIVATE, -1, 0);
>>>   #endif
>>> -    size_t offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) -
>>> (uintptr_t)ptr;
>>> +    size_t offset;
>>>       void *ptr1;
>>>
>>>       if (ptr == MAP_FAILED) {
>>>           return MAP_FAILED;
>>>       }
>>>
>>> -    /* Make sure align is a power of 2 */
>>> -    assert(!(align & (align - 1)));
>>> +    assert(is_power_of_2(align));
>>>       /* Always align to host page size */
>>>       assert(align >= getpagesize());
>>>
>>> +    offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
>>>       ptr1 = mmap(ptr + offset, size, PROT_READ | PROT_WRITE,
>>>                   MAP_FIXED |
>>>                   (fd == -1 ? MAP_ANONYMOUS : 0) |
>>> @@ -83,22 +84,20 @@ void *qemu_ram_mmap(int fd, size_t size, size_t
>>> align, bool shared)
>>>           return MAP_FAILED;
>>>       }
>>>
>>> -    ptr += offset;
>>> -    total -= offset;
>>> -
>>>       if (offset > 0) {
>>> -        munmap(ptr - offset, offset);
>>> +        munmap(ptr, offset);
>>>       }
>>>
>>>       /*
>>>        * Leave a single PROT_NONE page allocated after the RAM block,
>>> to serve as
>>>        * a guard page guarding against potential buffer overflows.
>>>        */
>>> +    total -= offset;
>>>       if (total > size + getpagesize()) {
>>> -        munmap(ptr + size + getpagesize(), total - size -
>>> getpagesize());
>>> +        munmap(ptr1 + size + getpagesize(), total - size -
>>> getpagesize());
>>>       }
>>>
>>> -    return ptr;
>>> +    return ptr1;
>>
>> Why did you change ptr to ptr1 here and above?
> 
> Because, I think there always is: ptr + offset == ptr1
> 
>>
>> On linux, mmap(2) manpage says that address serves as hint, and the
>> system create the mapping at a nearby page boundary.  Generally, this
>> address is just a hint.  So I'm not really sure if this code is actually
>> right.. :)
>>
> 
> Yes, but the 2nd mmap used MAP_FIXED, which the manpage says:
> 
> /Don't interpret addr as a hint: place the mapping at exactly that/
> /address. addr must be a multiple of the page size/
> /If the specified address cannot be used, mmap() will fail/
> 
>> At the very least, your commit comment is a bit misleading, as it says
>> about readability, but it also MAY change semantics.
>>
> 
> I don't think so, one just need dig a little deeper:)
> 
>> Maybe just move BOTH "ptr+=, total-=" parts down the line and keep
>> using ptr instead of ptr1?
>>
>> It'd be very good, in my opinion, to document how this whole thing
>> is supposed to work :)
>>
> 
> the change is just some simple arithmetic operation, I think it is
> little difficult for me to find a decent description.

I originally had similar problems as Michael understanding your changes
to ptr / ptr1 ... so you should likely at add the information with
MAP_FIXED etc. to the patch description at least, I think.

It's maybe also cleaner if you split your patch into two parts, first
patch to fix the parameter checking, and second patch to change the ptr1
stuff. That way the later patch could also be easier reverted in case
there are problems with that.

 Thomas


