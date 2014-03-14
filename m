Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOUkZ-0006cf-Ha
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 12:14:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOUkR-0006RE-S5
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:14:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOUkL-0007iN-LR
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:14:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46211)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOUk9-0007gl-95; Fri, 14 Mar 2014 12:13:57 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1016D41C8B;
	Fri, 14 Mar 2014 20:13:55 +0400 (MSK)
Message-ID: <53232AC2.7040202@msgid.tls.msk.ru>
Date: Fri, 14 Mar 2014 20:13:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
References: <1392549158-6009-1-git-send-email-sebastian.huber@embedded-brains.de>
In-Reply-To: <1392549158-6009-1-git-send-email-sebastian.huber@embedded-brains.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] hw/timer/grlib_gptimer: Avoid integer
 overflows
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
X-List-Received-Date: Fri, 14 Mar 2014 16:14:22 -0000

16.02.2014 15:12, Sebastian Huber wrote:
> The GPTIMER uses 32-bit registers.  Use a 64-bit operation to get the
> ptimer count, otherwise we end up with a count of 0 for GPTIMER counter
> values of 0xffffffff.
> 
> Use the GPTIMER counter value for tracing to avoid an overflow of the
> 32-bit value passed to trace_grlib_gptimer_enable().

Thanks, applied to the trivial patches queue.

Somehow this was quite a bit difficult for me to understand what's going
on.  Once I did, things are really trivial indeed.

/mjt

