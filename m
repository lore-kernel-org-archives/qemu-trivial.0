Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dp9yz-0007VB-85
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2017 05:17:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dp9yt-0007S8-1q
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 05:17:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dp9yn-0006iI-Ia
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 05:17:14 -0400
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:33112)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dp9yn-0006hK-C1
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 05:17:09 -0400
Received: by mail-wr0-x230.google.com with SMTP id a43so7277736wrc.0
	for <qemu-trivial@nongnu.org>; Tue, 05 Sep 2017 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nJY12jejB31ZapCDEhYjFvVxVPUPiNvk6iiRDSYRFqs=;
	b=UxoZGzRKRm2Jpw+21WLZc+LL0oq76pWXpQ5omILkz26txZYFDgl3EVVqapsG35wtHv
	/JgC04I4kZe0yXU6opmAtWMK7d0s+oCR/naAfE2e6pqaXmipJyimNUAmIPGiyO5n4sTP
	MJhPRQxlbJmwf0X/saCd67F8AlEs0NAqnZm8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nJY12jejB31ZapCDEhYjFvVxVPUPiNvk6iiRDSYRFqs=;
	b=WvLxL+HOFC9FsU3CqmeDFRThxkB6uKwJL5QMJj2D+qJA6YMI1PoH4udRQwb6Bxic7Q
	qDRNE8VqiddQzTgQvwUMvw7YApW3QNuHccAqfb98EfdHgpT1AZja+E45oVLD2x1T514Z
	Jrg2saTKV5XQ82/v0+aOSNR7+5njAlpCGr0GIOCLqTW/IOuBRgSBHJmesvLfXXAnNS5s
	PHR3572wreT45dq9VpHyrLnO0jIXcqeqh+By8kP1eRSUx+NXDsGQ6Ryq0PFskMuuvSr2
	Kh36vi3HteMIhFgmV70dIr/YprCtJVvwVWBvi3TIDmzgFg27Tp5bBoLMoBf1TNHQdHXa
	wApw==
X-Gm-Message-State: AHPjjUjs+4br+nd59FtMZa2ALsjxfZFdNBgAmfYh/x5MFgWLvm9XkdVJ
	yx7tS15yB6S9ZETiJen2WJ6XVUqpp/TJ97M=
X-Google-Smtp-Source: ADKCNb5B7DXE+bDIh6ypRAgtoLz3Xm9sKQ5ixpwq31AoDcKKQ7zL9zMp/acLp2T2Si5zSZSoNRTX4mar2AxdCKe6lG8=
X-Received: by 10.223.145.41 with SMTP id j38mr1781011wrj.314.1504603028297;
	Tue, 05 Sep 2017 02:17:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 02:16:47 -0700 (PDT)
In-Reply-To: <747d805a-98ed-3d36-c4e7-5e6b21b89924@gmx.com>
References: <20170903164952.26760-1-n54@gmx.com>
	<CAFEAcA-wB8JezCNjyU92U83+75C5NccfBHe1G5q-D67H4CMTKA@mail.gmail.com>
	<747d805a-98ed-3d36-c4e7-5e6b21b89924@gmx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 10:16:47 +0100
Message-ID: <CAFEAcA_f55+cJxy2L=PsUX5pE_=0AjqJJ4_spvJRm1D-FKkROg@mail.gmail.com>
To: Kamil Rytarowski <n54@gmx.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Jonathan Perkin <jperkin@joyent.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Do not include lutil
 on SunOS
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
X-List-Received-Date: Tue, 05 Sep 2017 09:17:20 -0000

On 5 September 2017 at 00:46, Kamil Rytarowski <n54@gmx.com> wrote:
> On 04.09.2017 11:32, Peter Maydell wrote:
>> My assumption is that the issue is that Solaris doesn't
>> have a -lutil (it's helpful to quote the linker or
>> compiler error message for this kind of patch to clarify
>> what the failure is that we're trying to fix).
>>
>
> There is no libutil on SmartOS.
>
> I cannot provide any information about the proprietary Solaris here and
> in next questions.

Yes; I was being a bit sloppy referring to all the
forks of opensolaris as 'Solaris' there. Recent news
suggests we don't need to consider support for the
proprietary Solaris...

>> It looks like we use libutil here for openpty, which
>> is used in the test-char test. But the condition we're
>> using in tests/Makefile.include isn't the same as the
>> one we used to decide whether to add -lutil to the
>> emulator binary link line, which is in configure:
>>
>> if test "$darwin" != "yes" -a "$mingw32" != "yes" -a "$solaris" != yes -a \
>>         "$aix" != "yes" -a "$haiku" != "yes" ; then
>>     libs_softmmu="-lutil $libs_softmmu"
>> fi
>>
>> So I think I'd prefer it if we have:
>>  * a configure test for "is openpty() in libutil"
>>  * use that to determine whether to add -lutil to
>>    libs_softmmu and to the libs for tests, rather than
>>    doing OS-specific tests
>>
>
> This looks cleaner. I will go for it.

Thanks. Remember that there are three cases to handle:
 * has openpty, don't need -lutil to get it (OSX is like this I think)
 * has openpty and you need -lutil (Linux)
 * has no openpty at all, use QEMU internal version (smartos)

thanks
-- PMM

