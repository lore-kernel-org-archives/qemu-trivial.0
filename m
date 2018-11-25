Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gR3F9-0000uM-KQ
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 17:51:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3F7-0000su-Gn
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 17:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3F6-00010a-H8
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 17:51:09 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35634)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gR3F6-0000zk-Ch
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 17:51:08 -0500
Received: by mail-ot1-x343.google.com with SMTP id 81so14957658otj.2
	for <qemu-trivial@nongnu.org>; Sun, 25 Nov 2018 14:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=F/zsxdFp/GNh/icUQkioxUABty2Na/KGNQ7ED4I3EuA=;
	b=ZRmL0GI2f+46nypFuuOUnBpC2AL0EzsVYvfeBT4wQyVUYun0a3R369WwxVEZmmWSEL
	B/Hbxq0h5w7av1F/JNJDad3ogLWX2OxHN+omBerKsqaGds2WudNLi4S/DFIoaC7+99sH
	kjQnZ8y6GymRF5g1JaoJN/W768l+E86fdd908=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=F/zsxdFp/GNh/icUQkioxUABty2Na/KGNQ7ED4I3EuA=;
	b=PQoEWB0W03hevlnTFL9mHeh/bgD7N4/Y3ISwYBuoncWwHGEYuIOQE++y1RE88J9HUd
	dM7x+CUDUMl1ILcNpjI0TlVgZ6rjJTK/x+gF3t4KcvOAWoJP740VNowML7kaAAE0FUL7
	gwyns/2BtAGtFRoExJhAZOfUVF+OJEX1wxJXAVAgTvbMJ00yovgjg8Cz1Y0BG8xnvwHF
	61RGnz06C6gpsvxP9i9AdWfpm6vq6zPgIDbhFWMiWXn3aV9Ru2a6GD7zaH1nPK3F0Lvm
	mwdRBN97RgLh6j8bXkpPYe/FctN9p9vcAzlELKalyQwDhpQ74j8HbgnWK6v8LwP2S4pu
	Tj7Q==
X-Gm-Message-State: AA+aEWY/0j0zwy0u68Tq27tTEPyTr/xrccK5no5Hd8V9OjfwO1TMSspn
	MWhTyrNMT3KWTEr8drHzGqEQsrHdmKdOJ99K5r8sFQ==
X-Google-Smtp-Source: AFSGD/Wq7vtHNKzKdLUPM1etdNs3aWBcRxfvj7tGD02Ff3VKcRJZ9T9V0rbe4Aj/FkcXWME527AmqnvwWRI5VVr2moI=
X-Received: by 2002:a9d:5617:: with SMTP id e23mr12775843oti.151.1543186267893;
	Sun, 25 Nov 2018 14:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-16-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-16-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Nov 2018 22:50:56 +0000
Message-ID: <CAFEAcA8ynuCc3RGcGGLc=aKB-DRiVr2joo7BjDNHf_TvXmuRDg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [PATCH for-3.1 15/25] MAINTAINERS: Add missing
 entries for the Canon DIGIC machine
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
X-List-Received-Date: Sun, 25 Nov 2018 22:51:10 -0000

On Sun, 25 Nov 2018 at 20:52, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> This pattern now also matches:
> - include/hw/timer/digic-timer.h
> - include/hw/char/digic-uart.h
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eab0fb9742..e04f2f1a44 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -527,6 +527,7 @@ L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: include/hw/arm/digic.h
>  F: hw/*/digic*
> +F: include/hw/*/digic*
>
>  Gumstix
>  M: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

