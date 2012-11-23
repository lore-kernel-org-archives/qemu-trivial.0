Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tbvyn-0006cu-7I
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 11:19:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jamie@shareable.org>) id 1Tbvyg-0006cI-T0
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 11:19:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jamie@shareable.org>) id 1Tbvyf-0007uA-Tw
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 11:19:42 -0500
Received: from [2001:41c8:1:56fc::10] (port=48930 helo=mail2.shareable.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jamie@shareable.org>)
	id 1Tbvyf-0007u6-O3; Fri, 23 Nov 2012 11:19:41 -0500
Received: from jamie by mail2.shareable.org with local (Exim 4.63)
	(envelope-from <jamie@shareable.org>)
	id 1TbvyY-0001dE-Qn; Fri, 23 Nov 2012 16:19:34 +0000
Date: Fri, 23 Nov 2012 16:19:34 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20121123161934.GB3912@jl-vm1.vm.bytemark.co.uk>
References: <1353683570-30525-1-git-send-email-peter.maydell@linaro.org>
	<50AF931B.8080707@redhat.com>
	<CAFEAcA9AnUrbrOKrJx7pkg9j1Ex3Ou2d23ROsn82TJa4Wdrf_Q@mail.gmail.com>
	<CAFEAcA_CxhYyGJzH886gEV21OU6yT6ejkmtOR=x8Nqva2YX7yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_CxhYyGJzH886gEV21OU6yT6ejkmtOR=x8Nqva2YX7yA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:41c8:1:56fc::10
Cc: patches@linaro.org, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Yurij Popov <oss@djphoenix.ru>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
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
X-List-Received-Date: Fri, 23 Nov 2012 16:19:48 -0000

Peter Maydell wrote:
> On 23 November 2012 15:17, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 23 November 2012 15:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >> You should at least test __i686__ too:
> >>
> >> $ gcc -m32 -dM -E -x c /dev/null |grep __i
> >> #define __i686 1
> >> #define __i686__ 1
> >> #define __i386 1
> >> #define __i386__ 1
> >
> > Yuck. I had assumed gcc would define everything from i386
> > on up when building for later cores.
> 
> ...and there's an enormous list of x86 cores too. This bites
> us already -- if you use '-march=native' to get "best for my
> cpu" then on a Core2, say, it will define __i386__ and __core2__
> but not __i686__, so TCG won't use cmov :-(
> 
> Anybody got any good ideas for how to say "is this at least
> a 586/686?" in a way that won't fail for any newly introduced
> x86 core types?

Fwiw, cmov doesn't work on some VIA "686" class CPUs.

Shouldn't TCG decide whether to use cmov at runtime anyway, using
cpuid?  For dynamically generated code it would seem not very
expensive to do that.

Looking at GCC source, it has an internal flag to say whether the
target has cmov, but doesn't expose it in preprocessor conditionals.

-- Jamie

