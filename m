Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJlve-0007hb-Sp
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 11:02:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJlvY-0007Zu-Bd
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:02:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJlvS-0004l8-Pi
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:01:56 -0400
Received: from wanbli.kerneis.info ([2001:41d0:8:38ad::1]:42164)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>)
	id 1VJlvH-0004jr-Db; Wed, 11 Sep 2013 11:01:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kerneis.info;
	s=wanbli-rsa1; 
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=srgogLvor3pHT8oxkYH4fcFW79v0TYCmZOPkupCEAto=; 
	b=BhixPtnH2I49bMifrbOrRsOLkbPohoZeBM/B9G8xmcwH6j3ZqlPcvi3O5nL7bWqQEmOSBQtoHNkGEks0NZ9WDjwRH7yBFQ4Go2BzsvHuGSuHETjDxRg0vU6YBAq418UkguuXZQkGYXQcn+mHFjP4xFZw5hqLUTUoNBOSFfaQ5yc=;
Received: from wowasieco.sm.cl.cam.ac.uk ([128.232.60.22] helo=localhost)
	by wanbli.kerneis.info with esmtpsa
	(TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <gabriel@kerneis.info>)
	id 1VJlvG-00020M-C2; Wed, 11 Sep 2013 15:01:38 +0000
Date: Wed, 11 Sep 2013 16:01:37 +0100
From: Gabriel Kerneis <gabriel@kerneis.info>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20130911150137.GC15227@kerneis.info>
References: <1378906912-14015-1-git-send-email-gabriel@kerneis.info>
	<523077CE.6070303@redhat.com> <20130911144230.GA15227@kerneis.info>
	<523083EF.7050203@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <523083EF.7050203@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 128.232.60.22
X-SA-Exim-Mail-From: gabriel@kerneis.info
X-SA-Exim-Scanned: No (on wanbli.kerneis.info); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:41d0:8:38ad::1
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Quote extra_cflags in config-host.mak
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
X-List-Received-Date: Wed, 11 Sep 2013 15:02:02 -0000

On Wed, Sep 11, 2013 at 04:53:35PM +0200, Paolo Bonzini wrote:
> Oh, then it's this line in configure that has to be changed to do proper
> quoting.
> 
> printf "# Configured with:" >> $config_host_mak
> printf " '%s'" "$0" "$@" >> $config_host_mak

No, this line has absolutely nothing to do with it. It's purely a
comment that is not executed later. The line that has to be fixed is
really the line starting with "extra_cflags=" in config-host.mak (well,
at least in my experience - my patch does not touch the first line, at
it still solves the issue).

> Something like
> 
> for arg in "$0" "$@"; do
>    quoted_arg=$(echo "$i" | sed 's/[$\\"]/\\&/g')
>    printf ' "%s"' "$quoted_arg"
> done >> $config_host_mak

But we could indeed apply that escaping mechanism to extra_cflags (or
maybe to every variable that is printed to config-host.mk). That's what
I meant when I refered to the following bashism:

printf "extra_cflags=%q\n" "$extra_cflags"

Unfortunately, %q is not portable and we probably need something along
the lines of your proposal above (note that it doesn't handle "("
though, which is precisely the one causing an issue in my example).

-- 
Gabriel

