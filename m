Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbF88-0001iy-Oy
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 19:57:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dbF87-0001i1-5i
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 19:57:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dbF86-0004qL-6q
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 19:57:15 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:37221)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dbF86-0004pJ-0o; Fri, 28 Jul 2017 19:57:14 -0400
Received: by mail-wm0-x244.google.com with SMTP id t138so10191869wmt.4;
	Fri, 28 Jul 2017 16:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jTG/hHWBiKED/2ymP9cb3ZNk9F2vpdJIyo3Hs27LnUI=;
	b=EgJHECctZX/qxR0BgSRbZWGVw9LuAiPU9bXjq0SQHSFs4qDDHBZSb723HmnIbB5Swj
	DpAaRCcWYWjcaJ3uE/9iL9RaKjNkeohen0O+uErOOu5iiETEIc11Ao11+AxdPxmO0ZBS
	Le+FA9H8Cotz6FDPywTtnQbiJgFAzmVozqGaVGTJq+CLnyEvCTlJBAdsfOLMxmtTqGKQ
	ujvy47Im2Ns+D70nu01ngfQhzINCIQVcQQyCAbaGztvkNVSudgcJpuFOJvWxfiBHknAu
	4owgMqV3uYfup+ziISQlvQvXOsgiMh9oAl2IOHJa9XgwJMpvIrTHXgFqEZEIwl6LS+hD
	zczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jTG/hHWBiKED/2ymP9cb3ZNk9F2vpdJIyo3Hs27LnUI=;
	b=tVsi9jOAw8P7xp9pBZJdSBldW1q9MemvyV/MNrDMolefWO94xrtzcRBlVbEMGuiccP
	bpdmk5+nB3d5A27jlA7Z5bCDwpJJk8zz0CGO2XPGsWuHq8RTOYMJL0/OOpt5a1aQfwBS
	qIko7cKVmk9i74NDZQclw49i2mAJda0XuhAjCuWLAfYiXPFtrugJxvyDIijmllWVaL92
	HL5weBEhdHNXUDi783Cu/jSHM/MTXKBLpgRbeEdZISVskT0AwEH8dNNeOt70YZRNXHVT
	UZP/VdTg5FLzgmlNuP59S56/PuyPjKfAFHXTLcG/juZreDuqegBSEjW1Ym3de073laks
	DIjQ==
X-Gm-Message-State: AIVw111jYtqJu5+7m4Eq6O00nMp+OP+loVlecNZ6/Atgr/OYxd2Z5y5k
	MW0BZwGZ4NJX+w7nVgzTcqr0aDUtCQ==
X-Received: by 10.28.69.197 with SMTP id l66mr6240352wmi.140.1501286232763;
	Fri, 28 Jul 2017 16:57:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Fri, 28 Jul 2017 16:56:42 -0700 (PDT)
In-Reply-To: <20170728053610.15770-40-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-40-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jul 2017 16:56:42 -0700
Message-ID: <CAKmqyKOonEpSCs2k-qJrOP76TV3Nnk08A1s7nBRJV-Ok+q4kow@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 39/47] MAINTAINERS: add
 missing SSI entries
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
X-List-Received-Date: Fri, 28 Jul 2017 23:57:16 -0000

On Thu, Jul 27, 2017 at 10:36 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> RFC because I'm not sure m25p80 fits.
>
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 54e35fdab9..83597fca4e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1010,7 +1010,9 @@ M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>  S: Maintained
>  F: hw/ssi/*
>  F: hw/block/m25p80.c
> +F: include/hw/ssi/ssi.h
>  X: hw/ssi/xilinx_*
> +F: tests/m25p80-test.c

I'm not sure if Peter is still maintaining this. Maybe it's worth
adding another Xilinx email in here as well.

Thanks,
Alistair

>
>  Xilinx SPI
>  M: Alistair Francis <alistair.francis@xilinx.com>
> --
> 2.13.3
>
>

