Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnKn3-00060U-Ka
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 01:44:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnKn1-0005x6-DB
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 01:44:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnKn0-0005R2-AA
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 01:44:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnKmu-0005M8-AB; Wed, 29 Apr 2015 01:44:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8E6DE42A19;
	Wed, 29 Apr 2015 08:43:59 +0300 (MSK)
Message-ID: <55406F9F.6090001@msgid.tls.msk.ru>
Date: Wed, 29 Apr 2015 08:43:59 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>, 
	Peter Maydell <peter.maydell@linaro.org>
References: <cover.1430096379.git.crosthwaite.peter@gmail.com>	<a07c62df4232de834d97e01a981281c68d97fbbc.1430096379.git.crosthwaite.peter@gmail.com>	<553E2571.2000700@msgid.tls.msk.ru>	<CAFEAcA-a==mJ2kfb6E=So+agg1uZ9VsWMNYwS0BwzEM+RKUAWQ@mail.gmail.com>	<CAFEAcA8t7_9BzOGekyJpz+_d_qYxT6rTXa=domd4JH0c6zRJUA@mail.gmail.com>
	<CAEgOgz5-hThXXxUZJRswFH1LgUEzFYGXGL+ON-R9K0NWfdhkew@mail.gmail.com>
In-Reply-To: <CAEgOgz5-hThXXxUZJRswFH1LgUEzFYGXGL+ON-R9K0NWfdhkew@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH target-arm 2/2] arm: cpu.h: Delete unused
	cpu_pc_from_tb()
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
X-List-Received-Date: Wed, 29 Apr 2015 05:44:08 -0000

27.04.2015 22:06, Peter Crosthwaite wrote:

> Does that mean a respin of this patch or should the tricore fix and
> the comment be a follow up?

Can you please resend whole thing in one change, removing single
unused function from two places and updating the comment, to fit
all the pieces together?  The whole thing is trivial enough to split
it up and the definition of "unused" in the subject will be true :)

I think that sometimes we make a bit "too trivial" patches which
aren't worth a patch by their own :) and the result is unnecessary
clutter in the git history.

Thanks,

/mjt

