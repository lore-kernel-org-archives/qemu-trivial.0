Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePcso-0007ru-KY
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 18:25:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePcsm-0007rn-LY
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 18:25:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePcsl-0007VJ-V4
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 18:25:40 -0500
Received: from mail-it0-x230.google.com ([2607:f8b0:4001:c0b::230]:38586)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePcsl-0007V7-Q5; Thu, 14 Dec 2017 18:25:39 -0500
Received: by mail-it0-x230.google.com with SMTP id r6so14960298itr.3;
	Thu, 14 Dec 2017 15:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=IbGSKEqinyAmOC8fC1bg+bQ6B0wYxhgwhdRfw891MZc=;
	b=lTnbvg9B7uqtLKS43b5ArjFMsGu2HhTSlvaW3tVUmwNZbBOujZYVGPceCpzTTmCidf
	trm/F+w+TlZg7NgKKVDfGq9Vocj+cmbo0M+dXUse0E+k6o1rwaRuz4MVsDM/L4NaozUp
	V4H7oLUOKrAO+4xFH9H2ZhYApcq9Co8ih4niH51eP0NJ19ssh1UJHCx2Rdhb3zcblXC4
	55MHxYIqcv6wkEEi3BbobjOsBzB3lQ6l1+Asi30cDDPVPvBlEsokHeK1mdbBm3505N3v
	oc4oJh84oaY1Sr9/48z1TkTAnfNHPzlrcvcOFJMxgDst1/ZKTYxj9cOLVVs0aSr12Ps3
	xY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=IbGSKEqinyAmOC8fC1bg+bQ6B0wYxhgwhdRfw891MZc=;
	b=gO4WcCowqoxfQLD3uH5f0sV3dgZQyY/px/rYQwhHWzcf0RiQHUHSVeJDAA7zL1oJLg
	NLFdFEktN7SY8e+4yQc2WEfVFUKe63MtJLpt3XTxLrtDOHJWocVWoWmoAraeLj/hJiky
	OJ6S0jsau8NbdFNiePOBmZK+ruA4BgWvYFXJDAaPYVj1g2U6rYIEpQaWUQarELrjxZYo
	GTxrCu4bUco7t9KrNn9fu9A9ZH6o2szOd1zK6Q0t22XwOkKbLAQBZ3lV/qmZUbyUKRhL
	TkxSH+vHEHSerEfpDQcVukWuqxCWShpcD6Kin7zRdHbHiAGR+v5h2Fe91AAkOxXRqeV6
	Q40Q==
X-Gm-Message-State: AKGB3mIiS96XCnHEKh568osBhAd5ocVVXKtpaIduVbrjAW2BE0B0AGC5
	14EaSq/WHVS6K7vYe3mKltnKBoT7oCaaBgERA+8=
X-Google-Smtp-Source: ACJfBovkUva/5Zo3oXlEju0FRUi22hf5/YpLNYX/LTrwpBv6noPkM1RwdjZ7UUrBLcn1HIuD3Vo/T51vg5b/diAoSgc=
X-Received: by 10.36.31.204 with SMTP id d195mr5128856itd.133.1513293939108;
	Thu, 14 Dec 2017 15:25:39 -0800 (PST)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.2.183.19 with HTTP; Thu, 14 Dec 2017 15:25:38 -0800 (PST)
In-Reply-To: <CAKmqyKPvAL3+LAqMBtUOc=0igkSwg4Jmf+Q0ySL7C+oech7AMw@mail.gmail.com>
References: <20171213195852.30439-1-f4bug@amsat.org>
	<20171213195852.30439-5-f4bug@amsat.org>
	<CAKmqyKPvAL3+LAqMBtUOc=0igkSwg4Jmf+Q0ySL7C+oech7AMw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 14 Dec 2017 20:25:38 -0300
X-Google-Sender-Auth: GZqSwJNO0Bu7AFuqO-81fMX8MRQ
Message-ID: <CAAdtpL6pT0GD+xkV5P+-J=SGr8_kTrNVBxc207g4mRuojrGe3w@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>, 
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::230
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
X-List-Received-Date: Thu, 14 Dec 2017 23:25:41 -0000

>> @@ -1123,12 +1123,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>>          MASKED_WRITE(s->admaerr, mask, value);
>>          break;
>>      case SDHC_ADMASYSADDR:
>> -        s->admasysaddr = (s->admasysaddr & (0xFFFFFFFF00000000ULL |
>> -                (uint64_t)mask)) | (uint64_t)value;
>> +        s->admasysaddr = deposit64(s->admasysaddr, 32, 0, value);
>
> This doesn't look right.
>
> Originally we were masking admasysaddr with (mask and
> 0xFFFFFFFF00000000). Then ORing in the value.
>
> Now we are depositing value into a bit field that starts at bit 32 and
> has 0 length. I don't see how value will be deposited at all with a 0
> length.

good catch :) I'll respin with:

    case SDHC_ADMASYSADDR:
        s->admasysaddr = deposit64(s->admasysaddr, 0, 32, value)
        break;
    case SDHC_ADMASYSADDR + 4:
        s->admasysaddr = deposit64(s->admasysaddr, 32, 32, value);
        break;

>>          break;
>>      case SDHC_ADMASYSADDR + 4:
>> -        s->admasysaddr = (s->admasysaddr & (0x00000000FFFFFFFFULL |
>> -                ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
>> +        s->admasysaddr = deposit64(s->admasysaddr, 0, 32, value);
>>          break;
>>      case SDHC_FEAER:
>>          s->acmd12errsts |= value;

