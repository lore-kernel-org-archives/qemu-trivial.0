Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBj25-0001tz-TA
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 06:56:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YBj22-0001pX-Hs
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 06:56:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YBj1w-0002XZ-TP
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 06:56:10 -0500
Received: from mail-lb0-f182.google.com ([209.85.217.182]:59816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YBj1w-0002XK-Me
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 06:56:04 -0500
Received: by mail-lb0-f182.google.com with SMTP id u10so12732015lbd.13
	for <qemu-trivial@nongnu.org>; Thu, 15 Jan 2015 03:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=j4I7Zq7EOQ6p+XnzULP1rnecDrAHV5ywlOG+R72Gv7I=;
	b=QWqjhOoietfWEAWKmKmSxN2mibCeZkAkzjBQzjeibEwylQsiwD6MfypN6uU9WmpuS4
	6Afc+eUouJdepvqy0oJ6WWs12sAhdNILQCuzwh/ePHI9CvtR97v/sbMgHvK35GIr/D96
	wrrC3GlvGRvaKfgGF6zfjAZLWTbCC69Nsb1LNB7Zo2bPP9xX5M+ex1WKL/Ti36stxhwO
	yONn3DIsgNkMlgLiocQYL88Vd0Ko0MOhQ5bwSLFuk3FeaZM/128HeiQGP+njxLsDL62L
	QiEudyFImS/C3cLuEz/Oj/qH4bD+qlWOjDe/O1U4bIn9RlzSM+euJf+rtNSi1Qb1gFOB
	EY1w==
X-Gm-Message-State: ALoCoQm+5odJ9wqKrktBYCnFkm1x49pVwFnG2R4BFhfPz6iZ2b76B7GxHw5MmybMz5NfW1b307+a
X-Received: by 10.153.11.170 with SMTP id ej10mr9383730lad.24.1421322963695;
	Thu, 15 Jan 2015 03:56:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.52.38 with HTTP; Thu, 15 Jan 2015 03:55:43 -0800 (PST)
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jan 2015 11:55:43 +0000
Message-ID: <CAFEAcA9mrdbduNh909Lc3fj=BtL+3c+rVs1aiiYhxSwg7as-sQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.182
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/12] Trivial patches for
	2015-01-15
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Jan 2015 11:56:11 -0000

On 15 January 2015 at 08:30, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is a next trivial-patches pull request, since the previous one
> which was at 2014-12-11 - 4 weeks ago.  Only 12 patches in 4 weeks.
> There's nothing exciting in there, but there are several (small)
> bugfixes.
>
> Please consider applying/pulling.

Applied, thanks.

> With the introduction of pbonzini's "misc" patches tree I'm not
> sure current trivial-patches is worth to keep.  Paolo does much
> better job in this area than me.

I'll leave that up to the two of you, but splitting the load
of review and testing seems to me like it would make sense.
In any case, thanks to both of you for the efforts you've
put in to this sort of patch curation -- I think it's really
important for the project.

thanks
-- PMM

