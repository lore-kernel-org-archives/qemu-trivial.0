Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbCMV-00063S-Ld
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 16:59:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1db8R3-0004pN-UA
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 12:48:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1db8R2-000346-Vz
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 12:48:21 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:35074)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1db8R2-00032k-R7; Fri, 28 Jul 2017 12:48:20 -0400
Received: by mail-wr0-x243.google.com with SMTP id c24so23409229wra.2;
	Fri, 28 Jul 2017 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iKXVjRwF/zi0ZVbJyD0mq+GYrx/UHmROfvrSas9UrYw=;
	b=gZA2Yj6ghQNBL9IpUMkmeFgYV54B9S+rKzOxUbRKfrfi+shnsb3eyHM6InJ93FxYrz
	+ivY15/CFDyJs4kfSP6Yg3vXdvF3mF4rXCxwooVA5OqKw1otUigCW1UFg9aa6jH34vgO
	HeCL9KpQym1RjXA49ENiT4ITpaPQ143MwTZcltGgOssEzhPTo8DaOrde3tc6dQ6Kjofl
	62D102Gi3v8T1Jp9MN8jVZLlS0C2YvyJMspTRrIB9diJKO9LWzg6i/6PHpwRaFHT8Nu/
	+itFlIY2YvqLZfUcTjmkQbQnfci593Ge9IkWYDkIAIpfflWSjgx1mtAEZq7/XaFtrZVZ
	6bGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iKXVjRwF/zi0ZVbJyD0mq+GYrx/UHmROfvrSas9UrYw=;
	b=Q6dzvCAOkA1gnCmI7rjgmL8Hv/mKwnMh57eGHg0NPKn49co+UbyNiMRMFp6g5I0ZwO
	4HfsxhsQGehFPUhzVJrlEbboh4ubdRXKUgSFwgDv66pYemuF9glCiLf5gdYYNvOqQ74f
	Vx5Ys60MkW1o2fDLtjs5LJV8D5A6Fh6AHj/02MkLTQ3XqHImBD+bzeOPUPpilQbsSp+R
	kEvk2BQGSmhGGD6xAsSBMkcneAgTr5QT4n3/U7As2IfGMMxrn8wJ5TYTip8E3TixA/DQ
	xXvj2FEosidDDk/J0wJekgGAOuD4srHAnsgpxO4m5aAN0gK2lA5KkADINT4D6mfM/CVk
	fOPA==
X-Gm-Message-State: AIVw113DNb2N42ebMzmXy+WdoFTTTWUUp2ObN8HipbMiBhZefRG9Q0t6
	yID2Vm1yXATE8ThKRPaNXKaqpVGAFw==
X-Received: by 10.223.174.209 with SMTP id y75mr6177022wrc.19.1501260499776;
	Fri, 28 Jul 2017 09:48:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Fri, 28 Jul 2017 09:47:49 -0700 (PDT)
In-Reply-To: <d35b1732-e970-8f52-b09d-9b9e004be39f@redhat.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-4-f4bug@amsat.org>
	<d35b1732-e970-8f52-b09d-9b9e004be39f@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jul 2017 09:47:49 -0700
Message-ID: <CAKmqyKPxJwBJ9kh1r3pEzectwjEmDV3LqFRqQRSetN2-J+=tfw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Alistair Francis <alistair@alistair23.me>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
X-Mailman-Approved-At: Fri, 28 Jul 2017 16:59:54 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/47] MAINTAINERS: add
 missing STM32 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 16:48:23 -0000

On Thu, Jul 27, 2017 at 11:58 PM, Thomas Huth <thuth@redhat.com> wrote:
> On 28.07.2017 07:35, Philippe Mathieu-Daud=C3=A9 wrote:
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 795f89f709..f10252c292 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -556,6 +556,7 @@ F: hw/char/stm32f2xx_usart.c
>>  F: hw/timer/stm32f2xx_timer.c
>>  F: hw/adc/*
>>  F: hw/ssi/stm32f2xx_spi.c
>> +F: include/hw/*/stm32*.h
>>
>>  Netduino 2
>>  M: Alistair Francis <alistair@alistair23.me>
>>
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>

