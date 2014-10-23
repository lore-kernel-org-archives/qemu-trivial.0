Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhCbX-0006dl-VZ
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 03:14:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhCbR-0006bw-GE
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 03:14:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhCbL-0004Ks-RM
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 03:14:33 -0400
Received: from mail-la0-f48.google.com ([209.85.215.48]:62115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhCbL-0004Kf-Kx
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 03:14:27 -0400
Received: by mail-la0-f48.google.com with SMTP id gi9so334939lab.35
	for <qemu-trivial@nongnu.org>; Thu, 23 Oct 2014 00:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v0O5PWz0IaGeEh3fwGiiQKi/mp2fpHma7GvbCwEuDWA=;
	b=Ap+RhDNhUPtE121Xxe/L7FXfZGWvnheZqEK9aPO536XpJRCQ1hcx+aW9kNSdsMLiJ6
	JAxzA6ezQf5IiNZBqKmoF6pbKvjyCgT8mZ50UyLzhPnYq3PR0IHinf9XcbLmSivz3eKH
	f+BMru+M5TiJIw534kUgdnz51euqEg0cUBZ5QZ5QRv9NKKxKkAUKrzwCiKKElba8d7N5
	YKVG8fY4Id89ELcvRwOIO8tdjbI/abZJcqLUCZkVxwLx29r7vNOkutp+we1TQdfCksHP
	JHMkPATjktez+duk6zOuLqrjmoTaAsZzy8Lt5AqZKOlyFw9z2Ho230YdhCn5cRFcEHx7
	gj/g==
X-Gm-Message-State: ALoCoQnItc9ew38RMeXv+OSdGvq1RlMkn0rdbYq13kX4LcZ/v+yfTasptW/xDsE61b8XDkxqvAac
X-Received: by 10.112.66.166 with SMTP id g6mr2888716lbt.69.1414048466658;
	Thu, 23 Oct 2014 00:14:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Thu, 23 Oct 2014 00:14:06 -0700 (PDT)
In-Reply-To: <5448A4E5.1020605@msgid.tls.msk.ru>
References: <54369514.5000004@gmail.com>
	<CAFEAcA9KgX1gOtXPqTC2gX1HD69aPF9fbKkk1i5zbN2+tLW_og@mail.gmail.com>
	<5448A4E5.1020605@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Oct 2014 08:14:06 +0100
Message-ID: <CAFEAcA9DiF47tHEMdmkukxoidS4V7w5K1pRF_audrOT0qGAqcQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.48
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, "rth@twiddle.net" <rth@twiddle.net>,
	Chen Gang <gang.chen.5i5j@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
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
X-List-Received-Date: Thu, 23 Oct 2014 07:14:38 -0000

On 23 October 2014 07:49, Michael Tokarev <mjt@tls.msk.ru> wrote:
> If upstream already have a patch for this, why not take the
> upstream's solution now, so we wont need to revert our solution
> before applying next drop from upstream?

Upstream haven't released it yet.

> BTW, how the "upstream drop" is done, anyway?  If it is something
> like git merge, we may need to care, but if it is just cp -a upstream/* .
> when there's no reason to... ;)

It's a copy. As you say, since it's just a copy we don't need
to worry about merge conflicts so we can just fix it in
a convenient way for us for the moment.

thanks
-- PMM

