Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VHXIA-0003i1-Lo
	for mharc-qemu-trivial@gnu.org; Thu, 05 Sep 2013 07:00:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VHXI4-0003hk-Bd
	for qemu-trivial@nongnu.org; Thu, 05 Sep 2013 07:00:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VHXHz-0006Er-JM
	for qemu-trivial@nongnu.org; Thu, 05 Sep 2013 06:59:56 -0400
Received: from mail-lb0-f175.google.com ([209.85.217.175]:34391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VHXHz-0006Ef-Cf
	for qemu-trivial@nongnu.org; Thu, 05 Sep 2013 06:59:51 -0400
Received: by mail-lb0-f175.google.com with SMTP id y6so1508717lbh.34
	for <qemu-trivial@nongnu.org>; Thu, 05 Sep 2013 03:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=duQ9LJ0q9QCXkGGumN7uq/iIiI3FHypAb30uvJltXYM=;
	b=El+hFAxJVB9xux1tDJ7ZRE1KjrAtbYDaln3Gu4FY/47zL8aGKf6CvIiF8jBlNQT6ia
	i+E5D1d9OhJQXLaXo6oO6PuRL4QwzteujB2NZ7rWNz1TkJQnjhUQ+GYHTNDJ5n9bF+13
	ZIOwV9HbU8jlIndmvVJZP+f6FYs42XsHJ1vjYOO6XAjwrkX7Kvm9zoCMPcAJCtTFfI0l
	AO3vVDU2nCrSQNguyKTRZJpCKC+TC40BuxJy3wOGmG7M5ck9KDt/tBBh0lTbewQFsH2W
	kWVyv0KTakCiq7/EK9d9NlKw+Lco0j7sHgsSz3m14lxUe7VAcr3lvYYgvMorHmwt6Vjw
	d19A==
X-Gm-Message-State: ALoCoQk1hU9Lx1mQr9iXLRbq0fn7KvePntJbNO9SO+57+Njm1Tr+3rxgwF7eBVCC7+I98wFevPSw
X-Received: by 10.152.120.73 with SMTP id la9mr6956355lab.3.1378378790346;
	Thu, 05 Sep 2013 03:59:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Thu, 5 Sep 2013 03:59:30 -0700 (PDT)
In-Reply-To: <58dbd819c4270169fa26487cf1e7220b11c363ac.1378378402.git.mprivozn@redhat.com>
References: <58dbd819c4270169fa26487cf1e7220b11c363ac.1378378402.git.mprivozn@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Sep 2013 11:59:30 +0100
Message-ID: <CAFEAcA87oO3KC3H-B+kXxNzPHbaoxYr=tYWoLO1HdPqUY45Bag@mail.gmail.com>
To: Michal Privoznik <mprivozn@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.175
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND] configure: Undefine
 _FORTIFY_SOURCE prior using it
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
X-List-Received-Date: Thu, 05 Sep 2013 11:00:01 -0000

On 5 September 2013 11:54, Michal Privoznik <mprivozn@redhat.com> wrote:
> Currently, we are enforcing the _FORTIFY_SOURCE=2 without any
> previous detection if the macro has been already defined, e.g.
> by environment, or is just enabled by compiler by default.
>
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

