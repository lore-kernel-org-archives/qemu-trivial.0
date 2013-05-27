Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uh3LZ-0002Pc-OZ
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 15:44:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uh3LT-0002HH-79
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 15:44:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uh3LN-0007wn-UO
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 15:44:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37212)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uh3LB-0007ul-BE; Mon, 27 May 2013 15:44:21 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 86A2041D10;
	Mon, 27 May 2013 23:44:20 +0400 (MSK)
Message-ID: <51A3B794.8090504@msgid.tls.msk.ru>
Date: Mon, 27 May 2013 23:44:20 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1369426020-39060-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1369426020-39060-1-git-send-email-emaste@freebsd.org>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: try pkg-config ncurses first
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
X-List-Received-Date: Mon, 27 May 2013 19:44:44 -0000

25.05.2013 00:07, Ed Maste wrote:
> When probing for ncurses, try pkg-config first rather than after
> explicit -lncurses and -lcurses.  This fixes static linking in the case
> that ncurses has additional dependencies, such as -ltinfo (as on FreeBSD).

Thanks, applied to the trivial patches queue, on top of my tiny configure change.

/mjt

