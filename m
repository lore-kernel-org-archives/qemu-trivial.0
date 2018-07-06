Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fbTKK-0002qU-01
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2018 12:11:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fbTKI-0002pH-6w
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 12:11:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fbTKH-0004UM-DY
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 12:11:18 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:44198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fbTKH-0004T0-8b
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 12:11:17 -0400
Received: by mail-oi0-x244.google.com with SMTP id s198-v6so24406565oih.11
	for <qemu-trivial@nongnu.org>; Fri, 06 Jul 2018 09:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oUtsapklR1SaVvH5Pq9QVgcuhg07cmvspAOCwVJ7YxE=;
	b=Wd/zsK84cBWn5CvxApEDcga7k/S6EnR+PVTVq4NkYr9i9nYk0KhUODApR08sP9OJ74
	LMGZB5jmwSc5VWrRT//2pGm6+z3mGQ+H9bHiyeu6HprKV9+wUrCUT9f2cOov0AaAEwNi
	i35Tqxgewf6nF+nzmMDpQ+/w8voS7mMVR+krc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oUtsapklR1SaVvH5Pq9QVgcuhg07cmvspAOCwVJ7YxE=;
	b=UGgewMJ2c7EUzxsERrwKzNqKycfcTTcQMyexoRhxvlL0SJ3/0iqz7N8bD9aKD25PX1
	51o5TA6Yh0IOAbSCZQNl0HSQnrCRIQY1JNgQXtDNDhAP2ZcEag89/NXMIm74dbIOgcaw
	zIvpgo8ztfptKqK/0QR0CAT6PeMIvQxO6IcedFkLChLAWupzqCfJtcWy8H2kTbmunL6g
	/FDqhPnWTrVtKwdlBmc4i4LmPlGGM/O7kIcFH8jiRFkzK9yzfukqgTiA/pHfPPYP2aSZ
	wt5aAorz02tVPfLeI0lPn7iWYnH/gRHGUXfDWNiVGhVl1pHfR8OeVR/5Lxq4UaidTeIZ
	GImg==
X-Gm-Message-State: APt69E34D6YhXZuSc9TPvFbirmbNfyTg8W/jjwXjvmkKY59lUwnobDK+
	l72cWqTyClbcNaVJ3HjNgjpT1YM5XKHNoqxf/LeGsA==
X-Google-Smtp-Source: AAOMgpfqQA+Vd88IirwkBe5mDVAGePEknsGAyTTZDwIWM1X/mymwK+0gQUVTJUXES8rSm/NvcnZibB4N8KT7GXTr4P4=
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr11738926oie.80.1530893476713; 
	Fri, 06 Jul 2018 09:11:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Fri, 6 Jul 2018 09:10:56 -0700 (PDT)
In-Reply-To: <20180706155127.7483-4-f4bug@amsat.org>
References: <20180706155127.7483-1-f4bug@amsat.org>
	<20180706155127.7483-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jul 2018 17:10:56 +0100
Message-ID: <CAFEAcA8zY-3kwUrehYhW0OkL07mvam7U=5OnE0K+EDTd1iR1=Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>, 
	QEMU Developers <qemu-devel@nongnu.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [PATCH for-3.0 3/3] linux-user: Report error
 message on stderr, rather than stdout
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
X-List-Received-Date: Fri, 06 Jul 2018 16:11:19 -0000

On 6 July 2018 at 16:51, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> Code change produced with:
>
>   git ls-files linux-user | \
>   xargs sed -i -E 's/(\s+)printf\s*\(("Unhandled.*)\);/\1fprintf(stderr, =
\2);/g'
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  linux-user/alpha/cpu_loop.c      | 2 +-
>  linux-user/cris/cpu_loop.c       | 2 +-
>  linux-user/microblaze/cpu_loop.c | 6 +++---
>  linux-user/sh4/cpu_loop.c        | 2 +-
>  linux-user/sparc/cpu_loop.c      | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)

Makes sense, as we're about to print the cpu_dump_state output to
stderr too.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

