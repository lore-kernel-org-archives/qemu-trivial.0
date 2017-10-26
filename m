Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7l7q-0003sn-8P
	for mharc-qemu-trivial@gnu.org; Thu, 26 Oct 2017 12:35:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7l7o-0003sD-0y
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 12:35:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7l7n-00063W-B8
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 12:35:20 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:46982)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e7l7m-00062f-RG
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 12:35:19 -0400
Received: by mail-wm0-x241.google.com with SMTP id m72so9144100wmc.1
	for <qemu-trivial@nongnu.org>; Thu, 26 Oct 2017 09:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QZTJK7TfbYuvKld1o+yGxkB31wZhunK1/oJtp4gaTlY=;
	b=c0B+qO6aftcKE5onaaHkDk9h8K1qXMnlghMyiW9R3E7TqmxmfFCzftdYUaOyT/ZZGM
	zVMrWDgFSpkMCv96Xn743ZEVSdFh1LcaPfIeUGd6dEaGcAh912h4CP6s58fFWMw5ge//
	XS1SoPhlOqvC93zl70IC1mv7OLyCyVIfDexsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QZTJK7TfbYuvKld1o+yGxkB31wZhunK1/oJtp4gaTlY=;
	b=SRDwub00a5o/r+foUWr2kqYn82EjoVkxR1aXW3rgHQCl48lrcyICcoI2rImPBS0ktd
	tPo9Lij0u02QV8a6z4GNRtRdwN6sM8rqhJIvp6pQ4Y6fixnc0UUd/Vy3XMIxMA/LjvAd
	gh8A6E7o9jBAS8qzsS4IYze+QI+3OT4urHgyJ4dl2+9uVz/h0tXlFD96NJWHFRF7HqV+
	yMqkWW9qP35or52oc/UG04/IG3Ja+4b7VYKOdIJjtK9aGCvs0f84znwlIrRodM6sysfP
	fOY2tpcKNGEx8FLeoWIP76eLNAvnXUSVl68oTJQGHhKf5dGY7zxcXGFDg53cqLyHbGhF
	0LUg==
X-Gm-Message-State: AMCzsaWZTunbq9DkdkIAMabearfTIWRCNQmI7QVXC0C8q52f0Bi/H1QF
	wLySekvQhVfKNGS59/sj9dxDQRU2hX6jPo0f+rNjRA==
X-Google-Smtp-Source: ABhQp+SrV/i+442Zdke0Z4U5pC1/KPyasdRt3683hnbPxtlQgpH5qnO62cwJrjV/4sd+VezOC6o1cDAx8zvQl9fYsgo=
X-Received: by 10.28.10.195 with SMTP id 186mr1958599wmk.136.1509035717591;
	Thu, 26 Oct 2017 09:35:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 26 Oct 2017 09:34:56 -0700 (PDT)
In-Reply-To: <CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
	<CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Oct 2017 17:34:56 +0100
Message-ID: <CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Jones <drjones@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/virt:
 support 4 serial ports
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
X-List-Received-Date: Thu, 26 Oct 2017 16:35:21 -0000

On 26 October 2017 at 17:15, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Thu, Oct 26, 2017 at 4:36 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> I'm still thinking about this. (You definitely can't have four,
>> though, because we already have 2 in the trustzone-enabled
>> config, so we can only add another 2.)
>
> The trustzone one could be the 5th? Since it's only useful for trustzone.

Reordering it would break existing users of the trustzone uart,
whose command lines would stop working.

thanks
-- PMM

