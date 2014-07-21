Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X9Ae3-0000W4-6A
	for mharc-qemu-trivial@gnu.org; Mon, 21 Jul 2014 06:16:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X9Adx-0000TK-0i
	for qemu-trivial@nongnu.org; Mon, 21 Jul 2014 06:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X9Adr-0002LE-Br
	for qemu-trivial@nongnu.org; Mon, 21 Jul 2014 06:16:28 -0400
Received: from mail-la0-f42.google.com ([209.85.215.42]:61974)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X9Adr-0002Kc-5K
	for qemu-trivial@nongnu.org; Mon, 21 Jul 2014 06:16:23 -0400
Received: by mail-la0-f42.google.com with SMTP id pv20so4131746lab.15
	for <qemu-trivial@nongnu.org>; Mon, 21 Jul 2014 03:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zI7dzk3HfDUSJsLyw5SubiLJfA3R6/RXaOZ2aXoVMNI=;
	b=G3vhZMzzddtKrAJpY3v8/ZX2v2YBLonGeQ0kVj73fu0SdgKbciWkbOC3c+YgK9FuPd
	RKpAOt9k77NpXX3gUzUIqBZJc/DCQNl2OUoVGWcpNjpMufpjfaadSQiG1yPfjMZteEWg
	0kCTbVU2xLULwdq4mP3WHqhgO4mYRoWUv9fqbw23oebnZsA4Z0AP0MsfVBYEVYE0z8Hz
	j6SsnB2NFqXTmP8J0wThUAMx75dFujn20oUJNkBWOZyVZ78m61Zh21p8D7nmfgi6qyce
	qPmPyr0FoL6QZ4EgKgsrnwNNoP6dMYSq+QkEows1fiDBMfAxCJwF/BiOLSShqDJmipbv
	uK1g==
X-Gm-Message-State: ALoCoQlA1RR6RDGuq8yRjAQG3myZcFHo8ponNr3aICPO6+JG50KWs2MqEH5D6+Boyk5RvqkXY6Io
X-Received: by 10.112.154.134 with SMTP id vo6mr2577138lbb.92.1405937780966;
	Mon, 21 Jul 2014 03:16:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Mon, 21 Jul 2014 03:16:00 -0700 (PDT)
In-Reply-To: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jul 2014 11:16:00 +0100
Message-ID: <CAFEAcA8-HsAhDTVtQ6Ra3KK5D-G_5LSkm=GveqxGWgj-howz2w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.42
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL for-2.1 0/8] Trivial patches
	for 2014-07-18
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
X-List-Received-Date: Mon, 21 Jul 2014 10:16:33 -0000

On 18 July 2014 15:09, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Since we're close to release, I included only really-really-trivial
> and safe changes in this pull request, -- only those which wont
> break anything.  One good patch is a documentation change mentioning
> icmp sockets, plus a series from Stefan Weil which adds some missing
> `static' attributes here and there and fixes some typos in comments.
> Plus a single patch from Chen Gang which was in the queue for quite
> some time, also really trivial.  And an addition of error message
> for slirp code which was pinged several times already.
>
> I haven't considered other "a bit less" than trivial patches for 2.1.
>
> Please consider either pulling whole series or at least applying the
> icmp doc change.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 4d121a549869b93475ccf8b9a0d3e693011d1abb:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2014-07-18 09:35:51 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-07-18
>
> for you to fetch changes up to 748bfb4eee8e699f3d2dd6a95820d1a9e57e4aa6:
>
>   tests: Add missing 'static' attributes (fix warnings from smatch) (2014-07-18 17:45:37 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-07-18

Applied, thanks.

-- PMM

