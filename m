Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdwQh-0004eG-3B
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2017 05:03:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwQe-0004ct-C5
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:03:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwQd-00085d-E7
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:03:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cdwQW-0007tM-Tu; Wed, 15 Feb 2017 05:03:09 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 05D0A421B6;
	Wed, 15 Feb 2017 13:02:59 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 5F097264;
	Wed, 15 Feb 2017 13:02:58 +0300 (MSK)
To: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <e4eb55c2-bac0-01f4-267f-19e70aa9b0de@tuxfamily.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <47d03193-5461-63e9-669e-4e7886c3c070@msgid.tls.msk.ru>
Date: Wed, 15 Feb 2017 13:02:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <e4eb55c2-bac0-01f4-267f-19e70aa9b0de@tuxfamily.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] m68k: Remove dummy machine
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
X-List-Received-Date: Wed, 15 Feb 2017 10:03:17 -0000

26.01.2017 11:30, Thomas Huth wrote:
> Since it is now possible to instantiate a CPU and RAM with the "none"
> machine, too, and a kernel can be loaded there with the generic loader
> device, there is no more need for the m68k "dummy" machine. Thus let's
> remove this unmaintained file now.

Applied to -trivial, thank you!

/mjt

