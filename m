Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UL15m-0004IF-V2
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2013 20:53:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1UL15j-0004Dn-Dg
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2013 20:53:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1UL15g-0002eG-TI
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2013 20:53:19 -0400
Received: from mail-pb0-f42.google.com ([209.85.160.42]:33433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1UL15Z-0002cf-VZ; Wed, 27 Mar 2013 20:53:10 -0400
Received: by mail-pb0-f42.google.com with SMTP id xb4so5519053pbc.15
	for <multiple recipients>; Wed, 27 Mar 2013 17:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=U6Szu0Bv/hZ5CKwvOSklRfyQWJfiCyHgjKelYf1R58I=;
	b=UZFysJr6w1gE3+anhB0yC04ayi1JriWIX17XQrCS+YicIZZopAR1oLT9wP9IQtcyxq
	nFtv5VE0e77dmVqyVmzwBIT8xJD+b/lQ/woEJaR/W+RZQndtQ3ZUnisJQRdRi2exaq15
	+FKETB7M6IG1Hr5IkbhP7BG+ecTJyCslj1+RVYSgtDzikEPUbcx7jVFdTPidMtFFY1o7
	nlLnNVkk2mPewod07S7Cy6Cq+KuWOdHx8Gqw+8L9x2DRwhg/sBTseZPvbH5ijL+TJiot
	yO93i4X+U4IHayAQpFvyhIovoNseVJUJ6Owa91JMWn/2godiefBD5BifiMkXcej67ggK
	XcIg==
X-Received: by 10.68.125.169 with SMTP id mr9mr32217983pbb.74.1364431988174;
	Wed, 27 Mar 2013 17:53:08 -0700 (PDT)
Received: from pebble.twiddle.net (mf42036d0.tmodns.net. [208.54.32.244])
	by mx.google.com with ESMTPS id t5sm7757849pbi.10.2013.03.27.17.53.05
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 17:53:06 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <51539468.6060301@twiddle.net>
Date: Wed, 27 Mar 2013 17:52:56 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1364410030-24008-1-git-send-email-rth@twiddle.net>
	<515383E2.7010408@suse.de>
In-Reply-To: <515383E2.7010408@suse.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.42
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vmxnet: Don't use bswap_64
	for constants
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
X-List-Received-Date: Thu, 28 Mar 2013 00:53:21 -0000

On 2013-03-27 16:42, Andreas Färber wrote:
> Am 27.03.2013 19:47, schrieb Richard Henderson:
>> This macro is used in the context of defining enum values.
>> We can't use a function call in that case.
>>
>> Cc: qemu-trivial@nongnu.org
>> Signed-off-by: Richard Henderson <rth@twiddle.net>
>> ---
>>   hw/vmxnet3.h | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vmxnet3.h b/hw/vmxnet3.h
>> index 7db0c8f..cd9ac85 100644
>> --- a/hw/vmxnet3.h
>> +++ b/hw/vmxnet3.h
>> @@ -37,7 +37,15 @@
>>   #define __packed QEMU_PACKED
>>
>>   #if defined(HOST_WORDS_BIGENDIAN)
>> -#define const_cpu_to_le64(x) bswap_64(x)
>> +#define const_cpu_to_le64(x) \
>> +        (((x & 0x00000000000000ffULL) << 56) | \
>> +         ((x & 0x000000000000ff00ULL) << 40) | \
>> +         ((x & 0x0000000000ff0000ULL) << 24) | \
>> +         ((x & 0x00000000ff000000ULL) <<  8) | \
>> +         ((x & 0x000000ff00000000ULL) >>  8) | \
>> +         ((x & 0x0000ff0000000000ULL) >> 24) | \
>> +         ((x & 0x00ff000000000000ULL) >> 40) | \
>> +         ((x & 0xff00000000000000ULL) >> 56))
>
> Being a macro, shouldn't this better use (x) for operator precedence?

It doesn't matter for this usage.

Nor, according to other threads that appeared on the list today, is this
the right fix, since the bswap itself turns out to be bogus.

Myself, I never tested the driver code, just fixed the compile error.


r~


