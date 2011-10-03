Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RAppJ-0006kN-BM
	for mharc-qemu-trivial@gnu.org; Mon, 03 Oct 2011 17:13:29 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RAppE-0006W5-UM
	for qemu-trivial@nongnu.org; Mon, 03 Oct 2011 17:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RAppB-0006Mo-Os
	for qemu-trivial@nongnu.org; Mon, 03 Oct 2011 17:13:24 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:44554)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RApp6-0006K2-Ej; Mon, 03 Oct 2011 17:13:16 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C67A1728327E; Mon,  3 Oct 2011 23:13:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id gxSJvfvhnsWO; Mon,  3 Oct 2011 23:12:45 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086F1F7.dip.t-dialin.net [80.134.241.247])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	79AC3728327D; Mon,  3 Oct 2011 23:12:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1RApoQ-000532-Vi; Mon, 03 Oct 2011 23:12:34 +0200
Message-ID: <4E8A2542.40707@weilnetz.de>
Date: Mon, 03 Oct 2011 23:12:34 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110818 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1317674600-19083-1-git-send-email-sw@weilnetz.de>
	<1317674600-19083-2-git-send-email-sw@weilnetz.de>
In-Reply-To: <1317674600-19083-2-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] linux-user: Remove
	unused code
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
X-List-Received-Date: Mon, 03 Oct 2011 21:13:28 -0000

Am 03.10.2011 22:43, schrieb Stefan Weil:
> The code is unused since 8 years, so remove it.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> linux-user/signal.c | 5 +----
> 1 files changed, 1 insertions(+), 4 deletions(-)
>
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 89276eb..40c5eb1 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -1274,10 +1274,7 @@ setup_return(CPUState *env, struct 
> target_sigaction *ka,
>
> if (__put_user(retcodes[idx], rc))
> return 1;
> -#if 0
> - flush_icache_range((abi_ulong)rc,
> - (abi_ulong)(rc + 1));
> -#endif
> +
> retcode = rc_addr + thumb;
> }
>

This is a trivial patch, so I send it to qemu-trivial, too.

The patch is independent of the rest of the series.

Cheers,
Stefan Weil


