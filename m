Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmkJa-0000va-3w
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 10:47:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YmkJX-0000pt-9f
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 10:47:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YmkJW-0006zx-MZ
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 10:47:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YmkJQ-0006xY-JO; Mon, 27 Apr 2015 10:47:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B753542778;
	Mon, 27 Apr 2015 17:47:06 +0300 (MSK)
Message-ID: <553E4BEA.2070403@msgid.tls.msk.ru>
Date: Mon, 27 Apr 2015 17:47:06 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
 qemu-devel@nongnu.org
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
In-Reply-To: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH microblaze v1 0/6] Microblaze Cleanups
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
X-List-Received-Date: Mon, 27 Apr 2015 14:47:16 -0000

26.04.2015 22:10, Peter Crosthwaite wrote:
> Hi Edgar,
> 
> This is some code cleanup of Microblaze. Mainly unused code
> deletion but also code share of the defconfig (P1).

Applied all 6 to -trivial, as is, since the whole series
does not perform any code changes.  Renumbering EXCP_*
constants can be done later.

Thanks,

/mjt

