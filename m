Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePfA0-0006UY-QD
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 20:51:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePf9y-0006TG-Ka
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 20:51:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePf9x-00023Q-Lm
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 20:51:34 -0500
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:43473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePf9v-0001z4-Ex; Thu, 14 Dec 2017 20:51:31 -0500
Received: by mail-it0-x244.google.com with SMTP id u62so16018425ita.2;
	Thu, 14 Dec 2017 17:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=o3XrStNBZuuansXkoj10t3cnx4otsQuwa4U0Z98RlE0=;
	b=btUeSBuUsxxRYGuAT4QY5SyCJYFot6K2kvbgdNrNRu4A0rcSCxIXAllMzQsUD3hRK6
	51qLEgY8ViXfJbelX8ocb1+w61qLgI96/HjuKUVZRM7YzeqkmBtTAhMjuAYfoeTm2aK0
	/9dxdAuC+2UUgJtkkhyqEmeaFjAqQRb1Ljyy7+ODivzjlmXXMHPMW3DBDbIe21zn+NJl
	m0C+2zUomjrh7DcZs1h6AGwcIJ1qMRficp75fEtlUR+7hoTCy1+a9FJtmrdboY2FdfyF
	ZS4L1kTeCJfIvVLG1vXF/zmhi14T3AiafCkNkUnDUrrd90HiWkX0EfPWYBQDG4HnNqZ0
	gFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=o3XrStNBZuuansXkoj10t3cnx4otsQuwa4U0Z98RlE0=;
	b=nDLtBgsseG35XIk5DvC4H+cqGbJbQ9CT1JMYYu9bgfqB/HaiAz0y8s9Gt7WHDyaZuj
	5eSwbmTcPFPaEV1KUQrCJj5L1yxhd7gvgJx3bM6gwkupE2iKyWCTfFqxeRrEFo94GB68
	UOxHhnNRa8SmInLKdVmOuPki+gYWHUKXSs9gJkNzvTqHA2XI+k6f0U6Q5oka3dDJIziC
	3C2JYNh8z53u8sgssEYM2673FXXEkCwp2HfJPac8/2CfJvtjrUHABH6XTgWJQVwyS+yK
	oqlODr0SmnTUnaZDTPW644FFC8H32PAXNlMuDAwXSKK1wWt3qozk/FXhsHXMEXWGNKD+
	8J3Q==
X-Gm-Message-State: AKGB3mLpUb4mE9h/8g5Q1ATQSdgbYZrs1A5+k4RG3cNRg5FHTqMpi3Yo
	aujB6U5YDksG/508kF0l7K3YWlbuvwcZLZ8EGzM=
X-Google-Smtp-Source: ACJfBou7DDbrc/2aqJVQSP1mUeGyFYWfTOOHk7cd+QJ76lUeGFA3SwpBo6H+AHdtC68NFuXyYdh57tmY2gLy4WHJTaE=
X-Received: by 10.36.70.195 with SMTP id j186mr1563883itb.32.1513302690384;
	Thu, 14 Dec 2017 17:51:30 -0800 (PST)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.2.183.19 with HTTP; Thu, 14 Dec 2017 17:51:29 -0800 (PST)
In-Reply-To: <CAKmqyKNZDeF63PrjUAU4MM8C6VbaJj2Ac6Y4zV1rbF2W9QaYtg@mail.gmail.com>
References: <20171213195852.30439-1-f4bug@amsat.org>
	<20171213195852.30439-5-f4bug@amsat.org>
	<CAKmqyKPvAL3+LAqMBtUOc=0igkSwg4Jmf+Q0ySL7C+oech7AMw@mail.gmail.com>
	<CAAdtpL6pT0GD+xkV5P+-J=SGr8_kTrNVBxc207g4mRuojrGe3w@mail.gmail.com>
	<CAKmqyKMU46dmqEDhm9My=4ZM4GQf3n_ZLdm5JnFTi-mf3hz7SQ@mail.gmail.com>
	<CAAdtpL7ybSzQHHucZTfYtKVR6xwa+r7y0_67b8nJpF_EXMZv6Q@mail.gmail.com>
	<CAKmqyKNZDeF63PrjUAU4MM8C6VbaJj2Ac6Y4zV1rbF2W9QaYtg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 14 Dec 2017 22:51:29 -0300
X-Google-Sender-Auth: lqmmBgoPhipx5UfOtJuRhvRaDTk
Message-ID: <CAAdtpL7c6cCWPH_x-JoPuzY6CoTMtqZactvLcfuwGFGRARScZw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Andrey Smirnov <andrew.smirnov@gmail.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	Sai Pavan Boddu <saipava@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/14] sdhci: use deposit64()
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
X-List-Received-Date: Fri, 15 Dec 2017 01:51:35 -0000

>>>> good catch :) I'll respin with:
>>>>
>>>>     case SDHC_ADMASYSADDR:
>>>>         s->admasysaddr = deposit64(s->admasysaddr, 0, 32, value)
>>>>         break;
>>>>     case SDHC_ADMASYSADDR + 4:
>>>>         s->admasysaddr = deposit64(s->admasysaddr, 32, 32, value);
>>>>         break;
>>>
>>> This still doesn't take the mask value into account though.
>>>
>>> Also, doesn't deposit() shift value up in this case? We want to mask
>>> the low bits out. I don't have the code in front of me though, so I
>>> could be wrong here.
>>
>> We have sdhci_mmio_ops.max_access_size = 4, so value will be at most 32bits.
>
> Ah! Good point.
>
>> Now ADMASYSADDR is a 64-bit register, accessible in 2x32-bit.
>>
>> /**
>>  * Deposit @fieldval into the 64 bit @value at the bit field specified
>>  * by the @start and @length parameters, and return the modified
>>  * @value. Bits of @value outside the bit field are not modified.
>>
>> uint64_t deposit64(uint64_t value, int start, int length, uint64_t fieldval);
>>
>> in both access we use length=32
>>
>> at SDHC_ADMASYSADDR we use start=0,
>> while at SDHC_ADMASYSADDR + 4 we use start=32.
>>
>> both deposit the 32b value (32b masked) into a 64b s->admasysaddr.
>>
>> This is good to clarify this now, because the Spec v3 series (and
>> v4.20 if we want it) add a lot of them.
>
> Ok, this sounds fine to me then.
>
> The mask variable is still being ignored though. value should be anded
> with mask.

This is what deposit64() does:

uint64_t deposit64(uint64_t value, int start, int length, uint64_t fieldval)
{
    uint64_t mask;
    assert(start >= 0 && length > 0 && length <= 64 - start);
    mask = (~0ULL >> (64 - length)) << start;
    return (value & ~mask) | ((fieldval << start) & mask);
}

