Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WyKb1-0006uN-LC
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jun 2014 08:40:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyKat-0006ro-5y
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 08:40:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyKan-0000gv-16
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 08:40:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WyKaO-0000Pa-BZ; Sat, 21 Jun 2014 08:40:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8EBE143761;
	Sat, 21 Jun 2014 16:39:59 +0400 (MSK)
Message-ID: <53A57D1F.9010604@msgid.tls.msk.ru>
Date: Sat, 21 Jun 2014 16:39:59 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1403025508-19171-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1403025508-19171-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] target-ppc: Fix compiler warning
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
X-List-Received-Date: Sat, 21 Jun 2014 12:40:37 -0000

17.06.2014 21:18, Stefan Weil wrote:
> gcc reports a warning which is usually wrong:
[]
> Using g_assert_not_reached better documents the intention and does not
> have these problems.

Applied to -trivial, thanks!

/mjt

