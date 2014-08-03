Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XDvaI-0001ci-4R
	for mharc-qemu-trivial@gnu.org; Sun, 03 Aug 2014 09:12:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XDvaB-0001c6-AB
	for qemu-trivial@nongnu.org; Sun, 03 Aug 2014 09:12:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XDva6-0003Ka-7E
	for qemu-trivial@nongnu.org; Sun, 03 Aug 2014 09:12:15 -0400
Received: from mail-la0-f49.google.com ([209.85.215.49]:50330)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XDva6-0003KU-08
	for qemu-trivial@nongnu.org; Sun, 03 Aug 2014 09:12:10 -0400
Received: by mail-la0-f49.google.com with SMTP id hz20so4508864lab.22
	for <qemu-trivial@nongnu.org>; Sun, 03 Aug 2014 06:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UohrwXJmoA+7TNZ2Dc5Q2kmQhQtKkKEL4FxcF8o8mdQ=;
	b=g+m36bdzpAGRbVYGU01qZv4Gb8BEbOTBYCsVfmxKqEh4ogbDThMw1EpORdBVh8rsRv
	sCXY1M0gzCk/Wa2dbSBVGm7PfV1SJva4bnP/hZ5RpXZudau7XVxqPaTXySqj+gZLEm3q
	kidcgRv6EXdaSN1ZeDigB9QxPBzuiKgwCQVu+SGvtfd/tE0Nz91g+GIxPEzWcQJ1l435
	yc9sRqijHe2JDl2XH8+WSaWp7nEbkUYk91kzgp7+FVIAvFaQaFQSyUgVQ9qdQfnO0rZg
	cxCVVPt+uFK8Ho4IwaJoDloIqbL5P/lsDqMZTJAfDYRfq+DVNl6VghZ94xBnHlpdWRrH
	6rEw==
X-Gm-Message-State: ALoCoQlG8A6KmKGGm0hPqzjzyXxUEiPB4DEUJn8In5dnAR4RsrOIXMnq97FdXn21c4JJkuTK05bD
X-Received: by 10.152.42.196 with SMTP id q4mr17446595lal.47.1407071529283;
	Sun, 03 Aug 2014 06:12:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Sun, 3 Aug 2014 06:11:49 -0700 (PDT)
In-Reply-To: <CAEgOgz4muAfJmGajA2D7EPiW12HGh-2JKfb1G7-tc5SW8ABhCQ@mail.gmail.com>
References: <fcfc06335c0f3eaecacd2ac8396c232142ff4774.1406707320.git.peter.crosthwaite@xilinx.com>
	<53DCE6F5.7010809@msgid.tls.msk.ru>
	<CAEgOgz71+Eg6KhyAtHmaKv=3Ko-uT2iUjwJT=MAwvf-ewiFLgA@mail.gmail.com>
	<CAEgOgz4muAfJmGajA2D7EPiW12HGh-2JKfb1G7-tc5SW8ABhCQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 3 Aug 2014 14:11:49 +0100
Message-ID: <CAFEAcA-hEZENkRYPXK5Zq_DwF7mZQh=LUK-M+TyhzoSPWZv8kQ@mail.gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.49
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/1] hexdump: Add null
 guard on output file.
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
X-List-Received-Date: Sun, 03 Aug 2014 13:12:20 -0000

On 3 August 2014 02:17, Peter Crosthwaite <peter.crosthwaite@xilinx.com> wrote:
> Note that many of the existing call this with stderr as FP argument
> which in theory should be change to something that backs onto
> qemu_log. I suspect the file handle in this case will be NULL when
> logging is disabled and this patch avoid having to add all these
> conditionals.

For the qemu_log case we should handle the "don't log" condition
in the qemu_log() wrapper, especially since we probably want the
wrapper to take a log-mask anyway.

thanks
-- PMM

