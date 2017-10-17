Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Sph-0004DF-3Y
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 10:27:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4SpZ-00047g-OF
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:26:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4SpY-0007TL-T4
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:26:53 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:46382)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4SpY-0007RA-MS
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:26:52 -0400
Received: by mail-wm0-x22d.google.com with SMTP id m72so4291523wmc.1
	for <qemu-trivial@nongnu.org>; Tue, 17 Oct 2017 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=q0DX7E3c2bTaA4dAx3pEq6NCJPB3IiBBiUOANhdFlkc=;
	b=S2ETj6/lhyfG1NOkWOU5EsFBGuFAgSLHtczF39QxFeeOI/9bHQ1dsPyGLX3CIIIF+n
	KoiePnDvREzSthbwSxxNiiW39XIQlcwQi5CFosvn2GEPMY30hOG0qjigw9ksWLfur8xb
	T+C1k4al+4oFFefL4NsdhuWRLPaA0RaaIq8E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=q0DX7E3c2bTaA4dAx3pEq6NCJPB3IiBBiUOANhdFlkc=;
	b=b3fgbzrE+e7D1RLFRbpJGYq+KRo9zHrEpjndWvL4cSVVUTIP7XJW3XecVIldw98w4j
	gKG8DelnX8yhW6AiHpMWJLdRv2DKgyFfUO3omiMdX9JphFyon8lo2rhdDinRVe5Q/RS3
	WmkiC7zvdXZ5BH3iwfGZcQntzOpD3Y/pKLxzn1kB01crrX9NQ4VfrVyVudAPddM5FxeM
	zeO95bBrrPbndsbmP7dkllaw1a2r6ooVijjfwKvyNbVq53PCPky8Bg95KmUYpuakNOVL
	+unDFnNDRX2AxmmkZ8ArZ41ZZkBS0qfeZjc9RakFyvPlQgIMqPKHqV57swgQju1qrdqg
	fTwg==
X-Gm-Message-State: AMCzsaWPGnm9cB6uVYeNI+ywe4ZFOSyLsZNK236Z4f1fw27DHEyh57Uh
	e84cVLR8cBgelMe0rysA8AVsJK1TZxM3m//yiRoHrA==
X-Google-Smtp-Source: ABhQp+SPZ6DS6V/dalJWcj2mkZliTmSOaSSMh2Et8O50Nz10UFHrj0ElhUp2tj2ZlCE2bAA4t38kvB7zg3tSgEVPFKI=
X-Received: by 10.28.113.196 with SMTP id d65mr3461812wmi.151.1508250409362;
	Tue, 17 Oct 2017 07:26:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 07:26:28 -0700 (PDT)
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 15:26:28 +0100
Message-ID: <CAFEAcA9ouLBo4tAzmsqeJ=Q2BgCxDNrs701knbBDo3oQQVioUw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/14] Trivial patches for
 2017-10-16
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
X-List-Received-Date: Tue, 17 Oct 2017 14:26:59 -0000

On 16 October 2017 at 21:33, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's a set of trivial changes accumulated so far.
> Not including large series by Philippe Mathieu-Daud=C3=A9.
>
> The following changes since commit c5bbcaa4b7c0f8a322bebe9ec563560178a68b=
55:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2017-10-16 17:29:16 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to 6b4f250bfc529bdf73a10ca6873a460175e666cc:
>
>   Add myself as maintainer for TPM code (2017-10-16 23:17:44 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-10-16
>

Applied, thanks.

-- PMM

