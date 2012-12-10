Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ti7Qw-0003t0-Eg
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 12:46:26 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ti7Qo-0003VT-Az
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 12:46:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ti7Qe-0007Wo-Un
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 12:46:18 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59217)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Ti7QY-0007VD-UI; Mon, 10 Dec 2012 12:46:03 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6884A7280048; Mon, 10 Dec 2012 18:46:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id PVasVfxsTwkm; Mon, 10 Dec 2012 18:46:01 +0100 (CET)
Received: from flocke.fritz.box (p5086F143.dip.t-dialin.net [80.134.241.67])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	B5CE2728001C; Mon, 10 Dec 2012 18:46:01 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.fritz.box with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1Ti7QX-0001eZ-C2; Mon, 10 Dec 2012 18:46:01 +0100
Message-ID: <50C61FD9.9060504@weilnetz.de>
Date: Mon, 10 Dec 2012 18:46:01 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20121027 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: John Spencer <maillist-qemu@barfooze.de>
References: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
	<1355122786-29243-2-git-send-email-maillist-qemu@barfooze.de>
In-Reply-To: <1355122786-29243-2-git-send-email-maillist-qemu@barfooze.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/4] fix build error on ARM
 due to wrong glibc	check
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
X-List-Received-Date: Mon, 10 Dec 2012 17:46:24 -0000

Am 10.12.2012 07:59, schrieb John Spencer:
> the test for glibc<  2 "succeeds" wrongly for any non-glibc C library,
> and breaks the build on musl libc.
> we must first test if __GLIBC__ is defined at all, before using it
> unconditionally.
>
> Signed-off-by: John Spencer<maillist-qemu@barfooze.de>
>
> ---
>   user-exec.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/user-exec.c b/user-exec.c
> index ef9b172..cccc145 100644
> --- a/user-exec.c
> +++ b/user-exec.c
> @@ -442,7 +442,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>       unsigned long pc;
>       int is_write;
>
> -#if (__GLIBC__<  2 || (__GLIBC__ == 2&&  __GLIBC_MINOR__<= 3))
> +#if defined(__GLIBC__)&&  (__GLIBC__<  2 || (__GLIBC__ == 2&&  __GLIBC_MINOR__<= 3))
>       pc = uc->uc_mcontext.gregs[R15];
>   #else
>       pc = uc->uc_mcontext.arm_pc;
>    

Reviewed-by: Stefan Weil <sw@weilnetz.de>


