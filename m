Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJo1F-0000sX-GV
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:25:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJo1E-0000rO-3D
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:25:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJo1D-0004wM-8G
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:25:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJo19-0004vI-5S; Mon, 27 Jul 2015 15:24:55 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4BD12425AF;
	Mon, 27 Jul 2015 22:24:54 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 39D19A57;
	Mon, 27 Jul 2015 22:24:54 +0300 (MSK)
Message-ID: <55B68586.4010109@msgid.tls.msk.ru>
Date: Mon, 27 Jul 2015 22:24:54 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>
References: <1437231272-17389-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1437231272-17389-1-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH for-2.4] make: Clean build messages
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
X-List-Received-Date: Mon, 27 Jul 2015 19:25:00 -0000

18.07.2015 17:54, Stefan Weil wrote:
> We want to have uniform build messages, so fix some messages
> which did not follow the standard pattern.


Applied to -trivial, thanks!

/mjt

