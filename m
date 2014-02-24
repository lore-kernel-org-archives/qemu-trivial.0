Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WHuVx-0000wH-6g
	for mharc-qemu-trivial@gnu.org; Mon, 24 Feb 2014 07:20:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WHuVq-0000m0-Ch
	for qemu-trivial@nongnu.org; Mon, 24 Feb 2014 07:20:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WHuVf-0002n7-Q8
	for qemu-trivial@nongnu.org; Mon, 24 Feb 2014 07:19:58 -0500
Received: from mail-la0-f46.google.com ([209.85.215.46]:44411)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WHuVf-0002mr-JQ
	for qemu-trivial@nongnu.org; Mon, 24 Feb 2014 07:19:47 -0500
Received: by mail-la0-f46.google.com with SMTP id b8so5580833lan.19
	for <qemu-trivial@nongnu.org>; Mon, 24 Feb 2014 04:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=De7XNbMCRftdoaAxkYqMBTWlmMY+hwyQDHv6UnIbYDE=;
	b=M5XqW6Awvp0mqMDip/m3o7ZL1A0DbxpSRlopr8j+oMdObWeEkKSJt11kxdyc54fu7g
	RTlv1gU/5lTa+4grDmTCEh1G1oA7GlWvD545a0SKOdI8YnPLv7hYNnT43y+werw9/5yn
	ZqwkzSaeoXz8HM62Qgb/tfDVWr/gf0jRTt4plWOBgEHZHCzF+IVmW3X3pziyiyR1qv/L
	LhnbasxJ3At9QUVEsNJjjjjYh7atwMegQIH+dXuwwB2PIltwkF9YsJLS1h9rxmaonxOK
	fCor8zvAuKBVgWjdSFFrcYUFw9NZ2YD6Ukfwe/rCXtwyp5/V0R7d6DQbMxSh6x3q6L6g
	I2RA==
X-Gm-Message-State: ALoCoQneVBmlLDftT9dL8bqMJT5nFSuU536DEe+eyogZDtYnSem0oS53NnnwHIkOCnGZ5ygGUFj0
X-Received: by 10.152.234.202 with SMTP id ug10mr12161781lac.28.1393244385779; 
	Mon, 24 Feb 2014 04:19:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.118.34 with HTTP; Mon, 24 Feb 2014 04:19:25 -0800 (PST)
In-Reply-To: <1393012441-4112-1-git-send-email-sw@weilnetz.de>
References: <1393012441-4112-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Feb 2014 12:19:25 +0000
Message-ID: <CAFEAcA8T=Z-Kauhh+tiHCPV_ikApy-mqTrgMHvz2=3Cg2m-Ncg@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.46
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libvixl: Fix typo in comment
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
X-List-Received-Date: Mon, 24 Feb 2014 12:20:03 -0000

On 21 February 2014 19:54, Stefan Weil <sw@weilnetz.de> wrote:
> * substract -> subtract
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  disas/libvixl/a64/constants-a64.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

It seems like a bad idea to make more changes than
necessary to a component we will probably be updating
with new upstream releases. We've made fixes where we
need to so the code will build, but fixing typos in
comments doesn't really seem worthwhile to me.

thanks
-- PMM

