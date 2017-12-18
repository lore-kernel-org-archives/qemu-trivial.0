Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQybG-0006aJ-8P
	for mharc-qemu-trivial@gnu.org; Mon, 18 Dec 2017 11:49:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eQybE-0006Z7-6P
	for qemu-trivial@nongnu.org; Mon, 18 Dec 2017 11:49:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eQybA-0004vy-FH
	for qemu-trivial@nongnu.org; Mon, 18 Dec 2017 11:49:08 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:39294)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eQybA-0004v6-Bb
	for qemu-trivial@nongnu.org; Mon, 18 Dec 2017 11:49:04 -0500
Received: by mail-ot0-x241.google.com with SMTP id v21so13896381oth.6
	for <qemu-trivial@nongnu.org>; Mon, 18 Dec 2017 08:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bK8g/3LfhM14wz8HUyolyM8e5hWVBcuP2MNmBfInKdw=;
	b=GbLHsmRcNYZ0eif2R9EElfR5Z7DaYysViv96yKmWrKgNyBgzOb36bVuzlvdn9NL8uU
	THYc949w37qDt3yFOtDejz0wivEsBZaLTF66VFiOgxHdcPQTfzZfAnx8t5++vIdupwFV
	Mw/tUvFDjIcd/kRVLJE486oj7+bFvIIM6U7xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bK8g/3LfhM14wz8HUyolyM8e5hWVBcuP2MNmBfInKdw=;
	b=isSjtSUaz/lfBWh3Sb1ARs3QC+KQJ+RG9+g7+CzxrXG/nBDKiOPMAsQGFwG7nim6xU
	nHIsUeoOPt78NqSmul3FX4F1xHIi7y6XNBAVTpfk6n4ETzlZ3mgE0fJ4v/OXu47tygbR
	mFQ4EvKJuaGlOGS1FxSkhnz7Lk3PFIWUaNZKwQz+gaur32tvddS8TPXsIA7+WQDoeeod
	OFktFw3femw+U/qzKuT7x+9u0oizGHCOOU7byJiOdEEebgrhkxhaxh1Z64Bwd7BvkNvf
	ul9s4PUJc96zlxpqVSde8yOzOnfx/5fDtXz3oylavgy0CWs3B3M8DqTVN3vmr83sxEVr
	SP1Q==
X-Gm-Message-State: AKGB3mJ9U5vyS+UKhLRMp0VA4dM54NsBc8O91oTMtyxowkirChBfLJ4d
	gdr8k982+8NvbvSENIhVqWyTxSyCM+Bc6JKUHJjgXg==
X-Google-Smtp-Source: ACJfBovz+GUUzSPTSASi+/vQ3RHJXCJoXTQEdLQjaNX1hP4yBvg8E5P7Oha/JfZxsMNZY7VQI9dKbSfj4Ldqj5bsrFY=
X-Received: by 10.157.90.6 with SMTP id v6mr189471oth.54.1513615743366; Mon,
	18 Dec 2017 08:49:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Mon, 18 Dec 2017 08:48:42 -0800 (PST)
In-Reply-To: <cover.1513606137.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
	<cover.1513606137.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2017 16:48:42 +0000
Message-ID: <CAFEAcA_qw3t5rC0_cj__7ax5FmYdD12e3FQSB3xBccVEH-x2Hw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL v3 00/60] Trivial patches for
 2017-12-18
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
X-List-Received-Date: Mon, 18 Dec 2017 16:49:09 -0000

On 18 December 2017 at 14:13, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another, 3rd, attempt for a pull request for the trivial-patches
> tree. Not resending whole thing once again.
>
> I've removed the patch that caused previous failure, which was
> =C2=ABhw/alpha/typhoon: simplify using the "unimplemented" sysbus device=
=C2=BB,
> and updated another patch, =C2=ABhw/tpm: remove old i386 dependency=C2=BB
> to resolve slight resolve conflicts, also rebased on top of current maste=
r.
>
> Please consider pulling.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 411ad78115ebeb3411cf4b7622784b93dfabe2=
59:
>
>   Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2017-1=
2-15-1' into staging (2017-12-17 15:27:41 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to c0578de60fcc3a07a881e9c4b7b8262faf6abbc7:
>
>   misc: drop old i386 dependency (2017-12-18 17:07:03 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-12-18

Applied, thanks.

-- PMM

