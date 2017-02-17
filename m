Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ceeq2-0007N9-UO
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 04:28:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceeq0-0007Lm-PU
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 04:28:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceepz-0001hp-Tl
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 04:28:24 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:34543)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ceepz-0001hF-Ni
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 04:28:23 -0500
Received: by mail-wm0-x235.google.com with SMTP id 196so8364136wmm.1
	for <qemu-trivial@nongnu.org>; Fri, 17 Feb 2017 01:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/nt5h9YLckWQMfHuSkodJg4VYrQ7pAdBqU9r/Xv5J34=;
	b=azWzhfPxNS7o+bEhkP1RE1SPtMTTn5zRWvUmpDcZrF37f6i7vISTYby9SiIgWWj65V
	psggWz7qOnYISuIGW1rzAtS5zYxwHTfocmWJlzqmcHit3e1N6t2IPWtiwXAmDgRcHh9/
	qhm1IIo5arSCTKjv5AvhhXq71NzY5l5hIsc6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/nt5h9YLckWQMfHuSkodJg4VYrQ7pAdBqU9r/Xv5J34=;
	b=i+UcphtV62SXqSXuI0m2UlXBkBpvO+r1pm5f8A17f99rNpA/Mg9okrcYh+vMUK0jpJ
	LpYcPNCV4L2Ia0NaVTHM3xvsXYe7A/5+wCxHPl9mhed1qOh/3r3oNZ6NQkDP8YXK62u2
	CsGfw5CIm9KQQw+/Z1GBu+Pb7UXmJVs1+h+Mv0+pYTCdbUBCw+iHxZQv2fYdrLImoky8
	9GRTui39NwV+KfHdntMBVZUMT/Wud5E9VafR4PVq8QTsYAl32kAVBn5fJWrsomRPTVJ1
	iwHiZJK/qK57KHv6JEHknNEKOJs85yJ18CqtM4VXP8+EqKwfjbuJuXnOLbr2t/N5CmEe
	lWTQ==
X-Gm-Message-State: AMke39kWV8CEMu5B0nVfhwh+DA9XKfrlYR9EWltD2XQp2oaFmMpAHsDI4CRNrXGF1XY4enIkqSYoWMB2esc8MOby
X-Received: by 10.28.4.10 with SMTP id 10mr2351667wme.142.1487323702437; Fri,
	17 Feb 2017 01:28:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 01:28:01 -0800 (PST)
In-Reply-To: <20170217064327.GB21716@lemon.lan>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 09:28:01 +0000
Message-ID: <CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
To: Fam Zheng <famz@redhat.com>
Cc: Chad Joan <chadjoan@gmail.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-trivial] [Qemu-devel] Fix build break during
 configuration on musl-libc based Linux systems.
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
X-List-Received-Date: Fri, 17 Feb 2017 09:28:25 -0000

On 17 February 2017 at 06:43, Fam Zheng <famz@redhat.com> wrote:
> But your point is taken, we should make the first (or a one-shot)
> contribution as easy as possible.

Yes; we could do with providing a "This page seems very long..."
introduction section. The absolute bare minimum requirements
for a submitter I think are:
 * Provide a Signed-off-by: line (this is a hard requirement
   because it's how you say "I'm legally OK to contribute this
   and am happy for it to go into QEMU")
 * send patch by email
 * read replies and act on them if you want your patch to go in

The larger your contribution is, the more important the other
requirements detailed on the page are; but personally I'm
happy to manually fix up patches from a first-time submitter,
and I think most other maintainers are too.

thanks
-- PMM

