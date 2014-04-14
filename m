Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZqjb-0005fQ-49
	for mharc-qemu-trivial@gnu.org; Mon, 14 Apr 2014 19:56:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrhines@linux.vnet.ibm.com>) id 1WZqjQ-0005Yy-IM
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 19:56:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mrhines@linux.vnet.ibm.com>) id 1WZqjH-00074n-H4
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 19:56:08 -0400
Received: from e36.co.us.ibm.com ([32.97.110.154]:48854)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrhines@linux.vnet.ibm.com>) id 1WZqjH-00074c-Ao
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 19:55:59 -0400
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mrhines@linux.vnet.ibm.com>;
	Mon, 14 Apr 2014 17:55:57 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 14 Apr 2014 17:55:54 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com
	(b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 1588319D8040;
	Mon, 14 Apr 2014 17:55:49 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by b03cxnp08025.gho.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id s3ENtrUN11010318; Tue, 15 Apr 2014 01:55:53 +0200
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP
	id s3ENtr66032212; Mon, 14 Apr 2014 17:55:53 -0600
Received: from [192.168.122.3] ([9.186.105.50])
	by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s3ENtoxu032077; Mon, 14 Apr 2014 17:55:51 -0600
Message-ID: <534C7584.2090301@linux.vnet.ibm.com>
Date: Tue, 15 Apr 2014 07:55:48 +0800
From: "Michael R. Hines" <mrhines@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Laszlo Ersek <lersek@redhat.com>, Amos Kong <akong@redhat.com>,
	qemu-trivial@nongnu.org
References: <1397442420-25626-1-git-send-email-akong@redhat.com>
	<534BA81C.9060807@redhat.com>
In-Reply-To: <534BA81C.9060807@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14041423-3532-0000-0000-0000010F3E97
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.154
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
X-List-Received-Date: Mon, 14 Apr 2014 23:56:17 -0000

On 04/14/2014 05:19 PM, Laszlo Ersek wrote:
> On 04/14/14 04:27, Amos Kong wrote:
>> We already have a function buffer_is_zero() in util/cutils.c
>>
>> Signed-off-by: Amos Kong <akong@redhat.com>
>> ---
>>   arch_init.c | 9 ++-------
>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch_init.c b/arch_init.c
>> index 60c975d..342e5dc 100644
>> --- a/arch_init.c
>> +++ b/arch_init.c
>> @@ -152,11 +152,6 @@ int qemu_read_default_config_files(bool userconfig)
>>       return 0;
>>   }
>>   
>> -static inline bool is_zero_range(uint8_t *p, uint64_t size)
>> -{
>> -    return buffer_find_nonzero_offset(p, size) == size;
>> -}
>> -
>>   /* struct contains XBZRLE cache and a static page
>>      used by the compression */
>>   static struct {
>> @@ -587,7 +582,7 @@ static int ram_save_block(QEMUFile *f, bool last_stage)
>>                           acct_info.dup_pages++;
>>                       }
>>                   }
>> -            } else if (is_zero_range(p, TARGET_PAGE_SIZE)) {
>> +            } else if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
>>                   acct_info.dup_pages++;
>>                   bytes_sent = save_block_hdr(f, block, offset, cont,
>>                                               RAM_SAVE_FLAG_COMPRESS);
>> @@ -983,7 +978,7 @@ static inline void *host_from_stream_offset(QEMUFile *f,
>>    */
>>   void ram_handle_compressed(void *host, uint8_t ch, uint64_t size)
>>   {
>> -    if (ch != 0 || !is_zero_range(host, size)) {
>> +    if (ch != 0 || !buffer_is_zero(host, size)) {
>>           memset(host, ch, size);
>>       }
>>   }
>>
> This seems to be correct, functionally -- apparently buffer_is_zero()
> has laxer size requirements than buffer_find_nonzero_offset(). However,
> I think the latter might be faster.
>
> For ram_save_block() I guess the difference is negligible. But
> ram_handle_compressed() is also called from "migration-rdma.c", where I
> can't even guess if a little bit of slowdown would count.
>
> I'm OK with the patch if Michael (CC'd) is.
>
> Thanks
> Laszlo
>

Thanks for the CC.

Actually, it looks like buffer_is_zero() is calling 
buffer_find_nonzero_offset()
as a "first try" anyway - which is the same thing RDMA is doing. So, all
calls to ram_handle_compressed() should hit the branch target there in
buffer_is_zero() for can_use_buffer_find_nonzero_offset() and automatically
drop into the vectorized-optimization to search for zeros, so there 
shouldn't
be any change in performance. The same should apply for TCP migration
as well - it's working on page-granularity, which is always aligned to 
32 or 64 bits.

Paolo? I see that some of the block-migration code and the qemu-img code 
is also
calling buffer_is_zero() - are you guys depending on the performance of any
buffer_is_zero() calls to use the vector-optimized version like 
migration does?

Just for RDMA: Reviewed-by: Michael R. Hines <mrhines@us.ibm.com>

- Michael


