Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIHtS-0006wL-9W
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 09:50:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XIHtL-0006iD-K4
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 09:50:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XIHtD-0001ez-T0
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 09:50:03 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:40281)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XIHtD-0001el-Li
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 09:49:55 -0400
Received: by mail-lb0-f173.google.com with SMTP id u10so1961307lbd.32
	for <qemu-trivial@nongnu.org>; Fri, 15 Aug 2014 06:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ph541y8KCmXpflp3ZlaP6Ms/uh/XuZ4oj/V1c8a7c5U=;
	b=DVnP/fN+roNnC+tbggA+BFf0AyoXY/rzWxrKTvxHolQCFza2JKVxsVyshxbQ5dXAMP
	HwDN/+alSffWbsai7s/6xscvyMQONFqzrreQOFA+ZUIf1AzI4AfLbcYF+ES+qC7S/pOP
	OjstvunhO4XDufjZ49xTZuGg2lH8i4Nd3ancD7BaCOt/+g74QNGEI0Y5ugjFOuylVqbB
	vXCOqQ0hI6gKxbMyJJfg9bewGp4loytB7VXA7SHauVd5i4hImxqDc2R4C15SBSF/MV87
	yS03b74Ezg4cR0JXIJXY3+j9v/OnyI4eiVxJHoIQSwI6Y3J/nuZ/Q//lYNmZNznMryBw
	UZAw==
X-Gm-Message-State: ALoCoQlnHt74/itj5OnjHz6h8Oss8OYFW7xqHzbhP7sVmgisFRt9ZYuXLcBQbVjwgt8FV1RR/QVH
X-Received: by 10.152.9.100 with SMTP id y4mr12292078laa.26.1408110594563;
	Fri, 15 Aug 2014 06:49:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Fri, 15 Aug 2014 06:49:34 -0700 (PDT)
In-Reply-To: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2014 14:49:34 +0100
Message-ID: <CAFEAcA9znJVRs8-sjCkxQ+-nebX03uFB3zNazXC=LveRqFD5KA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/9] Trivial patches for
	2014-08-09
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
X-List-Received-Date: Fri, 15 Aug 2014 13:50:08 -0000

On 8 August 2014 21:38, Michael Tokarev <mjt@tls.msk.ru> wrote:
> There's a next pull request for the -trivial tree.
> Nothing exciting in there this time.  Small things
> left from pre-2.1 time, small new things here and
> there, and 2 portability fixes on top of 2.1.
>
> Please consider applying.
>
> /mjt

Applied, thanks.

-- PMM

