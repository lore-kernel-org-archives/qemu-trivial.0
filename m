Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWgdY-0004rT-AF
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 02:33:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWgdQ-0004gA-1n
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 02:32:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWgdJ-0000Pp-MP
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 02:32:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WWgd7-0000Ox-4d; Sun, 06 Apr 2014 02:32:33 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6BCA640AFB;
	Sun,  6 Apr 2014 10:32:30 +0400 (MSK)
Message-ID: <5340F4FD.7040305@msgid.tls.msk.ru>
Date: Sun, 06 Apr 2014 10:32:29 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
	<533E7DD5.3090203@gmail.com>
In-Reply-To: <533E7DD5.3090203@gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH-trivial v2] vl: Report accelerator not
 supported for target more nicely
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
X-List-Received-Date: Sun, 06 Apr 2014 06:32:59 -0000

04.04.2014 13:39, Chen Gang wrote:
> When you ask for an accelerator not supported for your target, you get
> a bogus "accelerator does not exist" message:
> 
>   $ qemu-system-arm -machine none,accel=kvm
>   KVM not supported for this target
>   "kvm" accelerator does not exist.
>   No accelerator found!
> 
> Suppress it.

Applied to -trivial, thanks!

/mjt

