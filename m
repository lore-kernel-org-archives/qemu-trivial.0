Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uc8Lw-0005CX-U6
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2013 02:04:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uc8Lu-00059O-Cu
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 02:04:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uc8Lt-00008s-3N
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 02:04:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42593)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uc8Lq-00007X-UE; Tue, 14 May 2013 02:04:43 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 56834408B2;
	Tue, 14 May 2013 10:04:40 +0400 (MSK)
Message-ID: <5191D3F7.10003@msgid.tls.msk.ru>
Date: Tue, 14 May 2013 10:04:39 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: qiaonuohan@cn.fujitsu.com
References: <1367987941-26040-1-git-send-email-qiaonuohan@cn.fujitsu.com>
In-Reply-To: <1367987941-26040-1-git-send-email-qiaonuohan@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove twice include of
	qemu-common.h
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
X-List-Received-Date: Tue, 14 May 2013 06:04:47 -0000

08.05.2013 08:39, qiaonuohan@cn.fujitsu.com wrote:
> From: Qiao Nuohan <qiaonuohan@cn.fujitsu.com>
> 
> This patch is used to remove twice include of "qemu-common.h" in
> block/win32-aio.c

Thanks, applied to the trivial patches queue.

/mjt

