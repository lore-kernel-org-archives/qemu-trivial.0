Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZttWV-0007FL-2C
	for mharc-qemu-trivial@gnu.org; Wed, 04 Nov 2015 03:34:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZttWS-0007Do-Ax
	for qemu-trivial@nongnu.org; Wed, 04 Nov 2015 03:34:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZttWO-00043x-9u
	for qemu-trivial@nongnu.org; Wed, 04 Nov 2015 03:34:24 -0500
Received: from [59.151.112.132] (port=33827 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1ZttWN-00041T-OA; Wed, 04 Nov 2015 03:34:20 -0500
X-IronPort-AV: E=Sophos;i="5.20,242,1444665600"; 
   d="scan'208";a="84842"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Nov 2015 16:33:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tA48XQ3B007449;
	Wed, 4 Nov 2015 16:33:26 +0800
Received: from [10.167.226.57] (10.167.226.57) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 4 Nov 2015 16:34:02 +0800
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1446553829-28463-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<5638AB2B.5060700@msgid.tls.msk.ru>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5639C307.7030700@cn.fujitsu.com>
Date: Wed, 4 Nov 2015 16:34:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <5638AB2B.5060700@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.57]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] set_memory_options: remove
 code that make no sense
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
X-List-Received-Date: Wed, 04 Nov 2015 08:34:25 -0000

hi Michael,
     Thanks for your explanation that make me realized I am wrong about 
my patch:-[ ...So, forget it.

On 11/03/2015 08:40 PM, Michael Tokarev wrote:
> 03.11.2015 15:30, Cao jin wrote:
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   vl.c | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/vl.c b/vl.c
>> index f5f7c3f..13f2c8b 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -2860,11 +2860,6 @@ static void set_memory_options(uint64_t *ram_slots, ram_addr_t *maxram_size,
>>       sz = 0;
>>       mem_str = qemu_opt_get(opts, "size");
>>       if (mem_str) {
>> -        if (!*mem_str) {
>> -            error_report("missing 'size' option value");
>> -            exit(EXIT_FAILURE);
>> -        }
>
> I'm not sure this one is bad or good, it is indeed possible
> to specify no value for size=, but if we're to check that,
> we'd have to add such checks everywhere.
>

Yup..I missed to test "-m size=", just test several case with format "-m 
###", and didn`t read get_opt_value throughly, or else will find it can 
output a string like "\0" which I never encountered before;)

> But the next one...
>
>>           sz = qemu_opt_get_size(opts, "size", ram_size);
>>
>>           /* Fix up legacy suffix-less format */
>> @@ -2886,10 +2881,6 @@ static void set_memory_options(uint64_t *ram_slots, ram_addr_t *maxram_size,
>>
>>       sz = QEMU_ALIGN_UP(sz, 8192);
>>       ram_size = sz;
>> -    if (ram_size != sz) {
>> -        error_report("ram size too large");
>> -        exit(EXIT_FAILURE);
>> -    }
>
> is definitely wrong.
>
> sz is uint64_t, while ram_size is ram_addr_t which is
> either uint64_t or uintptr_t.  Until it is fixed to
> always be 64bits, the above code makes (some) sense.
>

yes,I am careless... maybe

#ifdef CONFIG_XEN_BACKEND
     if (ram_size != sz) {
         error_report("ram size too large");
         exit(EXIT_FAILURE);
     }
#endif

is better, but no big deal;)

anyway, forget this patch:P
> Thanks,
>
> /mjt
>
>

-- 
Yours Sincerely,

Cao Jin

