Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UdfJL-0000G5-EI
	for mharc-qemu-trivial@gnu.org; Sat, 18 May 2013 07:28:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UdfJJ-0000DG-0o
	for qemu-trivial@nongnu.org; Sat, 18 May 2013 07:28:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UdfJH-0005yW-Pj
	for qemu-trivial@nongnu.org; Sat, 18 May 2013 07:28:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UdfJF-0005wm-1U; Sat, 18 May 2013 07:28:21 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3A69140E46;
	Sat, 18 May 2013 15:28:20 +0400 (MSK)
Message-ID: <519765D2.9030602@msgid.tls.msk.ru>
Date: Sat, 18 May 2013 15:28:18 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Hu Tao <hutao@cn.fujitsu.com>
References: <1368597869-30405-1-git-send-email-hutao@cn.fujitsu.com>
In-Reply-To: <1368597869-30405-1-git-send-email-hutao@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-moxie: replace target_phys_addr_t
 with hwaddr
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
X-List-Received-Date: Sat, 18 May 2013 11:28:26 -0000

15.05.2013 10:04, Hu Tao wrote:
> target_phys_addr_t has been already replaced by hwaddr, but this
> one is introduced after.
> 
> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>

Thanks, added to the trivial patches queue.

/mjt

