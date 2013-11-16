Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vhdm3-0004nN-EV
	for mharc-qemu-trivial@gnu.org; Sat, 16 Nov 2013 06:10:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vhdlw-0004mH-K5
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 06:10:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vhdlr-00011o-CJ
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 06:10:40 -0500
Received: from mail-lb0-f170.google.com ([209.85.217.170]:57224)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vhdlr-00011g-22
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 06:10:35 -0500
Received: by mail-lb0-f170.google.com with SMTP id z5so3505287lbh.15
	for <qemu-trivial@nongnu.org>; Sat, 16 Nov 2013 03:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PWpMoWzQUKydMv03g4dK1QtOqqjzBVgpkvrg8MNZFn0=;
	b=NPehWpQt+X6rxUGBXtQvH6LTrZexSaKiIBtzhIQQyJmhwAUy4UxhfMPJ8T698xXjGw
	D46UHC82QrYqUlvN7vZCVyogretaPcvigEhqztXT0moX+zOiKN3VOvLw+9bXWvz1b7k9
	S9/FS6YLNONFKDAdhw1PCzIuQCLMiQukN5bzMvtzuOnDPEj7u1dwi16TFIxs3cR4kJsx
	cwz95inFyppC6NYNteyl32x+RQmuwiVZR6Hw+Q7RF47sDGF0XbUHplRusxVbJvmXJcSb
	+TBeyHIEaQk0S8lgXHgomGsCe+vWeNMMVM9RvkalT/I0dtqZ/f/1iJtgjskYLrxaMLRL
	VdcA==
X-Gm-Message-State: ALoCoQnTpMro17cwrPBnd9pHud2lwEDleN+8juglKcOuQD8XFnqiPJWLsiluG8Ru6MSMOkzqdWX1
X-Received: by 10.152.4.230 with SMTP id n6mr6408410lan.1.1384600233110; Sat,
	16 Nov 2013 03:10:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Sat, 16 Nov 2013 03:10:13 -0800 (PST)
In-Reply-To: <528743FA.50508@msgid.tls.msk.ru>
References: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
	<528743FA.50508@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 16 Nov 2013 11:10:13 +0000
Message-ID: <CAFEAcA83Q1nQtHWB+BRByfw+FzP-O7j9h5Dgch9Oya1nbOQf1g@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.170
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH (1.7?)] configure: Use -B
 switch only for Python versions which support it
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
X-List-Received-Date: Sat, 16 Nov 2013 11:10:45 -0000

On 16 November 2013 10:07, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 14.11.2013 22:07, Stefan Weil wrote:
>> Commit 1d984a67a95d88f3e708b077dab8adeb47c38c93 added the -B switch
>> unconditionally. This breaks Python versions before 2.6 which don't
>> support that switch.
>>
>> Now configure adds -B only if it is accepted by the Python interpreter.
>>
>> This modification introduces a small incompatiblity because -B might now
>> also be added when configure was called with --python=PYTHON_INTERPRETER.
>
> Thanks, applied to the trivial-patches queue, with the spelling fix in comment.

Just a question since we were discussing this on IRC -- are you going
to remove the non-buildfix/bugfix patches from the trivial queue so
the buildfixes go into 1.7?

thanks
-- PMM

