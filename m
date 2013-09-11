Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJldC-0003gX-Mi
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 10:42:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJld5-0003UU-Cn
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 10:42:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJlcz-0007FV-Fm
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 10:42:51 -0400
Received: from wanbli.kerneis.info ([2001:41d0:8:38ad::1]:42126)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>)
	id 1VJlco-0007CA-1o; Wed, 11 Sep 2013 10:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kerneis.info;
	s=wanbli-rsa1; 
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=4sSrkjMfmuZ9UTNLgYREzIXN/ya8icgaqyZMBezytMY=; 
	b=u83G9BlY505mAcmsItIgwq6RmD9xFTf/+LerPzg6Q9bB7PQSuMOpShcwI5JrVp96Z4deBHfhmd5xofpRD8gj5DQ6eRRkZXPp0TAUD15uX2X4IfxKjdKao0S2xUAeRuUMxWG1dcewdrU93eN/9YBgLtCwb1YNQtVyECNBpWzMSSU=;
Received: from wowasieco.sm.cl.cam.ac.uk ([128.232.60.22] helo=localhost)
	by wanbli.kerneis.info with esmtpsa
	(TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <gabriel@kerneis.info>)
	id 1VJlcm-0001QS-2s; Wed, 11 Sep 2013 14:42:32 +0000
Date: Wed, 11 Sep 2013 15:42:31 +0100
From: Gabriel Kerneis <gabriel@kerneis.info>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20130911144230.GA15227@kerneis.info>
References: <1378906912-14015-1-git-send-email-gabriel@kerneis.info>
	<523077CE.6070303@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <523077CE.6070303@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 128.232.60.22
X-SA-Exim-Mail-From: gabriel@kerneis.info
X-SA-Exim-Scanned: No (on wanbli.kerneis.info); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:41d0:8:38ad::1
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Wed, 11 Sep 2013 14:42:57 -0000

On Wed, Sep 11, 2013 at 04:01:50PM +0200, Paolo Bonzini wrote:
> > ./configure --extra-cflags="-Dcoroutine_fn='__attribute__((coroutine_fn))'"
> 
> Where does the shell read config-host.mak?  Make does not need the quotes.

I might have been confused about the shell vs. make interpreting the
string, but I am positive that without the patch, the following fails:

mkdir bin/test
cd bin/test
../../configure \
    --extra-cflags="-Dcoroutine_fn='__attribute__((coroutine_fn))' -w"
make tests/test-coroutine
touch ../../configure
make tests/test-coroutine

with the following error message:

config-host.mak is out-of-date, running configure
sh: 1: Syntax error: "(" unexpected
make: *** [config-host.mak] Error 2

My patch fixes this issue.

-- 
Gabriel

