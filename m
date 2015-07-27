Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoMJ-00009d-J9
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:46:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoMH-00005N-HW
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoMD-00075u-IY
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:46:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58106)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoM7-000732-V4; Mon, 27 Jul 2015 15:46:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CE481425AF;
	Mon, 27 Jul 2015 22:46:34 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id B70BBA57;
	Mon, 27 Jul 2015 22:46:34 +0300 (MSK)
Message-ID: <55B68A9A.9000707@msgid.tls.msk.ru>
Date: Mon, 27 Jul 2015 22:46:34 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>, 
	qemu-trivial <qemu-trivial@nongnu.org>
References: <55B26D4F.3040108@siemens.com>
In-Reply-To: <55B26D4F.3040108@siemens.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] gdbstub: Set current CPU on interruptions
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
X-List-Received-Date: Mon, 27 Jul 2015 19:46:46 -0000

24.07.2015 19:52, Jan Kiszka wrote:
> gdb expects that the thread ID for c and g-class operations is set to
> the CPU we provide when reporting VM stop conditions. If the stub is
> still tuned to a different CPU, the wrong information is delivered to
> the gdb frontend.

Applied to -trivial, thanks!

/mjt

