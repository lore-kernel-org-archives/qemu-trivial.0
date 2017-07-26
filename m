Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daVHu-0006m2-GJ
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 19:00:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daVHq-0006kz-Me
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 19:00:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daVHq-0005KZ-02
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 19:00:14 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:38497)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daVHh-0005BQ-RC; Wed, 26 Jul 2017 19:00:05 -0400
Received: by mail-qt0-x243.google.com with SMTP id p3so8500091qtg.5;
	Wed, 26 Jul 2017 16:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=btZbzqFzTLbZiYY8fJavpCwaYNMM9/nwqWuOYoSqHv4=;
	b=nMz8iKu/EdIBoo6e5ir3M0g+wGZqpFaB4xWLryJs5NDYtJGCQaiv4v9MhaAmxYhjXQ
	uIlJj7ttLU8zfNzvJRtoBWUkp30wd6xiz3c2upigWI8viZIE2Z3gh8abvjqrmq/WuY+2
	dH8zCOuDy9Z7MxudTTihv2B90rwN2LixJHQnuBuUXzaFMNMgA3B8LaCa34FCfUvd1D5C
	jTIrP4Jt93DyKo56CnLNiprsnxgLr60k8AkolFyPiw3LkLqOyqlOOUtD0NOE1gr6eGY9
	yUnm2MIB7MaJvqqfk+tlnniYTg8iwHvMgg0hI+Npgcm+hKZBIYeKArs1ghqNx25auIPr
	jdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=btZbzqFzTLbZiYY8fJavpCwaYNMM9/nwqWuOYoSqHv4=;
	b=W3yYFuBt4+46lIk3ccG2NNjNTI2pXEvYFk35QJPEuLvnlhP9FCT+l+mtT6L+OdwM4r
	Buvo/bG9y6fW8IsWYfiT4tD7M/cs0Cf4w1x8JO3zo/V8zdCZ03l5ua6Vl0HrBWf415MT
	2O6Kwb3yxN/lZf2gkXY1FIUxJvb+Nrm0evgsjj72sK+t8NLkR58+sTX9Hb9o44rINADx
	IpCeKTS/P6u4dL/urKU8+uGlI/AJKbrnLNWkxrqQ2Uq6DIi4PqQjBk+IU4HJBkC3+dbR
	epWj3O2ebrMS6BkejLvHkl++xs7FRBFzTOp70gVSGLSe0uL90qLIPg0rvhuFx99SDZPG
	80uw==
X-Gm-Message-State: AIVw111q6GCLlfCvIn9vKXRpS0lEXbApBkv73ice/o0+okqOOGniOdgD
	Ia9ZQxkGHOy5RrxMtyFqdw==
X-Received: by 10.200.46.161 with SMTP id h30mr3738326qta.202.1501110004760;
	Wed, 26 Jul 2017 16:00:04 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	i50sm12959975qti.92.2017.07.26.16.00.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 16:00:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-21-f4bug@amsat.org>
	<CAFEAcA9RvWoL0cr=irYQ0iphHT9E4pqoQKTW+Bu28uoEJGR3mA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6654b344-3f08-258c-aebc-0888e98efc71@amsat.org>
Date: Wed, 26 Jul 2017 20:00:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9RvWoL0cr=irYQ0iphHT9E4pqoQKTW+Bu28uoEJGR3mA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 20/35] arm/boot:
 fix undefined instruction on secondary smp cpu bootloader
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
X-List-Received-Date: Wed, 26 Jul 2017 23:00:17 -0000

On 07/24/2017 06:06 PM, Peter Maydell wrote:
> On 24 July 2017 at 19:27, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> In a ARM multicore system, write_secondary_boot() only initializes fixups for
>> FIXUP_GIC_CPU_IF and FIXUP_BOOTREG, while smpboot[] also uses FIXUP_DSB.
>> This results in write_bootloader() using uninitialized fixupcontext[FIXUP_DSB]
>> instruction in the bootloader code...
> 
> Hmm? The code does:
> 
>      if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
>          fixupcontext[FIXUP_DSB] = DSB_INSN;
>      } else {
>          fixupcontext[FIXUP_DSB] = CP15_DSB_INSN;
>      }
> 
> so fixupcontext[FIXUP_DSB] is guaranteed initialized,
> as are FIXUP_GIC_CPU_IF and FIXUP_BOOTREG, which are
> the only fixups that the smpboot[] code uses.

Indeed :)

Sorry for the noise, I'll add few hints to the analyzer.

