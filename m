Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQMyb-0004GB-H6
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 15:48:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQMyU-00046H-9I
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQMyO-0003Vj-1T
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:48:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VQMyB-0003U3-Jp; Sun, 29 Sep 2013 15:47:55 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 892F54292C;
	Sun, 29 Sep 2013 23:47:54 +0400 (MSK)
Message-ID: <524883EA.2090305@msgid.tls.msk.ru>
Date: Sun, 29 Sep 2013 23:47:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1380469880-19448-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1380469880-19448-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] hw/alpha: Fix compiler warning (integer
 constant is too large)
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
X-List-Received-Date: Sun, 29 Sep 2013 19:48:20 -0000

29.09.2013 19:51, Stefan Weil wrote:
>  From buildbot default_i386_rhel61:
>
>    CC    alpha-softmmu/hw/alpha/typhoon.o
> hw/alpha/typhoon.c: In function 'typhoon_translate_iommu':
> hw/alpha/typhoon.c:703: warning: integer constant is too large for 'long' type
> hw/alpha/typhoon.c:703: warning: integer constant is too large for 'long' type

Thanks, applied to the trivial patches queue.

> I used lower case 'ull' because the rest of the code writes it that way
> although I personally prefer 0xfffffffffffULL to 0xfffffffffffull.

Yea, "full" looks a bit odd here :)

/mjt

