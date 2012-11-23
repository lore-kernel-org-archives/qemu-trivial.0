Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbvEq-0000xh-LU
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 10:32:20 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jamie@shareable.org>) id 1TbvEk-0000vP-1m
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:32:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jamie@shareable.org>) id 1TbvEe-0001tC-8w
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:32:13 -0500
Received: from mail2.shareable.org ([80.68.89.115]:42090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jamie@shareable.org>)
	id 1TbvEe-0001sS-3I; Fri, 23 Nov 2012 10:32:08 -0500
Received: from jamie by mail2.shareable.org with local (Exim 4.63)
	(envelope-from <jamie@shareable.org>)
	id 1TbvEV-0001Gy-V0; Fri, 23 Nov 2012 15:31:59 +0000
Date: Fri, 23 Nov 2012 15:31:59 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20121123153159.GA3912@jl-vm1.vm.bytemark.co.uk>
References: <1353683570-30525-1-git-send-email-peter.maydell@linaro.org>
	<50AF931B.8080707@redhat.com>
	<CAFEAcA9AnUrbrOKrJx7pkg9j1Ex3Ou2d23ROsn82TJa4Wdrf_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9AnUrbrOKrJx7pkg9j1Ex3Ou2d23ROsn82TJa4Wdrf_Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 80.68.89.115
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Yurij Popov <oss@djphoenix.ru>, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-timer: Don't use RDTSC
	on 386s and 486s
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
X-List-Received-Date: Fri, 23 Nov 2012 15:32:19 -0000

Peter Maydell wrote:
> On 23 November 2012 15:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > Il 23/11/2012 16:12, Peter Maydell ha scritto:
> >> Adjust the conditional which guards the implementation of
> >>
> >> -#elif defined(__i386__)
> >> +#elif defined(__i586__)
> >>
> >>  static inline int64_t cpu_get_real_ticks(void)
> >>  {
> >>
> >
> > You should at least test __i686__ too:
> >
> > $ gcc -m32 -dM -E -x c /dev/null |grep __i
> > #define __i686 1
> > #define __i686__ 1
> > #define __i386 1
> > #define __i386__ 1
> 
> Yuck. I had assumed gcc would define everything from i386
> on up when building for later cores.

No, and it doesn't define __i686__ on all x86-32 targets after i686 either:

    $ gcc -march=core2 -dM -E -x c /dev/null | grep __[0-9a-z] | sort
    #define __core2 1
    #define __core2__ 1
    #define __gnu_linux__ 1
    #define __i386 1
    #define __i386__ 1
    #define __linux 1
    #define __linux__ 1
    #define __tune_core2__ 1
    #define __unix 1
    #define __unix__ 1

x86 instruction sets haven't followed a linear progression of features
for quite a while, especially including non-Intel chips, so it stopped
making sense for GCC to indicate the instruction set in that way.

GCC 4.6.3 defines __i586__ only when the target arch is set by -march
(or default) to i586, pentium or pentium-mmx.

And it defines __i686__ only when -march= is set (or default) to c3-2,
i686, pentiumpro, pentium2, pentium3, pentium3m or pentium-m.

Otherwise it's just things like __athlon__, __corei7__, etc.

The only one that's consistent is __i386__ (and __i386).

-- Jamie

