Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJm7w-0006xT-Uy
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 11:14:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJm7p-0006oR-JF
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJm7k-0000Np-1g
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:14:37 -0400
Received: from wanbli.kerneis.info ([2001:41d0:8:38ad::1]:42186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>)
	id 1VJm7j-0000Ni-OJ; Wed, 11 Sep 2013 11:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kerneis.info;
	s=wanbli-rsa1; 
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=5c1mVBUOwe9wOGAeoxAEcA0BF7Ny1i05sLG3ngCVVMM=; 
	b=X+4Z/YLVIlMBTDe/8MKrkK+KJoHrgCVg8wGD/l3YMRpFtQFnAwIClFacRkAF4It72vvScjVjwPGa3GqAN0qS3r8eFHrVF2yUXgogrNqdbTSpnDDzJuu4Pna49QOejcWJTFD/pXYO4CuXOZOU+xXGp9z9Npinr+aQQiRJ/8mi44E=;
Received: from wowasieco.sm.cl.cam.ac.uk ([128.232.60.22] helo=localhost)
	by wanbli.kerneis.info with esmtpsa
	(TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <gabriel@kerneis.info>)
	id 1VJm7h-0002cr-Jj; Wed, 11 Sep 2013 15:14:29 +0000
Date: Wed, 11 Sep 2013 16:14:28 +0100
From: Gabriel Kerneis <gabriel@kerneis.info>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20130911151428.GA22569@kerneis.info>
References: <1378906912-14015-1-git-send-email-gabriel@kerneis.info>
	<523077CE.6070303@redhat.com> <20130911144230.GA15227@kerneis.info>
	<523083EF.7050203@redhat.com> <20130911150137.GC15227@kerneis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130911150137.GC15227@kerneis.info>
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
X-List-Received-Date: Wed, 11 Sep 2013 15:14:43 -0000

On Wed, Sep 11, 2013 at 04:01:37PM +0100, Gabriel Kerneis wrote:
> On Wed, Sep 11, 2013 at 04:53:35PM +0200, Paolo Bonzini wrote:
> > Oh, then it's this line in configure that has to be changed to do proper
> > quoting.
> > 
> > printf "# Configured with:" >> $config_host_mak
> > printf " '%s'" "$0" "$@" >> $config_host_mak
> 
> No, this line has absolutely nothing to do with it.

I'm sorry, you are correct. I was confused because I did not try your
proposal from a clean build directory, running into a chicken-and-egg
issue.

I'll propose an updated patch.

-- 
Gabriel

