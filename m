Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dDB1m-0003YV-G2
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 10:43:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDB1k-0003WL-0I
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 10:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDB1j-0004rh-6F
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 10:43:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dDB1b-0004ng-O0; Tue, 23 May 2017 10:43:03 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F27AA4196E;
	Tue, 23 May 2017 17:43:02 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id D94F6437;
	Tue, 23 May 2017 17:43:02 +0300 (MSK)
To: Kamil Rytarowski <n54@gmx.com>, qemu-devel@nongnu.org
References: <20170426105027.10666-1-n54@gmx.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <92fec349-00a8-85b5-b113-c9b12cb545ac@msgid.tls.msk.ru>
Date: Tue, 23 May 2017 17:43:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170426105027.10666-1-n54@gmx.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] configure: Detect native NetBSD curses(3)
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
X-List-Received-Date: Tue, 23 May 2017 14:43:13 -0000

26.04.2017 13:50, Kamil Rytarowski wrote:
> NetBSD ships with traditional BSD curses with compatibility with ncurses.
> qemu works nicely with the basesystem version of curses(3) from NetBSD.
> 
> The only mismatch between curses(3) and ncurses is the lack of
> curses_version() in the NetBSD version. This function is used solely in
> the configure script, therefore eliminate it from the curses(3) detection.
> 
> With this change applied, configure detects correctly curses frontend.

Applied to -trivial, thanks!

/mjt

