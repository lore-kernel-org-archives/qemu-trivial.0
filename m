Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk827-0007si-DS
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 06:02:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zilwz-0006DL-Bh
	for qemu-trivial@nongnu.org; Sun, 04 Oct 2015 12:15:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zilwy-0006sE-C7
	for qemu-trivial@nongnu.org; Sun, 04 Oct 2015 12:15:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zilwt-0006py-V4; Sun, 04 Oct 2015 12:15:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 111FE403CD;
	Sun,  4 Oct 2015 19:15:40 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id D9DC4A66;
	Sun,  4 Oct 2015 19:15:39 +0300 (MSK)
Message-ID: <561150AB.5070105@msgid.tls.msk.ru>
Date: Sun, 04 Oct 2015 19:15:39 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1423406458-31957-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1423406458-31957-1-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Remove type casts to union
	type
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
X-List-Received-Date: Sun, 04 Oct 2015 16:15:50 -0000

08.02.2015 17:40, Stefan Weil wrote:
> Casting to a union type is a gcc (and clang) extension. Other compilers
> might not support it. This is not a problem today, but the type casts
> can be removed easily. Smatch now no longer complains like before:

I've applied this patch with the following change:

>  linux-user/syscall.c |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 852308e..ec137db 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2663,8 +2663,9 @@ static inline abi_long host_to_target_semarray(int semid, abi_ulong target_addr,
>  }
>  
>  static inline abi_long do_semctl(int semid, int semnum, int cmd,
> -                                 union target_semun target_su)
> +                                 abi_ulong target_arg)
>  {
> +    union target_semun target_su;

       union target_semun target_su = { .buf = target_arg };

>      union semun arg;
>      struct semid_ds dsarg;
>      unsigned short *array = NULL;
> @@ -2673,6 +2674,8 @@ static inline abi_long do_semctl(int semid, int semnum, int cmd,
>      abi_long err;
>      cmd &= 0xff;
>  
> +    target_su.buf = target_arg;

and dropping this hunk.

Thank you!

/mjt

