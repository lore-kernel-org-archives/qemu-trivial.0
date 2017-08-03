Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ddHBc-0004Im-Lz
	for mharc-qemu-trivial@gnu.org; Thu, 03 Aug 2017 10:33:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ddHBa-0004HA-Fg
	for qemu-trivial@nongnu.org; Thu, 03 Aug 2017 10:33:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ddHBZ-0001rk-JF
	for qemu-trivial@nongnu.org; Thu, 03 Aug 2017 10:33:14 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:32883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ddHBZ-0001pd-Cq; Thu, 03 Aug 2017 10:33:13 -0400
Received: by mail-wr0-x242.google.com with SMTP id y43so1143141wrd.0;
	Thu, 03 Aug 2017 07:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oQPUaRkoBMn0tdHP5YDi02Uo4vKB/MPhR2qrmDl18wE=;
	b=YEbutz8qXXKdW6sCLc8L3u2OMaLVnT0PgGiGp39UTykxIjelMYb5rY4PCB7KX7mmns
	MrLLyVMf/GdQ8SBTeWxsCCPNMKeRvELtqI3yWk5bpLu9BpAJJdur3uj+9zKltnCxFVph
	geBm2VD0JfUIK18E9HyZxd248tjH9f8b0LyLL89Idi+UjGbcaQTmcx3ziujlDQtQP/+s
	0icOJqMUzGeYnkAcw2734dhTnewnKxXmqrqvfab3AV6Q+hPJckmma47ghO7BaX8tEayo
	JdjbNADMTn2eaODH4UoFXFhmEmtKnETj8n+7febhUC+o5t1WwX9y9b6cw/umG90e/m+C
	fhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oQPUaRkoBMn0tdHP5YDi02Uo4vKB/MPhR2qrmDl18wE=;
	b=TX+J0adrpHHFeiGXroJUQqUEiVoc9ialjzFgs4ZsZIL08G9NGY32hW/Qh473FYa+yE
	xd3g5T8jN6foBUNwh6emLdALwns4oKhhqH44/qVCBuHOx31iXLwvxISUJRFdadcsJ4Wr
	1nrrkEkK79WSuuXlnmyvMZghrVFLxSyJoJE6Oj3DHKnQRrkxkauE9xYpkxbz6/gMz43I
	eVnhqB6kYT4W0/h0Fp06DF729EobwO4QYyGBAbz0719nwBG1J/kvvfsMP3o7qy3CNwb7
	n6JD/NLAB1UpG0ozGU2hIwdXyJEHLs+GrueO+LhlcItB+xEOLINukv33LDpst3hNzfEE
	AJ4A==
X-Gm-Message-State: AIVw11325nogf0yEemQEIGLptMlcM2D2XhLN4ezTdcrqz2ZPGOksWQC+
	0B9P3c6r+mHujBtPmu/21qh+ZSjI8A==
X-Received: by 10.223.135.35 with SMTP id a32mr1519303wra.138.1501770790656;
	Thu, 03 Aug 2017 07:33:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.70 with HTTP; Thu, 3 Aug 2017 07:32:40 -0700 (PDT)
In-Reply-To: <1c64b26d-e86d-44a6-66c4-f79d68d393ef@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-40-f4bug@amsat.org>
	<CAKmqyKOonEpSCs2k-qJrOP76TV3Nnk08A1s7nBRJV-Ok+q4kow@mail.gmail.com>
	<1c64b26d-e86d-44a6-66c4-f79d68d393ef@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Aug 2017 07:32:40 -0700
Message-ID: <CAKmqyKM8bh4r64feOJ5_BVW_wrDeFzFm+qeEFj2wzZhWQwsOoA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
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
X-List-Received-Date: Thu, 03 Aug 2017 14:33:15 -0000

On Fri, Jul 28, 2017 at 5:49 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 07/28/2017 08:56 PM, Alistair Francis wrote:
>>
>> On Thu, Jul 27, 2017 at 10:36 PM, Philippe Mathieu-Daud=C3=A9
>> <f4bug@amsat.org> wrote:
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>> RFC because I'm not sure m25p80 fits.
>>>
>>>   MAINTAINERS | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 54e35fdab9..83597fca4e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1010,7 +1010,9 @@ M: Peter Crosthwaite <crosthwaite.peter@gmail.com=
>
>>>   S: Maintained
>>>   F: hw/ssi/*
>>>   F: hw/block/m25p80.c
>>> +F: include/hw/ssi/ssi.h
>>>   X: hw/ssi/xilinx_*
>>> +F: tests/m25p80-test.c
>>
>>
>> I'm not sure if Peter is still maintaining this. Maybe it's worth
>> adding another Xilinx email in here as well.
>
>
> you mean yours? M: Alistair Francis <alistair.francis@xilinx.com> below
> Peter's?

I think that's a good idea. Peter hasn't responded to this, so it's
probably best to have someone else on the list.

Thanks,
Alistair

>
>
>>
>> Thanks,
>> Alistair
>>
>>>
>>>   Xilinx SPI
>>>   M: Alistair Francis <alistair.francis@xilinx.com>
>>> --
>>> 2.13.3
>>>
>>>
>

