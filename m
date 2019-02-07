Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grmru-0000jw-FU
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 11:49:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grmrs-0000iP-Hs
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 11:49:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grmrm-0007S9-Bw
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 11:49:36 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:38697)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grmrf-0007Kw-Ff
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 11:49:30 -0500
Received: by mail-ot1-x32a.google.com with SMTP id e12so900366otl.5
	for <qemu-trivial@nongnu.org>; Thu, 07 Feb 2019 08:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8tdurLVJgzQy4ZfwP6PUFCcWaYFLJDK7RlRdRcsu55g=;
	b=Yql/nwNvnbpoyXHiZSvT7XO62QUBsLjhyceBsA02XNe+RSwFnF7hQX5zB7RojdGZei
	oE8HFDVblRnUbhG85xHeMpqgydi5XWijfY82qaOEOidL9787WWuspdmZ5yYBOoKXY5dO
	PAvtqjsggc/FOxSLgLPI9xpY5CN88THwdANsWSJD6nqhLPt01vJnPRUf3jzYbYKfv38D
	JD42cMG2Z9549KqW73k5bPrwBAX3MbBx/R2qMNj2EtRXrhoRIYfCYkDNRjM6CzkEU4Wb
	uVJ5IWi/pkEmHlWGHGQjOOR82Z9BXC8gm8Gp1osgDJuZKzoV/BAXl0GuCAi6S1qkVfju
	ruKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8tdurLVJgzQy4ZfwP6PUFCcWaYFLJDK7RlRdRcsu55g=;
	b=DU1h3PsfC9aN6Rh1T/0I2Aa56YBWuHjB99g3al0DljBjaAw9jDuzMsETphvogvfnwH
	ejuO/MawK9ZwSyO+HKZf8jM6IKIM84LukMhE46pTCQhuB5CYYtVf5qaJpKQlOkkXIWIX
	Qe+9JLn2OEOTJulCazsTmwY2CgB2Tp1HW2LJ5nss28aQqKIBatxDLW2HK81KIWV0kjB/
	LnHBYlPFKbRDCDvzf+xwy0kby/RFBMNA/OO81kyIjsN+a6otpe2M91po35k/S+F52GfC
	JhMWUYeLPmeD01aX/4Pg/PKF2ZY+vxEtjg0074zzpWwP4hITQuhx7YYXWCOSUs0gCvvz
	2fIw==
X-Gm-Message-State: AHQUAuYr2iUjP6Y557Vh18xQKKF9+eMeJMygwDjEtyijEEK5mTOto6DT
	Af6T6tFSWW4zQrMvVcHfjUyMWTPf+Sj+eZr2c2SVcA==
X-Google-Smtp-Source: AHgI3IZkaLZFvwSN7ZBI9Sc4ikBrr2Ulcm1rWxDmop2eNFx6ivpt3jg3nT3aictV4sQHA87eW1drj1zDXx6Wkf1QUOY=
X-Received: by 2002:aca:bf82:: with SMTP id p124mr783886oif.48.1549558161797; 
	Thu, 07 Feb 2019 08:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20190206152807.31896-1-laurent@vivier.eu>
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 16:49:10 +0000
Message-ID: <CAFEAcA_-peVcup1ARQmKyxyxPQwSYWswO6tDhGcvNENW3ceRhA@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Green <green@moxielogic.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, 
	Michael Tokarev <mjt@tls.msk.ru>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32a
Subject: Re: [Qemu-trivial] [PULL 0/7] Trivial patches patches
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
X-List-Received-Date: Thu, 07 Feb 2019 16:49:41 -0000

On Wed, 6 Feb 2019 at 15:28, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 47994e16b1d66411953623e7c0bf0cdcd50bd507:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190205' into staging (2019-02-05 18:25:07 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-patches-pull-request
>
> for you to fetch changes up to e67e91b4b55331973f783ca89790ee9f7861ced1:
>
>   hw/input/tsc210x: Fix building with no verbosity (2019-02-06 15:57:06 +0100)
>
> ----------------------------------------------------------------
> Trivial patches:
> * Update copyright
> * Fix LGPL in target/moxie
> * configure portability fix
> * Drop useless inclusion of "hw/i386/pc.h"
> * Mark the cpu-cluster device with user_creatable = false
> * tsc210x: Fix building with no verbosity
>
Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

