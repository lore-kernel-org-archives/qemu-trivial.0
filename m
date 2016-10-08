Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsmmb-0005zj-8K
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:15:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmmZ-0005xF-Hz
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:15:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmmX-0000t7-Pm
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:14:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsmmS-0000pI-E8; Sat, 08 Oct 2016 04:14:52 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EA22740EB7;
	Sat,  8 Oct 2016 11:14:48 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 70CC8B26;
	Sat,  8 Oct 2016 11:14:48 +0300 (MSK)
To: Thomas Huth <huth@tuxfamily.org>, QEMU Developers
	<qemu-devel@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>
References: <0e742879-8036-7c18-dfa3-4c8a8174f96a@tuxfamily.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <e2b3869b-9be1-8045-89a1-e3441e9b2454@msgid.tls.msk.ru>
Date: Sat, 8 Oct 2016 11:14:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.3.0
MIME-Version: 1.0
In-Reply-To: <0e742879-8036-7c18-dfa3-4c8a8174f96a@tuxfamily.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Some updates related to the
 SH4 machines
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Oct 2016 08:15:00 -0000

30.09.2016 12:32, Thomas Huth wrote:
> hw/intc/sh_intc.c and hw/timer/sh_timer.c seem to belong to
> the R2D machine, as far as I can see.
> And concerning the Shix machine, it does not make much sense
> to have a "M:" entry here and the "S:" set to "Orphan". So
> I'd like to suggest to use "Odd Fixes" here instead.

Applied to trivial, thanks!

/mjt

