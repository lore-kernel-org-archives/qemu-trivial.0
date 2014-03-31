Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WUc5K-00072A-FQ
	for mharc-qemu-trivial@gnu.org; Mon, 31 Mar 2014 09:17:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WUc5D-0006zV-Ez
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WUc57-0006Te-3C
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:16:59 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:53525)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WUc56-0006TE-SB
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:16:53 -0400
Received: by mail-lb0-f173.google.com with SMTP id p9so5752837lbv.18
	for <qemu-trivial@nongnu.org>; Mon, 31 Mar 2014 06:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gDKv56yzKojUzD4JLhNA6RNjcugmGMlm2yxC6fxUS9A=;
	b=ZniQztczfpPiT7Zxi67X9cmSV7BtDRstUSS+ZFXWDZXVjFijF8povknpFMIOgZaH+e
	cHuRDSoV0u7PLB+LNTugVe2jdjjZRPUCo2/J2qHeVDI2/VlvTXRa+RTmG0Iv54gXB4BS
	O7q/fnDfXyIXSOjw16IXn5FKh8wU+LekHiTpmmQViBmQSuO5zOYxoLyKYpJVtllPcA2q
	DH3ztTNwDiPM9If8eTuuBl+7c9dR8t7YcgOE4IXrfH6Wi03kqcBLWIkjpYOZXuBtFLUa
	nFua8lLu8a1S3l/2gpkkoIfaDwFMBC+avM3yM6KHuQZFqJUTyPpUxFTPaOUUGBaqNTwx
	yZxg==
X-Gm-Message-State: ALoCoQn7RZuEA7UPifvPThYWWB2ocp/pmj+x+FJ9CpuKUmir0No4J/BSQaJhUgkxCKE/shx3SN+R
X-Received: by 10.112.142.68 with SMTP id ru4mr1044828lbb.49.1396271811530;
	Mon, 31 Mar 2014 06:16:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Mon, 31 Mar 2014 06:16:30 -0700 (PDT)
In-Reply-To: <533969AB.4010505@gmail.com>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Mar 2014 14:16:30 +0100
Message-ID: <CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: use 'break' instead
	of 'continue' in configure_accelerator()
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
X-List-Received-Date: Mon, 31 Mar 2014 13:17:04 -0000

On 31 March 2014 14:12, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> Next, when I send trivial patches, I will/should cc to qemu-trivial. I
> guess, most of my future patches will be trivial patches (and for me,
> trivial != minor).

We describe on the wiki what we mean by 'trivial':
http://wiki.qemu.org/Contribute/TrivialPatches

thanks
-- PMM

