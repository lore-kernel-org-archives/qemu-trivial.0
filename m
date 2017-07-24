Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZktb-00013h-E2
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 17:28:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZktZ-00012P-R6
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:28:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZktY-0005W5-NE
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:28:05 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:38907)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZktY-0005VM-HE
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:28:04 -0400
Received: by mail-wm0-x22a.google.com with SMTP id m85so27608395wma.1
	for <qemu-trivial@nongnu.org>; Mon, 24 Jul 2017 14:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3Eqb9O/cmdY+8qJBtQ8XwDxosLRuR4Smb56OvXUi2Ms=;
	b=QWzzZyNSSD82/FDXn2J3D30Z3/l63qsLd2P7JsvqTsMgccp/V/AUm8uNU0gzQdoYg0
	gqk/dO7nXSSorKKmz2NbWosbRLDysi2wzp26/EOHanuPUd91cgYJANbNrsO9dC7a0f0a
	LdJqd2m81Vnpxx8zKyMnVG9wDh/Hd8eoOMf8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3Eqb9O/cmdY+8qJBtQ8XwDxosLRuR4Smb56OvXUi2Ms=;
	b=Aoo1M0yh9WQBc0D9qEK5m4qEfOYOX+ZWyXH/a2k08VenxHgssc27k7A5gqukgIbvfL
	ZIvdaWHhZeF2h2ryU+hItAk918TWfUBXmVCIEV8ulyvcIULG4wFpKGK0qtCq4J/vZZsI
	FVu9IlE1BIBrVia08U2MWpW+SvKuIaG0XQBMi0bPKuNVNvVmUoju5xlAST8ubdONr+Lv
	C0r97K+apdWwIrKQ4oLQXL2YR9Nkgp2LUwt0wZPb09EfX6lM4B48pGSO9+rviCp/cZly
	+tRvVUyi3ENAgxD8fy9LaASM4JhyXDc3ow5veA7HaFdRaM+OIQhV+zrrmzYnV1Rb2D1u
	gtkw==
X-Gm-Message-State: AIVw111YB8CtrUK6cU5DlWNZ6LCfvohtfdCl6oBHCut8nKMQEsdRMFE2
	NjzHHMN74R27Zge5YG7ybEQY+kKMtWUH
X-Received: by 10.28.95.69 with SMTP id t66mr2099553wmb.74.1500931683580; Mon,
	24 Jul 2017 14:28:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:27:43 -0700 (PDT)
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:27:43 +0100
Message-ID: <CAFEAcA8ABKSfKRFSnYxztVj7LjK+a-5JtbgDY1R=7hsBmXsgCQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-trivial] [PATCH for 2.10 00/35] fix bugs reported by
 Clang Static Analyzer
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
X-List-Received-Date: Mon, 24 Jul 2017 21:28:06 -0000

On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi,
>
> This series is the result of having fun with Clang's Static Analyzer duri=
ng
> the week-end (see https://clang-analyzer.llvm.org/).
>
> No need to delay the first batch for -rc0.

I had a quick look through the mostly ARM related ones,
and there seem to be an awful lot of false positives :-(
For getting this into 2.10 it would be helpful to trim
down the series so that it has a more manageable number
of patches in it and they're fixing actual bugs...

thanks
-- PMM

