Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1b6g-0004sh-Ll
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 11:36:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1b6e-0004pu-4a
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 11:36:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1b6d-00079L-Fo
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 11:36:08 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:35436)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c1b6d-000794-At
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 11:36:07 -0400
Received: by mail-ua0-x230.google.com with SMTP id 12so131542261uas.2
	for <qemu-trivial@nongnu.org>; Tue, 01 Nov 2016 08:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HeBANxvocHjOvUvfhkDSP0pKFuhhVTjOys4+u/MJ9Qk=;
	b=EYJIiSKomC1lsWX6LBazlAuyEjTfYdoumSfOJohozkBevanVlRzZAfTKiJWJwnRBQT
	KM753lt0hKMlI50qjQ9jeyV+JESRTB40vr2Ne1tuOhsKGrvm21vJEbEKxn6pYFrFmBhq
	VhiSTEmwqO44rBt2TNXhu6LeC8ixrhHsxLTuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HeBANxvocHjOvUvfhkDSP0pKFuhhVTjOys4+u/MJ9Qk=;
	b=jLU/2fjXXNwTx7TfFDtZ5zqO9LJZHzlDREpmIzwBG50BNfSV7FU3DZdXA8OPNbd95F
	x9XSWNqTPx2Am0Qbsp3sLv6gU50HSnSJBDwtUZ/2x3AYXtW/GblNjHF2u/jLDtRwHvvb
	v6ya+UE4mg+KFvm2/Av517/YlQ5SavSUxRfIBCnoNMw8+TY7NgKdWys13a7Y7kV//ADS
	mf03TB2TyrIHTYjJtt6YPubEZKPlAj4azjsH4BoxfVbwaxKC8D8MdjU9V9XAbjYRm2Ps
	pYyMH7wrXK6NOOnLz0H5jhEvBLBrzmc6xstjM8wXvL2fDl3CpEKDRzmL4EPQXOP12xs9
	4j4g==
X-Gm-Message-State: ABUngvet0/YgblIl0DyazfLrM7xofPrVs/9TStVx+RLT2xngzzB/NUP+WQicgD/ezA0+qfO9fhCyZo2hqxZV6xB+
X-Received: by 10.176.3.137 with SMTP id 9mr18312082uau.120.1478014566718;
	Tue, 01 Nov 2016 08:36:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 1 Nov 2016 08:35:46 -0700 (PDT)
In-Reply-To: <20161101152819.18906-1-sw@weilnetz.de>
References: <20161101152819.18906-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Nov 2016 15:35:46 +0000
Message-ID: <CAFEAcA_Z+_ZertzpPY1cW5VHfQ6p30-QWNPCiH10+Qq+pAxLQA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>, Pavel Fedin <p.fedin@samsung.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-trivial] [PATCH] hw/intc/arm_gicv3_its: Fix typo in
 member names of GICv3ITSState
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
X-List-Received-Date: Tue, 01 Nov 2016 15:36:09 -0000

On 1 November 2016 at 15:28, Stefan Weil <sw@weilnetz.de> wrote:
> translater -> translator (found by codespell)
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

This is intentional: the name of the hardware register
in question is GITS_TRANSLATER, the ITS Translation Register.
The R stands for 'register', as is usual for ARM hardware
register names.

thanks
-- PMM

