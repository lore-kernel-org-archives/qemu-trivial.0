Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmoML-0003ub-34
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 15:06:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YmoMG-0003tt-VL
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 15:06:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YmoMC-0004vo-0X
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 15:06:20 -0400
Received: from mail-qc0-f171.google.com ([209.85.216.171]:35728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YmoMB-0004rG-SI
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 15:06:15 -0400
Received: by qcbii10 with SMTP id ii10so59808744qcb.2
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 12:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=2yTiNjAZs8TkZanJEgMiN4bvNCf/iNhRHYfZSXQXa0U=;
	b=GQQz0qzlGSn3x10slpodKeh/6YiaPZf++Ooi/Zs9LYVDi9I9yj2SkldeANJRX7XmPj
	J8rEIQMkI88zzm1+CW7o6tJK2QP9g/4EHgCs4WXvKMyzy47B7hoaTDwRQx+hgwBKIUmy
	jx0904uo3ie7uInh1BSvIOT2rtVJ3iiAAUUHWaQc9RatVRxz+iXAomoxu/eoE5C+8hk/
	oluudMi4TYvqt+4jm2MNhjzzqVJkSsHYAkFNKLEa6pED5FMnPnmR4wARJLm2VPdyjr6B
	Yx3D4zuzpXlz2bT3WAsDDO+PPw7ezZmBygagbX1NaGWTon4SbwRT+PCR1pyngJ+/P35y
	saeg==
X-Gm-Message-State: ALoCoQnwzwO4pl0eQ6fMwgb9HM2v16FE1yBi485BcebM7uMmt+OD2kCrtGvQxe/Rjh8g8+KoUg0k
MIME-Version: 1.0
X-Received: by 10.140.109.8 with SMTP id k8mr8267355qgf.53.1430161575410; Mon,
	27 Apr 2015 12:06:15 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.96.97.41 with HTTP; Mon, 27 Apr 2015 12:06:15 -0700 (PDT)
In-Reply-To: <CAFEAcA8t7_9BzOGekyJpz+_d_qYxT6rTXa=domd4JH0c6zRJUA@mail.gmail.com>
References: <cover.1430096379.git.crosthwaite.peter@gmail.com>
	<a07c62df4232de834d97e01a981281c68d97fbbc.1430096379.git.crosthwaite.peter@gmail.com>
	<553E2571.2000700@msgid.tls.msk.ru>
	<CAFEAcA-a==mJ2kfb6E=So+agg1uZ9VsWMNYwS0BwzEM+RKUAWQ@mail.gmail.com>
	<CAFEAcA8t7_9BzOGekyJpz+_d_qYxT6rTXa=domd4JH0c6zRJUA@mail.gmail.com>
Date: Mon, 27 Apr 2015 12:06:15 -0700
X-Google-Sender-Auth: wRdVY_Z12-UZqdQwDvVhVrh14ks
Message-ID: <CAEgOgz5-hThXXxUZJRswFH1LgUEzFYGXGL+ON-R9K0NWfdhkew@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.171
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH target-arm 2/2] arm: cpu.h:
	Delete unused cpu_pc_from_tb()
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
X-List-Received-Date: Mon, 27 Apr 2015 19:06:23 -0000

On Mon, Apr 27, 2015 at 12:00 PM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 27 April 2015 at 13:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The tcg/tcg.h comment should be updated:
>>  * Otherwise, we gave up on execution of this TB before it started, and
>>  * the caller must fix up the CPU state by calling the CPU's
>>  * synchronize_from_tb() method with the next-TB pointer we return.
>>  * (falling back to calling the CPU's set_pc() method with tb->pc
>>  * if no synchronize_from_tb() method exists.)
>>
>> That's a bit clunky though, which suggests we should
>> have a cpu_synchronize_from_tb() inline function in qom/cpu.h
>> which does the
>>         CPUClass *cc = CPU_GET_CLASS(cpu);
>>         if (cc->synchronize_from_tb) {
>>             cc->synchronize_from_tb(cpu, tb);
>>         } else {
>>             assert(cc->set_pc);
>>             cc->set_pc(cpu, tb->pc);
>>         }
>>
>> bit that cpu-exec.c currently open-codes.
>
> ...except that qom/cpu.h doesn't have the definition of the
> TranslationBlock struct it would need to be able to do that "tb->pc".
>  * we can't just include exec-all.h from here or otherwise get
>    the TranslationBlock struct definition, because it is target
>    CPU dependent
>  * we can't have the common baseclass in qom/cpu.c provide an
>    implementation of the synchronize_from_tb method which calls
>    set_pc, because qom/cpu.c is a common-obj-y sourcefile]
> which leaves us with:
>  * have cpu_synchronize_from_tb() take both tb and tb->pc as args,
>    which is pretty yucky
>  * give up and just update the tcg.h comment as above
>
> I think I go for "just update the comment"...
>

Does that mean a respin of this patch or should the tricore fix and
the comment be a follow up?

Regards,
Peter

> -- PMM
>

