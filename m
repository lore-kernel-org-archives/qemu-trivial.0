Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYuis-00044B-2O
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jun 2018 10:50:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYuiq-00042a-9y
	for qemu-trivial@nongnu.org; Fri, 29 Jun 2018 10:50:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYuip-0003gj-8N
	for qemu-trivial@nongnu.org; Fri, 29 Jun 2018 10:50:04 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYuii-0003HV-Iu; Fri, 29 Jun 2018 10:49:56 -0400
Received: by mail-qk0-x243.google.com with SMTP id b66-v6so5050782qkj.1;
	Fri, 29 Jun 2018 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LyZukr/b7daoh1AweXzo2Cn+KMHoCzZOJqLxIC2PNec=;
	b=VYKUMDBxj65cagi1mQK2E4Z5Pi6Zqwsmp8j8b9U+k4aSDyOwcYI/tuO61bWc2NE3+2
	hQIM5XfAaS6DSrRhM4z14IMUwbQilnI0Es8mCEyjxrCcF+os2GQF4S+Vc1ACuOue9/r7
	z+OMgL05FSAuEYl65+TO4n0aCgkIUuUtY++xnAPG1hNPhjA3EGs2ztAvHsqUcaSTmGx0
	apE4iafGM2Y+vnJvuwQO1sMpiWQnrsbVzFmNqt0plGEQ8aL0ysRm0TXo3nKVgs/LD2Q8
	oxqOjKLwl8gbueHV0CiAlxOUCwUvjw9ARcvZ28uJqRL1Kj3UYqMeATvNVMdau9cbD7Ok
	3jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=LyZukr/b7daoh1AweXzo2Cn+KMHoCzZOJqLxIC2PNec=;
	b=jsjl0Y5ZSRrNy7F0UTJPOUxL9IuFN0s81W7iWa960gZjnm7sSdLYcLrzEotOWTapez
	eJ6fxaoqs9/asrYCDz63nQnC00dvywipJCy/Nd2MrS2O4paYs3WKVng4SL9thJzILvRw
	rn7pqQgfBTQeMkSM5rGz488BafuwO/CP17RxBndsnF5oUKE5On0zTt2l2iQgfVzyATPa
	islHrcpE/WViucsVk9ByKtJJuMT9QhnaSK18FSOeWiWSCed4dI1smSw8xjH5/tx/W1d5
	rFv/8y6RVx8sxg0sJGhHfWLa/Zbj0Q7xPf1nx95C9yf4RaKa3pgLlmJRuI9+W6BFcM3j
	lMfA==
X-Gm-Message-State: APt69E3zrbLYyy2x7qyejMPer1x+HO2MQPWOj5t0YSz3F/vWsjFpb4qV
	LvcBVNiVsNi1Lv7xIhBZHrGAP57N
X-Google-Smtp-Source: AAOMgpc1SoQByXRXSeyakg21VklIlonLdWk0bKwXu5Gex7g7jHNRSz3geCoJHWmx9CcmHqfHM2ay1w==
X-Received: by 2002:a37:151f:: with SMTP id
	f31-v6mr12689437qkh.388.1530283795797; 
	Fri, 29 Jun 2018 07:49:55 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	h64-v6sm6283372qkf.40.2018.06.29.07.49.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 07:49:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-2-f4bug@amsat.org>
	<20180627132747.76773eb9@redhat.com>
	<3dd9341a-f4e6-c107-2f1f-0745d039f03e@redhat.com>
	<15aad1db-2f4c-ea49-9966-a969f0c769f5@amsat.org>
	<c1939f7b-76e2-eca9-2819-d0b4d9a134b1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <0822da0f-1da2-bff3-e465-57654aad7c16@amsat.org>
Date: Fri, 29 Jun 2018 11:49:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <c1939f7b-76e2-eca9-2819-d0b4d9a134b1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 01/46] include: Add IEC
 binary prefixes in "qemu/units.h"
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
X-List-Received-Date: Fri, 29 Jun 2018 14:50:05 -0000

Hi Eric,

On 06/29/2018 09:19 AM, Eric Blake wrote:
> On 06/28/2018 05:53 PM, Philippe Mathieu-Daudé wrote:
> 
>>>>> +#ifndef QEMU_UNITS_H
>>>>> +#define QEMU_UNITS_H
>>>>> +
>>>>> +#define KiB     (INT64_C(1) << 10)
>>>>> +#define MiB     (INT64_C(1) << 20)
>>>>> +#define GiB     (INT64_C(1) << 30)
>>>>> +#define TiB     (INT64_C(1) << 40)
>>>>> +#define PiB     (INT64_C(1) << 50)
>>>>> +#define EiB     (INT64_C(1) << 60)
>>>> Shouldn't above use UINT64_C()
>>>
>>> Since the decision of signed vs. unsigned was intentional based on
>>> review on earlier versions, it may be worth a comment in this file that
>>> these constants are intentionally signed (in usage patterns, these tend
>>> to be multiplied by another value; and while it is easy to go to
>>> unsigned by doing '1U * KiB', you can't go in the opposite direction if
>>> you want a signed number for '1 * KiB' unless KiB is signed).
>>
>> OK.
> 
> Actually, '1U * KiB' still ends up signed.  Why? Because as written, KiB
> is a 64-bit quantity, but 1U is 32-bit; type promotion says that since a
> 64-bit int can represent all 32-bit unsigned values, the result of the
> expression is still signed 64-bit.

Are you suggesting this?

#define KiB     (INT32_C(1) << 10)
#define MiB     (INT32_C(1) << 20)
#define GiB     (INT32_C(1) << 30)

#define TiB     (INT64_C(1) << 40)
#define PiB     (INT64_C(1) << 50)
#define EiB     (INT64_C(1) << 60)

Now than I reread what Richard reviewed, I guess understand he suggested
the same change:
http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg03284.html

> To get unsigned KiB, you either have to use '1ULL * KiB', or KiB should
> be changed to be (INT32_C(1) << 10) (a 32-bit constant, rather than a
> 64-bit one).
> 
>>
>> I'll also change this tests using your suggestion:
>>
>> diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
>> @@ -709,8 +709,7 @@ static void test_opts_parse_size(void)
>>                              false, &error_abort);
>> -    g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0),
>> -                     ==, 16777215 * T_BYTE);
>> +    g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), ==, 16777215U
>> * TiB);
>>
>> to avoid this error on 32-bit archs:
>>
>> source/qemu/tests/test-qemu-opts.c: In function 'test_opts_parse_size':
>> source/qemu/tests/test-qemu-opts.c:713:71: error: integer overflow in
>> expression [-Werror=overflow]
>>    g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), ==, 16777215 *
>> TiB);
>>                                                                         ^
> 
> And this compile error is proof of the confusion when we have a signed
> integer overflow (why it only happens on 32-bit arch and not also on
> 64-bit arch is subtle - it's because TiB is 'long long' on 32-bit, but
> merely 'long' on 64-bit, which results in a different type after type
> promotion - although I still find it odd that the 64-bit compiler isn't
> warning).
> 

