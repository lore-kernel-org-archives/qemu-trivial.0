Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeFo-0004iV-RO
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:21:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeFh-0004a3-PX
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:21:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeFb-00082F-QG
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:21:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeFP-00080h-Kv; Sat, 15 Feb 2014 07:21:31 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 04CB141BD1;
	Sat, 15 Feb 2014 16:21:31 +0400 (MSK)
Message-ID: <52FF5BCA.2020608@msgid.tls.msk.ru>
Date: Sat, 15 Feb 2014 16:21:30 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
References: <1392282978-19368-1-git-send-email-sebastian.huber@embedded-brains.de>
In-Reply-To: <1392282978-19368-1-git-send-email-sebastian.huber@embedded-brains.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw/timer/grlib_gptimer: Avoid integer
 overflow
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
X-List-Received-Date: Sat, 15 Feb 2014 12:21:55 -0000

13.02.2014 13:16, Sebastian Huber wrote:
> The GPTIMER uses 32-bit registers.  Use a 64-bit operation to get the
> ptimer count, otherwise we end up with a count of 0 for GPTIMER counter
> values of 0xffffffff.

Signed-off-by?

Thanks,

/mjt

