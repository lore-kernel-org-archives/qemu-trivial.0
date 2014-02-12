Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WDcfC-0005P4-RF
	for mharc-qemu-trivial@gnu.org; Wed, 12 Feb 2014 11:27:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WDcf4-0005GV-MQ
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 11:27:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WDcey-0002Tq-Na
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 11:27:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WDcem-0002Ml-Ef; Wed, 12 Feb 2014 11:27:28 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A6F3641784;
	Wed, 12 Feb 2014 20:27:17 +0400 (MSK)
Message-ID: <52FBA0E5.9080207@msgid.tls.msk.ru>
Date: Wed, 12 Feb 2014 20:27:17 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>
	<52F34A67.7060902@msgid.tls.msk.ru>
	<CAFEAcA_AJA3T=651ex7tFD3xfT4S_iRt44CJj1Pd6Sgz9NF21g@mail.gmail.com>
	<52FB7D13.8050801@embedded-brains.de>
	<CAFEAcA9bmL3gfjxUnp=uU24JQvsDV+hX2tRmg9ew6avZ-6AMtg@mail.gmail.com>
In-Reply-To: <CAFEAcA9bmL3gfjxUnp=uU24JQvsDV+hX2tRmg9ew6avZ-6AMtg@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Sebastian Huber <sebastian.huber@embedded-brains.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sparc/leon3: Initialize
 stack pointer
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
X-List-Received-Date: Wed, 12 Feb 2014 16:27:52 -0000

12.02.2014 18:00, Peter Maydell wrote:
[]
> It's sparc-specific, it's pretty small, it's been reviewed.
> MJT: I suggest we take the pragmatic approach and apply it
> via -trivial.

I actually applied it back at Feb-06.  Should be in the next pull request
at Friday.

Thanks,

/mjt

