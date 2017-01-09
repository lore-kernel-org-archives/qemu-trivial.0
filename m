Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cQhbR-0006uX-5M
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2017 16:35:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cQhbP-0006u7-2g
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 16:35:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cQhbN-0000XX-Kr
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 16:35:38 -0500
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:34956)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cQhbN-0000Vr-B9
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 16:35:37 -0500
Received: by mail-ua0-x231.google.com with SMTP id y9so142865832uae.2
	for <qemu-trivial@nongnu.org>; Mon, 09 Jan 2017 13:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Wax6YJKVWmRPfLLV0j9DROp6hzFFB9c7fWL9juJPKiQ=;
	b=fgd1xlZXtTCw35Yc7Rg4H8Rh5Yeu2ln55McU0VbNpy5XvKerCJ57rAA2sxJdsFbj6x
	chxw0PXtv2Y2KyjtZtS7AblRAp/X0zdm5N3ocgEV1P8+ULgPZDJhj7zZ8cbYGHVStFiP
	RkupnKcCR56kUTltcKCDhHfAHmMQSibayGZYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Wax6YJKVWmRPfLLV0j9DROp6hzFFB9c7fWL9juJPKiQ=;
	b=fkPfJuI0WWmayBABtfJufj2xLjf55cONNqA6IxjBjM8PnslbQZW2aAANVxsn32WCn4
	DHr05xHla7edsw4r97u+03AM92yLk3OAvj9e99HtdQ+ks7WC4pqgdrFstz3y+DMe4zaq
	j7xoni6S6NRIq05hsQA58DfxjQ0ap5YpnCQiSqKbvwi1isIEgmsoVJEIIdYhsrBRKLoq
	DIszKIIz7t/zY/lt9ki97JjzhJdN/NMXIK2ZTn8W6Hda7c+HUn0RcWKu41Ls8vkSFWAU
	+zTaAdSqNdOlMc+uKXAGW8q7x5qjg4gwPmv+BuJ23RlK8wV5bTQuU5263RLoOS5M5gvj
	riug==
X-Gm-Message-State: AIkVDXJTLjPJf6CMsl9E9Zoo9zyxmqqNXavgQaeocV5tC40mUmXBq2cGbopBrHzriXRQ9+fuXDeuKKxzS/g4G960
X-Received: by 10.176.69.172 with SMTP id u41mr9243370uau.164.1483997736516;
	Mon, 09 Jan 2017 13:35:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Mon, 9 Jan 2017 13:35:16 -0800 (PST)
In-Reply-To: <148398903105.208.13573655327114962163@790289a7ca88>
References: <1483988759-14606-1-git-send-email-peter.maydell@linaro.org>
	<148398903105.208.13573655327114962163@790289a7ca88>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2017 21:35:16 +0000
Message-ID: <CAFEAcA-S6txZ79_N1PTzAGb0dQSV9zpQ-kKyjnYDyyZzsv_4Ug@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Fam Zheng <famz@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] disas/cris.c: Fix Coverity
 warning about unchecked NULL
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
X-List-Received-Date: Mon, 09 Jan 2017 21:35:40 -0000

On 9 January 2017 at 19:10,  <no-reply@patchew.org> wrote:
> Checking PATCH 1/1: disas/cris.c: Fix Coverity warning about unchecked NULL...
> ERROR: code indent should never use tabs
> #24: FILE: disas/cris.c:2493:
> +^Iif (sregp == NULL || sregp->name == NULL)$
>
> ERROR: suspect code indent for conditional statements (8, 10)
> #24: FILE: disas/cris.c:2493:
> +       if (sregp == NULL || sregp->name == NULL)
>           /* Should have been caught as a non-match earlier.  */
>
> ERROR: braces {} are necessary for all arms of this statement
> #24: FILE: disas/cris.c:2493:
> +       if (sregp == NULL || sregp->name == NULL)
> [...]
>
> total: 3 errors, 0 warnings, 8 lines checked

This is because the whole file is GNU coding standards
style, being a binutils import. Better to stick with it rather
than rework, I think.

thanks
-- PMM

