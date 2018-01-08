Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYZRx-0004sk-4m
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jan 2018 10:34:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYZRu-0004qb-LP
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 10:34:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYZRt-0001HY-Nj
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 10:34:54 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:43480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYZRt-0001Gl-IG
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 10:34:53 -0500
Received: by mail-ot0-x241.google.com with SMTP id 3so1411254oty.10
	for <qemu-trivial@nongnu.org>; Mon, 08 Jan 2018 07:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BkuDB1S+MKcRP4q69JF0p8ex07OuakmBYNF1rDn0VAs=;
	b=CrVpOuQpTYXFn/bb5NidJ8C3zhQ7QbIjukepQG4/+uHLo6P6KYP+yqSur6ebXZQ4ko
	vJzjmaNuDZYTcTkSqAD7UzK1iejkw4GlbzsL2Gx01plfsFIgvXth04wkY/NbRRhRB2Eg
	vrtZHD4s3zPnlBy/lk5dAEfIr3NWqlNmp+Zhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BkuDB1S+MKcRP4q69JF0p8ex07OuakmBYNF1rDn0VAs=;
	b=AU2oi2W1Zm6zW9HjlkIcJiGK7/SSrVyZ1hArzJaupdnpLPqFKOol6q2xKpdx2RMVza
	yy5vyJqVyN+phG49nCdZkIJOtN23sH2HFrIohZmO9ji0cXDzRrtt0nr9DIJQSL+66kdR
	HCVLUZ5/puOSACGjD292PnWLrMIN+0wf3qqkauqThQz+F1EiacNwu1beQmCi1USG1T28
	1hm8S/gkT8+q+8us85MeFkLn/chT17SGcQjXfa5IhxeW4GwdF7z2YYcgr6GO1avtcWog
	FU5RhVgEQbNpW//3bHD5BYuen4QewDTqIPMwxBfmQaygq0hlkF6z7Oq7gSbxsDAmB2q6
	bJRg==
X-Gm-Message-State: AKwxytddMz70qH3tstlEFUz3pfpg59Arng2Q2Tp1FOf+p3JTFBWMAb81
	Z5XI6NpC28P15tu8fiT9B31CBceyguAruDhvFSjBuQ==
X-Google-Smtp-Source: ACJfBot6fnvSnOR37/hb1MQWSR26UrFllb3Z0Ka+DVfy9C+bywDFtlca6J5AnaYyDhvw3PA4ojOK6Fcquwc9DV45ylw=
X-Received: by 10.157.8.172 with SMTP id 41mr6476833otf.116.1515425692753;
	Mon, 08 Jan 2018 07:34:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 8 Jan 2018 07:34:32 -0800 (PST)
In-Reply-To: <23118.26328.811644.330716@guava.gson.org>
References: <23118.26328.811644.330716@guava.gson.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2018 15:34:32 +0000
Message-ID: <CAFEAcA_iPT14HSkMG4T43H3vykqBu=rFJpBe4idoVh9LFUEJaA@mail.gmail.com>
To: Andreas Gustafsson <gson@gson.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Kamil Rytarowski <kamil@netbsd.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] oslib-posix: check for
 posix_memalign in configure script
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
X-List-Received-Date: Mon, 08 Jan 2018 15:34:55 -0000

On 4 January 2018 at 17:39, Andreas Gustafsson <gson@gson.org> wrote:
> Check for the presence of posix_memalign() in the configure script,
> not using "defined(_POSIX_C_SOURCE) && !defined(__sun__)".  This
> lets qemu use posix_memalign() on NetBSD versions that have it,
> instead of falling back to valloc() which is wasteful when the
> required alignment is smaller than a page.
>
> Signed-off-by: Andreas Gustafsson <gson@gson.org>
> ---
>  configure          | 19 +++++++++++++++++++
>  util/oslib-posix.c |  2 +-
>  2 files changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Can we put this through the -trivial tree? (cc'd)

thanks
-- PMM

