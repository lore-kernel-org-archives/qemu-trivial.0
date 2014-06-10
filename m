Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOJs-0000xT-76
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 11:50:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOJj-0000un-3c
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 11:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOJb-0007rs-ED
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 11:50:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOJJ-0007ad-Hc; Tue, 10 Jun 2014 11:50:05 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 28A3E412A5;
	Tue, 10 Jun 2014 19:50:03 +0400 (MSK)
Message-ID: <5397292A.1090508@msgid.tls.msk.ru>
Date: Tue, 10 Jun 2014 19:50:02 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Aleksandar Ristovski <aristovski@qnx.com>, qemu-trivial@nongnu.org
References: <53876F3F.1060704@qnx.com>
In-Reply-To: <53876F3F.1060704@qnx.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] DBGAUTHSTATUS register
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
X-List-Received-Date: Tue, 10 Jun 2014 15:50:38 -0000

29.05.2014 21:32, Aleksandar Ristovski wrote:
> Hello,
> 
> 
> This is not a big issue: DBGAUTHSTATUS, according to the docs, should exist. According to "ARM Architecture Reference Manual, ARMv7-A and ARMv7-R edition" (DDI0406C_b_arm_architecture_reference_manual.pdf), DBGAUTHSTATUS is required in all implementations. Reading it should be permitted, even if as RAZ only (implying no features are implemented/enabled).
> 
> This trivial patch defines cp14 register DBGAUTHSTATUS.

While the patch appears to be trivial, I had to grab the above mentioned ARM manual
and read a bit from there.  Unfortunately, since I don't have any prior knowlege
about this stuff, at all, I still have to accept for granted that it is the right
thing to do.  Maybe it is better to route this to the ARM maintainer instead
(Cc'ed) ?

Thanks,

/mjt

