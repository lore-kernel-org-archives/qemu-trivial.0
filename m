Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRcV0-0003Ab-IG
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 05:20:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRcUx-00039P-Mm
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:20:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRcUv-0006BO-7A
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:20:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRcUq-000669-1W; Thu, 12 Jan 2017 05:20:40 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 61858409D2;
	Thu, 12 Jan 2017 13:20:29 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 9CBB3546;
	Thu, 12 Jan 2017 13:20:28 +0300 (MSK)
To: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
References: <20161101170302.23737-1-sw@weilnetz.de>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <dd8da5eb-3627-5cf8-8ef3-7042c144c5c8@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 13:20:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161101170302.23737-1-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/block/m25p80: Fix typo in local macro
 name
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
X-List-Received-Date: Thu, 12 Jan 2017 10:20:49 -0000

01.11.2016 20:03, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/block/m25p80.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to -trivial, quite a bit too late but better be late
than never :)  Thanks!

/mjt

