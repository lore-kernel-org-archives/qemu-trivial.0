Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ti7PV-0002CQ-Ur
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 12:44:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ti7PS-00021b-8G
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 12:44:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ti7PR-00075O-5Y
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 12:44:54 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Ti7PH-00072c-RC; Mon, 10 Dec 2012 12:44:43 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	B2D5C7280048; Mon, 10 Dec 2012 18:44:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id QPqayjazTLNz; Mon, 10 Dec 2012 18:44:41 +0100 (CET)
Received: from flocke.fritz.box (p5086F143.dip.t-dialin.net [80.134.241.67])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	215DC728001C; Mon, 10 Dec 2012 18:44:41 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.fritz.box with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1Ti7PE-0001eP-L9; Mon, 10 Dec 2012 18:44:40 +0100
Message-ID: <50C61F88.2040005@weilnetz.de>
Date: Mon, 10 Dec 2012 18:44:40 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20121027 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: John Spencer <maillist-qemu@barfooze.de>
References: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
In-Reply-To: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] fix implicit
 declaration of syscall() in	linux-user/mmap.c
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
X-List-Received-Date: Mon, 10 Dec 2012 17:44:55 -0000

Am 10.12.2012 07:59, schrieb John Spencer:
> on glibc, this header is getting pulled in automatically via
> another header, however on musl we need to include it explicitly.
>
> linux-user/mmap.c:705:9: warning: implicit declaration of function 'syscall'
> linux-user/mmap.c:705:9: warning: nested extern declaration of 'syscall'
>
> Signed-off-by: John Spencer<maillist-qemu@barfooze.de>
>
> ---
>   linux-user/mmap.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index b412e3f..171b449 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -25,6 +25,7 @@
>   #include<sys/types.h>
>   #include<sys/stat.h>
>   #include<sys/mman.h>
> +#include<sys/syscall.h>
>   #include<linux/mman.h>
>   #include<linux/unistd.h>


According to the Linux man-page SYSCALL(2), syscall
is declared in unistd.h. On my Debian Linux with glibc,
this information is correct. Here is the result of grep:

/usr/include/unistd.h:extern long int syscall (long int __sysno, ...) 
__THROW;

unistd.h is included implicitly via qemu-common.h,
so if you don't get the declaration, there is a buggy
implementation of the header files in musl:

http://git.musl-libc.org/cgit/musl/plain/include/unistd.h
does not match the Linux documentation.

Please report this to the musl developers.

Regards
Stefan Weil


