Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ws8lL-0005R0-Cl
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 06:49:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Ws8lA-0005Or-UN
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 06:49:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Ws8l1-0001wH-So
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 06:49:32 -0400
Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229]:35300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Ws8l1-0001w7-H4; Wed, 04 Jun 2014 06:49:23 -0400
Received: by mail-pb0-f41.google.com with SMTP id uo5so6869518pbc.28
	for <multiple recipients>; Wed, 04 Jun 2014 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=5n2HdNMnP8AhpFtrLp/dqBpD0JJy1UAOiXpu4jhEc+Q=;
	b=xKhHHuSj7OyDxRwHlPSsxkL4Fx2JCaYJ1/j/KZ1RRm2EnbyPPmMVVtx/9UhQHN+Bwq
	9gT0xClrBp21AS65UFcRtf2eCGEjJAOT6LfV+dM7HQxHr4nNMv7mUlv+9DDIvSRzxNSZ
	ZGJABnYFyhH30Z3eYjWR1AvvvN4Ydlb4334xonz8WjIKOXPNGZygWS9TMIzo4CiaP3TZ
	xr4USdXt0UX+MBiprqUtiSdIMArZQ4ImzL8Zss2+F7jVHGgpk2G1YqlJIOukZOIarJAA
	TabJgmD9p26gPxQCdvu48g0peWC3q9Y07qYaGL9FcmKulYNnJ7SAbm3ltJaWrNoaFcLd
	zjYA==
X-Received: by 10.68.196.168 with SMTP id in8mr62698854pbc.132.1401878961622; 
	Wed, 04 Jun 2014 03:49:21 -0700 (PDT)
Received: from [192.168.1.119] ([124.127.118.42])
	by mx.google.com with ESMTPSA id ci4sm8507719pbb.50.2014.06.04.03.49.18
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Jun 2014 03:49:21 -0700 (PDT)
Message-ID: <538EF9AC.8030802@gmail.com>
Date: Wed, 04 Jun 2014 18:49:16 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <538C6F98.5070005@gmail.com> <538D79D4.5000900@huawei.com>
	<538DD187.5050400@gmail.com> <20140604100148.GC2618@work-vm>
In-Reply-To: <20140604100148.GC2618@work-vm>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::229
Cc: ChenLiang <chenliang88@huawei.com>, quintela@redhat.com,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>, arei.gonglei@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH-trivial] arch_init.c: Always
 be sure that 'encoded_buf' and 'current_buf' are lock protected
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
X-List-Received-Date: Wed, 04 Jun 2014 10:49:42 -0000


Firstly, thank you very much for reviewing the related 2 patches.


On 06/04/2014 06:01 PM, Dr. David Alan Gilbert wrote:
> * Chen Gang (gang.chen.5i5j@gmail.com) wrote:
>>
>> Firstly, thank you very much for reviewing the related 2 patches.
>>
>> On 06/03/2014 03:31 PM, ChenLiang wrote:
>>> On 2014/6/2 20:35, Chen Gang wrote:
>>>
>>>> 'encoded_buf' and 'current_buf' are lock protected during using in
>>>> save_xbzrle_page() in ram_save_page(), and during freeing in
>>>> migration_end().
>>>>
>>>> So recommend to let them lock protected during starting, just like we
>>>> have done to 'cache'.
> 
> This isn't one for Trivial - it needs some thought.  Locks always need thought.
> 

OK, I shall notice about it next time.

"Locks always need thought", so prefer some 'templates' to simplify
thinking, especially for some simple locks (not nested, either not
performance sensitive).


>>>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>>>> ---
>>>>  arch_init.c | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch_init.c b/arch_init.c
>>>> index 23044c1..784922c 100644
>>>> --- a/arch_init.c
>>>> +++ b/arch_init.c
>>>> @@ -783,12 +783,12 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>>>>              error_report("Error creating cache");
>>>>              return -1;
>>>>          }
>>>> -        XBZRLE_cache_unlock();
>>>>
>>>>          /* We prefer not to abort if there is no memory */
>>>>          XBZRLE.encoded_buf = g_try_malloc0(TARGET_PAGE_SIZE);
>>>>          if (!XBZRLE.encoded_buf) {
>>>>              error_report("Error allocating encoded_buf");
>>>> +            XBZRLE_cache_unlock();
>>>>              return -1;
>>>>          }
>>>>
>>>> @@ -797,8 +797,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>>>>              error_report("Error allocating current_buf");
>>>>              g_free(XBZRLE.encoded_buf);
>>>>              XBZRLE.encoded_buf = NULL;
>>>> +            XBZRLE_cache_unlock();
>>>>              return -1;
>>>>          }
>>>> +        XBZRLE_cache_unlock();
>>>>
>>>>          acct_clear();
>>>>      }
>>>
>>>
>>> It isn't necessary.
>>>
>>
>> For me, it is still necessary to be improved.
>>
>>  - If this code is not performance sensitive:
>>
>>    "always lock protected" will let source code easy understanding for
>>    readers, and easy sustainable for maintainers.
>>
>>  - Else (performance sensitive):
>>
>>    Need give related comments to it (e.g. for performance reason, let it
>>    out of lock protected). So readers easily understand, and the related
>>    maintainers may notice about it at any time.
>>
>>      It is not good to give comments in a function, except the code is
>>      not used in normal way.
> 
> I think the locks for the cache were originally there to handle the race
> between a resize (on the main thread) against the use (in the migration thread).
> That doesn't happen for the encoded_buf so I don't think we have that problem.
> 
> Is there any other case that it could race?
> I can't see one - I think all of the other start/end is done within the migration
> thread.
> 

What you thought and what Chen Liang though are fine to me. But I guess
it is a simple lock, if we let them always lock protected, we need not
think them more.

One simple lock 'template' can be: "always let it lock protected during
its whole life", that will let all related readers and maintainers easy
understanding and avoid to think of more.

Our lock is not nested, although I am not quit sure whether it is
performance sensitive (I guess not).


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

