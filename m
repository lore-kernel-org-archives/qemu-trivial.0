Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c22Xv-0000qd-Ee
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 16:54:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1c22Xt-0000pE-3A
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 16:54:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1c22Xs-0005qb-A4
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 16:54:05 -0400
Received: from mail.kernel.org ([198.145.29.136]:35690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1c22Xn-0005pd-1x; Wed, 02 Nov 2016 16:53:59 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 2A191203F1;
	Wed,  2 Nov 2016 20:53:56 +0000 (UTC)
Received: from [10.1.10.56] (96-82-76-110-static.hfc.comcastbusiness.net
	[96.82.76.110])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C60E0203C0;
	Wed,  2 Nov 2016 20:53:54 +0000 (UTC)
Date: Wed, 2 Nov 2016 13:53:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
	Thomas Huth <thuth@redhat.com>, Olaf Hering <olaf@aepfle.de>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, xuquan8@huawei.com, 
	"xen-devel@lists.xensource.com Devel" <xen-devel@lists.xensource.com>, 
	Anthony Perard <anthony.perard@citrix.com>, 
	Emil Condrea <emilcondrea@gmail.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>
In-Reply-To: <CAFEAcA_u2+eeLFK-tzs8H+6MPms37q20Fqx=qrMwvgwAoMWvuQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1611021352500.19454@sstabellini-ThinkPad-X260>
References: <1478081958-5803-1-git-send-email-thuth@redhat.com>
	<alpine.DEB.2.10.1611021022470.19454@sstabellini-ThinkPad-X260>
	<CAFEAcA_u2+eeLFK-tzs8H+6MPms37q20Fqx=qrMwvgwAoMWvuQ@mail.gmail.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.136
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/xen/xen_pvdev: Include
 qemu/log.h for qemu_log_vprintf()
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
X-List-Received-Date: Wed, 02 Nov 2016 20:54:06 -0000

On Wed, 2 Nov 2016, Peter Maydell wrote:
> On 2 November 2016 at 17:34, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Wed, 2 Nov 2016, Thomas Huth wrote:
> >> Olaf Hering reported a build failure due to an undefined reference
> >> to 'qemu_log_vprintf'. Explicitely including qemu/log.h seems to
> >> fix the issue.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >
> > The fix makes sense:
> >
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> >
> > However I was unable to reproduce the build failure, so I would like a
> > confirmation from Olaf that the fix is working.
> 
> If you configure with the (default) simple trace
> backend then trace.h will pull in qemu/log.h
> (and in this case trace.h comes in via xen_common.h).
> But if you're using a different backend then it won't
> bring in that header, and you'll get the build failure.
> 
> This is a fairly common "breaks but only with
> some trace backends" compile failure, but I'm
> not sure how best to try to make it more robust
> (or at least into a 'fails-everywhere' bug).

Personally what I can do is adding

  --enable-trace-backends=syslog

to my test scripts. That is enough to repro the issue. Thanks for the
explanation.

