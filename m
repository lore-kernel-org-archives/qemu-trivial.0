Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmNW0-0008Bk-UD
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 08:17:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmNVu-00083l-R0
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmNVp-0007IW-VW
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:17:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56607)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmNVg-0007Gi-9g; Tue, 11 Jun 2013 08:17:12 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2336E4123A;
	Tue, 11 Jun 2013 16:17:11 +0400 (MSK)
Message-ID: <51B71545.3030508@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 16:17:09 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Peter Wu <lekensteyn@gmail.com>
References: <6740398.i518s4jboP@al>
In-Reply-To: <6740398.i518s4jboP@al>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Unbreak -no-quit for GTK,
 validate SDL options
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
X-List-Received-Date: Tue, 11 Jun 2013 12:17:31 -0000

11.06.2013 12:55, Peter Wu wrote:
> Certain options (-no-frame, -alt-grab, -ctrl-grab) only make sense with SDL.
> When compiling without SDL, these options (and -no-quit) print an error message
> and exit qemu.
> 
> In case QEMU is compiled with SDL support, the three aforementioned options
> still do not make sense with other display types. This patch addresses that
> issue by printing a warning. I have chosen not to exit QEMU afterwards because
> having the option is not harmful and before this patch it would be ignored
> anyway.
> 
> By delaying the sanity check from compile-time with some ifdefs to run-time,
> -no-quit is now also properly supported when compiling without SDL.

Thanks, this is also something I wanted to do for a long time, -- to know
when some options makes no sense (or not implemented) instead of wondering
what I did wrong and why it does not work as expected... ;)

Applied to the trivial patches queue.

/mjt

