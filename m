Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ti7S9-0004ee-UV
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 12:47:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ti7S4-0004Mp-C6
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 12:47:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ti7S0-0007xr-8a
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 12:47:36 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Ti7Rq-0007wC-5u; Mon, 10 Dec 2012 12:47:22 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	868527280048; Mon, 10 Dec 2012 18:47:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id NDyVBxH1sCEc; Mon, 10 Dec 2012 18:47:21 +0100 (CET)
Received: from flocke.fritz.box (p5086F143.dip.t-dialin.net [80.134.241.67])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	B941A728001C; Mon, 10 Dec 2012 18:47:20 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.fritz.box with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1Ti7Ro-0001ei-ED; Mon, 10 Dec 2012 18:47:20 +0100
Message-ID: <50C62028.30203@weilnetz.de>
Date: Mon, 10 Dec 2012 18:47:20 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20121027 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: John Spencer <maillist-qemu@barfooze.de>
References: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
	<1355122786-29243-4-git-send-email-maillist-qemu@barfooze.de>
In-Reply-To: <1355122786-29243-4-git-send-email-maillist-qemu@barfooze.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] linux-user/syscall.c:
 remove wrong forward decl of setgroups()
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
X-List-Received-Date: Mon, 10 Dec 2012 17:47:41 -0000

Am 10.12.2012 07:59, schrieb John Spencer:
> this declaration is wrong:
> the correct prototype on linux is:
> int setgroups(size_t size, const gid_t *list);
>
> since by default musl libc exposes this symbol in unistd.h
> additionally to grp.h, the wrong declaration causes a build error.
>
> the proper fix is to simply include the correct header.
>
> Signed-off-by: John Spencer<maillist-qemu@barfooze.de>
>
> ---
>   linux-user/syscall.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index fabbcd7..665316e 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -28,6 +28,7 @@
>   #include<fcntl.h>
>   #include<time.h>
>   #include<limits.h>
> +#include<grp.h>
>   #include<sys/types.h>
>   #include<sys/ipc.h>
>   #include<sys/msg.h>
> @@ -585,7 +586,6 @@ extern int personality(int);
>   extern int flock(int, int);
>   extern int setfsuid(int);
>   extern int setfsgid(int);
> -extern int setgroups(int, gid_t *);
>
>   /* ARM EABI and MIPS expect 64bit types aligned even on pairs or registers */
>   #ifdef TARGET_ARM
>    


Reviewed-by: Stefan Weil <sw@weilnetz.de>


