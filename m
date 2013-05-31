Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UiONz-0004od-FZ
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2013 08:24:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UiONw-0004oH-2J
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 08:24:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UiONr-0005cm-GT
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 08:24:44 -0400
Received: from mail-vc0-f178.google.com ([209.85.220.178]:44998)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UiONr-0005cg-C1; Fri, 31 May 2013 08:24:39 -0400
Received: by mail-vc0-f178.google.com with SMTP id id13so1002731vcb.9
	for <multiple recipients>; Fri, 31 May 2013 05:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=s5Ujmx2cc4yDsOe5cdB5cNk0unHE1ytoUX4WlGO8NOw=;
	b=NQWeNE6OdGM/vHdVvbDE9a4F1ArpoDUYpJ9wDfuM9RomBxDoudW5ED/bNPhvY7evax
	dnmz5cxvSnJeiWK7lK7xQNBNXBCtHUvcB0CCIte9bu6UxXX33rVhN4sdR4Q5z7JAv8zg
	T8EZ5sSYfOYFCWk9+SPvL7AK5le1oeF8L1uH5U+d/f6l3hnvfD+xTvCq2g4KHwbeMig0
	Do1ev/QXlS+NVh0/XSXOsmK7uhmidhvQGqH0E3qcLbfeBOx36V0/k0SmZkQNtuRgg/PN
	W2aKuqMSk5SfJr8JF/OrHNoWSLTgK54J2HWO34Wl1IZM5NKRqi5mIzq8Umt/VvGUUwtI
	+8nQ==
X-Received: by 10.220.83.138 with SMTP id f10mr9979951vcl.7.1370003078810;
	Fri, 31 May 2013 05:24:38 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-116-217-184.cust.dsl.vodafone.it. [37.116.217.184])
	by mx.google.com with ESMTPSA id tf2sm35109800veb.8.2013.05.31.05.24.36
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 31 May 2013 05:24:38 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <51A89679.5020805@redhat.com>
Date: Fri, 31 May 2013 14:24:25 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1369993154-17690-1-git-send-email-thomas@codesourcery.com>
	<51A89273.8010400@msgid.tls.msk.ru>
In-Reply-To: <51A89273.8010400@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.178
Cc: qemu-trivial@nongnu.org, Thomas Schwinge <thomas@codesourcery.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] fpu: Simplify floatx80ToCommonNaN
	function.
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
X-List-Received-Date: Fri, 31 May 2013 12:24:46 -0000

Il 31/05/2013 14:07, Michael Tokarev ha scritto:
> 31.05.2013 13:39, Thomas Schwinge wrote:
>> Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
>> ---
>>  fpu/softfloat-specialize.h |   15 +++++++--------
>>  1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git fpu/softfloat-specialize.h fpu/softfloat-specialize.h
>> index 518f694..83add1a 100644
>> --- fpu/softfloat-specialize.h
>> +++ fpu/softfloat-specialize.h
>> @@ -934,15 +934,14 @@ static commonNaNT floatx80ToCommonNaN( floatx80 a STATUS_PARAM)
>>      commonNaNT z;
>>  
>>      if ( floatx80_is_signaling_nan( a ) ) float_raise( float_flag_invalid STATUS_VAR);
>> -    if ( a.low >> 63 ) {
>> -        z.sign = a.high >> 15;
>> -        z.low = 0;
>> -        z.high = a.low << 1;
>> -    } else {
>> -        z.sign = floatx80_default_nan_high >> 15;
>> -        z.low = 0;
>> -        z.high = floatx80_default_nan_low << 1;
>> +    /* Replace a Pseudo NaN with a default NaN.  */
>> +    if (!(a.low >> 63)) {
>> +        a.low = floatx80_default_nan_low;
>> +        a.high = floatx80_default_nan_high;
>>      }
>> +    z.sign = a.high >> 15;
>> +    z.low = 0;
>> +    z.high = a.low << 1;
>>      return z;
>>  }
> 
> Hmm. And where's the simplification?  Here's context diff for the same:
> 
> *** fpu/softfloat-specialize.h.orig	2013-05-31 16:02:51.614710351 +0400
> --- fpu/softfloat-specialize.h	2013-05-31 16:02:59.838820308 +0400
> ***************
> *** 936,946 ****
>       if ( floatx80_is_signaling_nan( a ) ) float_raise( float_flag_invalid STATUS_VAR);
> !     if ( a.low >> 63 ) {
> !         z.sign = a.high >> 15;
> !         z.low = 0;
> !         z.high = a.low << 1;
> !     } else {
> !         z.sign = floatx80_default_nan_high >> 15;
> !         z.low = 0;
> !         z.high = floatx80_default_nan_low << 1;
>       }
>       return z;
> --- 936,945 ----
>       if ( floatx80_is_signaling_nan( a ) ) float_raise( float_flag_invalid STATUS_VAR);
> !     /* Replace a Pseudo NaN with a default NaN.  */
> !     if (!(a.low >> 63)) {
> !         a.low = floatx80_default_nan_low;
> !         a.high = floatx80_default_nan_high;
>       }
> +     z.sign = a.high >> 15;
> +     z.low = 0;
> +     z.high = a.low << 1;
>       return z;
> 
> 
> Yes, your version is 3 lines shorter, because it
> does not have extra else{} (2 lines) and the
> remaining if() construct is one line shorter too,
> due to moving z.low=0 construct into common place.
> 
> But I don't think your version is more readable, --
> before it was easy to understand what is going on,
> we had two easy case with all right stuff done for
> each case.  Now we do some preparation before, so
> the common case works.
> 
> Generated code should be about the same anyway, but
> to me (IMHO!), original code is a bit more readable.

I agree.  It's also not trivial.

Paolo


