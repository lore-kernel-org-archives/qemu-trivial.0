Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VdzIM-0004Bm-Lk
	for mharc-qemu-trivial@gnu.org; Wed, 06 Nov 2013 04:21:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VdzIG-000438-3e
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 04:21:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VdzIA-0002xj-0F
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 04:20:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VdzHx-0002w2-EU; Wed, 06 Nov 2013 04:20:37 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2E5574085D;
	Wed,  6 Nov 2013 13:20:36 +0400 (MSK)
Message-ID: <527A09E4.7090605@msgid.tls.msk.ru>
Date: Wed, 06 Nov 2013 13:20:36 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: whitearchey <whitearchey@gmail.com>
References: <op.w53t8fe2cb68cn@whitewind-arch>
In-Reply-To: <op.w53t8fe2cb68cn@whitewind-arch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] qga: Fix shutdown command of guest agent
 to work with SysV
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
X-List-Received-Date: Wed, 06 Nov 2013 09:21:02 -0000

06.11.2013 05:54, whitearchey wrote:
> For now guest agent uses following command to shutdown system:
> shutdown -P +0 "blabla"
> but this syntax works only with shutdown command from systemd or upstart,
> because SysV shutdown requires -h switch.
>
> Following patch changes the command so it works with systemd, upstart and SysV

While the patch is one-liner indeed, it is a bit more than trivial.
Because it changes things in a non-obvious way, especially when
multiple systems are concerned.  Cc'ing qemu-devel@ due to this.

> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> -        execle("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
> +        execle("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",

Note that shutdown command is not in POSIX, despite the fact
that this is put into commands-posix.c

Note also that even shutdown from sysvinit on linux has another
option, -P, which mean poweroff, while -h means "halt OR poweroff"
(the latter is a bit unclear).

Does the same work on other *nixes?  *BSD?  Solaris?

Thanks,

/mjt

