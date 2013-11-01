Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VcCkf-000469-P6
	for mharc-qemu-trivial@gnu.org; Fri, 01 Nov 2013 07:18:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VcCkZ-0003yY-SQ
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 07:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VcCkU-0004dE-W9
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 07:18:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47192)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VcCkK-0004S6-VX; Fri, 01 Nov 2013 07:18:33 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CD9864003C;
	Fri,  1 Nov 2013 15:18:28 +0400 (MSK)
Message-ID: <52738E04.4060706@msgid.tls.msk.ru>
Date: Fri, 01 Nov 2013 15:18:28 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Antony Pavlov <antonynpavlov@gmail.com>
References: <1383021391-3152-1-git-send-email-antonynpavlov@gmail.com>
	<52738284.5090708@msgid.tls.msk.ru>
	<20131101151402.2275a138bbcb849db3206db4@gmail.com>
In-Reply-To: <20131101151402.2275a138bbcb849db3206db4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH] vl: fix build when configured with no
 graphic support
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
X-List-Received-Date: Fri, 01 Nov 2013 11:18:52 -0000

01.11.2013 15:14, Antony Pavlov wrote:
> On Fri, 01 Nov 2013 14:29:24 +0400
> Michael Tokarev <mjt@tls.msk.ru> wrote:
>
>> 29.10.2013 08:36, Antony Pavlov wrote
>>> The following error occurs when building no graphic output support:
>                                             ^^^^^
> Can you plese fix misprint in my git commit message too.

Fixed.  Thank you for pointing this out.

>> +        (void)ds;      /* avoid warning if no display is configured */

Are you okay with me adding the comment? :)

/mjt

