Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eA6En-0007Gi-PR
	for mharc-qemu-trivial@gnu.org; Wed, 01 Nov 2017 23:32:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6El-0007GY-NO
	for qemu-trivial@nongnu.org; Wed, 01 Nov 2017 23:32:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6Eh-0006NQ-Nq
	for qemu-trivial@nongnu.org; Wed, 01 Nov 2017 23:32:11 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:47557)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6Eh-0006NI-IM; Wed, 01 Nov 2017 23:32:07 -0400
Received: by mail-qt0-x244.google.com with SMTP id z50so5137789qtj.4;
	Wed, 01 Nov 2017 20:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VIn995Wm5IAUN8Zop0qd40mtSU6Lfamu9rm1CsgE9PE=;
	b=lLYYk/QkxnTtJbKL5MIyJc4vVhNy+smhFVelsj3Mu47AZVlzO6BV/XImsNgKY6DXdX
	JurksRhNX6FMT7ucbIL9Mmskik6JINu1FPaWy1wd6vyZjidYF+PeGT38SguRyfCHaj5F
	mu4u5qGLnz/wdrF2gaJ1s3zEiKUnVl/7g9044fXIEdOvj8hylhfOFcqyG3tLeoEPFxvZ
	qDvZ+B57lU9cvCdJo9FTr3AhYHxNecahMfiNyjQOaJXAX2cl12WMJh6RzLXZ/Y9GRfQq
	BQoQhW4DDpNSPfGM6zdybBxMW19YPocsHTsYIpMUxh30PBPhMcbzuiqPJn00gyR7DMus
	QKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=VIn995Wm5IAUN8Zop0qd40mtSU6Lfamu9rm1CsgE9PE=;
	b=uZ0oDBBGTYJ1iOXhN/tdwhkjVd0MLnJSLY7ltCHxNVdHcsST2BmfliA2OLxDhtYiVv
	7suhcB86vguuRqreBMdp2xh4leEKlqe6k6GMdNEfVM5sANuhqsl/jACEHUvv23nNQhw/
	23moGd7UtjEwUscMT8PP1txu5RRV5pvQRvpEwwArE5biwBX8JVwBcH3cdYfSD5mOfwMS
	FRCoEbXh4yj7CjD+8bKdhSi6ixWh1SIbi/ClHL1eQ82a+m3Gg/FkTqc5De6o4TBWhfXL
	tux9GpW21XH84XHtup52jDJ4XMk0e6PY98b9KXK1tyIsGteMjU+PXcnbnXFrQ4MNyvzn
	D9qg==
X-Gm-Message-State: AMCzsaWoCb+4XO5YLgdcEUWrViV6ECxp771u/inHpLbODcUUEt1KFzCw
	ae5cxfvw3veGkMFgOL+dLdIQzY9f
X-Google-Smtp-Source: ABhQp+Qs6pdMHFRBq2oaHUPfYKpmLQ/zqXc0pW5kiGnaN6/5UXnbbmOZ9qZrgSgA937ljyEilcnPFw==
X-Received: by 10.200.53.200 with SMTP id l8mr3247701qtb.49.1509593526840;
	Wed, 01 Nov 2017 20:32:06 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id s5sm1458286qkc.70.2017.11.01.20.32.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Nov 2017 20:32:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Domen Puncer Kugler <domen@cba.si>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Konrad Frederic <fred.konrad@greensocs.com>
References: <CAB1b2sgGrJbpC5vDMJ2D2kPms_4cGmyfMjpcww4nj6rfNZaF9Q@mail.gmail.com>
Cc: qemu-trivial@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <70579e6d-0fb2-c6d8-9541-0eea53272db2@amsat.org>
Date: Thu, 2 Nov 2017 00:31:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAB1b2sgGrJbpC5vDMJ2D2kPms_4cGmyfMjpcww4nj6rfNZaF9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] 
 =?utf-8?q?=5BPATCH=5D_hw/timer/armv7m=5Fsystick?=
 =?utf-8?q?=3A_Fix_default_system=5Fclock=5Fscale=2E_Resolves_SIGFPE_divid?=
 =?utf-8?b?ZSBieSB6ZXJvLu+/vA==?=
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
X-List-Received-Date: Thu, 02 Nov 2017 03:32:13 -0000

Hi Domen,

Please have a look at the Contribute/SubmitAPatch guidelines for QEMU,
in particular about CC'ing the maintainers so your patch won't get lost:

https://wiki.qemu.org/Contribute/SubmitAPatch#CC_the_relevant_maintainer

$ ./scripts/get_maintainer.pl -f hw/timer/armv7m_systick.c
Peter Maydell <peter.maydell@linaro.org> (maintainer:ARM cores)
qemu-arm@nongnu.org (open list:ARM cores)

^ Cc'ing them how.

On 11/01/2017 05:59 PM, Domen Puncer Kugler wrote:
> Fix default system_clock_scale. Resolves SIGFPE divide by zero.
> 
> Netduino platform code does not provide a way to set
> system_clock_scale, so it remains 0.
> This causes a divide by zero, when emulated code asks systick for
> current timer value:
>     (s->tick - (t + 1)) / systick_scale(s)) + 1;
> Patch fixes this by providing a default value.

See the thread around this reply:
http://lists.nongnu.org/archive/html/qemu-devel/2017-06/msg06678.html

> 
> Also replaces a magic number an with already defined constant:
>     #define SYSTICK_SCALE 1000ULL
> 
> 
> Signed-off-by: Domen Puncer Kugler <domen@cba.si>
> ---
> 
> diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
> index df8d2804b3..651f8030a8 100644
> --- a/hw/timer/armv7m_systick.c
> +++ b/hw/timer/armv7m_systick.c
> @@ -25,15 +25,15 @@
>  #define SYSTICK_CLKSOURCE (1 << 2)
>  #define SYSTICK_COUNTFLAG (1 << 16)
> 
> -int system_clock_scale;
> +uint64_t system_clock_scale = SYSTICK_SCALE;
> 
>  /* Conversion factor from qemu timer to SysTick frequencies.  */
> -static inline int64_t systick_scale(SysTickState *s)
> +static inline uint64_t systick_scale(SysTickState *s)
>  {
>      if (s->control & SYSTICK_CLKSOURCE) {
>          return system_clock_scale;
>      } else {
> -        return 1000;
> +        return SYSTICK_SCALE;
>      }
>  }
> 

Regards,

Phil.

