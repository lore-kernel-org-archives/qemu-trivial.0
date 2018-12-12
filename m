Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXBnB-0007JF-Qz
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2018 16:11:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gXBn8-0007In-BM
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 16:11:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gXBn6-0007ui-Oy
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 16:11:38 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:37693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gXBn6-0007tM-Ds
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 16:11:36 -0500
Received: by mail-oi1-x22e.google.com with SMTP id y23so16262691oia.4
	for <qemu-trivial@nongnu.org>; Wed, 12 Dec 2018 13:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WDDnLtUe8dXxj8O1+1Iu+OAoLI+08odcVi2Z7GJoTx4=;
	b=AumEoIwf2pPsCTH3dDditZryr2XNPWnbAAUoLtIv04EMGqpkvcZ2RWT4YQ3PUAo+X0
	Iv8+1EbKZfXsB3yZzFecmyXgDBJO1Rx4cEuFDWZ7XwKrRcki0o8N5ZRxhrhaJ0bCl4FF
	qT2KsDzt02rhfLqqLgDinzdbyW+Hu6gG98cLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WDDnLtUe8dXxj8O1+1Iu+OAoLI+08odcVi2Z7GJoTx4=;
	b=prxyyRjUTZ3glLKKC1Y7EYOQru2SOIUcw7hQZGKjRamxNSzXI0ryegDbUgMwr4uoIM
	P/4fkNnlQcJV8ATHhpDSvz5iw2YO85bYOJx5e7vVoBTlHvxLevgQZoFdisVmspni9+Ka
	/tBPeXmS65G+jQ8oPlN8kEBbnpuT/r4CEGE7j6Wb1I10dk6P2FjxZVNx9/SS+UR8rwwY
	Gnvwtwl2DdX9HxQ5ImtEnirHw1OmaqFEOK8DYr+6K4bq+NpuOO0hE6svi3cFS+cJ2HPO
	xMlG00YC6CDTRAt0mwwKYPSY21MYbFbQLeqqndTTY4F72W8i9LdXI8E+e6sVOOl5vbcs
	Zkfw==
X-Gm-Message-State: AA+aEWYzqBc2KMAARz/kQlYQip6kiZeW64g3ToG2A1OrI8lBtKBZrQwP
	hoH5MapYMjds7gyaQV0rZbFz4+rMX1IkldGsym4ujBYZ
X-Google-Smtp-Source: AFSGD/UHdyGglbnqchtq6UepwXlb5QPjsNGNbCMlxqliTZ1gDTK1iqtkyABlr0t02Ubal9Yfn+yP61Xbv2RMeACVWLA=
X-Received: by 2002:aca:5c05:: with SMTP id q5mr1275450oib.146.1544649094473; 
	Wed, 12 Dec 2018 13:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20181211180352.19644-1-laurent@vivier.eu>
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Dec 2018 21:11:22 +0000
Message-ID: <CAFEAcA_wRfVWjWOMjE36Fepmv7TPSf5JJNoKVZbs_JXe-_W69Q@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/30] Trivial patches
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
X-List-Received-Date: Wed, 12 Dec 2018 21:11:39 -0000

On Tue, 11 Dec 2018 at 18:13, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 32a1a94dd324d33578dca1dc96d7896a0244d768:
>
>   Update version for v3.1.0 release (2018-12-11 17:18:37 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-patches-pull-request
>
> for you to fetch changes up to 82c48fb79df5596a9d0a3b6d998c4491e542aa7a:
>
>   Fixes i386 xchgq test (2018-12-11 18:41:25 +0100)
>
> ----------------------------------------------------------------
> Trivial patches (2018-12-11)
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

