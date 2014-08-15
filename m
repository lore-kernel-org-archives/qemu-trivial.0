Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIIv0-0001vV-L9
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 10:55:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIIut-0001oS-6F
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 10:55:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIIum-00079Z-Se
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 10:55:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52153)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIIua-00076M-7X; Fri, 15 Aug 2014 10:55:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 63BFC43075;
	Fri, 15 Aug 2014 18:55:23 +0400 (MSK)
Message-ID: <53EE1F5A.5000202@msgid.tls.msk.ru>
Date: Fri, 15 Aug 2014 18:55:22 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>, 
 qemu-devel@nongnu.org
References: <cover.1408090247.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1408090247.git.peter.crosthwaite@xilinx.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, agraf@suse.de
Subject: Re: [Qemu-trivial] [PATCH trivial v1 0/3] Initialise IRQ pointers
 as Zero
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
X-List-Received-Date: Fri, 15 Aug 2014 14:55:49 -0000

15.08.2014 12:14, Peter Crosthwaite wrote:
> Hi,
> 
> I'm working on some QOM stuff that requires output IRQ pointers to be
> initialised to zero. I have a catch-all workaround to the problem in
> the series proper, but this is the startings of a more complete
> solution.
> 
> Sending to trivial, as I think the change is an improvement
> independently, just due to the fact its easier to debug with NULL
> pointers rather than undefined pointer values.

Applied all 3 to -trivial, thank you!


