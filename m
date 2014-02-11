Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WDAbG-0000zG-8i
	for mharc-qemu-trivial@gnu.org; Tue, 11 Feb 2014 05:29:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WDAb9-0000qx-U3
	for qemu-trivial@nongnu.org; Tue, 11 Feb 2014 05:29:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WDAb4-0000BD-WA
	for qemu-trivial@nongnu.org; Tue, 11 Feb 2014 05:29:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WDAau-00005W-Uy; Tue, 11 Feb 2014 05:29:37 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6320840C5C;
	Tue, 11 Feb 2014 14:29:28 +0400 (MSK)
Message-ID: <52F9FB88.1050509@msgid.tls.msk.ru>
Date: Tue, 11 Feb 2014 14:29:28 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <153a8e98437c7d4b7fc3df2bf375fbc9e0bdb8ef.1392101145.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <153a8e98437c7d4b7fc3df2bf375fbc9e0bdb8ef.1392101145.git.peter.crosthwaite@xilinx.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: peter.maydell@linaro.org, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel@nongnu.org, dgilbert@redhat.com, edgari@xilinx.com,
	mkletzan@redhat.com
Subject: Re: [Qemu-trivial] [PATCH bugfix v1 1/1] char/serial: Fix emptyness
	check
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
X-List-Received-Date: Tue, 11 Feb 2014 10:29:56 -0000

11.02.2014 10:49, Peter Crosthwaite wrote:
> This was guarding against a full fifo rather than an empty fifo when
> popping. Fix.

I've applied this to qemu-trivial for now, if no one will pick it up
before the next -trivial pull, -- because the original change were
merged using -trivial too.

I also compared this with the previous code in this area, and it looks
like this is the right fix.  So you can add my

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

too.

Thank you!

/mjt

