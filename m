Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJmGe-0004yK-51
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 11:23:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJmGW-0004jp-Ur
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJmGR-0003kG-Da
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:23:36 -0400
Received: from wanbli.kerneis.info ([2001:41d0:8:38ad::1]:42251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>)
	id 1VJmGR-0003jn-0O; Wed, 11 Sep 2013 11:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kerneis.info;
	s=wanbli-rsa1; 
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=OPyTB3H6nD7nyRlzmvjcalXr3jrsorS082gi87WinCA=; 
	b=3JET0ojadsy81SvwS+LhWGYnvatZ1ca5r1Os7H5dPxuZkbvDHnVs/qTJyEdbtA1FngIW30tsFwT1XkG8ugPSRFi3nwapyGRQ8Tr7NcMlSH3PLuCVu53Zt8cf1YuMpbY1d6RbJr62BCTt1kMScJqQcZAHObW+mCbP/M4imAhdyRU=;
Received: from wowasieco.sm.cl.cam.ac.uk ([128.232.60.22] helo=localhost)
	by wanbli.kerneis.info with esmtpsa
	(TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <gabriel@kerneis.info>)
	id 1VJmGO-0002uw-Pl; Wed, 11 Sep 2013 15:23:28 +0000
Date: Wed, 11 Sep 2013 16:23:27 +0100
From: Gabriel Kerneis <gabriel@kerneis.info>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20130911152327.GC22569@kerneis.info>
References: <1378906912-14015-1-git-send-email-gabriel@kerneis.info>
	<523077CE.6070303@redhat.com> <20130911144230.GA15227@kerneis.info>
	<523083EF.7050203@redhat.com> <20130911150137.GC15227@kerneis.info>
	<52308701.1020706@redhat.com> <20130911151628.GB22569@kerneis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130911151628.GB22569@kerneis.info>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 128.232.60.22
X-SA-Exim-Mail-From: gabriel@kerneis.info
X-SA-Exim-Scanned: No (on wanbli.kerneis.info); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:41d0:8:38ad::1
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Quote extra_cflags in
	config-host.mak
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
X-List-Received-Date: Wed, 11 Sep 2013 15:23:42 -0000

On Wed, Sep 11, 2013 at 04:16:28PM +0100, Gabriel Kerneis wrote:
> > Yeah, what I'm missing now is why your patch works.
> 
> That is indeed very mysterious :-)

Okay, the answer is simple enough: it doesn't fix the issue at all.
Long story short, I had a sed script to rewrite the faulty extra_cflags=
line but I did not realize it *also* fixed the "Configured with:" line!
Then turned that into a patch for QEMU, and didn't test it thoroughly
enough, with the aforementioned chicken-and-egg issue.

Oh well, please ignore this whole thread. I'll fix it properly tomorrow.

-- 
Gabriel

