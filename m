Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePd8t-0003z2-5V
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 18:42:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePd8r-0003vs-BZ
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 18:42:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePd8q-0000PM-JR
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 18:42:17 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:37530)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ePd8o-0000LO-Bx; Thu, 14 Dec 2017 18:42:14 -0500
Received: by mail-wm0-x229.google.com with SMTP id f140so14450563wmd.2;
	Thu, 14 Dec 2017 15:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=OcVJIBb0clSsGOYjiua6bnfONByloLZqNf2TPu4OHSk=;
	b=UuwbnpSZ6gVkvUhTqCJYYCKUhHvUhxKh/FMfc1F9Qkxl+JoHkUsdt3QR+3aD/nSFCY
	Ejm7n03HbY8U095y3DUbspzZEEIa/ChdF9cpZ2NG72SnNPn9u7jPgEtTzgB0Zw1cf1/l
	+b4nxhMHk7un24lV5XcuMg4+v2a0c+UH+S5AZ+1F0kH5Q0iG4OzOSS52UYhV5pPMrxBW
	Uh7Ugk5uZ0sGFJbuWPEqRngrgXXW56Oh0aV6cEPuwTNy7gbfYRTxEfoiKIR+1yFFX9sL
	zFpNv3gTNNMWIureqxYZYUBe3fHlG3Yle7gkdkSXWrfZ2F73LEn8IhRNRATHk8C2wbT7
	2WVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=OcVJIBb0clSsGOYjiua6bnfONByloLZqNf2TPu4OHSk=;
	b=eIfWjQp1Ut9U+r+gdWuhZKAzzsWxkTzUDfAIgiW6VjlTMqNi1EapDBWI0P4J/D2dgW
	+2i1y5jICFb9LBRxEaIlFyH4mWwI1kHvlOUI6m0cl/yp1GdSBIm4Xj9KdAqi7DdgqgDV
	UB/lkSZ8Y7JsbYL54BBthzSRChiYiDoRNbXc4mqFmob0rXH27h7sWcH4cueThUJ0osWg
	iFOGBgw+4/Rh+MwCFhGff6tAzyiwh3tsyMYkqevqD9xUYJtIBY+mY8Zhoo9NDebshPlc
	W0bi7AxCbI4N3t3EkszziBgk6J8fy/2V+P5Nfo8/lyW6/QEokTQm7mXA8hjJaoyGS3CO
	EJKA==
X-Gm-Message-State: AKGB3mKNK6eiCkUgD7Ht74IsBkQczgtCHfBpKTfv3dMzFwrZyTA5soMh
	bqG4p7j0NfN7Ku/giYmYFKH+ZxfQDw4pfG27cNM=
X-Google-Smtp-Source: ACJfBosa8fFGXqSZSWAOdPcVoupcvhjZEFPOZ8JlQNRc2cvHjyCjytFr1X5NKlm+r6ub6Vsw1wC9OUVWsiF8dw7hJoQ=
X-Received: by 10.28.227.136 with SMTP id a130mr3736547wmh.104.1513294933221; 
	Thu, 14 Dec 2017 15:42:13 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Thu, 14 Dec 2017 15:41:42 -0800 (PST)
In-Reply-To: <CAAdtpL6pT0GD+xkV5P+-J=SGr8_kTrNVBxc207g4mRuojrGe3w@mail.gmail.com>
References: <20171213195852.30439-1-f4bug@amsat.org>
	<20171213195852.30439-5-f4bug@amsat.org>
	<CAKmqyKPvAL3+LAqMBtUOc=0igkSwg4Jmf+Q0ySL7C+oech7AMw@mail.gmail.com>
	<CAAdtpL6pT0GD+xkV5P+-J=SGr8_kTrNVBxc207g4mRuojrGe3w@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 14 Dec 2017 15:41:42 -0800
X-Google-Sender-Auth: k_cU-lEfdAHsErV32ua8RzBLtJg
Message-ID: <CAKmqyKMU46dmqEDhm9My=4ZM4GQf3n_ZLdm5JnFTi-mf3hz7SQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>, 
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
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
X-Received-From: 2a00:1450:400c:c09::229
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
X-List-Received-Date: Thu, 14 Dec 2017 23:42:18 -0000

On Thu, Dec 14, 2017 at 3:25 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>>> @@ -1123,12 +1123,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64=
_t val, unsigned size)
>>>          MASKED_WRITE(s->admaerr, mask, value);
>>>          break;
>>>      case SDHC_ADMASYSADDR:
>>> -        s->admasysaddr =3D (s->admasysaddr & (0xFFFFFFFF00000000ULL |
>>> -                (uint64_t)mask)) | (uint64_t)value;
>>> +        s->admasysaddr =3D deposit64(s->admasysaddr, 32, 0, value);
>>
>> This doesn't look right.
>>
>> Originally we were masking admasysaddr with (mask and
>> 0xFFFFFFFF00000000). Then ORing in the value.
>>
>> Now we are depositing value into a bit field that starts at bit 32 and
>> has 0 length. I don't see how value will be deposited at all with a 0
>> length.
>
> good catch :) I'll respin with:
>
>     case SDHC_ADMASYSADDR:
>         s->admasysaddr =3D deposit64(s->admasysaddr, 0, 32, value)
>         break;
>     case SDHC_ADMASYSADDR + 4:
>         s->admasysaddr =3D deposit64(s->admasysaddr, 32, 32, value);
>         break;

This still doesn't take the mask value into account though.

Also, doesn't deposit() shift value up in this case? We want to mask
the low bits out. I don't have the code in front of me though, so I
could be wrong here.

Alistair

>
>>>          break;
>>>      case SDHC_ADMASYSADDR + 4:
>>> -        s->admasysaddr =3D (s->admasysaddr & (0x00000000FFFFFFFFULL |
>>> -                ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
>>> +        s->admasysaddr =3D deposit64(s->admasysaddr, 0, 32, value);
>>>          break;
>>>      case SDHC_FEAER:
>>>          s->acmd12errsts |=3D value;
>

