Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhFLl-00071k-8h
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 06:10:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhFLf-0006yN-66
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 06:10:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhFLY-0004kc-L7
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 06:10:27 -0400
Received: from mail-lb0-f178.google.com ([209.85.217.178]:53683)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhFLY-0004kN-EY
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 06:10:20 -0400
Received: by mail-lb0-f178.google.com with SMTP id w7so542092lbi.37
	for <qemu-trivial@nongnu.org>; Thu, 23 Oct 2014 03:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Qlc3Tf5PFjYKlruJnUdmWCwoarq/Iwc8pKt4l0/OW0k=;
	b=jVf0JdrLuIg/7D/VOGJCQGEQN2nEHefSUs20CLMhhpdszaR7GRB93wKYOEkEIjpkqG
	K3YDDRkOxT+AsZTn07zOzO9mZyUUHKD6zoIhwEk4gcd2vh+1NthA8PEpEuRy8sMz5lMT
	TppjEj5K7pv0ZdN8BqwT+cpnyui0Pe13BOVdOv+nF6NfWq+qrD1o6aGQ3nf6Anmv4neF
	uF9xdeLgXNaeSf6gvU0zyeeEWNALBCmyz/zv/g8HJTx/zs12yhY9ZLuu0nvheZJw6zUH
	uLHOD9nHLQ+Fho2q+xJ+XO/drWuG9Czq4yHPjASvOCdaEYX0+FkxwdYdO4QheWT+uerQ
	MVCQ==
X-Gm-Message-State: ALoCoQljEoIZVT+0cQXwn2NmBGVZKtpET1J7xNFSUGmHSSvG5zONrB1B1M5XzpSK+zSKXWaOLCHv
X-Received: by 10.112.221.197 with SMTP id qg5mr3968411lbc.32.1414059019225;
	Thu, 23 Oct 2014 03:10:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Thu, 23 Oct 2014 03:09:59 -0700 (PDT)
In-Reply-To: <CAFEAcA-Zg-MUFCnJBeuSjbXyc9Y7W4rLQZ0DXXHJ_ZWKLDo8mw@mail.gmail.com>
References: <54369514.5000004@gmail.com> <5448B7C6.8070604@msgid.tls.msk.ru>
	<CAFEAcA-Zg-MUFCnJBeuSjbXyc9Y7W4rLQZ0DXXHJ_ZWKLDo8mw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Oct 2014 11:09:59 +0100
Message-ID: <CAFEAcA_o827huyJeqJty4eBUnXQSRmrP3n967ugr2q7HcJLrhw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.178
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Chen Gang <gang.chen.5i5j@gmail.com>, "rth@twiddle.net" <rth@twiddle.net>
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
X-List-Received-Date: Thu, 23 Oct 2014 10:10:31 -0000

On 23 October 2014 10:02, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 23 October 2014 09:09, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> Applied to trivial (with subject fixup), thanks!
>
> Please don't -- as I said, I have a libvixl update in my queue,
> and these will conflict. I'll apply an appropriate variation of
> this patch to my target-arm tree.

...or maybe I just *thought* I'd said that, since I can't find
a mail in this thread where I did; sorry.

-- PMM

