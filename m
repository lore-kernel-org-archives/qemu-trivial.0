Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5kuk-0006TS-QG
	for mharc-qemu-trivial@gnu.org; Sat, 03 Aug 2013 19:07:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V5kue-0006Sw-TN
	for qemu-trivial@nongnu.org; Sat, 03 Aug 2013 19:07:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V5kuZ-0000fY-U0
	for qemu-trivial@nongnu.org; Sat, 03 Aug 2013 19:07:04 -0400
Received: from mail-lb0-f182.google.com ([209.85.217.182]:33354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V5kuZ-0000fM-Nt
	for qemu-trivial@nongnu.org; Sat, 03 Aug 2013 19:06:59 -0400
Received: by mail-lb0-f182.google.com with SMTP id v20so1239041lbc.41
	for <qemu-trivial@nongnu.org>; Sat, 03 Aug 2013 16:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=JOxz9+r6ioCFryiAESHPJs2J3/yMHdINOLAAkQa6xdo=;
	b=bMwwcbJjS4IOBQRC6GQQxMB+0RZsaFP9cWPyWw3Ekm4vNgvsNj2DYkq+XVQ3g1NyRR
	2TMPS2dXprZcBAdoKjYMaY+fMlvIpgxkEDGUR/4XF7oxwsStXauJM1goa/cG7gfJbWEY
	qNotAjhggYiSGm/hzmTDuGObxstD29ACJlIqnEnlPTX5VcunRMt5yzeinuBzv5S3resV
	ZOMvQ9LobbhRvklFk+PglSg2mdm4O5/lg+O7X+0XNQiL2CI1Ty1/egHa+iW7ihkk2TaU
	HL9pOSVUDfiwn4hP07ANAm473GzWlM3d227yrHRMdnUy+Jbd62vQ3DxMHu5Eht5XvsWC
	Hk8A==
X-Received: by 10.152.22.65 with SMTP id b1mr5568516laf.46.1375571218835; Sat,
	03 Aug 2013 16:06:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.13.2 with HTTP; Sat, 3 Aug 2013 16:06:37 -0700 (PDT)
In-Reply-To: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Aug 2013 00:06:37 +0100
Message-ID: <CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
To: G 3 <programmingkidx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlf2Z29pITAKK60fH1/5daF+KJBfiaCJPSgJkPpodNAvH358IN0pMJ/TIfVa/QCHdo6QLsW
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.182
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, afaerber@suse.de,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Adds the ability to use
 the command key in the guest operating system.
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
X-List-Received-Date: Sat, 03 Aug 2013 23:07:09 -0000

On 3 August 2013 23:52, G 3 <programmingkidx@gmail.com> wrote:
> This patch adds the ability to use the command key in the guest
>  operating system. Just add -command-key 55 to the command line
>  options sent to QEMU to use this feature.
>
> I have checked the patch by sending it thru checkpatch.pl this time. I also
> made a bunch of style changes to more closely match QEMU's suggested coding
> style.
>
> signed-off-by: John Arbuckle <programmingkidx@gmail.com>
>
> ---
>  ui/cocoa.m |  114
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 files changed, 104 insertions(+), 10 deletions(-)

This definitely isn't "trivial".

I'm also really unconvinced that this is the right way to handle
this: adding a new cocoa-UI-only command line option which takes
a magic number looks very odd.

thanks
-- PMM

