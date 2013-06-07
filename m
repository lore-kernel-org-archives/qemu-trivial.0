Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ul5Dq-0002j0-L5
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jun 2013 18:33:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ul5Do-0002gt-7P
	for qemu-trivial@nongnu.org; Fri, 07 Jun 2013 18:33:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ul5Dn-0006zx-F9
	for qemu-trivial@nongnu.org; Fri, 07 Jun 2013 18:33:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55049)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ul5Dg-0006xA-Va; Fri, 07 Jun 2013 18:33:17 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9B51A40DA7;
	Sat,  8 Jun 2013 02:33:06 +0400 (MSK)
Message-ID: <51B25FA2.2050100@msgid.tls.msk.ru>
Date: Sat, 08 Jun 2013 02:33:06 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1370523215-35057-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1370523215-35057-1-git-send-email-emaste@freebsd.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: remove ${config_host_ld}
	variable
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
X-List-Received-Date: Fri, 07 Jun 2013 22:33:25 -0000

06.06.2013 16:53, Ed Maste wrote:
> It was only used in one place (and already expanded in one other).

Thanks, applied to the trivial patches queue.

I think we should just as well get rid of ${config_host_mak},
as it makes no sense too... ;)   And while at it, maybe use
common constructs like

{ echo a; echo b; echo c; ... } > config-host.mak

But that's for another time :)

/mjt

