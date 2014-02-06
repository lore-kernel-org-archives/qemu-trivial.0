Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WBKmr-0000cC-Rj
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2014 03:58:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WBKml-0000RG-MA
	for qemu-trivial@nongnu.org; Thu, 06 Feb 2014 03:58:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WBKmZ-0002oa-Ak
	for qemu-trivial@nongnu.org; Thu, 06 Feb 2014 03:58:15 -0500
Received: from mail-la0-f47.google.com ([209.85.215.47]:61948)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WBKmZ-0002oF-3o
	for qemu-trivial@nongnu.org; Thu, 06 Feb 2014 03:58:03 -0500
Received: by mail-la0-f47.google.com with SMTP id hr17so1212526lab.6
	for <qemu-trivial@nongnu.org>; Thu, 06 Feb 2014 00:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nVRc30cr3rtgxzqjAhYIhAIA22dqElqOwzTIgmnTEdg=;
	b=YeHe7fpQ2gG/iaqIokDHin8DLb4zKZEctLEyH5UmyV06A/lRE2UkmGCIVHSfsju1be
	BaQXYvrNfdMh5s0AxNHhS2Pla9FzAHWsvuefW7iqMI8AbQsya5AwrioxoO3Myv1tgh7P
	Tt3/IGtDEYTFZBxlagdI3m7eJgVt8pNT91oDfMRw0yLpSN5enuyvGJ1DEGgDs+aw6D/L
	6kabMKT8gWeMFEyQqgHlMwjTZjnBR8ye6jGefvRiM7/gGWPoPd6xnr6oa6IgdUTPaqEo
	RIIiHqHV5HaBHXsoAV9RgKTdYEdX3O8vlxZAHiOSGFqWewvvurX8gHEYyX8JqACCYIxg
	p8gQ==
X-Gm-Message-State: ALoCoQmYYCSo0OnaQvevU659g8W40faBPfYWvMmIHug7EF5RlideKvSu8OUcCzrVoMuRchXDo+Tl
X-Received: by 10.112.209.97 with SMTP id ml1mr4597403lbc.26.1391677081637;
	Thu, 06 Feb 2014 00:58:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.199.162 with HTTP; Thu, 6 Feb 2014 00:57:41 -0800 (PST)
In-Reply-To: <52F34A67.7060902@msgid.tls.msk.ru>
References: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>
	<52F34A67.7060902@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2014 08:57:41 +0000
Message-ID: <CAFEAcA_AJA3T=651ex7tFD3xfT4S_iRt44CJj1Pd6Sgz9NF21g@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.47
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Sebastian Huber <sebastian.huber@embedded-brains.de>,
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
X-List-Received-Date: Thu, 06 Feb 2014 08:58:20 -0000

On 6 February 2014 08:40, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 03.02.2014 13:18, Sebastian Huber wrote:
>> A lot of real world LEON3 systems are shipped with the GRMON boot
>> loader.  This boot loader initializes the stack pointer with the end of
>> RAM address.  The application can use this to detect the RAM size of a
>> particular board variant.
>
> I don't really know much about sparc or leon3 stuff.  But having a
> reviewed-by from Fabien I can apply it to trivial-patches.  I'm not
> really sure why it can't go to sparc tree instead.

As far as I'm aware there is currently no sparc tree; Blue is the
listed maintainer and typically just applied patches directly.
In the absence of Blue, if somebody else who cares about sparc
wishes to collect up reviewed sparc patches and submit them as
a pull request so they don't just get ignored, I'm willing to apply
that pull.

thanks
-- PMM

