Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtcCx-0005O1-Sj
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 08:28:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtcCr-0005Ld-EO
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:28:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtcCk-000862-76
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:28:13 -0400
Received: from mail-lb0-f177.google.com ([209.85.217.177]:43709)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtcCk-00085l-0J
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:28:06 -0400
Received: by mail-lb0-f177.google.com with SMTP id s7so2465295lbd.36
	for <qemu-trivial@nongnu.org>; Sun, 08 Jun 2014 05:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VFPclzUSbPaAs+RV6FALKob+r2JTK15hC1jofWMCKok=;
	b=C1cZsTzIySRtd4PNFxAVbp43RKL31qRgvDL+mOxVdOECOvZ8Lw0Fp5aUrJE2KAwmzO
	CIa8Rb6jvU161HzYZT7tJrAZEc9cpXfWTZffvqC0zRIGzf0bsy4YhECEl4Y8c66GtMQr
	bm8nA/vtDPm7cUSMXH2xps2uu2NGYXNobU4jzbV5w7INNQJyY0y7JAr+7YMQ52AaOpv4
	Yegt7qcVZkvsj/sUSCziIsLcqnv2fxljjjH6TYg63ncoNv+n2fOg+H27YTY0JNNc4lqu
	aLXfOjoLZ4HaBNBgHS0+JuSue9K+zL5T42isLSMINuicEZVbCabOZQSEPPY8DsKRy4h7
	t1XQ==
X-Gm-Message-State: ALoCoQnFQJu/uvYRCkWHItec9C6KsQ2Wbr2cd77SyVeJreeiAqdh72/H1Ap5rjV+WXxvAiXxMoKa
X-Received: by 10.112.129.202 with SMTP id ny10mr12422223lbb.14.1402230485063; 
	Sun, 08 Jun 2014 05:28:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Sun, 8 Jun 2014 05:27:44 -0700 (PDT)
In-Reply-To: <539449AE.4090909@msgid.tls.msk.ru>
References: <1402159924-13853-1-git-send-email-peter.maydell@linaro.org>
	<539449AE.4090909@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 8 Jun 2014 13:27:44 +0100
Message-ID: <CAFEAcA8o-1gY5xnJdCEhhfkxfYEv7AkHEXs05746EMj0zna+ow@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.177
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] hw/net/eepro100: Implement read-only
 bits in MDI registers
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Jun 2014 12:28:18 -0000

On 8 June 2014 12:31, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 07.06.2014 20:52, Peter Maydell wrote:
>> Although we defined an eepro100_mdi_mask[] array indicating which bits
>> in the registers are read-only, we weren't actually doing anything with
>> it. Make the MDI register-read code use it rather than manually making
>> registers 2 and 3 totally read-only and the rest totally read-write.
>
> s/register-read/register-write/ -- can be fixed when applying.
>
> I'm not sure this is "trivial enough", because the side effect is
> not obvious, at least not to someone not familiar with eepro100
> registers and their usage.

Mmm, but do you want to suggest a better queue? I did check
that Linux could still boot and talk to the network via an eepro100.

> Besides, the description does not seem to be very accurate too.
> From the code I see that the original code makes register 0
> "semi-writable", register 1 is unwritable and the rest fully
> writable.

Yes, that was wrongly worded. You're correct that it's just
that 1 is unwritable in the original code.

> In this context, apparently we're losing the ability to write to
> register 0 completely, since its mask is 0 but the original code
> allows writing something to it.

Hmm? The mask is a mask of read-only bits, so if mask is zero
then ANDing the register with the mask will clear it, ANDing the
data with ~mask will do nothing, and then ORing the data into
the register means we set every bit in the register. (This
all happens after the register-specific case code, so the work
that does to have some of the bits have special effects by
changing the value of 'data' remains in place.)

> Also, maybe updating the "missing()" calls according to the
> bitmask is a good idea...

That seems like a separate thing; there's a lot of missing
behaviour here, I suspect.

thanks
-- PMM

