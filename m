Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqeCH-0001KA-7O
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 08:22:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gqeCB-00011N-Uw
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 08:21:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gqdyC-0008OH-QM
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 08:07:34 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37765)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1gqdyB-00088K-AL
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 08:07:27 -0500
Received: by mail-wr1-x441.google.com with SMTP id s12so14318706wrt.4
	for <qemu-trivial@nongnu.org>; Mon, 04 Feb 2019 05:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=3SsUp1mg1eJNnuHP4zlUdZNHlWzcEFFT9B9gCFodQKs=;
	b=eFNVTtnwTLkY/GRsYYJtggM6XXnl2JXm8TAflq1otOPPtD3eZl4XoI1lf2VpHRklZc
	50ckF18pHXISu9+npmiVg5l1zQbO38Z8OE44yQ60EgkTdm3KR8DjJMQ83Q1C4FEPhhf8
	tqW2JH7ThqRRAHrvl0sjpwPBUg0VstcLMeLrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=3SsUp1mg1eJNnuHP4zlUdZNHlWzcEFFT9B9gCFodQKs=;
	b=KEAZaJCUdrXIY2wjeWGjNlmemEB+TOcYNPy/MnyKB4OTyjNvGxUqEzYiQeXbMOa/Kd
	+e5r8ZvylJgnMWRcRzu7k0E8QG3bDx1zRFqCb7ODDUKNIH/K1hEg/N3I2RmVk7GpePds
	fyPjZxlfIvAS0Epvs0zG0r9YDCf5CQp20HmPtED4JhgtAehcaWr3RDxppgcoafscQe1r
	TFaxtGJJlsyN5EGOzXLeiLxSsV8TXeo4E1x6ax0Z7i9gwSW4Bqfy+SG37QQkM6QBISfI
	gr+mZi/TcGC0NsmHxDPxy+JQRHbfa4TFqz0ehHMttsCxzaijRVkbqfMhXc+I0fFonq7z
	6zlw==
X-Gm-Message-State: AJcUukeDZerbbbn/hn6bDdMuQixiEaxbS2/onFpSIujuGLxlhboXcx19
	rGLdiArn1W6+S+dEcFDR4irYYQ==
X-Google-Smtp-Source: ALg8bN5/SnOmnsxyMa0c6mda9NoCodyUpzdfCHvSUR8xym3ZJ0gIzaEAdKYPGiU6D+ZEYVFXZsxyjg==
X-Received: by 2002:adf:f308:: with SMTP id i8mr47031777wro.219.1549285644251; 
	Mon, 04 Feb 2019 05:07:24 -0800 (PST)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	i184sm6413079wmd.26.2019.02.04.05.07.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Feb 2019 05:07:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTPS id 47EF51FF7C;
	Mon,  4 Feb 2019 13:07:22 +0000 (UTC)
References: <1549268743-18502-1-git-send-email-thuth@redhat.com>
User-agent: mu4e 1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, Gerd Hoffmann
	<kraxel@redhat.com>, qemu-trivial@nongnu.org, Philippe =?utf-8?Q?Mathieu-?=
	=?utf-8?Q?Daud=C3=A9?= <philmd@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
	=?utf-8?Q?=C3=A9?= <berrange@redhat.com>
In-reply-to: <1549268743-18502-1-git-send-email-thuth@redhat.com>
Date: Mon, 04 Feb 2019 13:07:22 +0000
Message-ID: <87o97r4s8l.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-trivial] [PATCH] tests/docker/test-mingw and docs: Remove
 --with-sdlabi=2.0
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
X-List-Received-Date: Mon, 04 Feb 2019 13:21:56 -0000


Thomas Huth <thuth@redhat.com> writes:

> Patchew currently reports failures with the mingw docker test - this
> is due to --with-sdlabi=3D2.0 configure flag which does not exist anymore.
> Remove this remainder from the docker test and the docs now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

I'm happy for this to be applied directly by Peter.

> ---
>  docs/multiseat.txt      | 2 +-
>  tests/docker/test-mingw | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/docs/multiseat.txt b/docs/multiseat.txt
> index 8dde36c..11850c9 100644
> --- a/docs/multiseat.txt
> +++ b/docs/multiseat.txt
> @@ -9,7 +9,7 @@ First you must compile qemu with a user interface support=
ing
>  multihead/multiseat and input event routing.  Right now this
>  list includes sdl2, gtk (both 2+3) and vnc:
>
> -  ./configure --enable-sdl --with-sdlabi=3D2.0
> +  ./configure --enable-sdl
>
>  or
>
> diff --git a/tests/docker/test-mingw b/tests/docker/test-mingw
> index b078f22..4b84cfe 100755
> --- a/tests/docker/test-mingw
> +++ b/tests/docker/test-mingw
> @@ -27,8 +27,7 @@ for prefix in x86_64-w64-mingw32- i686-w64-mingw32-; do
>          --enable-curl \
>          --enable-vnc \
>          --enable-bzip2 \
> -        --enable-guest-agent \
> -        --with-sdlabi=3D2.0
> +        --enable-guest-agent
>      install_qemu
>      make clean


--
Alex Benn=C3=A9e

