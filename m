Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ti7Tx-0005yi-ML
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 12:49:33 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ti7Tr-0005ht-PE
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 12:49:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ti7Tq-0008JZ-TE
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 12:49:27 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60039)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Ti7Tl-0008IG-3X; Mon, 10 Dec 2012 12:49:21 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	62C067280048; Mon, 10 Dec 2012 18:49:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id t8vzfFDKJGWT; Mon, 10 Dec 2012 18:49:20 +0100 (CET)
Received: from flocke.fritz.box (p5086F143.dip.t-dialin.net [80.134.241.67])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	EC88E728001C; Mon, 10 Dec 2012 18:49:19 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.fritz.box with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1Ti7Tj-0001eo-LV; Mon, 10 Dec 2012 18:49:19 +0100
Message-ID: <50C6209F.8060506@weilnetz.de>
Date: Mon, 10 Dec 2012 18:49:19 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20121027 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: John Spencer <maillist-qemu@barfooze.de>
References: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
	<1355122786-29243-3-git-send-email-maillist-qemu@barfooze.de>
In-Reply-To: <1355122786-29243-3-git-send-email-maillist-qemu@barfooze.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] fix implicit
 declaration of syscall() in	linux-user/syscall.c
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
X-List-Received-Date: Mon, 10 Dec 2012 17:49:32 -0000

Am 10.12.2012 07:59, schrieb John Spencer:
> Signed-off-by: John Spencer<maillist-qemu@barfooze.de>
>
> ---
>   linux-user/syscall.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 31d5276..fabbcd7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -39,6 +39,7 @@
>   #include<sys/resource.h>
>   #include<sys/mman.h>
>   #include<sys/swap.h>
> +#include<sys/syscall.h>
>   #include<signal.h>
>   #include<sched.h>
>   #ifdef __ia64__


This is a workaround for a missing declaration of function syscall
in musl's unistd.h. See my comment to patch 1 for more information.

