Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WNjwh-0004ZQ-A2
	for mharc-qemu-trivial@gnu.org; Wed, 12 Mar 2014 10:15:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WNjwY-0004JM-Sa
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:15:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WNjwU-0005Y0-2H
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:15:38 -0400
Received: from mail-la0-f51.google.com ([209.85.215.51]:62876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WNjwT-0005Wy-S0
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:15:34 -0400
Received: by mail-la0-f51.google.com with SMTP id pv20so6792398lab.10
	for <qemu-trivial@nongnu.org>; Wed, 12 Mar 2014 07:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=L9TEjFZnRlGn+vobB3n85pnpyGtabqldFD8r1KPCLtE=;
	b=YU1zx8rPxM/OmhPN9rOmAV+vJCSI5mAboNPPCapRctPUhKufUOeK+GDBc/j0pTO1eq
	zTL9kLHx0ecKmEZYyvuDU5SVnXB7bwGnB0PtwDgWPDKsGaavdIsX0g1u+hqqUDxivwpb
	k3oa0ap7KVYJjR6rFamdpzvVXh+cnqFD7881sgWUI+pT/u254vx715WjwEneZeOtGU3Q
	ITa0iOmvCLYP6F3qXDqtxLpdlK4XPS96CBZCVHi2Q+EWSa6iy2bgEs0EiMM+cGJ4xzGR
	Gf9tQsA4Z49ZvM7L9FXFgBIdyqoXHgw284/ejo1a6pPypeHhRCHInhDnaQZGndtroYrd
	oVOg==
X-Gm-Message-State: ALoCoQmqN91T7CG2LvaJKMAmr7vTvf0JvLp2GBoA6WbAzDoJrsNNHG6ikNKVPJrxSs96VBn0PBzS
X-Received: by 10.112.198.69 with SMTP id ja5mr1505800lbc.50.1394633729824;
	Wed, 12 Mar 2014 07:15:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Wed, 12 Mar 2014 07:15:09 -0700 (PDT)
In-Reply-To: <1394630689-11913-1-git-send-email-peter.maydell@linaro.org>
References: <1394630689-11913-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Mar 2014 14:15:09 +0000
Message-ID: <CAFEAcA9Le87gpzh-5cBtZVzYS05VfvKSnXZDuVRDC3XYUKiD=w@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.51
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-m68k: Remove custom
	qemu_assert() function
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
X-List-Received-Date: Wed, 12 Mar 2014 14:15:43 -0000

On 12 March 2014 13:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> Remove the custom qemu_assert() function defined by target-m68k/translate.c
> in favour of either using glib g_assert_not_reached() (for the genuinely
> can't-happen cases) or cpu_abort() (for the "this isn't implemented",
> in line with other unimplemented cases in the target).
>
> This has the benefit of silencing some clang warnings about
> variables used while uninitialized (which are emitted because
> clang can't figure out that qemu_assert(0, something) never
> returns.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Andreas pointed out that we've had one attempt to fix this
late last year:
http://lists.gnu.org/archive/html/qemu-devel/2013-12/msg02177.html
which didn't work because hw_assert() is not present in user-mode
compiles. This version of the patch doesn't suffer from that issue.

thanks
-- PMM

