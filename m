Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcEo2-0006J3-CS
	for mharc-qemu-trivial@gnu.org; Thu, 09 Oct 2014 10:35:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XcEnu-000642-4Q
	for qemu-trivial@nongnu.org; Thu, 09 Oct 2014 10:35:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XcEnn-0000Ns-2G
	for qemu-trivial@nongnu.org; Thu, 09 Oct 2014 10:34:53 -0400
Received: from mail-la0-f47.google.com ([209.85.215.47]:51891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XcEnm-0000NZ-Sa
	for qemu-trivial@nongnu.org; Thu, 09 Oct 2014 10:34:47 -0400
Received: by mail-la0-f47.google.com with SMTP id pv20so1306152lab.20
	for <qemu-trivial@nongnu.org>; Thu, 09 Oct 2014 07:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5raH9ybMGrWvFZLQTMXO9FkaDx0TzmHe05mE/KtmPC4=;
	b=jV7iK4l80XUetfARSMwCFEl3WDM7fa31scBxQc6fEjMGHEBp2G4//oeG0XEioDX186
	vLsiQlSJKzxxJL0qvub0dVHJHPYR9HlfIs2PUf6Q/E/NGJF0zWnXdHEedp5yg99M1qdZ
	f9XRUBuUcRIEYnQdsBl37Yb652yFvxXzapUBSKO5KyBgn8t0m/U/u2oi0KVhWZGvqBMi
	TUqSjij6qe6CJzBTUvwbEpji9rfMigIl2rUzxcQ1OyWBaj0+5qduShwNlZczy26BYZge
	Ncyua+DWpFPiXao8lFoPOACoGd4g6GWurTgDhsBmORbaoQr2s5/+1bgDAKfPevJGm6SO
	1wLQ==
X-Gm-Message-State: ALoCoQnGyA7k2Y9jCOCSw732mrVEJAOAea0Hmq8ZBs47tnrGdXkPbMN0gjHw7gTQ/gLCpJ71xeLK
X-Received: by 10.112.169.37 with SMTP id ab5mr18297882lbc.27.1412865283592;
	Thu, 09 Oct 2014 07:34:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Thu, 9 Oct 2014 07:34:23 -0700 (PDT)
In-Reply-To: <54369514.5000004@gmail.com>
References: <54369514.5000004@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Oct 2014 15:34:23 +0100
Message-ID: <CAFEAcA_NOfN=vr98+yqE7B+M88ZDWD_OwxG+noMzGcNjNFwwPw@mail.gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.47
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	"rth@twiddle.net" <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] disas/libvixl/a64/instructions-a64.h:
 Remove useless varialbe to avoid building break with '-Werror'
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
X-List-Received-Date: Thu, 09 Oct 2014 14:35:00 -0000

On 9 October 2014 15:00, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> The related variables are useless, need be removed, or can not pass
> microblaze building, after fix it, can build microblaze, successfully.
>
> The related configuration:
>
>  ./configure --target-list="arm-softmmu,microblazeel-softmmu" --enable-fdt --disable-kvm
>
> The related compiling error:

I build this code with both these targets enabled without any
problems.

There is an odd compiler thing where if you have any *other*
compilation issues then these warnings will also be emitted,
but once you've fixed that other compiler error then these
warnings are no longer produced. Maybe you ran into that?

The reason I'm reluctant to make changes to these files is
that they're pulled in from a different upstream project
(libvixl) so we should only fix critical problems in them,
or it makes new versions harder to update to.

thanks
-- PMM

