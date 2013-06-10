Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um4CV-0005vm-D6
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 11:40:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um4CP-0005mL-RN
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 11:40:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um4CJ-00089l-W3
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 11:40:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Um4CA-000873-95; Mon, 10 Jun 2013 11:39:46 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 76843410E7;
	Mon, 10 Jun 2013 19:39:45 +0400 (MSK)
Message-ID: <51B5F33F.2070706@msgid.tls.msk.ru>
Date: Mon, 10 Jun 2013 19:39:43 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Peter Wu <lekensteyn@gmail.com>
References: <11837115.9GZ72nQAUt@al>
In-Reply-To: <11837115.9GZ72nQAUt@al>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] gtk: implement -full-screen and -no-frame
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
X-List-Received-Date: Mon, 10 Jun 2013 15:40:06 -0000

09.06.2013 14:30, Peter Wu wrote:
> Aiming for GTK as replacement for SDL, features like -full-screen and -no-frame
> should also be implemented.

I'm not sure both options really should be implemented.  I think -no-frame makes
little sense actually.  But -full-screen is very useful, and hiding the menu bar --
actually in both full-screen mode and windowed mode -- makes very good sense, it
is something the gtk interface miss alot compared with sdl.

Thanks,

/mjt

