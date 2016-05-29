Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b6vZz-0003YP-Pb
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2016 03:56:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6vZx-0003XF-Bo
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 03:56:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6vZw-0007wy-Ds
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 03:56:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b6vZs-0007uB-1P; Sun, 29 May 2016 03:56:04 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A086D42BF2;
	Sun, 29 May 2016 10:55:57 +0300 (MSK)
To: Peter Wu <peter@lekensteyn.nl>, qemu-devel@nongnu.org
References: <1462354337-1733-1-git-send-email-peter@lekensteyn.nl>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <574AA08D.2020005@msgid.tls.msk.ru>
Date: Sun, 29 May 2016 10:55:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1462354337-1733-1-git-send-email-peter@lekensteyn.nl>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] gdbstub: set listen backlog to 1
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
X-List-Received-Date: Sun, 29 May 2016 07:56:10 -0000

04.05.2016 12:32, Peter Wu wrote:
> Avoid possible connection drops on Linux (when tcp_syncookies is
> disabled) or fallbacks to SYN cookies with the following kernel warning:
> 
>     TCP: request_sock_TCP: Possible SYN flooding on port 1234. Sending cookies.  Check SNMP counters.
> 
> Since Linux 4.4 (ef547f2ac16b "tcp: remove max_qlen_log"), a backlog of
> zero is really treated as the "queue length for completely established
> sockets waiting to be accepted" (listen(2)). This is apparently a valid
> interpretation of an "implementation-defined minimum value" for a
> backlog value of 0 (listen(3p)). Previous kernels would use 8 as
> minimum value, but that is no longer the case.

Applied to -trivial, thanks!

/mjt

