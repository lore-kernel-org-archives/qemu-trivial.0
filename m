Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hHVeS-0001Uz-6R
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2019 11:42:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1hHVeQ-0001TV-67
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2019 11:42:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1hHVeP-0002KL-6H
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2019 11:42:06 -0400
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141]:38760)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stephen.checkoway@oberlin.edu>)
	id 1hHVeP-0002Jw-0p
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2019 11:42:05 -0400
Received: by mail-it1-x141.google.com with SMTP id f22so8771116ita.3
	for <qemu-trivial@nongnu.org>; Fri, 19 Apr 2019 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oberlin-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=rXRhStdQCc3dQU4S4qg2Ze2crnUdsX7Qa2mruJ/qLHY=;
	b=JxAFjXokAg1r75PA0j1k346zQWF6+3JJgwj4wqDXY1Mx8osZZEPTj0TPXkU/82BkjW
	rLUkIHFP7CNEHcIjVadH6CNL5jsq3/Z1onEbnF5/FfX1R4u6isMzF6R4FIncn4QCWMJq
	aIfcZL7T4Hfduf2DVfX1lAdOHVchPt40Gr5jKdcY/af2uNVsckGdc7LMAQgZ8urAGLrP
	1r9+H2PEzLVi8Ch5iJ1b1Fz+U0lLnGmM6St4zxin3SwkeGZKgIHYVA7NqD9S6iTI/yDc
	715HW7gLFsjmITa9CnWkTJnI/pAEHiicrSjoFnmqX1KvivvNjEgNNSSj4pQoj/aNtz2d
	/vOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=rXRhStdQCc3dQU4S4qg2Ze2crnUdsX7Qa2mruJ/qLHY=;
	b=IKxAzvopH4SpQqA36Hf+s9B1h66UDeiyLXHvRI82B1aySU2uBFMrTooq8ca+UO5rJy
	Qqy3HM+rdGJ7JvCclXUl96SnpGq/hZ/WrxoGnWS4Av0MDB88hSfLdMBrq8QVAZ5HEcX5
	ICFYHIz4gjLmXDLrPa6LqjqroicnebuJqZwjQsL05ReLoH89WJLKNYPt7r3u180Ps+jY
	c+huejjXreparQfvTVmPsU6btJDgNXhUx2r6YdDtqjQF5ObdDhxsUWdQiqfUq2il2Qfl
	falE8AofGjr9z/EuOkhkuGqQGH96U7fyZx7dKMsR9+efvrms/UIB3oOu/Ic/0EnGoO5Y
	VYLA==
X-Gm-Message-State: APjAAAWSgDZDzCAzz7wo1sB6fCo6it2zEyGTNaKrKcfv3MtEdhKLKu9J
	Owzee6G10+EuJy6z4P2wLrBLgw==
X-Google-Smtp-Source: APXvYqxi/hZCPGgSPaVvRYY4y8KHYZHHd5RsNTkPYEYg8nRTJsKiuWnZ9dmS3Ki8QOjxHXjFJE8pQA==
X-Received: by 2002:a24:e14b:: with SMTP id n72mr3183599ith.34.1555688524303; 
	Fri, 19 Apr 2019 08:42:04 -0700 (PDT)
Received: from ip-70-93.wireless.oberlin.edu (ip-70-93.wireless.oberlin.edu.
	[132.162.70.93]) by smtp.gmail.com with ESMTPSA id
	v126sm2429234itb.30.2019.04.19.08.42.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Apr 2019 08:42:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
In-Reply-To: <aaa450c5-0446-b4b3-40ac-ef87b5522545@redhat.com>
Date: Fri, 19 Apr 2019 11:42:02 -0400
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org,
	=?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <05AF5CE1-3A71-4D78-B35B-C443BE310985@oberlin.edu>
References: <20190417005053.885-1-stephen.checkoway@oberlin.edu>
	<aaa450c5-0446-b4b3-40ac-ef87b5522545@redhat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
X-Mailer: Apple Mail (2.3445.102.3)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::141
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/char/escc: Lower irq
 when transmit buffer is filled
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
X-List-Received-Date: Fri, 19 Apr 2019 15:42:07 -0000



> On Apr 18, 2019, at 08:13, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>=20
> On 4/17/19 2:50 AM, Stephen Checkoway wrote:
>> The SCC/ESCC will briefly stop asserting an interrupt when the
>> transmit FIFO is filled.
>>=20
>> This code doesn't model the transmit FIFO/shift register so the
>> pending transmit interrupt is never deasserted which means that an
>> edge-triggered interrupt controller will never see the low-to-high
>> transition it needs to raise another interrupt. The practical
>> consequence of this is that guest firmware with an interrupt service
>> routine for the ESCC that does not send all of the data it has
>> immediately will stop sending data if the following sequence of
>> events occurs:
>> 1. Disable processor interrupts
>> 2. Write a character to the ESCC
>> 3. Add additional characters to a buffer which is drained by the ISR
>> 4. Enable processor interrupts
>>=20
>> In this case, the first character will be sent, the interrupt will
>> fire and the ISR will output the second character. Since the pending
>> transmit interrupt remains asserted, no additional interrupts will
>> ever fire.
>=20
> You might want to add a line expliciting the chipset model which =
forced
> you to do that patch (Z85C30).

Done.

Thanks for looking at this.

--=20
Stephen Checkoway






