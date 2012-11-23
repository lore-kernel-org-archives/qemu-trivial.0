Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tbw0Z-0007gW-Rq
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 11:21:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jamie@shareable.org>) id 1Tbw0T-0007fH-53
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 11:21:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jamie@shareable.org>) id 1Tbw0N-0000CH-F8
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 11:21:33 -0500
Received: from [2001:41c8:1:56fc::10] (port=48937 helo=mail2.shareable.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jamie@shareable.org>)
	id 1Tbw0N-0000CC-92; Fri, 23 Nov 2012 11:21:27 -0500
Received: from jamie by mail2.shareable.org with local (Exim 4.63)
	(envelope-from <jamie@shareable.org>)
	id 1Tbw0M-0001e8-7C; Fri, 23 Nov 2012 16:21:26 +0000
Date: Fri, 23 Nov 2012 16:21:26 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20121123162126.GC3912@jl-vm1.vm.bytemark.co.uk>
References: <1353683570-30525-1-git-send-email-peter.maydell@linaro.org>
	<50AF931B.8080707@redhat.com>
	<CAFEAcA9AnUrbrOKrJx7pkg9j1Ex3Ou2d23ROsn82TJa4Wdrf_Q@mail.gmail.com>
	<20121123153159.GA3912@jl-vm1.vm.bytemark.co.uk>
	<CAFEAcA9Y_fBOOMDdngu=5GApfD1OBkj6=kF4JwJTkerFydNWmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9Y_fBOOMDdngu=5GApfD1OBkj6=kF4JwJTkerFydNWmw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:41c8:1:56fc::10
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
X-List-Received-Date: Fri, 23 Nov 2012 16:21:39 -0000

Peter Maydell wrote:
> On 23 November 2012 15:31, Jamie Lokier <jamie@shareable.org> wrote:
> > x86 instruction sets haven't followed a linear progression of features
> > for quite a while, especially including non-Intel chips, so it stopped
> > making sense for GCC to indicate the instruction set in that way.
> 
> If you're going to go down that route you need to start defining
> #defines for features then, so we could say defined(__rdtsc__)
> or defined(__cmov__) and so on. I don't see any of those either :-(

It does for some major architectural instructions groups like MMX,
different kinds of SSE, etc.  But not everything and I don't see cmov
among them.  I agree it's unfortunate.

-- Jamie

