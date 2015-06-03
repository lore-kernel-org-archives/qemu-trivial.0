Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z09zf-0003j7-5s
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 10:50:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z09zc-0003f4-Bw
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:50:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z09zY-0005Vt-P5
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:50:08 -0400
Received: from mail-ig0-f174.google.com ([209.85.213.174]:37216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z09zY-0005Ug-Lv
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:50:04 -0400
Received: by igbsb11 with SMTP id sb11so16298416igb.0
	for <qemu-trivial@nongnu.org>; Wed, 03 Jun 2015 07:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=782zaTCSDbIRnBC0irfv2mor6LbIN4aQUp15yDUzyP8=;
	b=inZL6CcNhuHAIdo3BBBpWlBFwMHHIZoIL07Z0mcSrfzXBMkKyl2D+4MwejxN+rvyHv
	AQoGrn72u/HSPwP2D+x3sjlofG98a3hiNXJJVurE7V2VEQpSqoHIzWi5WevwZSfY3mie
	rxspFS1Zm6ZbwlYWRcacBIBVQJ2X3XR5OnEF75iKX4uV4G4uiTq6KYoLtClG0RO4aOPr
	bPtMbBPzFSrnqzFopBKHlUrG7TuIPUtGSvF0O7Lxx4Tv7JDWt/LFoy63wXS+Ci9IOUmh
	Sg2BpgOe69nUJ+QBMnCaPRjDEDzSalayDn7z/WAOZ7iWOcYuqmbIWwJZsgYRmE8K2Yzk
	iaSw==
X-Gm-Message-State: ALoCoQnWKBa956pScACKiBCyXoUY877M7Xe0Qxvc1Fg1wSaiF1B9zMufkz5pvX3yzHaPpAHxzyy/
X-Received: by 10.42.86.197 with SMTP id v5mr3051070icl.70.1433343004066; Wed,
	03 Jun 2015 07:50:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.166.5 with HTTP; Wed, 3 Jun 2015 07:49:43 -0700 (PDT)
In-Reply-To: <1433342686-24310-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1433342686-24310-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Jun 2015 15:49:43 +0100
Message-ID: <CAFEAcA-i2VxL+MX3Bun6_Vb8jLaNiL-+fztZe632J_cFJ7Yh1w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.174
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Tom Musta <tommusta@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] remove
	libdecnumber/dpd/decimal128Local.h
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
X-List-Received-Date: Wed, 03 Jun 2015 14:50:09 -0000

On 3 June 2015 at 15:44, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Commit 72ac97cdfc added two equivalent versions of decimal128Local.h,
> one in libdecnumber/dpd/ and another in include/libdecnumber/dpd/.
> Being identical by the code, the two files however differs in the
> licensing terms.  The one in libdecnumber/dpd/ (which is being
> removed by this patch) is licensed as GPL3.1 (plus gcc runtime
> exception), which, as far as I know, is not compatible with GPL-2.

Yikes. Yes, that has to go. I did a quick grep of the tree for
'version 3' and that seems to be the only accidental GPL3 thing
we've ended up with.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

