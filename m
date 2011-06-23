Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZkxa-0007Do-Ms
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 10:32:46 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QZkxX-0007Ct-97
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 10:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QZkxR-0005wC-Vh
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 10:32:43 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:48987)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QZkxN-0005vO-En; Thu, 23 Jun 2011 10:32:33 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7473872818A4; Thu, 23 Jun 2011 16:32:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id zUBxPYT3TVTQ; Thu, 23 Jun 2011 16:32:30 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086FB6F.dip.t-dialin.net [80.134.251.111])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	4D37072818A6; Thu, 23 Jun 2011 16:32:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1QZkxI-0002VM-EA; Thu, 23 Jun 2011 16:32:28 +0200
Message-ID: <4E034E79.5050901@mail.berlios.de>
Date: Thu, 23 Jun 2011 16:32:25 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110505 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <4E02F63E.3010908@web.de>
	<20110623133508.GF12698@stefanha-thinkpad.localdomain>
In-Reply-To: <20110623133508.GF12698@stefanha-thinkpad.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Avoid double definitions of PRI*64
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
X-List-Received-Date: Thu, 23 Jun 2011 14:32:45 -0000

Am 23.06.2011 15:35, schrieb Stefan Hajnoczi:
> On Thu, Jun 23, 2011 at 10:15:58AM +0200, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Recent mingw32 provide those defines.

... and all of those defines are wrong, because QEMU does not use
MS format specifiers. http://patchwork.ozlabs.org/patch/74276/
tried to fix this. My preferred solution is removing those PRI*64 from
qemu-common.h, because not only recent mingw32 versions provide
the (wrong) definitions, but even the Debian version provides them
(which is really old, but I use it for my regression tests).

The wrong definitions do not allow using -Wformat for mingw32
builds, but they work because (most?) relevant mingw32 functions
accept both MS and standard format specifiers.

Adding the correct definitions (to qemu-os-win32.h, not to qemu-common.h)
would be another solution as long as mingw32 does not handle
__USE_MINGW_ANSI_STDIO correctly.

>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>> qemu-common.h | 3 +++
>> 1 files changed, 3 insertions(+), 0 deletions(-)
>
> It's never too late to implement C99!
>
> Thanks, applied to the trivial patches tree:
> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches
>
> Stefan

Stefan, the patch won't harm, but it's also unnecessary.
So it's up to you whether you remove it from your queue,
modify it as I suggested above or apply it as it is.

Stefan


