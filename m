Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eANDA-00033S-3K
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 17:39:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <domen.puncer@gmail.com>) id 1eAND7-00031r-Vz
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 17:39:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <domen.puncer@gmail.com>) id 1eAND7-0000Av-0d
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 17:39:38 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:53652)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <domen.puncer@gmail.com>)
	id 1eAND4-00009o-Hc; Thu, 02 Nov 2017 17:39:34 -0400
Received: by mail-pg0-x242.google.com with SMTP id s2so731305pge.10;
	Thu, 02 Nov 2017 14:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=X3Z+eov/6cLCKQoU5LguHn/ITqQmklfYdabWYXVWZKw=;
	b=FfH8oE010h9RyUlXMZ6NWkED9/6tjmtBz2QwGX43OsskRJSca2Yg30qDm/u5gF/Yr5
	qAhPHKQoEAO4+hCzNkGx8JZFlkaU2oKt/cDYb5Ur/hMJwGWSszgaVvJAeXOVjzKqmcmQ
	pP+RBLQn1oftMl9hE5DrPy2/4YiP7Oi8yQUlsMWJkvQArTuPUxkYA4Q1gd+6pCCmqlkT
	JsX2L1E3kmB8oUjK/6vDvZwWdrQOCuH5qooZEdAnjju7oZsUz38GCFkPE+Ush/Dgucv4
	32q1XRuMFflhdVQe1GU0hf+gr8O6PLJZ6wMKFUdwH8BxcBq/chHmnDqsvsaBjq2umh8O
	ydhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=X3Z+eov/6cLCKQoU5LguHn/ITqQmklfYdabWYXVWZKw=;
	b=CXQxcg9nVkCNlvRBOYhT5LUoWkZkUvhPYOwfWoMXhJi+Qe6w0n3KINp5zHa2O1J5M9
	XqKsd0Jw/BPLjynCwMOu2FqApwsb0KAr4V54RqRuROGWKHqj1rTaG7MpjeNIqopn/H7k
	i0iBnOxbEFk9uBaY/gwjhESP4fVgV6/hIyNiUGksFfhnN0NmVlLS/OMoOxixkU3UxWsp
	ARQnUsUfl2NtpnfAgv/mPTfg239a5mavi+3uuwYJStjY5wEesA3mBbwOYSgctjDarSYi
	C7PgfxXXkTtz67frYwFMM3I22EfUOcNsdYM7W8sXA0370l9EnYwgRgj+MngGfsvQMKiI
	5uRw==
X-Gm-Message-State: AMCzsaUjRbJa64OorBAWbv45E3BX/UfYUVUrBD+OgPN039HaibykwAvh
	OrYRSTRy/mw0w5/ty7ABtIgfYKpK0iFnrY9Sao8=
X-Google-Smtp-Source: ABhQp+Q9PculBw6WN46NfKupGRWVscEaoRK4+DG09zQ5Ey71rlUNvZIt1/gNCCLUS3lSNiaXAVgumpXA+T+dsw8COGk=
X-Received: by 10.99.99.71 with SMTP id x68mr5076275pgb.334.1509658772950;
	Thu, 02 Nov 2017 14:39:32 -0700 (PDT)
MIME-Version: 1.0
Sender: domen.puncer@gmail.com
Received: by 10.100.164.97 with HTTP; Thu, 2 Nov 2017 14:39:32 -0700 (PDT)
In-Reply-To: <70579e6d-0fb2-c6d8-9541-0eea53272db2@amsat.org>
References: <CAB1b2sgGrJbpC5vDMJ2D2kPms_4cGmyfMjpcww4nj6rfNZaF9Q@mail.gmail.com>
	<70579e6d-0fb2-c6d8-9541-0eea53272db2@amsat.org>
From: Domen Puncer Kugler <domen@cba.si>
Date: Thu, 2 Nov 2017 21:39:32 +0000
X-Google-Sender-Auth: VCqp4b7nEbLPHjJQWEScL-cdNSs
Message-ID: <CAB1b2shHRD1RSSMvO+QgwFRQKwMVuj8+hASACNquGNtC3tSgCw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	Konrad Frederic <fred.konrad@greensocs.com>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-trivial] 
	=?utf-8?q?=5BPATCH=5D_hw/timer/armv7m=5Fsystick?=
	=?utf-8?q?=3A_Fix_default_system=5Fclock=5Fscale=2E_Resolves_SIGFP?=
	=?utf-8?q?E_divide_by_zero=2E=EF=BF=BC?=
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
X-List-Received-Date: Thu, 02 Nov 2017 21:39:39 -0000

On 2 November 2017 at 03:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Please have a look at the Contribute/SubmitAPatch guidelines for QEMU,
> in particular about CC'ing the maintainers so your patch won't get lost:

Apologies for that.
Thanks

>> Netduino platform code does not provide a way to set
>> system_clock_scale, so it remains 0.
>> This causes a divide by zero, when emulated code asks systick for
>> current timer value:
>>     (s->tick - (t + 1)) / systick_scale(s)) + 1;
>> Patch fixes this by providing a default value.
>
> See the thread around this reply:
> http://lists.nongnu.org/archive/html/qemu-devel/2017-06/msg06678.html

I see. Personally, I don't really mind waiting for proper support.
It's a solved problem for me now (SYSTICK_CLKSOURCE =3D 0 [external] for
qemu target), but I suspect it might also bite someone else.
Are there any downsides to the simple fix?

For background:

arm arm v7m says:
[2] R/W CLKSOURCE 0: clock source is (optional) external reference clock
                  1: core clock used for SysTick
                  If no external clock provided, this bit will read as
1 and ignore writes.
// note that the optional case actually works fine with qemu, core
clock case doesn't

stm32 docs say (my target is stm32/netduino2):
The RCC feeds the external clock of the Cortex System Timer (SysTick)
with the AHB clock (HCLK) divided by 8. The SysTick can work either
with this clock or with the Cortex clock (HCLK), configurable in the
SysTick control and status register.
The timer clock frequencies are automatically set by hardware.

