Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1elFTX-0008MH-GI
	for mharc-qemu-trivial@gnu.org; Mon, 12 Feb 2018 09:52:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elFTV-0008K6-Dp
	for qemu-trivial@nongnu.org; Mon, 12 Feb 2018 09:52:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elFTU-0002da-IS
	for qemu-trivial@nongnu.org; Mon, 12 Feb 2018 09:52:57 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:39818)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1elFTU-0002cp-DU
	for qemu-trivial@nongnu.org; Mon, 12 Feb 2018 09:52:56 -0500
Received: by mail-oi0-x244.google.com with SMTP id j188so11337507oib.6
	for <qemu-trivial@nongnu.org>; Mon, 12 Feb 2018 06:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1JTWFHccjJGxWdDbTvZFmTI/m+L6wnXeYbUk+stt/O0=;
	b=Mksxc8ED2mCBEsdctdhy6zzvmFATu3m6+t59U3NRtfwFvlHR0w8aPE/HjQ6JzFE/Z/
	8c9uYu5X2k45BAdJb1y2Ob7BdJfIuAecKgm2BxLMxTrJw7D7ENIgFv2KK3mFxyXEjv4O
	eqZNNyWcc8mXZ/b5D2bHzJs6fpD7Sv1Ckv+cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1JTWFHccjJGxWdDbTvZFmTI/m+L6wnXeYbUk+stt/O0=;
	b=WjN2ePc5F1KJQQsXeT2o32vq1l8Eh3EHhASzB6mzkEQgZkbirJ8lAext+veIZeUYMY
	yhmoVyUCVg7erg/u85E23FhL/0c46bnf+04FC1wFXVl/xZRoYgi9pIP3uSkctneExUHs
	IFgAN/SqLQc29UklgyU2Gq4pDI7Ge1fb0G35D9Q7Sx3YQlYfn17rvfz0oDRsgCUwDxSY
	seJySrLqxi9qvPi0nsm+tdMw11By7UkP9EN2jqT6OSRJ3gyFoopZjbgiwj02j+/sDJ0V
	xXtNwn04NQ5xboh+39KU6fit3D6YFOrLJ/oLrNMKgseUUM7BOkYtEPl1/XZXcep1sBoM
	7u3g==
X-Gm-Message-State: APf1xPAFtvJuImB4Nx44XkjhSXrxzjSNlDsmPNLkFlIDfiuWL1YP11gf
	VbC6ZvFvzpmdhG0XOGhUO8apguOJ4Uu3avHn2VDfNQ==
X-Google-Smtp-Source: AH8x22795ucOZHfyL7ulqTnbJT7SwVgMEEJqP+asl0UikNI7/b8UQV8viIBNTxjbhNOZhGmbfxb0ifK01Z5rWShEe5I=
X-Received: by 10.202.244.137 with SMTP id s131mr8355654oih.327.1518447175516; 
	Mon, 12 Feb 2018 06:52:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Mon, 12 Feb 2018 06:52:35 -0800 (PST)
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Feb 2018 14:52:35 +0000
Message-ID: <CAFEAcA_K6Ybm44JykAvtGDNb_ZKt-EFuC1D8_O9NfFDx4boteA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/17] Trivial patches for
 2018-02-10
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
X-List-Received-Date: Mon, 12 Feb 2018 14:52:58 -0000

On 10 February 2018 at 07:54, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's a next pull request for the trivial-patches tree.
> After a very long delay.
>
> Hopefully I still remember how to apply patches :)
>
> The following changes since commit c7b02d7d032d6022060e4b393827c963c93ce63f:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-travis-speedup-090218-1' into staging (2018-02-09 16:12:34 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to d40d74a645feea0ad01482da2358804f6574dce0:
>
>   tests/qapi: use ARRAY_SIZE macro (2018-02-10 10:45:14 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2018-02-10
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

