Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WDaN8-0002jA-QX
	for mharc-qemu-trivial@gnu.org; Wed, 12 Feb 2014 09:01:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WDaN2-0002hX-G6
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 09:01:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WDaMx-00028r-Rh
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 09:01:00 -0500
Received: from mail-la0-f41.google.com ([209.85.215.41]:64401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WDaMx-00028c-LX
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 09:00:55 -0500
Received: by mail-la0-f41.google.com with SMTP id mc6so7230315lab.0
	for <qemu-trivial@nongnu.org>; Wed, 12 Feb 2014 06:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=X+kj4D3+mjNqtUcifQMi9+mHufxJVI3qA8mIxwDHaxE=;
	b=cgq9+ADEiyyXAUaldzV9lpfiwxv6g90OW+H0LDg4QXBWIav90IuCZ/LUJqIPBfa/so
	UMFIjyFEvTumDGuhlSutJK17WklUbx/aCtXkHvbjCySMXasdde2ibTARE0FcZCs2Rsif
	1kbSxNm+TE/4oqcAwkNN0GV5HNaqvQW4lYDmmEtitFPbv+0Xb81GLjGE1T/h/YZaiRyt
	i85Rkl1BB1j1NKvH5KU8VNRKwuYykeUydtxOyD2WegW5JYj8vtswAE54NHxNwjtbZyui
	zwY5cxbtDfvaK0R2S4woDy4GoS5CzVCJclWThHKjDe6gB38PTIeLZmTslLFQquV49cq/
	VcFw==
X-Gm-Message-State: ALoCoQksKNFYHWOOlOj+l7EzUoYLYWPp8/z8mR+4cZVpBj4WmFuzWyDWm95xnr1llMfhrBQfmZAR
X-Received: by 10.152.19.166 with SMTP id g6mr31622188lae.21.1392213654142;
	Wed, 12 Feb 2014 06:00:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.118.34 with HTTP; Wed, 12 Feb 2014 06:00:34 -0800 (PST)
In-Reply-To: <52FB7D13.8050801@embedded-brains.de>
References: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>
	<52F34A67.7060902@msgid.tls.msk.ru>
	<CAFEAcA_AJA3T=651ex7tFD3xfT4S_iRt44CJj1Pd6Sgz9NF21g@mail.gmail.com>
	<52FB7D13.8050801@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Feb 2014 14:00:34 +0000
Message-ID: <CAFEAcA9bmL3gfjxUnp=uU24JQvsDV+hX2tRmg9ew6avZ-6AMtg@mail.gmail.com>
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sparc/leon3: Initialize
	stack pointer
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
X-List-Received-Date: Wed, 12 Feb 2014 14:01:05 -0000

On 12 February 2014 13:54, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
> On 2014-02-06 09:57, Peter Maydell wrote:
>> On 6 February 2014 08:40, Michael Tokarev<mjt@tls.msk.ru>  wrote:
>>> >I don't really know much about sparc or leon3 stuff.  But having a
>>> >reviewed-by from Fabien I can apply it to trivial-patches.  I'm not
>>> >really sure why it can't go to sparc tree instead.
>>
>> As far as I'm aware there is currently no sparc tree; Blue is the
>> listed maintainer and typically just applied patches directly.
>> In the absence of Blue, if somebody else who cares about sparc
>> wishes to collect up reviewed sparc patches and submit them as
>> a pull request so they don't just get ignored, I'm willing to apply
>> that pull.

> Ok, how do we want proceed here?  I have an additional patch in the queue
> that adds AMBA plug and play support to the LEON3 support of QEMU so that
> you can run unmodified binaries for RTEMS, eCos and Linux.

It's sparc-specific, it's pretty small, it's been reviewed.
MJT: I suggest we take the pragmatic approach and apply it
via -trivial.

thanks
-- PMM

