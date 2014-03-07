Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLxmE-0004FL-Hh
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 11:37:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WLxm8-0004DG-BK
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 11:37:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WLxm1-0007UJ-E6
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 11:37:32 -0500
Received: from mail-la0-f48.google.com ([209.85.215.48]:51783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WLxm1-0007Tu-6e
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 11:37:25 -0500
Received: by mail-la0-f48.google.com with SMTP id gf5so2917985lab.7
	for <qemu-trivial@nongnu.org>; Fri, 07 Mar 2014 08:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=9iZxgQh0DCGpWEdmBcHy626iKWFi6VzllRdVMLGyUJQ=;
	b=KRq8sfIZr5q2QthIfxhcIMOWlu6Gc9MlPYSFGfAN5wFTdxGlPYzoyHwbPb9vOWJCPC
	Tx4d+jm/o9IFfYlIwXveLsODvAEc2gsa2ewUD3ZLXSref/Jlu2J3bNu9q6HO5sAl+S+F
	jHoAOLig1NH2cS2vihuzJTfZ7jcqbTOhn1cjY+OVuakv0DuPgk02xddK7LGh5W2K+lNl
	fjx38501rUABLTJGKpHwaZtWBWat3SPvDbGc8OID1g8lsN3YgTV11bEt0RejKvINkL56
	JJPuzEsm21hWDAEaWnJ3DBudV3V+HzaafuXaOMCD7A/AxOIfbYiC/WSx5BpocqVizqhp
	soDQ==
X-Gm-Message-State: ALoCoQnjMn6JIMS0wntl90tlHCbNVy/hLmwMu7l2GT74rZbNJpKkDT8kNl4f/TipzUCc+I0FXF2B
X-Received: by 10.112.171.136 with SMTP id au8mr11821266lbc.0.1394210244138;
	Fri, 07 Mar 2014 08:37:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.118.34 with HTTP; Fri, 7 Mar 2014 08:37:04 -0800 (PST)
In-Reply-To: <87y50maspa.fsf@linaro.org>
References: <1394187082-31986-1-git-send-email-sw@weilnetz.de>
	<871tyecixy.fsf@linaro.org> <5319BE2C.7040801@weilnetz.de>
	<5319C21A.6010705@suse.de> <5319C768.2000903@weilnetz.de>
	<CAFEAcA8nbPodctcDPXUjxZz4+0WeeUP=24DxuLeyU9OsBT=Vew@mail.gmail.com>
	<87y50maspa.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Mar 2014 16:37:04 +0000
Message-ID: <CAFEAcA-rvE5QSoZPPmcjOO8r4Gfn_KDLSsCs4r+QvExsR50f4Q@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.48
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-stable <qemu-stable@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Fix 'make test' for
	i686 hosts (buildregression))
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
X-List-Received-Date: Fri, 07 Mar 2014 16:37:37 -0000

On 7 March 2014 16:17, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> I think TCG x86 FPU emulation has been a bit dodgy since
>> forever; it's a fair amount of work to go through and
>> fix everything up to be bitwise exact results versus
>> hardware and I think that nobody's cared enough about x86
>> emulation to do that...
>
> IIRC the behaviour is different depending on how much x87 vs SIMD FP you
> go through. FWIW the Transitive translator was able to do most FP ops
> with generated code (certainly on SPARC->x86_64) and only go to softfloat
> for some things. But you did need to disable the x87 to do it.
>
> But I get the impression that FP performance is currently "good enough"
> for what QEMU gets used for.

This is true but not particularly relevant to whether our
current implementation is actually buggy in the sense
of producing wrong results. We ripped out the code that
tried to implement FP natively a long time back, so
pure emulation is all we do now.

thanks
-- PMM

