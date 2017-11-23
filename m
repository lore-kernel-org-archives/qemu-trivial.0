Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eHrLC-00021D-Hl
	for mharc-qemu-trivial@gnu.org; Thu, 23 Nov 2017 08:14:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHrLA-0001zh-1s
	for qemu-trivial@nongnu.org; Thu, 23 Nov 2017 08:14:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHrL8-0006Y7-Me
	for qemu-trivial@nongnu.org; Thu, 23 Nov 2017 08:14:52 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:44928)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHrL8-0006Xa-IU
	for qemu-trivial@nongnu.org; Thu, 23 Nov 2017 08:14:50 -0500
Received: by mail-ot0-x244.google.com with SMTP id d27so16273772ote.11
	for <qemu-trivial@nongnu.org>; Thu, 23 Nov 2017 05:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TI2nYfILaC+gJdEs4FbDMaVKTr5+BRVM2lvBHboBwQc=;
	b=gtHTMXRNWgGjZStJcxTfZG0CHkXyOJ9tyrRRBAW0vJnard8PUmHRK+/xYkfpBQSbIj
	5ObGdptVgmSLXAsHOW1eGIXzvMUk/5Mfef51rrecGkyiV2Lfk9iL9D9k4dqX8anVDN6I
	XdT9yvonAurB/eF6lovqZYFZMza94aT5nqbaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TI2nYfILaC+gJdEs4FbDMaVKTr5+BRVM2lvBHboBwQc=;
	b=fAVYGpGHupJh8J32FJWbgExAs2FOamBtlmc/OMGZmRz9mBkfjjdrgUL4aOrBkTmbu3
	1KzbgzPrJERo7UoS6uvLJ6yO/bSth0YXlHe/0gHZURYezISBdu72eqLUxw6rMSrWeyPg
	vgtIEs8vSFcpAz9B7uxy5JLJ6xw+VrO+xUoxTaVG/Eb4kImliMUdsoo/XCz+wn3ZVWa9
	gXKdBE9ItgVvydvJyL2vzzvGRAOS5s01ZtE69clJpruLPbtEOjMpAKz4768scBqEfH4k
	8HOMXKuUPbRhYqCA83G0Df/D5qB7TP2DZK7HO3Pg4zQkdaIfh981axL+yww7d32ZYUSB
	Miow==
X-Gm-Message-State: AJaThX6x75PlUaZJSZ17B/OZjQgB+lzB6ei/4RZDSaNvSckq13fpLpLO
	jqihuABaoIx3zarOGWaNW67rtDXmJaXD5TRQGlKYIw==
X-Google-Smtp-Source: AGs4zMYIF4je3EbVYMiJVgg9WkYtxOHufTNCxzDzRSTIqhRSjAZREPo5sP9fS+hHzhEFtPdXUNsZ5SbKuuliTt0cFZQ=
X-Received: by 10.157.13.168 with SMTP id 37mr17259516ots.197.1511442889959;
	Thu, 23 Nov 2017 05:14:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Thu, 23 Nov 2017 05:14:29 -0800 (PST)
In-Reply-To: <20171116163732.31584-1-sw@weilnetz.de>
References: <20171116163732.31584-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Nov 2017 13:14:29 +0000
Message-ID: <CAFEAcA96KUqqyJeiRhZd+-67CwSEFjb=mnEG0wZ-qbf_ALKQxg@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Fam Zheng <famz@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-trivial] [PATCH for-2.11] Fix build of console and GUI
 executables for Windows
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
X-List-Received-Date: Thu, 23 Nov 2017 13:14:53 -0000

On 16 November 2017 at 16:37, Stefan Weil <sw@weilnetz.de> wrote:
> It was broken by commit 8ecc89f6e792152496eccb684d6c8c48aba8027d which
> moved the SDL linker flags from macro libs_softmmu to macro SDL_LIBS.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> Peter, can you apply this fix directly, or do you need a pull request?
>
> Regards
> Stefan
>
>  Makefile.target | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile.target b/Makefile.target
> index e4244c188a..f9a9da7e7c 100644
> --- a/Makefile.target
> +++ b/Makefile.target
> @@ -22,7 +22,7 @@ QEMU_PROG_BUILD = $(QEMU_PROG)
>  else
>  # system emulator name
>  QEMU_PROG=qemu-system-$(TARGET_NAME)$(EXESUF)
> -ifneq (,$(findstring -mwindows,$(libs_softmmu)))
> +ifneq (,$(findstring -mwindows,$(SDL_LIBS)))
>  # Terminate program name with a 'w' because the linker builds a windows executable.
>  QEMU_PROGW=qemu-system-$(TARGET_NAME)w$(EXESUF)
>  $(QEMU_PROG): $(QEMU_PROGW)
> --
> 2.11.0

Applied, thanks.

-- PMM

