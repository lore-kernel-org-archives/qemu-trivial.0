Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMWBu-0007KX-6C
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 07:17:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMWBs-0007K3-8f
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:17:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMWBr-0007Jb-7j
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:17:20 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50406)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hMWBr-0007IX-06
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:17:19 -0400
Received: by mail-wm1-x342.google.com with SMTP id p21so6647649wmc.0
	for <qemu-trivial@nongnu.org>; Fri, 03 May 2019 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=LDnTsG5ltzP6WaSpBgYWCuVdvbx94yyTbk2ZcTENVLU=;
	b=QAi1Mg13bfBeCPnwf222gzrVn0Um/yXCRqZivLNrA4b9VNRSYHV5oKtlGBQZO8h7du
	3DT5d+eUBDibigQqbnZ7UuSwfLIlPIh9DayFzTcdce2Bcnlsb2dz0bL71ag3euNARNch
	lGEijUPM5FgYGuBxmCUeHc9IUYaEEhNLUWXB/pUqlJfvcG8L8Rda99wAKhkHq3qBD+A7
	Ln/rf96kYlKeWSv16c42ZyNLjUJ77qNkLJyoT2PU6r/BNDa2XLZ2/fSapNtpY5n2nus3
	GNsAambdmqQtW1SWWhu6I7OPs8jJ166tBlHJmROCViL+ig07l6gsM3XDWV3XD73PeR+u
	b6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=LDnTsG5ltzP6WaSpBgYWCuVdvbx94yyTbk2ZcTENVLU=;
	b=Iav3LmHCtc3zXPGeGAJkz6sk1JA7t5KmOnwXIKmyDTy+hSHD690yDnmoZJAwtSgxBw
	4dQKNY8amXqQrpQfPUGqe8xKEo0z9pys39DmG2thXuMnN/+EgbP8p0a2j8RP9abDZjuV
	gfKkg4okg63riSm7pZQSSOtq/DPuH9jpjLfN331ZmGueKVv0ADPldhlpY4kcOdfzCv3E
	EIsEmPawYCOY/GrFzCsTanPi/E4YQkkQouptjvLWTbw/FoEsVWa12vb9xc6KjMqelYt6
	C+iYkjwBzUdp3znv8zhGX/ZpsKQGqQPIW6COlLjFQ0CzHLnJYl1GoWD284RlJ17PzRdQ
	HjWA==
X-Gm-Message-State: APjAAAWHwjRJJ+RYxaNGhyMig8kjGaj1HrYL8jbwAU0Xju50uGUDxkya
	rVwCukLd39R7xhuK+XRRUkRAww==
X-Google-Smtp-Source: APXvYqxYD8TDL0xiELYOnxfokP4V7ComCvUrFEXxy8zVExnIyLyDcP6BbYTCwgeBoMoZkO4tH7Hmew==
X-Received: by 2002:a1c:a103:: with SMTP id k3mr6022549wme.8.1556882237038;
	Fri, 03 May 2019 04:17:17 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	p67sm2000681wmp.22.2019.05.03.04.17.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 May 2019 04:17:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A97B81FF87;
	Fri,  3 May 2019 12:17:15 +0100 (BST)
References: <20190502185835.15185-1-laurent@vivier.eu>
	<CAFEAcA9-hAU5dxUmSWtbvrPEXE-nCP1uLvLbOby-_EXZ27o+8g@mail.gmail.com>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Developers
	<qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Fabien
	Chouteau <chouteau@adacore.com>, Viktor Prutyanov
	<viktor.prutyanov@phystech.edu>, Richard Henderson <rth@twiddle.net>,
	Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Eduardo Habkost
	<ehabkost@redhat.com>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Aurelien Jarno
	<aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>, QEMU Trivial
	<qemu-trivial@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, Michael
	Tokarev <mjt@tls.msk.ru>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
	<berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Michael Roth
	<mdroth@linux.vnet.ibm.com>
In-reply-to: <CAFEAcA9-hAU5dxUmSWtbvrPEXE-nCP1uLvLbOby-_EXZ27o+8g@mail.gmail.com>
Date: Fri, 03 May 2019 12:17:15 +0100
Message-ID: <87sgtv4wjo.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-trivial] [PULL 00/13] Trivial branch patches
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
X-List-Received-Date: Fri, 03 May 2019 11:17:21 -0000


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 2 May 2019 at 19:58, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> The following changes since commit 8482ff2eb3bb95020eb2f370a9b3ea26511e4=
1df:
>>
>>   Merge remote-tracking branch 'remotes/jnsnow/tags/bitmaps-pull-request=
' into staging (2019-05-02 12:04:51 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>>
>> for you to fetch changes up to f7c03a68b814254df414977ff299468fbf0fa1c0:
>>
>>   sockets: avoid string truncation warnings when copying UNIX path (2019=
-05-02 20:50:47 +0200)
>>
>> ----------------------------------------------------------------
>> Pull request trivial branch 2019-05-02
>>
>> ----------------------------------------------------------------
>
> Markus's "Clean up includes" patch breaks 'make check' on
> big-endian hosts:
> cd /home/pm215/qemu/build/all/tests/fp && ./fp-test -s -l 1 -r all  i32_t=
o_f16 i
> 64_to_f16 i32_to_f32 i64_to_f32 i32_to_f64 i64_to_f64 i32_to_f128 i64_to_=
f128 >
>  int-to-float.out 2>&1 || (cat  int-to-float.out && exit 1;)
>>> Testing i32_to_f16, rounding near_even
> ^M372 tests total.
> ^M372 tests performed.
> In 372 tests, no errors found in i32_to_f16, rounding near_even.
>>> Testing i32_to_f16, rounding minMag
> [...]
> ^MErrors found in i32_to_f128:
> 1006FFFF  =3D> +0000.000000000000401B006FFFF00000 .....
>         expected +401B.006FFFF000000000000000000000 .....
> ^M0001DDEB  =3D> +0000.000000000000400FDDEB00000000 .....
>         expected +400F.DDEB000000000000000000000000 .....
> ^MFFF6FFFC  =3D> +0000.000000000000C012200080000000 .....
>         expected -4012.2000800000000000000000000000 .....
> ^MFFFFFFF8  =3D> +0000.000000000000C002000000000000 .....
>         expected -4002.0000000000000000000000000000 .....
> [etc]

Considering the header clean-ups moved bswap related stuff and the
patterns look incorrectly swapped something has gone fishy.

If it's just stuff touching f128 then we have some magic in
softfloat-types:

 typedef struct {
 #ifdef HOST_WORDS_BIGENDIAN
     uint64_t high, low;
 #else
     uint64_t low, high;
 #endif
 } float128;

but I would have though HOST_WORDS_BIGENDIAN is in the config. I shall
have a poke once I get onto the s390 machine.

>
> (I had to bounce Markus' own pullreq from a week or
> so back because it had this patch in too and also failed
> for this reason.)
>
> thanks
> -- PMM


--
Alex Benn=C3=A9e

