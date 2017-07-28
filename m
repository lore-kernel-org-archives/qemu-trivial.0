Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbCMV-00063g-Rr
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 16:59:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1db8SK-0006xk-F3
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 12:49:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1db8SJ-0004PT-MO
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 12:49:40 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:36705)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1db8SJ-0004OC-Ge; Fri, 28 Jul 2017 12:49:39 -0400
Received: by mail-wr0-x244.google.com with SMTP id y67so26138944wrb.3;
	Fri, 28 Jul 2017 09:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IJipzINIZeN5AjAJCRMKWxO9tnON4awpiJwcHwEp8to=;
	b=TLl7E8v7JWN40Au/Lx9eBtxavkkCKfELBwH5A9EOWPI8xDqoVLF2uYR6WsnhBT5Yew
	6odpzW8bP+hJ5w4QWZHqbR9bWB7slKkOnsPx0buSFQkVOKK1XyPdTd06YHf1xgZiCd2e
	arlcI85obSXcFX6yrOCWOrhRXeQgrQ7qqW8ezhPVHeOJy69m6jALR+6znnmTnIz0CvAi
	YdDvFn+35hiLLqrbATPorbebvT6Z9U9NC9TJTr/k40yh7aJXr0287pV4dW+rbpLNsu2o
	//A8aqkLvQ7BF2FP5nZWGd8HcKm1rFPLN6H79zPJEqfH/HddfYWLwJwZjp6RRLHWm2IS
	pfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IJipzINIZeN5AjAJCRMKWxO9tnON4awpiJwcHwEp8to=;
	b=LJvHHpRg2zPH29Sa3C7tWGrOCzDypSxYXuaNZksmmojnQ8IVtcY5cjehVy2AjK0vzs
	BAixryqBuiiOzlDmSD+TlyiilvBGJOg16sFrABGm/gPqn4eKOvqEAKA54tB3f60CART8
	d6g2G8Ru0B1X3tbbt2PF7LtXiV9zUZzJg82EO9VVGuS247Qir9H4mtLIaKvyYEp17dgA
	PaLJVPF9SgK3jPMDD+kDRMLWmqVUFCnsO+IHi76ISTLlX3XmFoBrT1mYsL37mUrqdySO
	dTQOAcAcQJm7h1iSeECtqnW4LNHreeJqRYXlb+mnbBiVoUWsfTWE1l2gBMKtLF/cWE0l
	Sl8w==
X-Gm-Message-State: AIVw113pNS9/Yxh68zJCOYKTVDRLljZykY0pIDECoU1nw1JA9hxPmsiF
	1azfcKOxmGxvdjKIRERcD/LCFiMkbw==
X-Received: by 10.223.166.7 with SMTP id k7mr7328701wrc.34.1501260578433; Fri,
	28 Jul 2017 09:49:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Fri, 28 Jul 2017 09:49:07 -0700 (PDT)
In-Reply-To: <CAKmqyKPxJwBJ9kh1r3pEzectwjEmDV3LqFRqQRSetN2-J+=tfw@mail.gmail.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-4-f4bug@amsat.org>
	<d35b1732-e970-8f52-b09d-9b9e004be39f@redhat.com>
	<CAKmqyKPxJwBJ9kh1r3pEzectwjEmDV3LqFRqQRSetN2-J+=tfw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jul 2017 09:49:07 -0700
Message-ID: <CAKmqyKN01Q01w8zNozM2kF06eyvGBhUit-RXuXFKNWxKvDfOug@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
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
X-List-Received-Date: Fri, 28 Jul 2017 16:49:41 -0000

On Fri, Jul 28, 2017 at 9:47 AM, Alistair Francis <alistair23@gmail.com> wr=
ote:
> On Thu, Jul 27, 2017 at 11:58 PM, Thomas Huth <thuth@redhat.com> wrote:
>> On 28.07.2017 07:35, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Ah, different emails. I guess use this one instead.

Reviewed-by: Alistair Francis <alistair@alistair23.me>

Thanks,
Alistair


>
> Thanks,
> Alistair
>
>>> ---
>>>  MAINTAINERS | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 795f89f709..f10252c292 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -556,6 +556,7 @@ F: hw/char/stm32f2xx_usart.c
>>>  F: hw/timer/stm32f2xx_timer.c
>>>  F: hw/adc/*
>>>  F: hw/ssi/stm32f2xx_spi.c
>>> +F: include/hw/*/stm32*.h
>>>
>>>  Netduino 2
>>>  M: Alistair Francis <alistair@alistair23.me>
>>>
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>

