Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePdX0-00009P-0o
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 19:07:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePdWx-00007g-5d
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 19:07:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePdWw-0007sF-7D
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 19:07:11 -0500
Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243]:41637)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePdWt-0007mv-Nd; Thu, 14 Dec 2017 19:07:07 -0500
Received: by mail-it0-x243.google.com with SMTP id x28so15650694ita.0;
	Thu, 14 Dec 2017 16:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=7chV4JpUoaM/KftLzDu0l9uk9MrhQkKDP5is2ME2G7w=;
	b=vGX+eIJUSONTMOHU2wLr9olI0KRNORa0jXhwDlw/84M5Sm/iiLsm1q2YzyvUD3JsWl
	sN6DoTu0H4aGaBfXfqhXJkOdDhxMDCvIYb4jpeGLG8pozoXmpiZvBCzJlKgZGzU4eQk6
	51rgBv/OezPxUWJbSEezn11DWNh3X0K0rABjT/bXaa74mdPmkO+U2cqrvFaxfQxBPYAp
	nzkNPAtnSvEkuGWROCpBxB4UUoA0lJ/bi+WAs4viYPVGMnFqhRNh46NdF+QNZsQr+Tpn
	GVFtvHIpzVAzxf50r9adJEY/mM0/9JtnyyhxojvMv7WaZF4aqcz8zCgPkXqhK4a7pS3S
	XLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=7chV4JpUoaM/KftLzDu0l9uk9MrhQkKDP5is2ME2G7w=;
	b=P3D0gdCAzIcHvnOP1xB70Y81hVJRH5GJHT9avgAgRO/t7Z3U4mmJ7oRunP5+Qalf8Q
	dUNm0wHKXGnmdV7VDCxqOw51tWg2mYtmlG6NpE7iJpTE38DmXnzV1td7dH7GH8JugQ2c
	LM/YrK7+/WjvjX7jds4HPYmHtMWzDjZKmB6K2ES487Mq4PGyikhyZq2xUgtEtZ6/EgUS
	YILl7SJHQosm1WYWSI9A3K+pOsfgPKUz4BhC0hZJ8k5txrkJHMlFahA1ApehLGUVZVfk
	aEwz2lYmXDcbdkITfbL0A00jV/fqGxiXzmgtxpqMqvl0EbSSYp3OSzkHvKnhMyLhUF2Q
	+ksw==
X-Gm-Message-State: AKGB3mKtuj4AFui4QCFRH19ClVCBHI0k3AgH1wtNKF1Z2UuDR2nJ7C6T
	tF+7+Gqb0WLEC5kT35VN2G6oIU4PxPdgyPnaF9k=
X-Google-Smtp-Source: ACJfBotRKdod6wqi4o62AxSMQJXFhmkXNuou5XaE7ahdEOplL7e+6BENT/j7c15Zuis6VO1aQgds9FaBAzHL9suJEpI=
X-Received: by 10.36.73.9 with SMTP id z9mr5612454ita.88.1513296426961; Thu,
	14 Dec 2017 16:07:06 -0800 (PST)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.2.183.19 with HTTP; Thu, 14 Dec 2017 16:07:06 -0800 (PST)
In-Reply-To: <CAKmqyKMU46dmqEDhm9My=4ZM4GQf3n_ZLdm5JnFTi-mf3hz7SQ@mail.gmail.com>
References: <20171213195852.30439-1-f4bug@amsat.org>
	<20171213195852.30439-5-f4bug@amsat.org>
	<CAKmqyKPvAL3+LAqMBtUOc=0igkSwg4Jmf+Q0ySL7C+oech7AMw@mail.gmail.com>
	<CAAdtpL6pT0GD+xkV5P+-J=SGr8_kTrNVBxc207g4mRuojrGe3w@mail.gmail.com>
	<CAKmqyKMU46dmqEDhm9My=4ZM4GQf3n_ZLdm5JnFTi-mf3hz7SQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 14 Dec 2017 21:07:06 -0300
X-Google-Sender-Auth: 9mJWXhv7X5QfKy3PpyDZdp60qDE
Message-ID: <CAAdtpL7ybSzQHHucZTfYtKVR6xwa+r7y0_67b8nJpF_EXMZv6Q@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::243
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
X-List-Received-Date: Fri, 15 Dec 2017 00:07:12 -0000

On Thu, Dec 14, 2017 at 8:41 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Thu, Dec 14, 2017 at 3:25 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
>>>> @@ -1123,12 +1123,10 @@ sdhci_write(void *opaque, hwaddr offset, uint6=
4_t val, unsigned size)
>>>>          MASKED_WRITE(s->admaerr, mask, value);
>>>>          break;
>>>>      case SDHC_ADMASYSADDR:
>>>> -        s->admasysaddr =3D (s->admasysaddr & (0xFFFFFFFF00000000ULL |
>>>> -                (uint64_t)mask)) | (uint64_t)value;
>>>> +        s->admasysaddr =3D deposit64(s->admasysaddr, 32, 0, value);
>>>
>>> This doesn't look right.
>>>
>>> Originally we were masking admasysaddr with (mask and
>>> 0xFFFFFFFF00000000). Then ORing in the value.
>>>
>>> Now we are depositing value into a bit field that starts at bit 32 and
>>> has 0 length. I don't see how value will be deposited at all with a 0
>>> length.
>>
>> good catch :) I'll respin with:
>>
>>     case SDHC_ADMASYSADDR:
>>         s->admasysaddr =3D deposit64(s->admasysaddr, 0, 32, value)
>>         break;
>>     case SDHC_ADMASYSADDR + 4:
>>         s->admasysaddr =3D deposit64(s->admasysaddr, 32, 32, value);
>>         break;
>
> This still doesn't take the mask value into account though.
>
> Also, doesn't deposit() shift value up in this case? We want to mask
> the low bits out. I don't have the code in front of me though, so I
> could be wrong here.

We have sdhci_mmio_ops.max_access_size =3D 4, so value will be at most 32bi=
ts.

Now ADMASYSADDR is a 64-bit register, accessible in 2x32-bit.

/**
 * Deposit @fieldval into the 64 bit @value at the bit field specified
 * by the @start and @length parameters, and return the modified
 * @value. Bits of @value outside the bit field are not modified.

uint64_t deposit64(uint64_t value, int start, int length, uint64_t fieldval=
);

in both access we use length=3D32

at SDHC_ADMASYSADDR we use start=3D0,
while at SDHC_ADMASYSADDR + 4 we use start=3D32.

both deposit the 32b value (32b masked) into a 64b s->admasysaddr.

This is good to clarify this now, because the Spec v3 series (and
v4.20 if we want it) add a lot of them.

Regards,

Phil.

