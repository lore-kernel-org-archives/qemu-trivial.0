Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMVX4-0004Gm-ON
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 06:35:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMVX1-0004Ek-7p
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 06:35:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMVX0-0001R1-77
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 06:35:07 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMVX0-0001Oe-0c
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 06:35:06 -0400
Received: by mail-oi1-x244.google.com with SMTP id v23so4038828oif.8
	for <qemu-trivial@nongnu.org>; Fri, 03 May 2019 03:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W8p7sct4LMp93fn1JCApAKZ7MtzmC3ws7T9s70vdvAU=;
	b=yuZwU0wq+d61MYI/ZI9VHvOIEtQq2b/R8mGUJG7RhFzuGc3JALGZQBeuq8D/YrT8q3
	C1LdwSgXkudtkz7GR/kP9uAP3q4g5KngDNa5J3apcDATFSkZ8zd90r4ZPzXu6AyK/GMs
	3TeOMKuf5q5wdiH7IN//4DZFQWnsJMlTL0po420JZ4ETa31Jajo0/Wmai1F8eVY9YQ7G
	TJXJGD0sf9ZazOwvjGpX+zg6ff0oeki7v0/Ql7tSBuoRL1zJuX4ry/kV9Y7qEMdGCL1B
	bU2Mk9J9WvaueDqFMc4hhU4Cb1lZ32+Sw4y6s41ZU0MClS9a0iOumLx8dxaOdwNlt5Ty
	95LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W8p7sct4LMp93fn1JCApAKZ7MtzmC3ws7T9s70vdvAU=;
	b=lJ7HuUPhLVFEwqGwv7sX2nJjltu1iMyAy523PhoqLkHbMvU1SahuzVofuh+PFgkDPt
	tSEkAUDQediXcoivjfZYX/6PPmGQfVdMgLyMVnPmkfLsiJUWhMWcaJR1leIa+mF/AWvN
	0ZpvQT51hlTIAlVm1KqRAAJgsDT/ax1l7sU1dYZyeQk4M/GqNM2OFauLHEkWqoWARXW+
	nCMK+ZhFhbT4bOReJMFzmkv0wV5aQ1naNrzaNamSLy3N0arFyvAjyVvUerxmURD4SB6v
	q32IPi/XyQoYhyRQWdZx36bnWp9PyreA+J6n/a/y8bvNLhKhgLJG3MwpEQWyDl52ClSy
	A3UQ==
X-Gm-Message-State: APjAAAXzTIRd2okysh7O8mLeqdvJFAh/yOPyJN+OmF8rHHNWnoXNw+WD
	Ih4oj0vDPlxV5aguWD/Zvvl/xpzTmb+H810pq8WTtw==
X-Google-Smtp-Source: APXvYqzYYrpW7go7sKkA4LMn1/WCp5cBnoQRealULYrw/pLw+8WDCq/jUELfV2NnAXVrR0PVfQCZsAe8uzy0VxIbEHI=
X-Received: by 2002:aca:4b04:: with SMTP id y4mr5493572oia.170.1556879704999; 
	Fri, 03 May 2019 03:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190502185835.15185-1-laurent@vivier.eu>
In-Reply-To: <20190502185835.15185-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 11:34:53 +0100
Message-ID: <CAFEAcA9-hAU5dxUmSWtbvrPEXE-nCP1uLvLbOby-_EXZ27o+8g@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	Fabien Chouteau <chouteau@adacore.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Jason Wang <jasowang@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Laurent Vivier <lvivier@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-List-Received-Date: Fri, 03 May 2019 10:35:08 -0000

On Thu, 2 May 2019 at 19:58, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 8482ff2eb3bb95020eb2f370a9b3ea26511e41df:
>
>   Merge remote-tracking branch 'remotes/jnsnow/tags/bitmaps-pull-request' into staging (2019-05-02 12:04:51 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to f7c03a68b814254df414977ff299468fbf0fa1c0:
>
>   sockets: avoid string truncation warnings when copying UNIX path (2019-05-02 20:50:47 +0200)
>
> ----------------------------------------------------------------
> Pull request trivial branch 2019-05-02
>
> ----------------------------------------------------------------

Markus's "Clean up includes" patch breaks 'make check' on
big-endian hosts:
cd /home/pm215/qemu/build/all/tests/fp && ./fp-test -s -l 1 -r all  i32_to_f16 i
64_to_f16 i32_to_f32 i64_to_f32 i32_to_f64 i64_to_f64 i32_to_f128 i64_to_f128 >
 int-to-float.out 2>&1 || (cat  int-to-float.out && exit 1;)
>> Testing i32_to_f16, rounding near_even
^M372 tests total.
^M372 tests performed.
In 372 tests, no errors found in i32_to_f16, rounding near_even.
>> Testing i32_to_f16, rounding minMag
[...]
^MErrors found in i32_to_f128:
1006FFFF  => +0000.000000000000401B006FFFF00000 .....
        expected +401B.006FFFF000000000000000000000 .....
^M0001DDEB  => +0000.000000000000400FDDEB00000000 .....
        expected +400F.DDEB000000000000000000000000 .....
^MFFF6FFFC  => +0000.000000000000C012200080000000 .....
        expected -4012.2000800000000000000000000000 .....
^MFFFFFFF8  => +0000.000000000000C002000000000000 .....
        expected -4002.0000000000000000000000000000 .....
[etc]

(I had to bounce Markus' own pullreq from a week or
so back because it had this patch in too and also failed
for this reason.)

thanks
-- PMM

