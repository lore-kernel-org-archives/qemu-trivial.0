Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5JOT-00011q-9y
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jun 2015 15:53:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5JOR-0000zC-7w
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 15:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5JON-0002Yi-Ux
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 15:53:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52361)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5JON-0002YU-OS
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 15:52:59 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 908EF4186B;
	Wed, 17 Jun 2015 22:52:58 +0300 (MSK)
Message-ID: <5581D01A.2020604@msgid.tls.msk.ru>
Date: Wed, 17 Jun 2015 22:52:58 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Wolfgang Bumiller <w.bumiller@proxmox.com>, qemu-trivial@nongnu.org
References: <1432211609-13466-1-git-send-email-w.bumiller@proxmox.com>
In-Reply-To: <1432211609-13466-1-git-send-email-w.bumiller@proxmox.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] util/qemu-sockets: improve ai_flag hints
 for ipv6 hosts
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
X-List-Received-Date: Wed, 17 Jun 2015 19:53:04 -0000

21.05.2015 15:33, Wolfgang Bumiller wrote:
> *) Do not use AI_ADDRCONFIG on listening sockets, because this flag
> makes it impossible to explicitly listen on '127.0.0.1' if no global
> ipv4 address is configured additionally, making this a very
> uncomfortable option.
> *) Add AI_V4MAPPED hint for connecting sockets.
> 
> If your system is globally only connected via ipv6 you often still want
> to be able to use '127.0.0.1' and 'localhost' (even if localhost doesn't
> also have an ipv6 entry).
> For example, PVE - unless explicitly asking for insecure mode - uses
> ipv4 loopback addresses with QEMU for live migrations tunneled over SSH.
> These fail to start because AI_ADDRCONFIG makes getaddrinfo refuse to
> work with '127.0.0.1'.
> 
> As for the AI_V4MAPPED flag: glibc uses it by default, and providing
> non-0 flags removes it. I think it makes sense to use it.
> 
> I also want to point out that glibc explicitly sidesteps POSIX standards
> when passing 0 as hints by then assuming both AI_V4MAPPED and
> AI_ADDRCONFIG (the latter being a rather weird choice IMO), while
> according to POSIX.1-2001 it should be assumed 0. (glibc considers its
> choice an improvement.)
> Since either AI_CANONNAME or AI_PASSIVE are passed in our cases, glibc's
> default flags in turn are disabled again unless explicitly added, which
> I do with this patch.

Applied (finally!) to -trivial.  I'm sorry for the delay.  Thank you!

/mjt

