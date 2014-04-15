Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZzcg-0001ZK-66
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 05:25:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WZzcT-0001Nr-Ob
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 05:25:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WZzcN-00005T-Cu
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 05:25:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1WZzcA-0008RV-1N; Tue, 15 Apr 2014 05:25:14 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3F90ifT031671
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 15 Apr 2014 05:00:46 -0400
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-86.ams2.redhat.com
	[10.36.116.86])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3F90e0G028223; Tue, 15 Apr 2014 05:00:41 -0400
Message-ID: <534CF538.9000100@redhat.com>
Date: Tue, 15 Apr 2014 11:00:40 +0200
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Michael R. Hines" <mrhines@linux.vnet.ibm.com>,
	Amos Kong <akong@redhat.com>, qemu-trivial@nongnu.org
References: <1397442420-25626-1-git-send-email-akong@redhat.com>
	<534BA81C.9060807@redhat.com> <534C7584.2090301@linux.vnet.ibm.com>
In-Reply-To: <534C7584.2090301@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: yamahata@private.email.ne.jp, Paolo Bonzini <pbonzini@redhat.com>,
	mjt@tls.msk.ru, qemu-devel@nongnu.org,
	"Michael R. Hines" <mrhines@us.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] arch_init.c: remove duplicate function
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
X-List-Received-Date: Tue, 15 Apr 2014 09:25:44 -0000

On 04/15/14 01:55, Michael R. Hines wrote:
> On 04/14/2014 05:19 PM, Laszlo Ersek wrote:
>> On 04/14/14 04:27, Amos Kong wrote:
>>> We already have a function buffer_is_zero() in util/cutils.c
>>>
>>> Signed-off-by: Amos Kong <akong@redhat.com>
>>> ---
>>>   arch_init.c | 9 ++-------
>>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch_init.c b/arch_init.c
>>> index 60c975d..342e5dc 100644
>>> --- a/arch_init.c
>>> +++ b/arch_init.c
>>> @@ -152,11 +152,6 @@ int qemu_read_default_config_files(bool userconfig)
>>>       return 0;
>>>   }
>>>   -static inline bool is_zero_range(uint8_t *p, uint64_t size)
>>> -{
>>> -    return buffer_find_nonzero_offset(p, size) == size;
>>> -}
>>> -
>>>   /* struct contains XBZRLE cache and a static page
>>>      used by the compression */
>>>   static struct {
>>> @@ -587,7 +582,7 @@ static int ram_save_block(QEMUFile *f, bool
>>> last_stage)
>>>                           acct_info.dup_pages++;
>>>                       }
>>>                   }
>>> -            } else if (is_zero_range(p, TARGET_PAGE_SIZE)) {
>>> +            } else if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
>>>                   acct_info.dup_pages++;
>>>                   bytes_sent = save_block_hdr(f, block, offset, cont,
>>>                                               RAM_SAVE_FLAG_COMPRESS);
>>> @@ -983,7 +978,7 @@ static inline void
>>> *host_from_stream_offset(QEMUFile *f,
>>>    */
>>>   void ram_handle_compressed(void *host, uint8_t ch, uint64_t size)
>>>   {
>>> -    if (ch != 0 || !is_zero_range(host, size)) {
>>> +    if (ch != 0 || !buffer_is_zero(host, size)) {
>>>           memset(host, ch, size);
>>>       }
>>>   }
>>>
>> This seems to be correct, functionally -- apparently buffer_is_zero()
>> has laxer size requirements than buffer_find_nonzero_offset(). However,
>> I think the latter might be faster.
>>
>> For ram_save_block() I guess the difference is negligible. But
>> ram_handle_compressed() is also called from "migration-rdma.c", where I
>> can't even guess if a little bit of slowdown would count.
>>
>> I'm OK with the patch if Michael (CC'd) is.
>>
>> Thanks
>> Laszlo
>>
> 
> Thanks for the CC.
> 
> Actually, it looks like buffer_is_zero() is calling
> buffer_find_nonzero_offset()
> as a "first try" anyway

I have no idea how I managed to miss that.

> - which is the same thing RDMA is doing. So, all
> calls to ram_handle_compressed() should hit the branch target there in
> buffer_is_zero() for can_use_buffer_find_nonzero_offset() and automatically
> drop into the vectorized-optimization to search for zeros, so there
> shouldn't
> be any change in performance. The same should apply for TCP migration
> as well - it's working on page-granularity, which is always aligned to
> 32 or 64 bits.
> 
> Paolo? I see that some of the block-migration code and the qemu-img code
> is also
> calling buffer_is_zero() - are you guys depending on the performance of any
> buffer_is_zero() calls to use the vector-optimized version like
> migration does?

The patch doesn't change buffer_is_zero() internally, so callers of
buffer_is_zero() are unaffected. The patch turns two indirect callers of
buffer_find_nonzero_offset() into two "differently indirect" callers of
the same (which I now see thanks to your explanation). Hence,

Before:
ram_save_block        -> is_zero_range -> buffer_find_nonzero_offset
ram_handle_compressed -> is_zero_range -> buffer_find_nonzero_offset

After:
ram_save_block        -> buffer_is_zero -> buffer_find_nonzero_offset
ram_handle_compressed -> buffer_is_zero -> buffer_find_nonzero_offset

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks!
Laszlo

