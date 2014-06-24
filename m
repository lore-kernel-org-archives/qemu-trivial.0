Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzT7l-0003dh-Ou
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 11:59:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzT7c-0003QP-Of
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 11:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzT7V-0000Vo-Ak
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 11:59:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzT7F-0000SH-IM; Tue, 24 Jun 2014 11:58:37 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D010D4405B;
	Tue, 24 Jun 2014 19:58:36 +0400 (MSK)
Message-ID: <53A9A02C.7030601@msgid.tls.msk.ru>
Date: Tue, 24 Jun 2014 19:58:36 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: Hunter Laux <hunterlaux@gmail.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org, riku.voipio@iki.fi, peter.maydell@linaro.org
References: <1403262794-19963-1-git-send-email-hunterlaux@gmail.com>
In-Reply-To: <1403262794-19963-1-git-send-email-hunterlaux@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] Add support for the arm breakpoint
 syscall
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
X-List-Received-Date: Tue, 24 Jun 2014 15:59:08 -0000

20.06.2014 15:13, Hunter Laux wrote:
> OABI arm used a software interrupt(0xef9f0001) for breakpoints.
> Since 2005 gdb has used the break instruction(0xe7f001f0) for EABI.
> Apparently Steel Bank Common Lisp still uses the swi instruction.

Applied to -trivial, despite the ugliness with the goto.  Oh well.

Thank you!

/mjt

