Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmoGa-0006wZ-TG
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 15:00:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YmoGY-0006wD-EP
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 15:00:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YmoGT-0000IU-Kk
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 15:00:26 -0400
Received: from mail-ie0-f179.google.com ([209.85.223.179]:36479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YmoGT-0000IE-H2
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 15:00:21 -0400
Received: by iebrs15 with SMTP id rs15so1446741ieb.3
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 12:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lVwP2o4vk448XJ32YOKoyE2y8IQkSEn2vZ65BlKWq2A=;
	b=Dgn44E3b7MFHXINBXvIyB98Km+4N8IEl3nDQGZbl8jKB4Nks8OrrM3Jd9r/AjwPFZM
	FGoHHPkg5X6D7XVu+VJPFnAK2MMRa9IF6JhX36H1hH5C9Z155+unD5YhtO5dpfJjI9PM
	4l8YeLTC/X1SCR1HjfsRhK31GUrr+kN5LbVxra4Fflm7wr5rE613f/+LJyomEhYW6Ofg
	szoXhtXgB4Ry3TGBnSsND2DOFUUaI5TBIuV3JkQARv2UcyP0XB6d5lvkdb/HAx/KHBGX
	6SoVdHvnrV/L1XS5cKXPSrYVLeuA8JfGDAhqr9NUZIxNbKflQDslxQ/cFkZjU863Ov5A
	7RkA==
X-Gm-Message-State: ALoCoQkosERqQGK5s088+1ie2Q/NnqbjWshQ1Cng30eoj/9R+qr40YYFSAIEV8g0pq+dnbhckorN
X-Received: by 10.50.43.226 with SMTP id z2mr15058415igl.33.1430161220152;
	Mon, 27 Apr 2015 12:00:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.220 with HTTP; Mon, 27 Apr 2015 12:00:00 -0700 (PDT)
In-Reply-To: <CAFEAcA-a==mJ2kfb6E=So+agg1uZ9VsWMNYwS0BwzEM+RKUAWQ@mail.gmail.com>
References: <cover.1430096379.git.crosthwaite.peter@gmail.com>
	<a07c62df4232de834d97e01a981281c68d97fbbc.1430096379.git.crosthwaite.peter@gmail.com>
	<553E2571.2000700@msgid.tls.msk.ru>
	<CAFEAcA-a==mJ2kfb6E=So+agg1uZ9VsWMNYwS0BwzEM+RKUAWQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2015 20:00:00 +0100
Message-ID: <CAFEAcA8t7_9BzOGekyJpz+_d_qYxT6rTXa=domd4JH0c6zRJUA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.179
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH target-arm 2/2] arm: cpu.h: Delete unused
	cpu_pc_from_tb()
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
X-List-Received-Date: Mon, 27 Apr 2015 19:00:27 -0000

On 27 April 2015 at 13:58, Peter Maydell <peter.maydell@linaro.org> wrote:
> The tcg/tcg.h comment should be updated:
>  * Otherwise, we gave up on execution of this TB before it started, and
>  * the caller must fix up the CPU state by calling the CPU's
>  * synchronize_from_tb() method with the next-TB pointer we return.
>  * (falling back to calling the CPU's set_pc() method with tb->pc
>  * if no synchronize_from_tb() method exists.)
>
> That's a bit clunky though, which suggests we should
> have a cpu_synchronize_from_tb() inline function in qom/cpu.h
> which does the
>         CPUClass *cc = CPU_GET_CLASS(cpu);
>         if (cc->synchronize_from_tb) {
>             cc->synchronize_from_tb(cpu, tb);
>         } else {
>             assert(cc->set_pc);
>             cc->set_pc(cpu, tb->pc);
>         }
>
> bit that cpu-exec.c currently open-codes.

...except that qom/cpu.h doesn't have the definition of the
TranslationBlock struct it would need to be able to do that "tb->pc".
 * we can't just include exec-all.h from here or otherwise get
   the TranslationBlock struct definition, because it is target
   CPU dependent
 * we can't have the common baseclass in qom/cpu.c provide an
   implementation of the synchronize_from_tb method which calls
   set_pc, because qom/cpu.c is a common-obj-y sourcefile]
which leaves us with:
 * have cpu_synchronize_from_tb() take both tb and tb->pc as args,
   which is pretty yucky
 * give up and just update the tcg.h comment as above

I think I go for "just update the comment"...

-- PMM

