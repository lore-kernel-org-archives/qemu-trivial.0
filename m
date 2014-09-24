Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWiiV-0005hT-PI
	for mharc-qemu-trivial@gnu.org; Wed, 24 Sep 2014 05:18:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XWiiP-0005hC-Sb
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 05:18:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XWiiK-00012C-Tl
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 05:18:25 -0400
Received: from mail-lb0-f179.google.com ([209.85.217.179]:56690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XWiiK-00011e-Mg
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 05:18:20 -0400
Received: by mail-lb0-f179.google.com with SMTP id 10so9616256lbg.38
	for <qemu-trivial@nongnu.org>; Wed, 24 Sep 2014 02:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=f/xHBrW19cIOvFozEUIVBTiwi9olZeR6zvXNxyqNg58=;
	b=TfatBTRKREt2oEm8eSBgd95Fcu/lfZzUVu9qtQSP3BfQCtgnkqM3aPCY01oFnl8T91
	9f4o+/XOx0Bah8OMgHZ5ps9FEJ81XV3AOqCCLBaenE8Fw0bxNzjs2MFrP6z0jI3LPa/+
	v0lKO1L0rBtRiZ68QWicaLftGb0OkuYgXqxdEacbMALEi4u1nzFfAaS+mAMN1gTsm5zV
	oc22ni94cp3H39OLVVcAhXgHhcldk0vfb2SJ8yV/PP++e9PAFgLerDoHl5F2YZUGT059
	cvzBqVhipt8SuVs8eroKbYurUN6282erp9VJbUckpYjuK4IU0OtaJEpNsn8IA+8O9PDS
	TS0Q==
X-Gm-Message-State: ALoCoQkAyu2uag8HfQV7z4/Fm7eu8EsBkV5ZcV0rifoCeIpUSOFO8UQocDWSPObfEG8RAVVqWypX
X-Received: by 10.152.2.41 with SMTP id 9mr4943615lar.79.1411549802704; Wed,
	24 Sep 2014 02:10:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Wed, 24 Sep 2014 02:09:42 -0700 (PDT)
In-Reply-To: <542279B5.7070502@msgid.tls.msk.ru>
References: <1411061124-21108-1-git-send-email-tklauser@distanz.ch>
	<542279B5.7070502@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Sep 2014 02:09:42 -0700
Message-ID: <CAFEAcA_q=L6vk0Snn3a2wz+VzvXXCGm6D+ZakD=HCDw1F7rP1w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.179
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Tobias Klauser <tklauser@distanz.ch>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] disas/arm: Remove
 redefinition of ATTRIBUTE_UNUSED
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
X-List-Received-Date: Wed, 24 Sep 2014 09:18:30 -0000

On 24 September 2014 00:58, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 18.09.2014 21:25, Tobias Klauser wrote:
>> ATTRIBUTE_UNUSED is already defined in disas/bfd.h, which is included.
>> Thus, there is no need to redefine it.
>
> Is there any harm in keeping it here?
>
> While it really is a redifinition, I'm not sure what's the right thing
> here.  This whole code is not from qemu, it is an external source imported,
> and that source is being maintained (but under different license as has
> already been discussed, so keeping changes at minimum might not be that
> good idea anymore).  On the other hand this symbol is so common it should
> be defined in a common header.  Yet on another hand, for these external
> sources wich has public API, it might not be a good idea to define it in
> a header to start with, because it might clash with project-local define,
> so it might be better to define it in either private header or in individual
> source.

So my take on the disas/ sources is:
 * yes, they're from an external source
 * but as you say, we're never going to take another drop from that
   external source so we should feel free to make local bugfixes
   and changes as we need to
 * on the other hand, there's no point in making gratuitous changes
   to them (they're never going to match the QEMU coding style,
   for instance)

So what's the rationale for this particular change? The duplication
is harmless, so why worry about it...

-- PMM

