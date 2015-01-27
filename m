Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG8Mo-0003FF-BD
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 10:47:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YG8Mg-00033e-2w
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 10:47:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YG8MZ-0008N1-P0
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 10:47:41 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YG8MS-0008Ii-J4; Tue, 27 Jan 2015 10:47:28 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 98C4C42F85;
	Tue, 27 Jan 2015 18:47:26 +0300 (MSK)
Message-ID: <54C7B30D.4060204@msgid.tls.msk.ru>
Date: Tue, 27 Jan 2015 18:47:25 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Chen Gang S <gang.chen@sunrus.com.cn>, riku.voipio@iki.fi, 
	Peter Maydell <peter.maydell@linaro.org>
References: <54C4D51E.4030408@sunrus.com.cn>
In-Reply-To: <54C4D51E.4030408@sunrus.com.cn>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user/main.c: Use TARGET_SIG*
	instead of SIG*
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
X-List-Received-Date: Tue, 27 Jan 2015 15:47:46 -0000

25.01.2015 14:35, Chen Gang S wrote:
> In main.c, all SIG* need be change to TARGET_SIG*, since the related
> next call are all for TARGET_SIG*: queue_signal() and gdb_handlesig().

In main.c, all SIG* should be TARGET_SIG*, since the relevant functions
(queue_signal() and gdb_handlesig()) expects TARGET_SIG*.

> The related vi operation command is "1,$ s/\<SIG/TARGET_SIG/g".

The corresponding vi command is "1,$ s/\<SIG/TARGET_SIG/g".

Applied to -trivial with the above corrections.  Thank you!

/mjt

