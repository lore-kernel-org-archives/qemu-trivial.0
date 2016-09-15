Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkaEO-0003wV-B6
	for mharc-qemu-trivial@gnu.org; Thu, 15 Sep 2016 13:13:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bkaEL-0003uz-Ek
	for qemu-trivial@nongnu.org; Thu, 15 Sep 2016 13:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bkaEF-0005Ah-TJ
	for qemu-trivial@nongnu.org; Thu, 15 Sep 2016 13:13:45 -0400
Received: from mail-yw0-f181.google.com ([209.85.161.181]:35093)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bkaEF-0005AK-8Q
	for qemu-trivial@nongnu.org; Thu, 15 Sep 2016 13:13:39 -0400
Received: by mail-yw0-f181.google.com with SMTP id u82so60104649ywc.2
	for <qemu-trivial@nongnu.org>; Thu, 15 Sep 2016 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R/6GJO0j1teWI1zG8ZUb//3S8S+z+TAj5NPDkcrMhds=;
	b=I4CHosR3GkaBF7lc46pjqfB4rBnMQIujolPU8qKPl8k3w12sY7cS46U1vb96s2f2gn
	+rS6RLLhlNzMaePR0mA2KiM7xFKm2l6t7hYdBU6nJSfCgHkXMmL+JMTxbkoswonElQcU
	X5gdaM8nEd9B7UMieJ/X2mn5xSEPs2Kc5B2p8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R/6GJO0j1teWI1zG8ZUb//3S8S+z+TAj5NPDkcrMhds=;
	b=lZDU3o0z89QWvIXen3qKuyuWpjV+841xBv0pDoMQE7wJvCmWI6czSgcdLe7knKycbg
	Jfp6tg4DJPUf0PL7aRhrOn5AbggHrv6HCnh0JO8sJg/fx3VwKE0QioA/yWIOuNByzL3y
	lz82XJtGeqcNk5ulUqEmdEiObrQJ00GhZAexZiUceoyD6IoQzKEmwx1GoLaEfIPUClHU
	Q4y1GhmGsyrwFEp+3OvnOGrBlD/u2kOFLthfMHuEcnnJgp8rWv/xIugk3XuaBZqx2l9c
	VQ3wkg+VXDEMndrZQTeE0jLEr3jAdiTJO+Zsy3vOp0R1XBe2BKBsIhk3S9dhQm93WmDo
	VoSg==
X-Gm-Message-State: AE9vXwNvTMMHfM1Bcw+fsJpd5Ch1/Pzt06HQIvKtbzsXfS2K7bLysb4Ds5OhUAgdTa8c5mtmV06BpTMLgDHdSfWR
X-Received: by 10.13.231.3 with SMTP id q3mr9395539ywe.242.1473959558817; Thu,
	15 Sep 2016 10:12:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Thu, 15 Sep 2016 10:12:18 -0700 (PDT)
In-Reply-To: <cover.1473943262.git.mjt@msgid.tls.msk.ru>
References: <cover.1473943262.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Sep 2016 18:12:18 +0100
Message-ID: <CAFEAcA-fhsyMKasYex1ZUzDyHBsbxsyefKMejo7onMmkEeWQFQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.181
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/21] Trivial patches for
 2016-09-15
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
X-List-Received-Date: Thu, 15 Sep 2016 17:13:47 -0000

On 15 September 2016 at 13:53, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is a respin from the yesterday's pull request,
> now with only 21 patch out of 27.  Other 6 patches
> has already been applied to master from other trees
> (what a waste of time :) ).
>
> Resending only the cover letter, not whole series.
>
> Thanks!
>
> /mjt
>
> The following changes since commit 9e8204b1de9c4d09c0ec8f1c004a2e11346eb116:
>
>   ui/cocoa.m: Make a better about dialog (2016-09-15 11:36:39 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to afe4c95331cea4c78cab3240594055a72aa5c30c:
>
>   mptsas: change .realize function name (2016-09-15 15:32:22 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2016-09-15
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

