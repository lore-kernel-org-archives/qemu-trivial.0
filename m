Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ayLqF-0007fy-2B
	for mharc-qemu-trivial@gnu.org; Thu, 05 May 2016 12:09:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1ayLq6-0007LZ-Id
	for qemu-trivial@nongnu.org; Thu, 05 May 2016 12:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1ayLpu-0001YM-Gl
	for qemu-trivial@nongnu.org; Thu, 05 May 2016 12:09:17 -0400
Received: from mail.lekensteyn.nl ([2a02:2308::360:1:25]:43493)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>)
	id 1ayLpZ-0001Dx-T7; Thu, 05 May 2016 12:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lekensteyn.nl; s=s2048-2015-q1; 
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=tHUXriyyG8426Q/2V+7kIWeCJD+dFS2MJHrOEtXUHE8=; 
	b=pq/GIqUAQd2QHHCTPCiv7f+XphHeahwxclVaL90w05CoomqG5Npj2WX8PROo2plaBgQDDIsirqAxWUOll4v0GCuYsMdXok6bGxV9kh0gLQoOroJnOmB4u0Cc6q6loyH4nFOkOQpxsR/rCfc8luKB85oxj2LQUbeEAIO9+2eO6H+uIxfZ0KAWzuH3agDpBdJpneMuN/npYF/pxeRn/zb2sLa1nx/4Ucq9eHD0S/ONIBaKAbpPpLAYwGYF+1O0j0tOmP3wJo0lzvdezhtPM/LMDF4RIDaIR4G55ntan1gWEz+FycF8F4lAfF4mFyYWTJ/r/7Zf98mQMsruk2FTaySdOg==;
Received: by lekensteyn.nl with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
	(envelope-from <peter@lekensteyn.nl>)
	id 1ayLpC-0001H5-22; Thu, 05 May 2016 18:08:26 +0200
Date: Thu, 5 May 2016 18:08:06 +0200
From: Peter Wu <peter@lekensteyn.nl>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20160505160806.GA1044@al>
References: <1462316319-4308-1-git-send-email-peter@lekensteyn.nl>
	<CAFEAcA93StM0HME9urYAFKYrhEBxHBCP0+v_RSsSRcvz91=xcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA93StM0HME9urYAFKYrhEBxHBCP0+v_RSsSRcvz91=xcg@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a02:2308::360:1:25
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gdbstub: avoid busy loop
 while waiting for gdb
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
X-List-Received-Date: Thu, 05 May 2016 16:09:29 -0000

On Thu, May 05, 2016 at 04:37:40PM +0100, Peter Maydell wrote:
> On 3 May 2016 at 23:58, Peter Wu <peter@lekensteyn.nl> wrote:
> > While waiting for a gdb response, or while sending an acknowledgement
> > there is not much to do, so just mark the socket as non-blocking to
> > avoid a busy loop while paused at gdb. This only affects the user-mode
> > emulation (qemu-arm -g 1234 ./a.out).
> >
> > Note that this issue was reported before at
> > https://lists.nongnu.org/archive/html/qemu-devel/2013-02/msg02277.html.
> >
> > While at it, close the gdb client fd on EOF or error while reading.
> 
> The commit message says "mark the socket as non-blocking"...
> 
> > @@ -1599,8 +1603,6 @@ static void gdb_accept(void)
> >      gdb_has_xml = false;
> >
> >      gdbserver_state = s;
> > -
> > -    fcntl(fd, F_SETFL, O_NONBLOCK);
> >  }
> 
> ...but the code change is *removing* a call to mark the
> socket as non-blocking. Which is correct?
> 
> thanks
> -- PMM

The commit message is misleading, it should have been "so do not mark
the socket as non-blocking". If you were to apply this, please fix it up
:-)
-- 
Kind regards,
Peter Wu
https://lekensteyn.nl

