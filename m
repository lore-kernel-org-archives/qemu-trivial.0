Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WdUnP-0002fc-CP
	for mharc-qemu-trivial@gnu.org; Thu, 24 Apr 2014 21:19:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WdUki-00012A-Ey
	for qemu-trivial@nongnu.org; Thu, 24 Apr 2014 21:17:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WdK9V-0007pm-Om
	for qemu-trivial@nongnu.org; Thu, 24 Apr 2014 09:57:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39520)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WdK9P-0007iM-BH; Thu, 24 Apr 2014 09:57:19 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E91D442D79;
	Thu, 24 Apr 2014 17:57:17 +0400 (MSK)
Message-ID: <5359183D.4020102@msgid.tls.msk.ru>
Date: Thu, 24 Apr 2014 17:57:17 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Anthony Liguori <aliguori@amazon.com>
References: <534DC6EA.6050203@gmail.com>
In-Reply-To: <534DC6EA.6050203@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH trivial v2 0/2] vl: simplify code for
	main()
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
X-List-Received-Date: Fri, 25 Apr 2014 01:19:17 -0000

16.04.2014 03:55, Chen Gang wrote:
> In "vl.c", at least, we can simplify the code below, so can let readers
> read professional C code (especially for new readers, which often start
> reading code at main function).
> 
>  - Remove useless 'continue' in main().
> 
>  - Eliminate a superfluous local variable in main().

Applied to -trivial, thank you!

/mjt

