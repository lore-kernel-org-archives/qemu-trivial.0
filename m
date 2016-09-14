Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk65j-0002OL-Ed
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 05:02:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bk65e-0002LQ-KS
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:02:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bk65c-0007uZ-Ja
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:02:45 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35628)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bk65U-0007nF-0O; Wed, 14 Sep 2016 05:02:36 -0400
Received: by mail-wm0-f68.google.com with SMTP id c131so1510361wmh.2;
	Wed, 14 Sep 2016 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Ode+sx+qKLZyUIoWhtYDG0uGUYyC5eq//TRaPFSS5ik=;
	b=TMdfUDmJWTWWQTHHrwA78jF6pfeRh+07Hjm4VKcbyyK74ZOqcCR1zAtj+2oaTQntuL
	XbHriJzKhFTEp7p0P33bmtL1fy/tELGlG5pnGRQ2gKvKt7fzraxzrSLNPLXu2/fCXJ9F
	Y3HALTMZ6xh2K8jgfpA0/viC6+BI0Uk2XeoGwZwyq+luYGcxEJ6kmxAkjqu3V0NpGDLT
	2uIkdPqvjnDD6m1A611Q/ndsjC8LsXPZ67ydaTfJW6Ae1yRt9ewKUFxkhuiInM7VS20h
	WYr4sO/JfXHF4Ch87tzsO6k7Ku+GDF5vpd9qK5/GrsqMz9FaDihRQfEb/Tl5Z2ueoByr
	AIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Ode+sx+qKLZyUIoWhtYDG0uGUYyC5eq//TRaPFSS5ik=;
	b=CPwLie7a24R3ALputtSD5WPQ/iHMVnr2GDu5Ug02B0BjBJwPhXX4SgFD98yQFAmaFH
	azJZIJMJ/do6qu674eHKnA6ZP9Qe5/g6NaV2qH4KPpuNP7D6zB4dm4zYurKG8vf2Zesf
	MztPp3HcLs8vOwexUEKoGltpj6QilLOr7Mqe1WgYUbYVosPM8xW4zhXoiT2433gPkqDz
	1IhOCvyXAywc0e8Qh30H6e03L3H4nlriswqyxyzFsD3mD2h0U24KfKjOkc6Ss0zdHpgh
	EdOKI3FPgXhao59OtxMG4+2KkiujGzcT44nxaA4+58EOzQLNoUQeHRtAGDgESxLqsLAy
	5brQ==
X-Gm-Message-State: AE9vXwP0KC57ToKF7O2taH7bUpc/7q0F0ahsP2Fcio0G31T+rFx6CTKAOHMMjqwt7CbPpA==
X-Received: by 10.194.87.227 with SMTP id bb3mr1471001wjb.62.1473843695258;
	Wed, 14 Sep 2016 02:01:35 -0700 (PDT)
Received: from [192.168.10.165] (94-39-176-182.adsl-ull.clienti.tiscali.it.
	[94.39.176.182]) by smtp.googlemail.com with ESMTPSA id
	v203sm3085840wmv.2.2016.09.14.02.01.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 02:01:34 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Wei Yang <richard.weiyang@gmail.com>,
	corentincj@iksaif.net
References: <1457185628-23304-1-git-send-email-richard.weiyang@gmail.com>
	<b31417a0-f1ff-32ce-1893-bb7576333469@msgid.tls.msk.ru>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7028e33b-fe71-098b-71d9-7e31ae71c6ec@redhat.com>
Date: Wed, 14 Sep 2016 11:01:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <b31417a0-f1ff-32ce-1893-bb7576333469@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.68
Subject: Re: [Qemu-trivial] [PATCH] bitmap: refine and move
 BITMAP_{FIRST/LAST}_WORD_MASK
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
X-List-Received-Date: Wed, 14 Sep 2016 09:02:50 -0000



On 14/09/2016 09:33, Michael Tokarev wrote:
> Is this (quite old) patch still relevant?

Yes, I think it's a nice cleanup.  The interesting bit is that it
expands nbits exactly once.

Paolo

> Thanks,
> 
> /mjt
> 
> 05.03.2016 16:47, Wei Yang wrote:
>> According to linux kernel commit <89c1e79eb30> ("linux/bitmap.h: improve
>> BITMAP_{LAST,FIRST}_WORD_MASK"), these two macro could be improved.
>>
>> This patch takes this change and also move them all in header file.
>>
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> ---
>>  include/qemu/bitmap.h | 7 ++-----
>>  util/bitmap.c         | 2 --
>>  2 files changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
>> index 0e33fa5..864982d 100644
>> --- a/include/qemu/bitmap.h
>> +++ b/include/qemu/bitmap.h
>> @@ -58,11 +58,8 @@
>>   * find_next_bit(addr, nbits, bit)    Position next set bit in *addr
>> >= bit
>>   */
>>
>> -#define
>> BITMAP_LAST_WORD_MASK(nbits)                                    \
>> -   
>> (                                                                   \
>> -        ((nbits) % BITS_PER_LONG)
>> ?                                     \
>> -        (1UL<<((nbits) % BITS_PER_LONG))-1 :
>> ~0UL                       \
>> -        )
>> +#define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) &
>> (BITS_PER_LONG - 1)))
>> +#define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) &
>> (BITS_PER_LONG - 1)))
>>
>>  #define DECLARE_BITMAP(name,bits)                  \
>>          unsigned long name[BITS_TO_LONGS(bits)]
>> diff --git a/util/bitmap.c b/util/bitmap.c
>> index 40aadfb..43ed011 100644
>> --- a/util/bitmap.c
>> +++ b/util/bitmap.c
>> @@ -157,8 +157,6 @@ int slow_bitmap_andnot(unsigned long *dst, const
>> unsigned long *bitmap1,
>>      return result != 0;
>>  }
>>
>> -#define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) %
>> BITS_PER_LONG))
>> -
>>  void bitmap_set(unsigned long *map, long start, long nr)
>>  {
>>      unsigned long *p = map + BIT_WORD(start);
>>
> 
> 
> 

