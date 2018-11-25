Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gR3EZ-0000ak-9n
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 17:50:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3EX-0000Zz-57
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 17:50:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3EW-0007MJ-Bo
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 17:50:33 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gR3EW-0007L1-6N
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 17:50:32 -0500
Received: by mail-ot1-x344.google.com with SMTP id v23so9509155otk.9
	for <qemu-trivial@nongnu.org>; Sun, 25 Nov 2018 14:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kxhLBVEQ9wXqeM2FbtUtBixBvKfoDdmGu9+VegkbkTk=;
	b=aqTHZYT0Zy7Mppv9x2J3udk7+yUTOCPJwxJCJSIqU6q5/9Dnq3I2ABUJU7MJUXj1ZG
	xQVCuLiikBxTzDR1UaOuZdyLqodV1S2D3u57iuoZTmTivHZJo6yabAKn0nkPAyD95l9Z
	JfZUXl/rAoGexZ9br6fjItcPi50WNUqk6dUgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kxhLBVEQ9wXqeM2FbtUtBixBvKfoDdmGu9+VegkbkTk=;
	b=MFPRE7ySOxY0hZ2AvQGVtqbf4zKk9tsrTnR9auOJj3pPR/AeMm8GEObRRKgPNBYII8
	mZN70rWQ26lxiQHGJtXGRS4E1L2mdXOPPzAJ/VZLlSKN5hD/hBPWIaqxZt8T8vCG3loX
	0hypa+wHo5oaTXSR+TorH+VPlVwPCe4CPCfr7KzYSpOoGZJezHP+2CoK3bZg8Cwg8tfE
	fusLRb6Q2UsyTChqux1B9itC+dMb73apmGBQyLsRx+PGgocXkgNqbu4wbnnHS2xNurAp
	LxCXsnrYHH8t1t2hsvPCd9NGzZhA8byrLw1uhSGZJYayimhya2nSRDLUieDQuOOCY97H
	f9eg==
X-Gm-Message-State: AA+aEWZGmjxEou4q6JHCI+ZxeA8LyrjC6Q7vHlmpYCi9yqlZX7ch2DnH
	gZ2eI5+wZuOu7KtRIrBQ97Yz4Llt6IeDmOzJWUupWQ==
X-Google-Smtp-Source: AFSGD/VbRIB4CEplEoLTlg4gWaGzpHTBE4NMGJ469Q8DBP1qelt6WQl4WzZWq0vBrzjN63z8k92YBd/d4zQVs2E5Dxo=
X-Received: by 2002:a9d:582e:: with SMTP id r46mr14156618oth.238.1543186231328;
	Sun, 25 Nov 2018 14:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-7-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-7-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Nov 2018 22:50:19 +0000
Message-ID: <CAFEAcA_ujDFu_X0cm5gVppESYeZ4KfNwjJkVKrsCNRgBeeQ1OA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-trivial] [PATCH for-3.1 06/25] MAINTAINERS: Add a missing
 entry for the Xilinx S3A-DSP 1800 machine
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
X-List-Received-Date: Sun, 25 Nov 2018 22:50:33 -0000

On Sun, 25 Nov 2018 at 20:51, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e396cbe71..aa17e9bbd3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -822,6 +822,7 @@ petalogix_s3adsp1800
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>  S: Maintained
>  F: hw/microblaze/petalogix_s3adsp1800_mmu.c
> +include/hw/char/xilinx_uartlite.h

Missing the leading "F: " ?

>  petalogix_ml605
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>

thanks
-- PMM

