Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvqk1-0006Gf-CT
	for mharc-qemu-trivial@gnu.org; Sun, 16 Oct 2016 15:05:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bvqjz-0006G6-Fs
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 15:05:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bvqjy-0007o1-C0
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 15:04:59 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36219)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bvqjy-0007nb-15
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 15:04:58 -0400
Received: by mail-vk0-x229.google.com with SMTP id 2so153121171vkb.3
	for <qemu-trivial@nongnu.org>; Sun, 16 Oct 2016 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fZl1LF52wBAIDSCzG5OVu6EDj/JR2L5EBDfjt+zCFvM=;
	b=ARW1b5hXvq4D7UyNWhzHiC8a7ziFUm/pj8OC/TrD/Ya7z26Al40JMu9md2n4TO3eWU
	dIw3aabovf3iGgTr0+Zd2mu12cf2OpEQ0qpqYkbrYIZxWe+P/UbvM8RHoXVGHjjCNP0T
	WER1/N2lP51h09KqonGCr2EUYdYwc7NnnaBYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fZl1LF52wBAIDSCzG5OVu6EDj/JR2L5EBDfjt+zCFvM=;
	b=E4HE3UzX3+eIk+hhUZ/zEuJ2CcaPknHLOHl7owLTYL5vGGpjikh2cClwS79A2lPUTy
	2IH6ywcUSw463L3st+qKBpS3KyzFfMyeD72FNsgfPh+kfw4C1CkyyomgOxpJarx4eKM5
	Q7NMHO8s5AzYp3nMqZ7BjRfKfpwhI/FUTPdTyg5AYK7dm+hzacYINzBUMsc7OLFqhlBJ
	U37BkwKSLCmSRTno3wsRJbfK+fTBaUZo31T2ocvEIj8v+mJbb6gOLQ656dVgNxS6omFu
	eX3qsfTh87k/Nu95wkJx63juAXsOhgMEEQjSQeVRObF5TnNgIBNNYIIbf55HI6e0Lioz
	Lufg==
X-Gm-Message-State: AA6/9RnX1vVxlLjj620E6gV1dbLIqyL4BZsW37vA3UmCBhnWQZyFmu9CbA2vFVW1BOUItm9iv5jU0vHyjsX0tT3x
X-Received: by 10.31.206.198 with SMTP id e189mr12539960vkg.51.1476644697143; 
	Sun, 16 Oct 2016 12:04:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Sun, 16 Oct 2016 12:04:36 -0700 (PDT)
In-Reply-To: <9af01992-677a-11d5-e372-fc5e942907be@msgid.tls.msk.ru>
References: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
	<9af01992-677a-11d5-e372-fc5e942907be@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 Oct 2016 20:04:36 +0100
Message-ID: <CAFEAcA-u-XrxYrb_tCOfk5dHh1j2xpHZek8oRWqWKX-jS5i4uQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix build for less common
 build directories names
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
X-List-Received-Date: Sun, 16 Oct 2016 19:05:00 -0000

On 16 October 2016 at 15:31, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 13.10.2016 21:29, Stefan Weil wrote:
>> scripts/tracetool generates a C preprocessor macro from the name of the
>> build directory. Any characters which are possible in a directory name
>> but not allowed in a macro name must be substituted, otherwise builds
>> will fail.
>
> Applied to -trivial, thank you!

Consensus on this and the other thread seemed to be
that we should just fix the bug where tracetool is
putting the build directory name into symbols
rather than working around that...

thanks
-- PMM

