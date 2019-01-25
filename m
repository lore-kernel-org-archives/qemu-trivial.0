Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmysA-0006rK-RQ
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 05:38:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmys8-0006pV-Ug
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 05:38:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmys8-0003sm-3X
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 05:38:04 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:44578)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gmys7-0003s2-Uw
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 05:38:04 -0500
Received: by mail-ot1-x32b.google.com with SMTP id g16so4086906otg.11
	for <qemu-trivial@nongnu.org>; Fri, 25 Jan 2019 02:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c05puAZBkWbs8q2yEQ5NL1LxTqdiKh0YN+nAq9OXwEM=;
	b=cyrTUcCNgfLOCQ1feKdZFgKLY3WVOaSNxUxhtjHZPG7r+4rhHgC0KKkk0zNin/abmu
	f4SsH0kh3GM9HFPXArXpF1W3Q4edmDUid+YzfUtGXGWBuisLUG4tOjvHokv5KFOPVVbE
	DVxUAD0uH/KT2tFS/DN6o9lVuY7FAwZmZxAiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c05puAZBkWbs8q2yEQ5NL1LxTqdiKh0YN+nAq9OXwEM=;
	b=DkLOt5HzxfMdvEmber8mX8odQ1X42pweNqKYOMieDW4oBbTNBsPUGj0xN81vm1uNr2
	DhL3hDr7hhWux1ceA/mJI1hM5GeMFdbdEofvg35tUbOe89Dl7+6qL5ae0rouxJFg7AYh
	bdwt2Ad3qqUUVPLAdeefJFSbovyKlq0u9m4f/Rw5KJLW4/GcKmeCXCl+9l2L8uZGkXfk
	X/QwqFrXtx9ts1T+z0Jv8olD2adixh+ScVTI4TOmH1ocDuDAYWJCXi3fSUMpIrFJeIdC
	VG7tTSgy2d2d88RX+Vm3kaIZgfVZyvzDor75ZIDTpNCrXFz4nsI5wm8LcUNOi+0Z3kAQ
	AbHA==
X-Gm-Message-State: AJcUukdI5Uglz6FiaI0q1fXqDv3JXk7dOKYY3sJjjJgY5vpx9mhX08uu
	5PGLzWPi/a25FpyktWIyKYnFvRwOlRYcn/DIYLcAng==
X-Google-Smtp-Source: ALg8bN7nVrHPaM/UcBhSUID6kuvQ7YL62keCoGE8zfgsl9StF3ZZrwh9ukOWH7Tuud6u/ua+ojHDX7y0krelsGCGPt0=
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr7218603otq.316.1548412682923; 
	Fri, 25 Jan 2019 02:38:02 -0800 (PST)
MIME-Version: 1.0
References: <20190124124906.16653-1-laurent@vivier.eu>
In-Reply-To: <20190124124906.16653-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jan 2019 10:37:51 +0000
Message-ID: <CAFEAcA_BRPpz3mz+J-iAduVCnKrC-WajTdFWHdg65EQr9Jspvw@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Michael Tokarev <mjt@tls.msk.ru>, qemu-ppc <qemu-ppc@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/5] Trivial patches patches
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
X-List-Received-Date: Fri, 25 Jan 2019 10:38:05 -0000

On Thu, 24 Jan 2019 at 12:52, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 6d809e7da943bb4b95b408fbf3d80d097c0f7d38:
>
>   Merge remote-tracking branch 'remotes/xtensa/tags/20190122-xtensa' into staging (2019-01-23 21:50:49 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-patches-pull-request
>
> for you to fetch changes up to 285816d76f37c412f391fa14a2b28a35b7cb134e:
>
>   hw/i386/pc.c: fix one typo in function name (2019-01-24 13:34:20 +0100)
>
> ----------------------------------------------------------------
> - Some typo and UTF-8 fixes
> - a ppc e6500 fix to remove duplicate SPR registering
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

