Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKlxU-0003af-95
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 05:16:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKlxN-0003QG-3R
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:16:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKlxH-0007Ps-4p
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:15:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKlk9-00038K-0y; Sat, 14 Sep 2013 05:02:17 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CB3FA41074;
	Sat, 14 Sep 2013 13:02:15 +0400 (MSK)
Message-ID: <52342617.50107@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 13:02:15 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1379009870-18323-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1379009870-18323-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] tci: Fix qemu-alpha on 32 bit hosts
 (wrong assertions)
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
X-List-Received-Date: Sat, 14 Sep 2013 09:16:03 -0000

12.09.2013 22:17, Stefan Weil wrote:
> Debian busybox-static for alpha has a load address of 0x0000000120000000
> which is mapped to 0x0000000020000000 for 32 bit hosts.
>
> qemu-alpha uses the TCG opcodes qemu_ld32, qemu_ld64, qemu_st32 and
> qemu_st64 which all raise the assertion (taddr == host_addr).
>
> Remove all assertions of this type because they are either wrong or
> unnecessary (when sizeof(tcg_target_ulong) >= sizeof(target_ulong)).

Thanks, applied to the trivial-patches queue.
I'm not sure why this needs to go there, as you're a maintainer of TCI,
but since you sent it especially to -trivial I'm applying it.

/mjt

