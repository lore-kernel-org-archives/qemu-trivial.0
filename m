Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJm9r-0008Sm-6q
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 11:16:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJm9k-0008JQ-JQ
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:16:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJm9f-0001DJ-2m
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:16:36 -0400
Received: from wanbli.kerneis.info ([2001:41d0:8:38ad::1]:42192)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>)
	id 1VJm9e-0001D6-QE; Wed, 11 Sep 2013 11:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kerneis.info;
	s=wanbli-rsa1; 
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=SZG8i4PzN3PogtNeMvhzoV1VYwX3Uz/MJvzpFHR/iIU=; 
	b=8STxZ1dtQRL8GMW1lpvvl+fhKLOeE7O2Csvwf5Ea89cqYfLMxSVoRMQXbtnjuW7r8nwTfozROscBM2WVtK6iGggNih9TN3FR6DPJVFagoUHIqJYsAWaz8mEuSL8HSqTrLl9uVPpfJcD1fb/RIubLE3EPUHsOig0dMoFrMKqH4/4=;
Received: from wowasieco.sm.cl.cam.ac.uk ([128.232.60.22] helo=localhost)
	by wanbli.kerneis.info with esmtpsa
	(TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <gabriel@kerneis.info>)
	id 1VJm9d-0002jG-Mt; Wed, 11 Sep 2013 15:16:29 +0000
Date: Wed, 11 Sep 2013 16:16:28 +0100
From: Gabriel Kerneis <gabriel@kerneis.info>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20130911151628.GB22569@kerneis.info>
References: <1378906912-14015-1-git-send-email-gabriel@kerneis.info>
	<523077CE.6070303@redhat.com> <20130911144230.GA15227@kerneis.info>
	<523083EF.7050203@redhat.com> <20130911150137.GC15227@kerneis.info>
	<52308701.1020706@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52308701.1020706@redhat.com>
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
X-List-Received-Date: Wed, 11 Sep 2013 15:16:42 -0000

On Wed, Sep 11, 2013 at 05:06:41PM +0200, Paolo Bonzini wrote:
> > The line that has to be fixed is
> > really the line starting with "extra_cflags=" in config-host.mak (well,
> > at least in my experience - my patch does not touch the first line, at
> > it still solves the issue).
> 
> Yeah, what I'm missing now is why your patch works.

That is indeed very mysterious :-)

-- 
Gabriel

