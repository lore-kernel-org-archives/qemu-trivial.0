Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WaDOP-0002iJ-AU
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 20:07:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenliang0016@icloud.com>) id 1Wa5qH-00065S-Uk
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 12:04:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenliang0016@icloud.com>) id 1Wa5qA-0005dz-E9
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 12:04:13 -0400
Received: from st14p23im-asmtp001.me.com ([17.164.101.12]:49904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenliang0016@icloud.com>)
	id 1Wa5pv-0005ZV-AJ; Tue, 15 Apr 2014 12:03:51 -0400
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: text/plain; CHARSET=US-ASCII
Received: from [192.168.1.104] ([124.90.48.69]) by st14p23im-asmtp001.me.com
	(Oracle Communications Messaging Server 7u4-27.01(7.0.4.27.0) 64bit
	(built Aug
	30 2012)) with ESMTPSA id <0N42007FCXY08810@st14p23im-asmtp001.me.com>;
	Tue, 15 Apr 2014 16:03:49 +0000 (GMT)
From: =?GB2312?B?s8LBug==?= <chenliang0016@icloud.com>
In-reply-to: <534CF538.9000100@redhat.com>
Date: Wed, 16 Apr 2014 00:03:35 +0800
Message-id: <9CA658EF-6537-43BB-BE52-7DA1C405282D@icloud.com>
References: <1397442420-25626-1-git-send-email-akong@redhat.com>
	<534BA81C.9060807@redhat.com> <534C7584.2090301@linux.vnet.ibm.com>
	<534CF538.9000100@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
X-Mailer: Apple Mail (2.1874)
X-MANTSH: 1TEIXWV4bG1oaGkdHB0lGUkdDRl5PWBoaGxEKTEMXGx0EGx0YBBIZBBscEBseGh8
	aEQpYTRdLEQptfhcaEQpMWRcbGhsbEQpZSRcRClleF2hjeREKQ04XSxsbGmJCH2lpGUEeGXhzB
	xlsGxwaGUdnEQpYXBcZBBoEHQdNSx0SSEkcTAUbHQQbHRgEEhkEGxwQGx4aHxsRCl5ZF2FNXFA
	FEQpMRhdia2sRCkNaFxsYHgQTGgQeEgQcExEKRFgXGxoRCkRJFxMRCkJGF2thXx5mbUxffUZNE
	QpCRRdmZH5NGUwBXwFFQhEKQk4Xa0UaUlAeQ1xZXGgRCkJMF2xdRVJGH2FLWWZbEQpCbBd6aGF
	/c19jBVNERhEKQkAXa3kaYllafxwSWnMRCnBoF24FUxscb2BCQ2ZaEQpwaBdlaEtZRUZmfQVsG
	REKcGgXZEkee39/H0dpXRkRCnBoF2x9bnJrG3gZWWsFEQpwaBdpS25CSUFEbm9MYxEKcGwXb05
	nbXIdaE1pHHMRCnBMF3pNGgVFGnJeG0RFEQ==
X-CLX-Spam: false
X-CLX-Score: 1011
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.11.96,1.0.14,0.0.0000
	definitions=2014-04-15_02:2014-04-15, 2014-04-15,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=7.0.1-1402240000
	definitions=main-1404150262
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 17.164.101.12
X-Mailman-Approved-At: Tue, 15 Apr 2014 20:07:54 -0400
Cc: yamahata@private.email.ne.jp, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, "Michael R. Hines" <mrhines@linux.vnet.ibm.com>,
	=?GB2312?B?s8LBug==?= <chenliang0016@icloud.com>,
	"Michael R. Hines" <mrhines@us.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arch_init.c:
 remove	duplicate function
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
X-List-Received-Date: Tue, 15 Apr 2014 16:04:21 -0000


> On 04/15/14 01:55, Michael R. Hines wrote:
>> On 04/14/2014 05:19 PM, Laszlo Ersek wrote:
>>> On 04/14/14 04:27, Amos Kong wrote:
>>>> We already have a function buffer_is_zero() in util/cutils.c
>>>> 
>>>> Signed-off-by: Amos Kong <akong@redhat.com>
>>>> ---
>>>>  arch_init.c | 9 ++-------
>>>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>>> 
>>>> diff --git a/arch_init.c b/arch_init.c
>>>> index 60c975d..342e5dc 100644
>>>> --- a/arch_init.c
>>>> +++ b/arch_init.c
>>>> @@ -152,11 +152,6 @@ int qemu_read_default_config_files(bool userconfig)
>>>>      return 0;
>>>>  }
>>>>  -static inline bool is_zero_range(uint8_t *p, uint64_t size)
>>>> -{
>>>> -    return buffer_find_nonzero_offset(p, size) == size;
>>>> -}
>>>> -
>>>>  /* struct contains XBZRLE cache and a static page
>>>>     used by the compression */
>>>>  static struct {
>>>> @@ -587,7 +582,7 @@ static int ram_save_block(QEMUFile *f, bool
>>>> last_stage)
>>>>                          acct_info.dup_pages++;
>>>>                      }
>>>>                  }
>>>> -            } else if (is_zero_range(p, TARGET_PAGE_SIZE)) {
>>>> +            } else if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
>>>>                  acct_info.dup_pages++;
>>>>                  bytes_sent = save_block_hdr(f, block, offset, cont,
>>>>                                              RAM_SAVE_FLAG_COMPRESS);
>>>> @@ -983,7 +978,7 @@ static inline void
>>>> *host_from_stream_offset(QEMUFile *f,
>>>>   */
>>>>  void ram_handle_compressed(void *host, uint8_t ch, uint64_t size)
>>>>  {
>>>> -    if (ch != 0 || !is_zero_range(host, size)) {
>>>> +    if (ch != 0 || !buffer_is_zero(host, size)) {
>>>>          memset(host, ch, size);
>>>>      }
>>>>  }
>>>> 
>>> This seems to be correct, functionally -- apparently buffer_is_zero()
>>> has laxer size requirements than buffer_find_nonzero_offset(). However,
>>> I think the latter might be faster.
>>> 
>>> For ram_save_block() I guess the difference is negligible. But
>>> ram_handle_compressed() is also called from "migration-rdma.c", where I
>>> can't even guess if a little bit of slowdown would count.
>>> 
>>> I'm OK with the patch if Michael (CC'd) is.
>>> 
>>> Thanks
>>> Laszlo
>>> 
>> 
>> Thanks for the CC.
>> 
>> Actually, it looks like buffer_is_zero() is calling
>> buffer_find_nonzero_offset()
>> as a "first try" anyway
> 
> I have no idea how I managed to miss that.
> 
>> - which is the same thing RDMA is doing. So, all
>> calls to ram_handle_compressed() should hit the branch target there in
>> buffer_is_zero() for can_use_buffer_find_nonzero_offset() and automatically
>> drop into the vectorized-optimization to search for zeros, so there
>> shouldn't
>> be any change in performance. The same should apply for TCP migration
>> as well - it's working on page-granularity, which is always aligned to
>> 32 or 64 bits.
>> 
>> Paolo? I see that some of the block-migration code and the qemu-img code
>> is also
>> calling buffer_is_zero() - are you guys depending on the performance of any
>> buffer_is_zero() calls to use the vector-optimized version like
>> migration does?
> 
> The patch doesn't change buffer_is_zero() internally, so callers of
> buffer_is_zero() are unaffected. The patch turns two indirect callers of
> buffer_find_nonzero_offset() into two "differently indirect" callers of
> the same (which I now see thanks to your explanation). Hence,
> 
> Before:
> ram_save_block        -> is_zero_range -> buffer_find_nonzero_offset
> ram_handle_compressed -> is_zero_range -> buffer_find_nonzero_offset
Because of *static inline *is_zero_range, it may be like that:
    ram_save_block    -> buffer_find_nonzero_offset
    ram_handle_compressed   -> buffer_find_nonzero_offset
But this affects little in my testing.

Best regards
ChenLiang

> After:
> ram_save_block        -> buffer_is_zero -> buffer_find_nonzero_offset
> ram_handle_compressed -> buffer_is_zero -> buffer_find_nonzero_offset
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> 
> Thanks!
> Laszlo


