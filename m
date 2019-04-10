Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEJPo-00029H-85
	for mharc-qemu-trivial@gnu.org; Wed, 10 Apr 2019 16:01:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEJPk-00028w-Vm
	for qemu-trivial@nongnu.org; Wed, 10 Apr 2019 16:01:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEJPg-00080f-OB
	for qemu-trivial@nongnu.org; Wed, 10 Apr 2019 16:01:42 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35939)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hEJPa-0007wM-TT
	for qemu-trivial@nongnu.org; Wed, 10 Apr 2019 16:01:36 -0400
Received: by mail-wr1-f66.google.com with SMTP id y13so4416007wrd.3
	for <qemu-trivial@nongnu.org>; Wed, 10 Apr 2019 13:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=G4RH2D6PPWQz6Xc+ZAdvZ+q0zeeNMRyHXYBq7Rf5VB0=;
	b=UUP8q0ueDb1itNCkyjvKUuI2Qdzcr5pDYCMb0BmXLtw9n/g1ohdvh2lzm98K7YVJYM
	Uy9B8vxJOLeFrH2mjqQvgEkb8pawtJleUfFWGc+635jtJh+fTLqPJWiyGI94/4NrfMxw
	KwR42gjVkTMFv1VxjLnN71ISahadLXzNrYKMlAac3kgooL5MGaCc8+bWTlRujp/mS6Ve
	5qS6Rqw41QBPKQckwVaN/ZMv9EH+ewTsavB/qgLrRfpUypz8lvL1uQ/hfALcga6aykv1
	WBnDeXBxVDcQjbZZRTldjS9z5APlNf/cEh+9fG8OVSVqauhZZVQUruhG0OkCEHVKBOgf
	RIFg==
X-Gm-Message-State: APjAAAVzuBzDtqKnLh1+7UtETIXEDKyLIn1JlH/lyG8bhnwrBntCa9WI
	SnhRIPlJMOMMsaV3MKNWpeH5sQ==
X-Google-Smtp-Source: APXvYqymGI8vLX4yZ0xiA9uLf+D8tY494tXWInDdqRJG1SnZngHCqubWpRCAike+jQ2Od3qFlsTVKA==
X-Received: by 2002:adf:e4c2:: with SMTP id v2mr27889256wrm.124.1554926485180; 
	Wed, 10 Apr 2019 13:01:25 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	o2sm29376356wrs.89.2019.04.10.13.01.24
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Apr 2019 13:01:24 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>,
	Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-devel@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20190305051007.56009-1-stephen.checkoway@oberlin.edu>
	<52a82d3a-3b79-c61d-93fa-f087af45f6fb@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1328f591-897f-8762-d324-cccb5f63a360@redhat.com>
Date: Wed, 10 Apr 2019 22:01:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <52a82d3a-3b79-c61d-93fa-f087af45f6fb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/char/escc: Lower irq
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
X-List-Received-Date: Wed, 10 Apr 2019 20:01:47 -0000

On 3/6/19 12:01 PM, Paolo Bonzini wrote:
> On 05/03/19 06:10, Stephen Checkoway wrote:
>> The SCC/ESCC will briefly stop asserting an interrupt when the
>> transmit FIFO is filled.
>>
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
>>
>> In this case, the first character will be sent, the interrupt will
>> fire and the ISR will output the second character. Since the pending
>> transmit interrupt remains asserted, no additional interrupts will
>> ever fire.
>>
>> This fixes that situation by explicitly lowering the IRQ when a
>> character is written to the buffer.
>>
>> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> 
> Looks good but I would like Mark to give his ack as well.
> 
> Mark, could you also add hw/char/escc.c to both SPARC and Mac sections
> of MAINTAINERS?

Cc'ing Artyom who also made some changes in this file, and Laurent.


Stephen, which particular chipset are you using?

This file models various types. I had a talk with Mark or Laurent at
last KVM forum about this device. IIRC, while the sun4m machines use a
real chipset, the MacIO embeds an slighly modified IP core.

I can't find what you describe in the Z85C30 doc, however in the ESCC
datasheet referenced in escc.c (which happens to be a 85MiB pdf!!!) I found:

  Transmit Interrupts and Transmit Buffer Empty Bit on the NMOS/CMOS

  The TxIP is reset either by writing data to the transmit buffer or
  by issuing the Reset Tx Int command in WR0.

I understand the NMOS/CMOS desc. matches the Z85C30 (no FIFO used).

So your description and patch makes sens.
What worries me is the controller could have other pending IRQs to
deliver and you are clearing them. Shouldn't we only clear the
INTR_TXINT bit, and call escc_update_irq() which should lower the IRQ if
no bits are pending?

Maybe as:

    s->wregs[W_INTR] &= ~INTR_TXINT;
    escc_update_irq(s);

Thanks,

Phil.

> Thanks,
> 
> Paolo
> 
>> ---
>>  hw/char/escc.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/char/escc.c b/hw/char/escc.c
>> index 628f5f81f7..bea55ad8da 100644
>> --- a/hw/char/escc.c
>> +++ b/hw/char/escc.c
>> @@ -509,6 +509,7 @@ static void escc_mem_write(void *opaque, hwaddr addr,
>>          break;
>>      case SERIAL_DATA:
>>          trace_escc_mem_writeb_data(CHN_C(s), val);
>> +        qemu_irq_lower(s->irq);
>>          s->tx = val;
>>          if (s->wregs[W_TXCTRL2] & TXCTRL2_TXEN) { // tx enabled
>>              if (qemu_chr_fe_backend_connected(&s->chr)) {
>>
> 
> 

