Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axsj9-0000J2-Nz
	for mharc-qemu-trivial@gnu.org; Wed, 04 May 2016 05:04:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axsj0-0008PT-KZ
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 05:04:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axsio-0004dc-Qv
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 05:04:01 -0400
Received: from mail-yw0-x231.google.com ([2607:f8b0:4002:c05::231]:35658)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axsin-0004Wl-K6
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 05:03:54 -0400
Received: by mail-yw0-x231.google.com with SMTP id g133so66492367ywb.2
	for <qemu-trivial@nongnu.org>; Wed, 04 May 2016 02:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8x1+qTm4xvwjttccybAoLU9brM1x6s+m8J5OY7DkciU=;
	b=aiwffNTCtcdStFj9z1vl/V79/IsTN9HyftktEJdP7gfPVr+GjZFKYbooHdOFQrZUv6
	IIzOznerI1vwe0piQemEx/CtCJYExHVD0U2jfLb2jTvKTWhKRWPFt3cC8utndrZb0uCj
	oXyV6v6aFRlyZRCJca9srFvF4Pnh2XGLxuIkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8x1+qTm4xvwjttccybAoLU9brM1x6s+m8J5OY7DkciU=;
	b=EnOv9YuBWWKDoR8M++vD4Nx7OwWFn8OLXFv+7+pmEFSqoHHC1XWYmgOOTBpV7fNJot
	DVWrgqTUPyzjJM53w5VJ+6AsjRKPj43glxHRygbp2X7FaJ90cwKC3ZkZTHCwIWZx6f7J
	N1F+mP76axIJ2kGTy6nLeS65XGU03B0Xk9akS02v++URXIKFk+jvpqlRIvXVWT1t2juJ
	PR0ySVcf2Ko/QSLdrk55irWy0lwxAZyp9WiDY8lrIPOrmLKb1racspGK9yeIcm0dW6JC
	Ytap6VRLEyqNpWtwUdNG9OdwUtAo9UjdvPowAk0LLhPCaeAAIT4NJ8CvYB7BjockIiWT
	0x6Q==
X-Gm-Message-State: AOPr4FV6ns+U1L8Oy8IysR01wx39klyPD8wI1M0IHhCtndGRm0hJnovvB15g5LnE8+IedJ6WFkcMIo7T9MMY1RHa
X-Received: by 10.159.35.12 with SMTP id 12mr4106594uae.119.1462352611528;
	Wed, 04 May 2016 02:03:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 4 May 2016 02:03:12 -0700 (PDT)
In-Reply-To: <CAF4BF-Re+siJV4KTOvUwsDS3ckt_HfPpCQkB7rPPmJZ=OS8tSw@mail.gmail.com>
References: <1462237852-61856-1-git-send-email-chrisfriedt@gmail.com>
	<0b165339-9dde-57f8-959d-22122390ca0b@twiddle.net>
	<CAF4BF-T44ixRn6EVqLvPC7pktEcCO8qQDJJd1UgN8WX6T=Dwcw@mail.gmail.com>
	<CAF4BF-Re+siJV4KTOvUwsDS3ckt_HfPpCQkB7rPPmJZ=OS8tSw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2016 10:03:12 +0100
Message-ID: <CAFEAcA9ob9RZ55Hhh+DwAFt92V0oNL+57rDmFk6GGaPkxdAqtw@mail.gmail.com>
To: Christopher Friedt <chrisfriedt@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Fam Zheng <famz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2v2] [RESENT-INLINE] Use
 libtool instead of ar to create static libraries on Darwin.
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 04 May 2016 09:04:13 -0000

On 4 May 2016 at 01:07, Christopher Friedt <chrisfriedt@gmail.com> wrote:
>
> On May 3, 2016 9:50 AM, "Christopher Friedt" <chrisfriedt@gmail.com> wrote:
>>
>> On Tue, May 3, 2016 at 3:06 AM, Richard Henderson <rth@twiddle.net> wrote:
>> > On 05/02/2016 03:10 PM, Christopher Friedt wrote:
>> >>
>> >>  %.a:
>> >> +ifdef CONFIG_DARWIN
>> >> +       $(call quiet-command,rm -f $@ && libtool -static -o $@ $^,"
>> >> libtool    $(TARGET_DIR)$@")
>> >> +else
>> >>         $(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR
>> >> $(TARGET_DIR)$@")
>> >> +endif
>> >>
>> >
>> > Does it work to use libtool -static everywhere?
>
> One possibility for future-proofing the link stage that applies to most
> (all?) platforms that Qemu runs on would be to switch to libtool for all
> arch's and just adjust the "libtool flags" as necessary.
>
> Would require checking for libtool.

This is more complicated than we need. OSX "libtool" and GNU
"libtool" are really completely different things. We don't
(these days) do anything that we need GNU libtool for, so
there's no need to depend on it or use it optionally -- we should
just use "ar". If we need to special case the "program for creating
static libraries" for OSX that's annoying but we can do that.

thanks
-- PMM

