Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJo89-00057T-Ku
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:32:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJo87-00054u-Fm
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:32:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJo82-0007xJ-6V
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:32:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36347)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJo81-0007wr-Tz
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:32:02 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0AA0B425AF;
	Mon, 27 Jul 2015 22:32:01 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E7D35A57;
	Mon, 27 Jul 2015 22:32:00 +0300 (MSK)
Message-ID: <55B68730.3040302@msgid.tls.msk.ru>
Date: Mon, 27 Jul 2015 22:32:00 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Johannes Schlatow <schlatow@ida.ing.tu-bs.de>, 
 qemu-trivial@nongnu.org
References: <20150629174541.25e4226c@johanness-latitude>
In-Reply-To: <20150629174541.25e4226c@johanness-latitude>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] Fix Cortex-A9 global timer
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
X-List-Received-Date: Mon, 27 Jul 2015 19:32:08 -0000

29.06.2015 18:45, Johannes Schlatow wrote:
> The auto increment bit of the timer control register was wrongly
> defined.

Applied to -trivial, thanks!

/mjt

