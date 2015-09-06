Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYXiZ-0005WN-42
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2015 07:02:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXiX-0005TJ-9R
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 07:02:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXiW-00029P-Gv
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 07:02:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32869)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZYXiR-00028B-G9; Sun, 06 Sep 2015 07:02:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C474A409B9;
	Sun,  6 Sep 2015 14:02:30 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id AF40AA76;
	Sun,  6 Sep 2015 14:02:30 +0300 (MSK)
Message-ID: <55EC1D46.5070901@msgid.tls.msk.ru>
Date: Sun, 06 Sep 2015 14:02:30 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>
References: <1440833392-5555-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1440833392-5555-1-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Fix warnings caused by
	missing 'static' attribute
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
X-List-Received-Date: Sun, 06 Sep 2015 11:02:38 -0000

29.08.2015 10:29, Stefan Weil wrote:
> Warnings from the Sparse static analysis tool:
> 
> linux-user/main.c:40:12: warning:
>  symbol 'filename' was not declared. Should it be static?
> linux-user/main.c:41:12: warning:
>  symbol 'argv0' was not declared. Should it be static?
> linux-user/main.c:42:5: warning:
>  symbol 'gdbstub_port' was not declared. Should it be static?
> linux-user/main.c:43:11: warning:
>  symbol 'envlist' was not declared. Should it be static?

Applied to -trivial, thanks!

/mjt

