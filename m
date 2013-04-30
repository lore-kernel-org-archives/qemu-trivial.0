Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXFqe-0008Bw-Si
	for mharc-qemu-trivial@gnu.org; Tue, 30 Apr 2013 15:04:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXFqY-0008Bp-HL
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 15:04:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXFqT-0004TY-Qb
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 15:04:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43464)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXFqT-0004G7-JU
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 15:04:09 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6635742D9E;
	Tue, 30 Apr 2013 23:04:01 +0400 (MSK)
Message-ID: <5180159F.80706@msgid.tls.msk.ru>
Date: Tue, 30 Apr 2013 23:03:59 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Maksim Ratnikov <m.o.ratnikov@gmail.com>
References: <CAAWx3aSdhAdZfPiKodbCo6sHhHPX4kk1_yZ6h1j4PU8EyNBQFg@mail.gmail.com>
In-Reply-To: <CAAWx3aSdhAdZfPiKodbCo6sHhHPX4kk1_yZ6h1j4PU8EyNBQFg@mail.gmail.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] SMBUS module update.
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
X-List-Received-Date: Tue, 30 Apr 2013 19:04:19 -0000

28.04.2013 22:26, Maksim Ratnikov wrote:
> Previous realization doesn't consider flags in the status register.
> Add DS and INTR bits of HST_STS register set after transaction execution.
> Update bits resetting in HST_STS register. Update error processing: if DEV_ERR bit are set
> transaction isn't execution.

I'm not sure this qualifies for -trivial branch.  Maybe the device
itself isn't of first importance or trivial, but the change this
patch introduces are a bit more than qemu-trivial branch considers.
I think anyway - I'm new here in -trivial.

Also, please don't us HTML to format patches.

Thanks,

/mjt

