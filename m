Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tnlm7-0000J0-4P
	for mharc-qemu-trivial@gnu.org; Wed, 26 Dec 2012 02:51:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Tnlm4-0000Bn-7f
	for qemu-trivial@nongnu.org; Wed, 26 Dec 2012 02:51:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Tnlm3-0005EJ-8Q
	for qemu-trivial@nongnu.org; Wed, 26 Dec 2012 02:51:36 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:36029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Tnllx-0005Dg-5D; Wed, 26 Dec 2012 02:51:29 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1EF95728004A; Wed, 26 Dec 2012 08:51:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Rrhst1XhMKQ7; Wed, 26 Dec 2012 08:51:26 +0100 (CET)
Received: from [192.168.178.20] (p5086F419.dip.t-dialin.net [80.134.244.25])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	91EBB7280049; Wed, 26 Dec 2012 08:51:26 +0100 (CET)
Message-ID: <50DAAC7D.5050001@weilnetz.de>
Date: Wed, 26 Dec 2012 08:51:25 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: John Spencer <maillist-qemu@barfooze.de>
References: <1356479389-1967-1-git-send-email-maillist-qemu@barfooze.de>
In-Reply-To: <1356479389-1967-1-git-send-email-maillist-qemu@barfooze.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] linux-user/syscall.c: remove forward
	declarations
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
X-List-Received-Date: Wed, 26 Dec 2012 07:51:37 -0000

Am 26.12.2012 00:49, schrieb John Spencer:
> instead use the correct headers that define these functions.
>
> Requested-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: John Spencer <maillist-qemu@barfooze.de>
> ---
>   linux-user/syscall.c |    8 +++-----
>   1 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index e99adab..3167a87 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -36,6 +36,9 @@
>   #include <sys/time.h>
>   #include <sys/stat.h>
>   #include <sys/mount.h>
> +#include <sys/file.h>
> +#include <sys/fsuid.h>
> +#include <sys/personality.h>
>   #include <sys/prctl.h>
>   #include <sys/resource.h>
>   #include <sys/mman.h>
> @@ -581,11 +584,6 @@ _syscall4(int, sys_prlimit64, pid_t, pid, int, resource,
>             struct host_rlimit64 *, old_limit)
>   #endif
>   
> -extern int personality(int);
> -extern int flock(int, int);
> -extern int setfsuid(int);
> -extern int setfsgid(int);
> -
>   /* ARM EABI and MIPS expect 64bit types aligned even on pairs or registers */
>   #ifdef TARGET_ARM
>   static inline int regpairs_aligned(void *cpu_env) {

Reviewed-by: Stefan Weil <sw@weilnetz.de>


