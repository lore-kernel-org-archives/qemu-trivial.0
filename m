Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W37lO-0007lO-Ba
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2014 12:26:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W37lH-0007bx-Ow
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 12:26:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W37lB-0006t4-QV
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 12:26:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39954)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W37kz-0006pb-Kp; Tue, 14 Jan 2014 12:26:29 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 62882411AD;
	Tue, 14 Jan 2014 21:26:27 +0400 (MSK)
Message-ID: <52D57343.8000205@msgid.tls.msk.ru>
Date: Tue, 14 Jan 2014 21:26:27 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1389679228-15870-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1389679228-15870-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] exec: Exclude non portable function for
 MinGW
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
X-List-Received-Date: Tue, 14 Jan 2014 17:26:53 -0000

14.01.2014 10:00, Stefan Weil wrote:
> cpu_physical_memory_set_dirty_lebitmap calls getpageaddr and ffsl which are
> unavailable for MinGW. As the function is unused for MinGW, it can simply
> be excluded from compilation.

I applied it to -trivial.  But maybe it's better to just move whole thing to kvm-all.c where
it is actually used?

Thanks,

/mjt

