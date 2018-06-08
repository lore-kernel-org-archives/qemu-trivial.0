Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRFyy-0004o3-OH
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 07:55:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRFyu-0004lK-1r
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 07:55:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRFyt-0000AJ-4M
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 07:55:00 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:33938)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fRFys-00009W-Ma
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 07:54:59 -0400
Received: by mail-ot0-x242.google.com with SMTP id r18-v6so885605otk.1
	for <qemu-trivial@nongnu.org>; Fri, 08 Jun 2018 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Ea37MvRMnCX2d1wyfLFa19vFsRxnAI/3DzNID2gq3vM=;
	b=iuN00IqoBZeFoWLRPtsEXJ/OFlMLqgwuDGP8u2CjL6tQ9A9uCBBvh3iHrwFCMf8tBu
	QXb+1RCX2ocYs5LadZJFXIHlxIm+kmmdCEBGav7Tkdeb/fh4SRvUkoVHh6f/i1w2yUWh
	rw/bTVh+CMzHH842CTj/W/yn0WAv36Iryfs78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Ea37MvRMnCX2d1wyfLFa19vFsRxnAI/3DzNID2gq3vM=;
	b=jtVTLhPU0pV7Izxtd7sQRcBoWX7Sk/fRitpYguvqqH6hWQp4RouqP83ijBHZSQJOf+
	O6pYx6feft/kMtObHSwbYEytREli/0ZA2mjgkCRzqb0lai/iELugVY33xZ3Miw8vu+St
	pPk+zyokAlDwXeaQzwavya5b1PnszN2xsNJoyGBDKferOTqbvf1hf2eOVsJ11KzE/ryv
	A33GXqjCwb8EM2ubItpSyhkyvEFVY9zbRJ33iATXP4l7Ed13z6QjTQ9RSYQhqf/b+rG8
	TFjBPagELXC9sOpGxeKZm0nlbGLMxuplaCekAIfP3hl24IRx9FmPZaKZGjLw0uLY0ZKD
	qHVg==
X-Gm-Message-State: APt69E1Tx0OAGactl0dxQ1Td4rraH6Xn97neuidSq2TKf6XyNM1SxoKQ
	Qekuh3vPC/8k0WjAd2rKGheXW2xOOIskofkbDFFTAA==
X-Google-Smtp-Source: ADUXVKIGPAaUkDsYFMruz9gNgbMqG0kMZBQztqyr+KI+azqdnZBPJOpn790zN4EmrKH1G7b4Q+kpqhRLPmkXdZ2ILrs=
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr3693438otd.316.1528458897880; 
	Fri, 08 Jun 2018 04:54:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 04:54:37 -0700 (PDT)
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jun 2018 12:54:37 +0100
Message-ID: <CAFEAcA-9=j8_VmMmAuUbk37uvWKkFEs77NFT3jv4TbWDk4=ZYg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Michael Walle <michael@walle.cc>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
	Paul Burton <paul.burton@mips.com>, Yongbok Kim <yongbok.kim@mips.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>,
	Antony Pavlov <antonynpavlov@gmail.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-trivial] [PATCH 00/11] misc: Add trailing '\n' to
 qemu_log() calls
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
X-List-Received-Date: Fri, 08 Jun 2018 11:55:01 -0000

On 6 June 2018 at 16:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> Nothing very exciting here.
> I sometimes miss to notice some trace events, running with -d unimp,trace=
...
> then using 'grep ^...'. This is only due to a missing '\n' :)
>
> Philippe Mathieu-Daud=C3=A9 (11):
>   hw/sd/milkymist-memcard: Add trailing '\n' to qemu_log() call
>   hw/digic: Add trailing '\n' to qemu_log() calls
>   xilinx-dp: Add trailing '\n' to qemu_log() call
>   ppc/pnv: Add trailing '\n' to qemu_log() calls
>   hw/core/register: Add trailing '\n' to qemu_log() call
>   hw/mips/boston: Add trailing '\n' to qemu_log() calls
>   stellaris: Add trailing '\n' to qemu_log() calls
>   target/arm: Add trailing '\n' to qemu_log() calls
>   target/m68k: Add trailing '\n' to qemu_log() call
>   RISC-V: Add trailing '\n' to qemu_log() calls
>   RFC target/xtensa: Add trailing '\n' to qemu_log() calls
>
>  hw/arm/stellaris.c        | 11 ++++++-----
>  hw/char/digic-uart.c      |  4 ++--
>  hw/core/register.c        |  2 +-
>  hw/display/xlnx_dp.c      |  4 +++-
>  hw/mips/boston.c          |  8 ++++----
>  hw/ppc/pnv_core.c         |  4 ++--
>  hw/sd/milkymist-memcard.c |  2 +-
>  hw/timer/digic-timer.c    |  4 ++--
>  target/arm/helper.c       |  4 ++--
>  target/m68k/translate.c   |  2 +-
>  target/riscv/op_helper.c  |  6 ++++--
>  target/xtensa/translate.c |  6 +++---
>  12 files changed, 31 insertions(+), 26 deletions(-)


Applied to target-arm.next, since about half of these are arm
and the rest are trivial and have got ack/review by the relevant
maintainers.

thanks
-- PMM

