Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpMWE-0003u0-7X
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 13:22:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpMW6-0003kq-NH
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 13:22:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpMW0-000272-Oh
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 13:22:14 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VpMVo-00025S-Ij; Sat, 07 Dec 2013 13:21:56 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 99C5840CDB;
	Sat,  7 Dec 2013 22:21:53 +0400 (MSK)
Message-ID: <52A36741.3@msgid.tls.msk.ru>
Date: Sat, 07 Dec 2013 22:21:53 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1386355410-10805-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1386355410-10805-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>,
	Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: Re: [Qemu-trivial] [PATCH] hw/arm/highbank: Simplify code (memory
 region in device state)
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
X-List-Received-Date: Sat, 07 Dec 2013 18:22:20 -0000

06.12.2013 22:43, Stefan Weil wrote:
> The memory region can be included by value instead of by reference in the
> device state (like it is done in other SoCs).

Applied to trivial-patches queue, with the suggested comment fix.

Thanks!

/mjt

