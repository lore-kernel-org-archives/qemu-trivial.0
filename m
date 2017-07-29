Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbFwW-0008HJ-DW
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 20:49:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbFwU-0008Fp-32
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 20:49:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbFwT-0006Qp-8b
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 20:49:18 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35469)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbFwM-0006KH-W6; Fri, 28 Jul 2017 20:49:11 -0400
Received: by mail-qk0-x243.google.com with SMTP id a77so5099524qkb.2;
	Fri, 28 Jul 2017 17:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Bpv7RpDna/Qjs+LYdXPJFZ0NTOmJrCuY+aOuSQEx1es=;
	b=uqUZ/em6I/gOhoqJA5Pyia5715958ALV0QVdns7g0fJj2uug/xha4cxgKVRzT17u0Y
	9jsX7d2Y7LgMA5bx1PrXj6iUz9JrliYRAC4d1Kf46vrFkVh6kVw+8LS7shC+DCSA3lqy
	QstISkdK08V/3zh8wN/+dqspoASGW/KvcUKXjAKgr9lWv5GeQJQnizL2eqEQXZZjfaZq
	ayhsxLroIleuUx8S2fCB09Og7MQq+CVgKhALMdm2OIzUmVbRLPhu1SeUT0VfK6zNwYQc
	xo5QJkjqw1+VL+JatZbCn6rss4TbdOXOkBLHuZ51Ni1cKO2hAakQnhI/V2A6LU58RXhl
	YKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Bpv7RpDna/Qjs+LYdXPJFZ0NTOmJrCuY+aOuSQEx1es=;
	b=gQKmf43c07fcoKGE7nv+cT0Y0fFmHebyST+Gs922UxevSHxQISM8W923UxCfJ07uy/
	ELKSAr5FefHgWgTTvGEhGK7S3k1vQ2w5Jlz3JFJ9MsERKgk8mWrsNcTFb0w6WTRRXQN5
	0GLSRGq1YiC6FhLRfboGyy2q/RxKVYS8seG31blMDqj9eKC2XI048smSXNN4GGXEpW/1
	cT+aF5/wGBV8ZX/DG1sFjQrNijVny5KiWNvQAcq//kppTX372Q3Ro0+nkY8k9jQkXCGG
	NsRZo/9YbsNu7HTUBuP1jHwQy9IT3T8hPTuJ3L8gU7SBKk5qlUO19o4OzIKMYLUgbyqi
	UJnA==
X-Gm-Message-State: AIVw113OPqIg1T4Ew0cuHKMTsp90yJuoo0e6sB/CG4wIJH/3BL7lXsuH
	JdxPpSzrOfykyNhLHfrsfw==
X-Received: by 10.55.169.134 with SMTP id s128mr12421337qke.69.1501289349813; 
	Fri, 28 Jul 2017 17:49:09 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	u68sm19994715qkg.58.2017.07.28.17.49.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 17:49:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-40-f4bug@amsat.org>
	<CAKmqyKOonEpSCs2k-qJrOP76TV3Nnk08A1s7nBRJV-Ok+q4kow@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1c64b26d-e86d-44a6-66c4-f79d68d393ef@amsat.org>
Date: Fri, 28 Jul 2017 21:49:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOonEpSCs2k-qJrOP76TV3Nnk08A1s7nBRJV-Ok+q4kow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 39/47] MAINTAINERS: add
 missing SSI entries
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
X-List-Received-Date: Sat, 29 Jul 2017 00:49:19 -0000

On 07/28/2017 08:56 PM, Alistair Francis wrote:
> On Thu, Jul 27, 2017 at 10:36 PM, Philippe Mathieu-Daudé
> <f4bug@amsat.org> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> RFC because I'm not sure m25p80 fits.
>>
>>   MAINTAINERS | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 54e35fdab9..83597fca4e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1010,7 +1010,9 @@ M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>>   S: Maintained
>>   F: hw/ssi/*
>>   F: hw/block/m25p80.c
>> +F: include/hw/ssi/ssi.h
>>   X: hw/ssi/xilinx_*
>> +F: tests/m25p80-test.c
> 
> I'm not sure if Peter is still maintaining this. Maybe it's worth
> adding another Xilinx email in here as well.

you mean yours? M: Alistair Francis <alistair.francis@xilinx.com> below 
Peter's?

> 
> Thanks,
> Alistair
> 
>>
>>   Xilinx SPI
>>   M: Alistair Francis <alistair.francis@xilinx.com>
>> --
>> 2.13.3
>>
>>

