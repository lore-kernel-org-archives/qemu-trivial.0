Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfjgX-0005Oj-JI
	for mharc-qemu-trivial@gnu.org; Thu, 10 Aug 2017 05:23:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dfjgT-0005NY-VM
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 05:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dfjgS-0005Gk-RZ
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 05:23:17 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:37121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dfjgS-0005GD-KI
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 05:23:16 -0400
Received: by mail-wm0-x22d.google.com with SMTP id i66so17118941wmg.0
	for <qemu-trivial@nongnu.org>; Thu, 10 Aug 2017 02:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3nRllFY8FdtDjSHAHEq1QnTU9dnjaHRhQJY49OHqbsU=;
	b=jiA+F44lqFLnDCO7cr8k/+HskC4I1WCRRum/ktnxp4xUKTeKi1U2yeruREh5MfFm+W
	ioTBpDWJVg7GfSENHbCDlXbMqhATLYjCO/UzARmrLCA/S32TXTwVlFhYfExpij5r3mMz
	Ix2wv9FVujEjb3YJkWpd4eYje0kW+PYl3BkRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3nRllFY8FdtDjSHAHEq1QnTU9dnjaHRhQJY49OHqbsU=;
	b=fLcgUhhPmrADhXVO8BIJogHjq5giyjv8JnBNGvcvvrHAkK3NZBNGpHI/a0Ew3jt3WY
	v32GdzgdWT8PMy0d6NnEaXrqjuokNS8x11LF+xxUU1eUXLJyvPJo+F29AmePuOUWXQ3s
	HRZ9wp/XBwJOgn4068Sk9lUAtjQxB3lcosD35HAKN+vhA3yxKaqOTeNRUEV3RtPcEpZN
	PNl6iVk/MrC20G+DXOMRMz13vXEe4bZ5gwDGBDUygYif+/Y4gah/AW3+0OHeN3WGsVvs
	UmgR27xKXZPoofGBmDDYfxJZxy+2WpLN/qvZwtOF8yiYEJNab6azJbEYco+jCra7D/X0
	AiuQ==
X-Gm-Message-State: AHYfb5hNF1bI9S8PrdIneHoeIfjM9lRh7r/zYxXJeY4Q8tmXtRB6JSDx
	qqvnH579NLFlTwjse2EpgrvH2APq2/Lk
X-Received: by 10.28.125.195 with SMTP id y186mr7195507wmc.37.1502356995554;
	Thu, 10 Aug 2017 02:23:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Thu, 10 Aug 2017 02:22:54 -0700 (PDT)
In-Reply-To: <20170810104604.342af354.cohuck@redhat.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-19-f4bug@amsat.org>
	<87mv7aumav.fsf@linaro.org>
	<8e2e3aa5-4459-76ba-3309-af6b30220346@amsat.org>
	<87fud0vmak.fsf@linaro.org>
	<3e66742f-04c5-51b7-de3a-f692c0637bc5@amsat.org>
	<20170810104604.342af354.cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2017 10:22:54 +0100
Message-ID: <CAFEAcA-GP53g+vfgDH1mNQnPHcrNULb+gkQk4JeJhb=8UCt+YA@mail.gmail.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Eric Blake <eblake@redhat.com>, Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 18/47] MAINTAINERS: add
 missing TCG entry
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
X-List-Received-Date: Thu, 10 Aug 2017 09:23:20 -0000

On 10 August 2017 at 09:46, Cornelia Huck <cohuck@redhat.com> wrote:
> The root problem is "some files have no maintainers". The reasons range
> from "forgot to include the file in the pattern" (easily fixed), over
> "file is updated via a script" (the linux-headers case), to "nobody
> feels up to the task" (which is the worst case).
>
> In most cases, I don't think the recent contributors list is very
> helpful. Somebody who simply did a tree-wide rename is unlikely to be
> able to make a good judgment about a complicated logic change. Just
> printing qemu-devel as the address to send this to is probably better;
> unfortunately, it may cause patches to languish on the list if nobody
> takes pity on them.
>
> Do we need someone collecting non-trivial patches like that, who either
> pesters others or picks up the patches themselves?

The problem is that if nobody's feeling up to the task of taking
on a particular single file which has no maintainer, then it's
definitely true that nobody's going to feel up to taking on
the entire collection of unmaintained files...

I think the UI (giving no consideration to how we might implement
this!) would ideally be something like:
 * if anybody mails a patch which touches an "unmaintained" file,
   a robot should send a reply along the lines of "thanks for the
   patch; unfortunately file X is not maintained so it may be
   tricky to get patch review for this. You'll need to be
   persistent and do more of the legwork than if you were patching
   a file that did have an active maintainer" so contributors
   know when they've wandered into the swamp
 * some mechanism for easily finding patches to unmaintained
   files which haven't got review yet, so that anybody with some
   spare time and interest can move some of them along (the idea
   being to spread the load rather than trying to designate a
   particular "owner" for this headache)
 * ditto for finding patches to unmaintained files which have got
   review but which haven't been committed

thanks
-- PMM

