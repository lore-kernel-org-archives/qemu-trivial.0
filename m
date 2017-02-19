Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cfQMA-0003nf-DQ
	for mharc-qemu-trivial@gnu.org; Sun, 19 Feb 2017 07:12:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cfQM8-0003nU-N9
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 07:12:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cfQM7-000853-Ot
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 07:12:44 -0500
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:33143)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cfQM7-00084e-JB
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 07:12:43 -0500
Received: by mail-wr0-x22a.google.com with SMTP id 35so10365965wrw.0
	for <qemu-trivial@nongnu.org>; Sun, 19 Feb 2017 04:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e0FAL9oIOW09NSlA+IHJOnu7dvESu9G19uqZTaACYB4=;
	b=Rv6DbqVAuA7KshuTcUiOYSUEnw4WvZTJNufvSyazOGwf0MiamW4mTbNKv4RWdWbKuN
	MMwOnvJSSG5nQb2B7q2KV+TaYsVqlMVyVd/1XxeQgnJjerYxT20f/ysOBtnbsX/VYFYu
	uS5pBwCx59JT0IOnqxvxwPF40whez4oFVc5ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e0FAL9oIOW09NSlA+IHJOnu7dvESu9G19uqZTaACYB4=;
	b=p6H+WDQLV1iITj1KbwlBwXWgWM8ES3AKURFokiQupP8AgPmWMZkTtEHd07f3GMlL6X
	PHTmON58o0auc1iOBaSP98QNh1KBYK4ehs6R975X6Vgc0ThA1qgiq4iw0rzIGMvSC4XQ
	1i1I9hojJDc56VXad3qdsolBNl4mGxRDfvJQvSn+Nm7ACDCNH9vOx9eUgZMmSaWs7KU2
	ZNtO7JI6c02k86IpZmmN/aa1RKKw+W+H7C4ul5J2Omjognj/OgdFQyLbyLs0ikSbmVfL
	+QJpBaoyvtt+bW1jGf+uqEoyMqAK0ynaHI1HKLrhYPsT4HgAlIFQnszyrXw/5P0UV1rI
	O3GA==
X-Gm-Message-State: AMke39lSsesu8NCdmDgwAS3yRb+aYAlNATEUzfONJqjoks+bCv8Do45Ha9a//IxPceTxa3lzLN8zQBExZLKR2KBC
X-Received: by 10.223.133.68 with SMTP id 62mr12450600wrh.195.1487506362524;
	Sun, 19 Feb 2017 04:12:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Sun, 19 Feb 2017 04:12:21 -0800 (PST)
In-Reply-To: <CABHMSTUJEEwbo76-4cqRq01Lpv76Y0KMdjAvgcgmuVARZGudEw@mail.gmail.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
	<6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
	<CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
	<CAFEAcA_N1j9tpxEBROG6D1per9vDMPZeuRyM93BRzNT5ZK3q0Q@mail.gmail.com>
	<CABHMSTUJEEwbo76-4cqRq01Lpv76Y0KMdjAvgcgmuVARZGudEw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 19 Feb 2017 12:12:21 +0000
Message-ID: <CAFEAcA_jQt1Xof9Pk6ANE4werM-uXi3wsp9XS2NW6Znr_J_56g@mail.gmail.com>
To: Chad Joan <chadjoan@gmail.com>
Cc: Eric Blake <eblake@redhat.com>, Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::22a
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
X-List-Received-Date: Sun, 19 Feb 2017 12:12:45 -0000

On 19 February 2017 at 07:22, Chad Joan <chadjoan@gmail.com> wrote:
> I suspect I'm going to encounter this problem again as I try to make small
> fixes for more projects, so it might be worth it for me to spend a small
> amount of time at some point setting up a mail client that I can send git
> patches with.  Or perhaps I can just move the patch(es) onto another machine
> (ex: my personal laptop) and send it with 'git send-email' from there,
> instead of needing to install a mail client that is outside of my normal
> workflow.  I am not comfortable with putting smtp login information onto the
> server that I am using for this work.

Yes, I'd do that. If you do git format-patch on one machine you can
then copy the patch files onto another where you do git send-email
(my workflow actually involves something similar to this).

Or if the machine you're running on is a server with limited
development facilities you might prefer to do development
entirely on a different machine and then on the server
just do a git fetch or git pull from the git tree on your
development machine to build it. (I do this when I'm doing
build tests, since there usually isn't a nice dev environment
with my preferred editor and tools and so on on the test
machine.) Then your patches are all on the dev machine to
start with.

thanks
-- PMM

